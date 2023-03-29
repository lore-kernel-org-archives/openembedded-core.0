Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA5BC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 07:20:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.18380.1680074408238808933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 00:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WVQX0Dht;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id n19so8288977wms.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680074407;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=39+8O1+nq7r72q9uPfEQMAfprlpmHKcBfgTUr7NKjZg=;
        b=WVQX0DhtEO5VqyVQBPUVhW3N1b0cb1iIH2g8d8SgqPaTuSSnipZYYckkCJgAo32/r/
         uvQcDQAXCDNUgLGrtqKPaveg3bIbu0gJqagEAQMT/HCECBZOZrEn9/KEodY5kWadDGGV
         X6vYnWC74/1WsPhLGBgfIebf+bSeJTcy/EH7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680074407;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39+8O1+nq7r72q9uPfEQMAfprlpmHKcBfgTUr7NKjZg=;
        b=5rLMUlE7N/Smz1PXhz8FwcCxdRdZ49VjN1Zb0Hm0gsWVoyfiqVGsXwURyamRQ2pf8i
         +OdypuNw7uYlcAPO9U58uSyOvtHMy4rT+ZJZd7axvZk2Xw4qlvkXPLBwZTsj+ZPiTZ0N
         bHB06+nmn4qudpJmeN4bPRDK+kbo5ckMF7qFDPZu6EhP2nyfNT7iZFEfDsk9vixsCneo
         Xdz9uxuzOX8pU4KMvMWlWnIddKnnMmK527Qhl3N98GqyGGA0B1NrWnRCmTX9dOevYU+a
         6YRr9LYXLDKSCPupebRESg2cFHeOFz4WdQ/Q8WI6vF+M49maA+3VDm2MNEyPZ7mfY3Sg
         HDPg==
X-Gm-Message-State: AO0yUKWbnliH3FCBTxlgfyxCfWAkDgXLiBG8o3ShJsyTr2wxb+09DMPK
	CNSZikYIl9GP271p4fcFHDVPbQ==
X-Google-Smtp-Source: AK7set/jxSoGNyar47RFjZli7UnwicdQ00M2/KtLDhzc7lKvZReln8+++NY6tRLVT1ZYSP8nLevD9A==
X-Received: by 2002:a7b:cb86:0:b0:3dc:433a:e952 with SMTP id m6-20020a7bcb86000000b003dc433ae952mr13627934wmi.33.1680074406568;
        Wed, 29 Mar 2023 00:20:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a292:121e:1e7c:1ae7? ([2001:8b0:aba:5f3c:a292:121e:1e7c:1ae7])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c4fc900b003ef6bc71cccsm1231718wmq.27.2023.03.29.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 00:20:06 -0700 (PDT)
Message-ID: <53e7d019d34be7a785e67f67ecc5f2c0dff2ac8e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta][dunfell][PATCH] busybox: Make high ASCII chars
 printable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nikhil <nikhilar2410@gmail.com>,
 openembedded-core@lists.openembedded.org,  sanak@kpit.com
Cc: ranjitsinh.rathod@kpit.com, Sana Kazi <Sana.Kazi@kpit.com>, Sana Kazi
	 <sanakazisk19@gmail.com>
Date: Wed, 29 Mar 2023 08:20:05 +0100
In-Reply-To: <20230329064717.2486576-1-nikhilar2410@gmail.com>
References: <20230329064717.2486576-1-nikhilar2410@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 07:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179264

On Wed, 2023-03-29 at 12:17 +0530, nikhil wrote:
> Currently busybox utilty "ls" fails to display filenames contains
> UTF-8 characters and replaces with "?".
>=20
> Steps to reproduce:
> bin/busybox touch utf_test-=C3=9C
> bin/busybox ls utf_test-* > sample.log
> bin/busybox cat sample.log
> utf_test-??
> bin/busybox hexdump -C sample.log | grep "c3 9c"
>=20
> Therefore, above hexdump command is unable to find matching hex value
> for the umlaute character.
> Hence, change the libbb's printable_string() function to allow high ASCII
> characters so that unicode filenames are displayed correctly.
> This issue is not observed in upstream busybox.
>=20
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
> ---
>  .../270-libbb_make_unicode_printable.patch    | 39 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/270-libbb_make_unic=
ode_printable.patch
>=20
> diff --git a/meta/recipes-core/busybox/busybox/270-libbb_make_unicode_pri=
ntable.patch b/meta/recipes-core/busybox/busybox/270-libbb_make_unicode_pri=
ntable.patch
> new file mode 100644
> index 0000000000..001d2847fe
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/270-libbb_make_unicode_printable.=
patch
> @@ -0,0 +1,39 @@
> +busybox: make high ASCII chars printable (#7993)
> +
> +Currently busybox utils like "ls" fail to display filenames containing U=
TF-8
> +characters, replacing any special characters with "?".
> +
> +Change libbb's printable_string() function to allow high ASCII character=
s so
> +that unicode filenames are displayed correctls.
> +
> +Signed-off-by: Jo-Philipp Wich <jow@openwrt.org>
> +Upstream-Status: Pending [https://git.openwrt.org/?p=3Dopenwrt/svn-archi=
ve/archive.git;a=3Dpatch;h=3Dbbca780ca657d894fc457cac8eaaaec9d414bfc8]
> +

Has the patch been submitted to busybox? The upstream we refer to here
is really busybox. The link to openwrt is helpful but we should limit
to any submission to busybox itself for the purposes of upstream-
status.

Cheers,

Richard


