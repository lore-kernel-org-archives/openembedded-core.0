Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06578C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 09:21:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2971.1678267275061022233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 01:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fLqhbXE3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so689379wmi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678267273;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdMk7r5K8OBKhsjlYQfbl1d05R6EFdqONHOKmvgKidE=;
        b=fLqhbXE3aSd7Vaj3AlQT1mn3Eke6Q0a3HIB5IKjA39U2UYJijDyFBta7nfZFDB7E8y
         Lw/8UNdUArGvFfhfqzuIybS0LUylRNjAXGdECwsm4fdl20MswkrdE4GrEbxE4RF5R6zC
         yikQ+Z5e7v4EZZbYyOPdyxjYkWoSKCZBmVGP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678267273;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QdMk7r5K8OBKhsjlYQfbl1d05R6EFdqONHOKmvgKidE=;
        b=5BjajliAhqo5dMoVTD7nvGnTvUQtjIscSXtvyI92gURQuSpMdl38HC9/FXyOhuFmA4
         VBPzRSBbSDS7GioviKgf9FsShL6vQA61BewChAg7JoEjrqfBa2Tid+RyzPkZczZZ3FMp
         5IAsLeN0uY52fFMvr99KLfFirydFCOlt2mPuxX9nCDN3vXxypH/0NqIpWP+j5QNYu0IL
         suRTw/XOBzatFzCW6tw3vr94LL4hQPEIc1cwyDdpkubRKEIWC09WrFw+2sZnEV3KhXi8
         EVhbYCSulpBS0oF0qHdibgzLoRL6b26edIw4cFQUJYCR1cZ1k7CeLff68OGiNB99cHRL
         DxZQ==
X-Gm-Message-State: AO0yUKXh2Hznd1XNbvcijJdJfUk8iFMF9uxzUxE9eZq1Na50Pt3MPgfO
	3CfqRuWcwio+VyeUuzOOSg39HjcF3UCuBIqD+Nk=
X-Google-Smtp-Source: AK7set+lC+dJwgbeKxhXa0OqCt/XiLtqkHPNyaqIq4TiTGYcwzWv7Hv3IbTe8jZpOATwIXAKggQ3Hg==
X-Received: by 2002:a05:600c:198e:b0:3e2:1ef0:f585 with SMTP id t14-20020a05600c198e00b003e21ef0f585mr15069530wmq.2.1678267273565;
        Wed, 08 Mar 2023 01:21:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b? ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id r22-20020a05600c435600b003eae73ee4a1sm15190432wme.17.2023.03.08.01.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 01:21:13 -0800 (PST)
Message-ID: <a217c248c8fc840689997f43e61ae076e5420b0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 4/5] xcb-proto: Fix install conflict when
 enable multilib.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Wed, 08 Mar 2023 09:21:12 +0000
In-Reply-To: <1678239619-21210-4-git-send-email-wangmy@fujitsu.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
	 <1678239619-21210-4-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178158

On Wed, 2023-03-08 at 09:40 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Error: Transaction test error:
>   file /usr/share/pkgconfig/xcb-proto.pc conflicts between attempted inst=
alls of lib32-xcb-proto-dev-1.15.2-r0.armv7ahf_neon and xcb-proto-dev-1.15.=
2-r0.cortexa57
>=20
> The differences between the two files are as follows:
> @@ -2,7 +2,7 @@
>  exec_prefix=3D/usr
>  datarootdir=3D${prefix}/share
>  datadir=3D/usr/share
> -libdir=3D/usr/lib64
> +libdir=3D/usr/lib
>  xcbincludedir=3D${pc_sysrootdir}${datadir}/xcb
>  PYTHON_PREFIX=3D${prefix}
>  pythondir=3D${pc_sysrootdir}${libdir}/python3.11/site-packages
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb b/meta/=
recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
> index 4e4472a9c1..0fdca732e8 100644
> --- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
> +++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
> @@ -28,3 +28,6 @@ DEV_PKG_DEPENDENCY =3D ""
>  RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> +inherit multilib_script
> +MULTILIB_SCRIPTS =3D "${PN}-dev:${datadir}/pkgconfig/xcb-proto.pc"
> +

If the .pc file doesn't use libdir anywhere, we should just delete that
line. It is being installed into a "noarch" location (datadir) so it
shouldn't be library specific.

Also, we should *never* be putting pkgconfig files under update-
alternatives control!

Cheers,

Richard


