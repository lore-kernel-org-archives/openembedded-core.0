Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3DBC433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 19:03:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.1595.1639335791286351134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 11:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IuQLpNk2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id q3so23656150wru.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 11:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kf824NXTu8VCZ43cxeg3JvC5ixE04bomv0pvrTPcHL4=;
        b=IuQLpNk2CYDeYZ3vZ7jT0ZVhDkwXpGXz9AZ5Q+jDAoR19FDi+QmiJyS64scbUhgIa3
         t6Os3CUsWi09IzKem5THYDdjzXTQ9aMvFpKxTDp2K8N6MIXdq/NfZ1jq4JJjd6kXu+6f
         cWcZh/cLyAMUQUqf8k+N0NkWx2+H72l0BDaiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kf824NXTu8VCZ43cxeg3JvC5ixE04bomv0pvrTPcHL4=;
        b=2gUQStNLf7U2UlJpfydGARCId803NHz8FR1c6Q6mjWlqY5VwRgK7JNjpUzdP5uohfq
         BOxNsfr7LOnguC5Eb1Ug4ASwisYeKSX0w17ucS1ijdjdG3M2Rl29pIx5sCTV8Qcxdd5M
         oay4Cje6Qps4fo7Xwn4Mz2UOMsHN9hFGbk5Y+kCtgWED+2Nc3DokbamtMHqF1QSHWEvz
         DrE3bMnmcxqTABCqyBmSVxOCPGf3oU4nsiEFb6zV5Tyb1PgN78PgXoASREYgZK9e/SpP
         RDPJpme53X9WCadkWK4stHbMgjEY9S9A76vCjXNF9iBOJcq7KDc9eo+esBuhc9OY00Xs
         xmzg==
X-Gm-Message-State: AOAM5307LMdJxM3t89S70AIeQFoYVok3Wrz04o7DsAXw8XG3T4FCrFpv
	TndhBxdIDanAD1tSVGLKV8f1iw==
X-Google-Smtp-Source: 
 ABdhPJzELTyP/41Dj0gJBD6FxgWnZIVp/fu++SfrnfX0rs7WusIMXxLDkEK2u/JUWALb6YuasR6NsQ==
X-Received: by 2002:a5d:5850:: with SMTP id
 i16mr26959014wrf.410.1639335789767;
        Sun, 12 Dec 2021 11:03:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dd:524c:81ce:484c?
 ([2001:8b0:aba:5f3c:dd:524c:81ce:484c])
        by smtp.gmail.com with ESMTPSA id
 g16sm5637967wmq.20.2021.12.12.11.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 11:03:09 -0800 (PST)
Message-ID: 
 <879c61e857e71c586000da4dea39f3351c2bbd88.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 01/10] libtool: don't prefix the installed
 binary
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 12 Dec 2021 19:03:08 +0000
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
References: <20211210142242.2698587-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 19:03:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159588

On Fri, 2021-12-10 at 14:22 +0000, Ross Burton wrote:
> Typically libtool installs the binary to 'libtool' in the source tree,
> but we've got patches to rename this to ${host_sys}-libtool. As this
> isn't standard any upstream that don't respect the LIBTOOL variable need
> to be told explicitly where libtool is, which is a long-term maintenance
> burden for us on top of the initial libtool patches.
> 
> The reasoning for this renaming appears to stem from the design to be
> sure that we're using our new/patched libtool and not the host's binary.
> However, now that we have HOSTTOOLS, there's no way to run the host
> libtool so this argument is moot.
> 
> This patch removes the libtool renaming, follow-up patches remove the
> required modifications from the rest of the recipes.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../libtool/libtool-cross_2.4.6.bb            | 11 ++-
>  .../libtool/libtool-native_2.4.6.bb           |  4 +-
>  .../libtool/libtool/prefix.patch              | 98 -------------------
>  .../libtool/nativesdk-libtool_2.4.6.bb        |  6 +-
>  4 files changed, 11 insertions(+), 108 deletions(-)
>  delete mode 100644 meta/recipes-devtools/libtool/libtool/prefix.patch

Whilst this was an RFC I've gone ahead and merged this as I think it is time to
clean this up, the reasons for having it are mostly historical at this point.

I did remove the commented lines this patch left too.

Cheers,

Richard


