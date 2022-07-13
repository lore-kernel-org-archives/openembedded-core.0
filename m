Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834BFC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:26:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.24103.1657729569453570311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OTdGvP43;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id a5so16223561wrx.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=G7NhF0gW9ga3soP9ROLkw1MdaSj9WVX0RozVjyz5Gw8=;
        b=OTdGvP43ZLOOshyBHyen+NDupRK2foQQj3GwiGxk272QDkQFBdXT0Q4K1WjoG+gmvV
         B53RFLldnbYhZyi6psH/OgE+Ggt4d3pvr+q/fVi3saLSDOSDj+5spD/azYPDPA+cd/vL
         WSojkliQ+4UdteoDZVydYxBJkhMYiBDHHS5VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=G7NhF0gW9ga3soP9ROLkw1MdaSj9WVX0RozVjyz5Gw8=;
        b=h40FNixVZ+Ar45KTOp9IWg/+NGz/8qoNhXw9HsmvR4VAzCo8iUsUwR5uY4vzLXMkLz
         XZRyPqACGxpKH/liymQiHW9KqinKAro8Lw+wBw8+UUbn+PFE6bbvOqoT5nrZER3pWEue
         HZ693gGGkPq+UXjBk2PlKOLi41TG6xbloMqlAIrAskW024liirXONeuzCpShGC4nYGNJ
         EUhtoP+uECNSQR4N+E+DzbfmvNWhJP5FxhvZgE66njzbHIM2LSpOJDBg+U04w6k6yUIn
         Zv3wF3HPzq2zkwhR8ySUBimTsvjtHuvQxDbcgm70uzh4nSbAPUcXOpkNjZzOonUB+Mpp
         zUJA==
X-Gm-Message-State: AJIora9Xf8ISk1jB2LhUFWBjc9pr1nNA1u6FpbxfBvxMcsbhhNlIrz08
	ASrcoRTv9q0pU+sUJ6MQgqzV/g==
X-Google-Smtp-Source: 
 AGRyM1t4M6mA2ZYbnQjfdVuLCvxHfyaGSchbghNO0lrAHO9CLgcYdJPvAv52q5kVJqnoXzMRj1244w==
X-Received: by 2002:a05:6000:2c8:b0:21d:b356:5f21 with SMTP id
 o8-20020a05600002c800b0021db3565f21mr4178950wry.515.1657729567747;
        Wed, 13 Jul 2022 09:26:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527?
 ([2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527])
        by smtp.gmail.com with ESMTPSA id
 s7-20020adfecc7000000b0021d7050ace4sm11316031wro.77.2022.07.13.09.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 09:26:07 -0700 (PDT)
Message-ID: 
 <fb71b30dec53dc6d2a84416ceeb4056455c1f110.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2022 17:26:05 +0100
In-Reply-To: <20220713154139.101744-2-luca.boccassi@gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
	 <20220713154139.101744-1-luca.boccassi@gmail.com>
	 <20220713154139.101744-2-luca.boccassi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:26:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167965

On Wed, 2022-07-13 at 16:41 +0100, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> Support for unmerged-usr is deprecated upstream, taints the system and wi=
ll be
> removed in the near future.
> Enforce building merged-usr images when using systemd.
>=20
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: use :append in each recipe
>=20
>  meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
>  meta/recipes-core/systemd/systemd-serialgetty.bb  | 2 +-
>  meta/recipes-core/systemd/systemd.inc             | 5 +++++
>  meta/recipes-core/systemd/systemd_251.2.bb        | 2 +-
>  4 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/rec=
ipes-core/systemd/systemd-compat-units.bb
> index 55ebf99117..9085075a78 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -14,7 +14,7 @@ INHIBIT_DEFAULT_DEPS =3D "1"
> =20
>  ALLOW_EMPTY:${PN} =3D "1"
> =20
> -REQUIRED_DISTRO_FEATURES =3D "systemd"
> +REQUIRED_DISTRO_FEATURES:append +=3D "systemd"
> =20
>  SYSTEMD_DISABLED_SYSV_SERVICES =3D " \
>    busybox-udhcpc \
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/reci=
pes-core/systemd/systemd-serialgetty.bb
> index fd888bb834..60e18c4298 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -14,7 +14,7 @@ S =3D "${WORKDIR}"
> =20
>  # As this package is tied to systemd, only build it when we're also buil=
ding systemd.
>  inherit features_check
> -REQUIRED_DISTRO_FEATURES =3D "systemd"
> +REQUIRED_DISTRO_FEATURES:append +=3D "systemd"
> =20
>  do_install() {
>  	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
> index b8dbe2263a..f9e109bba4 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -21,3 +21,8 @@ SRC_URI =3D "git://github.com/systemd/systemd-stable.gi=
t;protocol=3Dhttps;branch=3D${S
>  "
> =20
>  S =3D "${WORKDIR}/git"
> +
> +# unmerged-usr support is deprecated upstream, taints the system and wil=
l be
> +# removed in the near future. Fail the build if it is not enabled.
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES =3D "usrmerge"
> diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-co=
re/systemd/systemd_251.2.bb
> index bb3c59f418..b1358420eb 100644
> --- a/meta/recipes-core/systemd/systemd_251.2.bb
> +++ b/meta/recipes-core/systemd/systemd_251.2.bb
> @@ -12,7 +12,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d =
update-alternatives qemu
> =20
>  # As this recipe builds udev, respect systemd being in DISTRO_FEATURES s=
o
>  # that we don't build both udev and systemd in world builds.
> -REQUIRED_DISTRO_FEATURES =3D "systemd"
> +REQUIRED_DISTRO_FEATURES:append +=3D "systemd"
>=20

We shouldn't need :append here, just go with +=3D "systemd".

Cheers,

Richard


