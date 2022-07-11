Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E36EC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:47:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.26164.1657529221181323358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gvYAzNFE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 r129-20020a1c4487000000b003a2d053adcbso4571867wma.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=VU034FPotf+uRO/RuAQx71D7RSHfDrIAaAPFkR14NQw=;
        b=gvYAzNFEo534a6+krqWf2AbuIXhFil/aRw6UR0L67VGzjSnvjxVqNdGc4v9NeDddtA
         RSNkA2JL15eWnwGM4igM+YFvjLXoQSWxmUWlb/XKHxdUVI4GbrcX/a8Q+ZHAUU8+hYrB
         +pheVnpTAUjvmfH3rG8d00hmb5MX/ga+GMTWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=VU034FPotf+uRO/RuAQx71D7RSHfDrIAaAPFkR14NQw=;
        b=mN/dN+IZUs6aaQN/PRYPwZnU8pL9i9gqiKhhGga6KzMm05uDXva1BYNcN7w0ylMsNq
         Vl0eMW3GsUJb9Ep7Fdeh3KDgx/Va4sv90c2J9LW+RA7KrsR1t9KdYpgrzUvjRk320fP8
         d3lzbOD+580zCknfoPzArzI5Y/ZEr0NUnN92rnWv7Vjil9Mta1yrCcXY2sfdkPr/NBkd
         DfsJ5xHNFVGjO/nx8fIHq8uHdxdYYG4yCWweCyk+eQb78rzH8oMz7DugAQucm+vK0KCN
         JVLgDDO1tHnpyatLI7axJPRxLDMfltHwocwHNCVcApjXlX7YOp1rvyOaXtviMv+e0w0r
         HLZQ==
X-Gm-Message-State: AJIora+FaKq1mC5/httYliTbChTyYkGa5ndSEaWdm9ughJc7vSc7LDpZ
	EmtA1ti6T9ekyY4rM93eDWOdZikGgTXERg==
X-Google-Smtp-Source: 
 AGRyM1u6qQTJh19E4e0j0jzQuQDqoP4orDBvJaUSw96LJOwPkv1AawrWhb6vdHsQYBIY6kQ1WjlwDQ==
X-Received: by 2002:a05:600c:354e:b0:3a1:9ddf:468d with SMTP id
 i14-20020a05600c354e00b003a19ddf468dmr14398196wmq.145.1657529219410;
        Mon, 11 Jul 2022 01:46:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:33cc:9a17:a076:b55d?
 ([2001:8b0:aba:5f3c:33cc:9a17:a076:b55d])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a5d424e000000b0021d4d6355efsm5213628wrr.109.2022.07.11.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 01:46:58 -0700 (PDT)
Message-ID: 
 <5227282d05b0791d57457c44f63859a97001c6ab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] zlib: minizip: add recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Nyekjaer <sean@geanix.com>, openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2022 09:46:58 +0100
In-Reply-To: <20220711083309.1749253-2-sean@geanix.com>
References: <20220711083309.1749253-1-sean@geanix.com>
	 <20220711083309.1749253-2-sean@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 08:47:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167863

On Mon, 2022-07-11 at 10:33 +0200, Sean Nyekjaer wrote:
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta/recipes-core/zlib/minizip_1.2.12.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-core/zlib/minizip_1.2.12.bb

I can see what this does, but why? Who would want this and why?=C2=A0There
is no detail in the commit messages. Also no maintainers entry which
will break QA checks.

Cheers,

Richard



