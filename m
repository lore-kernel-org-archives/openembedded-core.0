Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3540AC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 15:47:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.7822.1645804067707967068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 07:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J1db74ZS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so1940735wmg.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 07:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=bJXFbdMcnh1P/nfR6frrxB5Em5UIYePuW74FVLemf2Q=;
        b=J1db74ZSUJb+Y4t0cJkfszgwp14I7VdreuuhMvZsvXi4ZRrK5ysKuJbndhiT6GyXsG
         KCA/EA7eG6YPXKe6Eg4wyiWkVYttYw8NRG9R+E8JNd1dXpmBD7P5SPzQ+76m0l+Eo3LY
         06QTeSJxJqXjvpoIjpwyuLRInWEgsjWX2EU48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bJXFbdMcnh1P/nfR6frrxB5Em5UIYePuW74FVLemf2Q=;
        b=4RwfZL9dtPUnT6W3N7YKLbc0Y0HpDPjZUTAJ4njf1VeA8qUl/3DU/QUgkilWZdmS/v
         wTmPsC0JCa1jA1HdUpHREiil9pVmvzyYo52yESApZ4flfXMsjevsdHw0QYXLHh2KQCpR
         m163FHBMbtzoKcUyMKYke+bc3jt4415rx5XV6RJTPqcg71muBGLS3RXcL0Xt+DaIh6+2
         rSVGDX4S1ERJzHvFXoapPW9s+mV6QDA7EPi2pucJ6pYWF1KsMOmvpNX2xsJ8gtBGNq9z
         jPcDyOWrCRZjKe/XuInL/2Rw2epgTzaHWxZ7kZ71NlJW7Dr5tM6UuCF1viIsp5rxcddo
         QtVg==
X-Gm-Message-State: AOAM533ZmjyM2quer8Bk2Bmu0bpfhneN0/ODNjccn0H+4cKUObvWHhVT
	kk0JFEBWLwENZtHIRhJwUZ576Q==
X-Google-Smtp-Source: 
 ABdhPJxhbr53OpIt0asmDMOsxNQBm3cyKEpzEoPYRjfGUtcogQWGkmt82IzSxVX0BNh8Tg6Na5TWOw==
X-Received: by 2002:a7b:c85a:0:b0:381:397d:9790 with SMTP id
 c26-20020a7bc85a000000b00381397d9790mr2434469wml.71.1645804066090;
        Fri, 25 Feb 2022 07:47:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c05:a731:3c1:5d08?
 ([2001:8b0:aba:5f3c:8c05:a731:3c1:5d08])
        by smtp.gmail.com with ESMTPSA id
 ay23-20020a5d6f17000000b001ea79f73fbcsm2579908wrb.25.2022.02.25.07.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 07:47:45 -0800 (PST)
Message-ID: 
 <272916479ebe54e8874bf172a4ec70e6f675b0c3.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] bitbake.conf: add ssh-keygen to
 HOSTTOOLS_NONFATAL
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Fri, 25 Feb 2022 15:47:44 +0000
In-Reply-To: <20220218073535.5097-1-f_l_k@t-online.de>
References: <20220218073535.5097-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 15:47:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162404

On Fri, 2022-02-18 at 08:35 +0100, Markus Volk wrote:
> Gnome Seahorse needs an external ssh-keygen to build and there is no provider
> for it in yocto/oe. openssh-native is not allowed to build and if allowed there
> are problems building it with '--enable-pam'.
> 
> 'ssh' is already set to be added as a HOSTTOOL when it is found.
> This commit also adds ssh-keygen.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index fba99e8f0c..15ea0bc29e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -499,7 +499,7 @@ HOSTTOOLS += " \
>  HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
>  
>  # Link to these if present
> -HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
> +HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh ssh-keygen sudo"
>  

Does it actually need to generate keys or is it just checking for the presence
of the tool? I'm not a big fan of adding new tools like this, particularly as
this could still cause a deterministic build issue...

Cheers,

Richard


