Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73EFC4332F
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 17:15:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.45995.1672506900131301394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Dec 2022 09:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iYWLpQL3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id m3so8642194wmq.0
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Dec 2022 09:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXx/O/Gsl259Id0lEwDDrcVXFoS/Px9+n1JpD5dTtfk=;
        b=iYWLpQL3JfzK9UIgTExoQN4N8QBf7X2Kyw6HKzBW8OtpBBjJELBM7FXHKufnolcQPq
         DvFqRrf3o0l3s/KmL4iv/APpWiHO4LAGuq0QurVehmZav33G+CC43QOL79Y5YMM5Xb1/
         LhkMs332t+rVeEPIzP/2JO8jBV9SRrCcpLO40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rXx/O/Gsl259Id0lEwDDrcVXFoS/Px9+n1JpD5dTtfk=;
        b=guEoD6KIf3QlYxlWyb4N4LU1XCnCb9EPKCKX6pNEhrg20IrQPgqDBAGdkYwTZVIwsR
         IXcGMiN/sbwDmRgNFV4Ca9palHMtk9MINDcb63czr68hmvJZrj0Zm6qNKXZ9Y4lufdIa
         8enr08mdPjvuKgtbwov8H0jnnk7mmTdgJXvApDODbh5C4X30dzTHzIkRiLPoPk01w0pr
         G2QEkeLFnkksg5S3D4m8kglq6a3dNm2UBAKypcxaukrBn55m86bJHefCSG3TUIiyrYn+
         g54oxNlHFcRAyOCnQpv2FCE0AdwPHFEcsIa46+Cv7+KBKHF6SczEBGB//vw8F5MyzmQA
         MZ9Q==
X-Gm-Message-State: AFqh2krbnZoUptc+tPO7Mi++OZrOxjt/JbWtLOL1MOF2QIfS7voLneWr
	jsnD7Yhta5ETHAqt599vd249Pg==
X-Google-Smtp-Source: AMrXdXtZhaoaIo0KeJKhCZpXNjW8i1YM+B0tldmz3zkNPCeuidIA0B1VfNo1D9/3tgImoi/BQpxR1Q==
X-Received: by 2002:a05:600c:3d98:b0:3cf:d70d:d5a8 with SMTP id bi24-20020a05600c3d9800b003cfd70dd5a8mr24783887wmb.6.1672506898485;
        Sat, 31 Dec 2022 09:14:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1a1f:74ee:21ca:3bb? ([2001:8b0:aba:5f3c:1a1f:74ee:21ca:3bb])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c191400b003b4fe03c881sm42707766wmq.48.2022.12.31.09.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 09:14:58 -0800 (PST)
Message-ID: <f75728aa4e2acbf7274889aeaeb6a8f2b5c72533.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] gsettings-desktop-schemas.pc.in: use
 pc_sysrootdir for prefix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Sat, 31 Dec 2022 17:14:57 +0000
In-Reply-To: <20221229080810.98961-1-f_l_k@t-online.de>
References: <20221229080810.98961-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Dec 2022 17:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175181

On Thu, 2022-12-29 at 09:08 +0100, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...ktop-schemas.pc.in-use-pc_sysrootdir.patch | 34 +++++++++++++++++++
>  .../gsettings-desktop-schemas_43.0.bb         |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-gnome/gsettings-desktop-schemas/gsetting=
s-desktop-schemas/0001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.pa=
tch
>=20
> diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas/0001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.patch b/m=
eta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas/0001-=
gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.patch
> new file mode 100644
> index 0000000000..4bf38c1987
> --- /dev/null
> +++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas/0001-gsettings-desktop-schemas.pc.in-use-pc_sysrootdir.patch
> @@ -0,0 +1,34 @@
> +From abd179df28adcdd9fac3d066aaccbd4c4cd135f5 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Thu, 29 Dec 2022 06:39:59 +0100
> +Subject: [PATCH] gsettings-desktop-schemas.pc.in: use pc_sysrootdir for =
prefix
> +
> +gnome-settings uses pkgconfig to find gdesktop-enums.h
> +https://github.com/GNOME/gnome-control-center/blob/4648296a706df83af984a=
918e5f14c3ece42f5fc/panels/background/meson.build#L22
> +
> +Adding pc-sysrootdir to prefix would allow to find the file also if we h=
ave a user defined sysroot.
> +
> +This will fix cross compilation of gnome-control-center with yocto/opene=
mbedded that otherwise fails like this:
> +
> +| ../gnome-control-center-43.2/panels/background/meson.build:27:0: ERROR=
: File /usr/include/gsettings-desktop-schemas/gdesktop-enums.h does not exi=
st.
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gsettings-des=
ktop-schemas/-/merge_requests/62]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + gsettings-desktop-schemas.pc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gsettings-desktop-schemas.pc.in b/gsettings-desktop-schemas=
.pc.in
> +index d611dc1..992fa55 100644
> +--- a/gsettings-desktop-schemas.pc.in
> ++++ b/gsettings-desktop-schemas.pc.in
> +@@ -1,4 +1,4 @@
> +-prefix=3D@prefix@
> ++prefix=3D${pc_sysrootdir}@prefix@
> +=20
> + Name: gsettings-desktop-schemas
> + Description: Shared GSettings schemas for the desktop, including helper=
 headers
> +--=20
> +2.34.1
> +

This doesn't look right to me. It would lead to an arms race where
every .pc file would need to start accounting for the sysroot. The
sysroot should really be handled at the calling site.

Cheers,

Richard

