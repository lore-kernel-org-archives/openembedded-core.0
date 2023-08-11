Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C36AC001DB
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 12:25:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.41348.1691756700483808547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 05:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W5wuNW0L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso18903355e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691756699; x=1692361499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0njx8IqgoXdI/FUluzSYXW7mLg6QteGesXlMsCr7SeM=;
        b=W5wuNW0L73QGNy0k1rstUPTM1Dd2AMR2K/1BHPeAnx5QiQ/e943UIMsFUnIkDp5hiR
         STkUifv20VAz6h/q8g3KZDaJuAYWwxRagwoQ4U4nOIuGmd1y+C05aWztGhU+ahMGgzxe
         xVRTeSWdEuKxyMJBY6PxYLrrHeR/9VBmIqw7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691756699; x=1692361499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0njx8IqgoXdI/FUluzSYXW7mLg6QteGesXlMsCr7SeM=;
        b=ihuBl9fLIRN7QwwSKry3lKGQTnrUzbOBzfh93wp5TGfjy/PI/x90kc+mN5tRfYsE4m
         89BIeU65j9SC848sV8ZpJ+xgoPNS5ecENQ5LLHRLjPHyk+Ei+HpkN7u5/llWGk//7os/
         c/ZdzvWuYusS+k+3hw8q4np+F3BVTyetQOhLSa1B4ibu2fISRovJk4N+SqjnINI+zcto
         gptlfh+QNdw0L+4ZL4d3TVRlAxRtsOxbL1UaQLnEqyTq1TztZLHeobXf1i+3lvksuLMM
         pFwkYOGwQfzD1vWI7OyAQjMYDfO24kbEgl3GiLGpv/ZXfD2eu5p4J5xI+C7CYSMDpIi3
         qtbQ==
X-Gm-Message-State: AOJu0YwELXuCpRrIni5KzXUEvd45esM7XxhR4f+JIsnoo+vAeNt4MaJ0
	JMg4I1UTLOemy5zxyV1R3QkFQQ==
X-Google-Smtp-Source: AGHT+IF0pXfnHYxXerivBKdjj9cmVkM74OuOjbeFIJ9kPja6ttWN5o+EXhrgsHzK9IvxFFNaen9wvg==
X-Received: by 2002:a05:600c:c7:b0:3fe:1cac:37d5 with SMTP id u7-20020a05600c00c700b003fe1cac37d5mr1552098wmm.4.1691756698853;
        Fri, 11 Aug 2023 05:24:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:abc2:839a:7473:990f? ([2001:8b0:aba:5f3c:abc2:839a:7473:990f])
        by smtp.gmail.com with ESMTPSA id v22-20020a1cf716000000b003fe23b10fdfsm8115799wmh.36.2023.08.11.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 05:24:58 -0700 (PDT)
Message-ID: <5f41037241c33cd4cc36807f6be271007f1a8127.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Date: Fri, 11 Aug 2023 13:24:57 +0100
In-Reply-To: <20230805213551.2737605-1-luca.boccassi@gmail.com>
References: <20230805110643.2708376-1-luca.boccassi@gmail.com>
	 <20230805213551.2737605-1-luca.boccassi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 12:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185836

On Sat, 2023-08-05 at 22:35 +0100, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> Support for unmerged-usr is deprecated upstream, taints the system and
> has been removed for v255 (next release).
> Enforce building merged-usr images when using systemd. This allows one
> release cycle where it can be tested for any remaining issue, and can
> still be overridden, before it stops working completely.
>=20
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: rearrange so systemd-boot.bb is left as-is for now
>=20
>  meta/recipes-core/systemd/systemd-compat-units.bb      | 3 ++-
>  meta/recipes-core/systemd/systemd-conf_1.0.bb          | 3 +++
>  meta/recipes-core/systemd/systemd-machine-units_1.0.bb | 3 ++-
>  meta/recipes-core/systemd/systemd-serialgetty.bb       | 3 ++-
>  meta/recipes-core/systemd/systemd_254.bb               | 6 +++++-
>  5 files changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/rec=
ipes-core/systemd/systemd-compat-units.bb
> index 55ebf99117f..75b1045728a 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -14,7 +14,8 @@ INHIBIT_DEFAULT_DEPS =3D "1"
> =20
>  ALLOW_EMPTY:${PN} =3D "1"
> =20
> -REQUIRED_DISTRO_FEATURES =3D "systemd"
> +REQUIRED_DISTRO_FEATURES +=3D "systemd"
> +REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
> =20
>  SYSTEMD_DISABLED_SYSV_SERVICES =3D " \
>    busybox-udhcpc \
> diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes=
-core/systemd/systemd-conf_1.0.bb
> index 61ce7939d3a..2355936631e 100644
> --- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
> +++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> @@ -5,6 +5,9 @@ DefaultTimeoutStartSec setting."
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> =20
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
> +
>  PE =3D "1"
> =20
>  PACKAGECONFIG ??=3D "dhcp-ethernet"
> diff --git a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb b/met=
a/recipes-core/systemd/systemd-machine-units_1.0.bb
> index 12f27d6ae30..7e59e86f9be 100644
> --- a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
> +++ b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
> @@ -7,7 +7,8 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  PR =3D "r19"
> =20
> -inherit systemd
> +inherit systemd features_check
> +REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
>  SYSTEMD_SERVICE:${PN} =3D ""
> =20
>  ALLOW_EMPTY:${PN} =3D "1"
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/reci=
pes-core/systemd/systemd-serialgetty.bb
> index fd888bb8340..c2c67e6fe08 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -14,7 +14,8 @@ S =3D "${WORKDIR}"
> =20
>  # As this package is tied to systemd, only build it when we're also buil=
ding systemd.
>  inherit features_check
> -REQUIRED_DISTRO_FEATURES =3D "systemd"
> +REQUIRED_DISTRO_FEATURES +=3D "systemd"
> +REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
> =20
>  do_install() {
>  	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
> diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core=
/systemd/systemd_254.bb
> index 7ba4233f6a2..3fa49122cd6 100644
> --- a/meta/recipes-core/systemd/systemd_254.bb
> +++ b/meta/recipes-core/systemd/systemd_254.bb
> @@ -10,9 +10,13 @@ SECTION =3D "base/shell"
> =20
>  inherit useradd pkgconfig meson perlnative update-rc.d update-alternativ=
es qemu systemd gettext bash-completion manpages features_check
> =20
> +# unmerged-usr support is deprecated upstream, taints the system and wil=
l be
> +# removed in the near future. Fail the build if it is not enabled.
> +REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
> +
>  # As this recipe builds udev, respect systemd being in DISTRO_FEATURES s=
o
>  # that we don't build both udev and systemd in world builds.
> -REQUIRED_DISTRO_FEATURES =3D "systemd"
> +REQUIRED_DISTRO_FEATURES +=3D "systemd"
> =20
>  SRC_URI +=3D " \
>             file://touchscreen.rules \

FWIW I tried multiple runs of this through the autobuilder and tracked
down all the places this needed fixing so the test work. Once those
fixes merged, I was able to merge this.

Cheers,

Richard


