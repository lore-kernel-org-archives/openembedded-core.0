Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01ECC4167B
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 13:42:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.180385.1672234971614258574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 05:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QHjTTdom;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id ay40so11276452wmb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 05:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A+s5p5ILV2w6C9BHO0lyGiTu2U67x9radD9HtsPuoXI=;
        b=QHjTTdomEWB+LsRN0U09k+Fk9h1KMmN5cNDcOGAkdFtQD8+0MVfCxUW67GZhSrhhhZ
         +Xm14e/sXKkVI1UiU6cX0erfvkHvBSyumMIyuPj/nLVjUsOaJOEFPxnYJDQ4wlUhxl4Z
         DL+DicrLcchfgHDtWA/IWFgkVbuCGbMUcM/RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+s5p5ILV2w6C9BHO0lyGiTu2U67x9radD9HtsPuoXI=;
        b=ZnW9WAUm8tYdqLWwhiUonsYeqZ8V7teO7ZtSCHgGUJIj1B8GOq+DT3CkAqEcvBdjf7
         zA1QUQ6D4Yq9gMoRnHiMy/oyIZx2ku21JO1Bk8ZHfnVAMuJOXmLtcNKTwyDtuLXXxoIi
         U/KbXP9+ePh/y3FsYErE70GUFugMmyLWS0y35R/GBg7YiCwhOcsOCFa+cgXbnNaRhnvd
         YwMb52bhN2ZQbdMqBM9yo2JVORtPSy8gZ3ckoFHz/G5jHZpSOASuv6v6thSarNDK2Na8
         Aqq7HVt8kNJgOQbLGFDjWZW8vb7MFU/e43VQG6B4zsczFeao6qpFd67MAH2HRUh7wSPb
         tlMw==
X-Gm-Message-State: AFqh2kou451unFNWTtT5hweP8RGdaOHan9ERLSoXYNyFWPQ/2PMEX/xd
	1x41OW+OUvja2bOvPmBqB4CDCQ==
X-Google-Smtp-Source: AMrXdXu4/rR2WEqXqZqs2pLhyKHRvyIJ20cY2PqBM8XwNb+7bIMwh8ITbXDqmVPF8SKJfzD7A9hxkw==
X-Received: by 2002:a05:600c:4d94:b0:3d5:3ab1:d630 with SMTP id v20-20020a05600c4d9400b003d53ab1d630mr17806074wmp.8.1672234970046;
        Wed, 28 Dec 2022 05:42:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9a6e:7039:ab68:1e0d? ([2001:8b0:aba:5f3c:9a6e:7039:ab68:1e0d])
        by smtp.gmail.com with ESMTPSA id o7-20020a05600c4fc700b003cf4ec90938sm24072591wmq.21.2022.12.28.05.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:42:49 -0800 (PST)
Message-ID: <05ddc76c998a397e7392957760517b2011a4d61e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/7] libslirp: add recipe to continue slirp
 support in qemu
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Wed, 28 Dec 2022 13:42:48 +0000
In-Reply-To: <20221224165943.1324800-6-alex@linutronix.de>
References: <20221224165943.1324800-1-alex@linutronix.de>
	 <20221224165943.1324800-6-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 13:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175066

On Sat, 2022-12-24 at 17:59 +0100, Alexander Kanavin wrote:
> qemu 7.2 no longer carries libslirp in-tree, and so
> it has to be provided externally.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc       |  1 +
>  .../recipes-connectivity/slirp/libslirp_git.bb | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta/recipes-connectivity/slirp/libslirp_git.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 66797db02c..be96123ce6 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -382,6 +382,7 @@ RECIPE_MAINTAINER:pn-libsamplerate0 =3D "Unassigned <=
unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libsdl2 =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-libseccomp =3D "Unassigned <unassigned@yoctoproject=
.org>"
>  RECIPE_MAINTAINER:pn-libsecret =3D "Alexander Kanavin <alex.kanavin@gmai=
l.com>"
> +RECIPE_MAINTAINER:pn-libslirp =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
>  RECIPE_MAINTAINER:pn-libsm =3D "Unassigned <unassigned@yoctoproject.org>=
"
>  RECIPE_MAINTAINER:pn-libsndfile1 =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
>  RECIPE_MAINTAINER:pn-libsolv =3D "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-connectivity/slirp/libslirp_git.bb b/meta/recip=
es-connectivity/slirp/libslirp_git.bb
> new file mode 100644
> index 0000000000..334b786b9b
> --- /dev/null
> +++ b/meta/recipes-connectivity/slirp/libslirp_git.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "A general purpose TCP-IP emulator"
> +DESCRIPTION =3D "A general purpose TCP-IP emulator used by virtual machi=
ne hypervisors to provide virtual networking services."
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/slirp/libslirp"
> +LICENSE =3D "BSD-3-Clause & MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbca0186b14e6b05e338e729f106=
db727"
> +
> +SRC_URI =3D "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=3D=
https;branch=3Dmaster"
> +SRCREV =3D "3ad1710a96678fe79066b1469cead4058713a1d9"
> +PV =3D "4.7.0"
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D " \
> +    glib-2.0 \
> +"
> +
> +inherit meson pkgconfig
> +
> +BBCLASSEXTEND =3D "native nativesdk"

I did merge this to core since the qemu upgrade has some potential wins
for us and is fairly important to get in. I probably shouldn't have
done as people are now upset, we're now seeing autobuilder failures,
people are on vacation and the issues won't be fixed until mid January.

I've had some feedback about the way this was handled. In future things
might be smoother if we:

a) make sure the maintainers of other layers containing such recipes=C2=A0
   are cc'd on the changes.
b) mention in the commit which layer a recipe came from and who worked=C2=
=A0
   on the underlying code
c) mention any changes made to merge to core
d) time things outside of holidays

Yes, it is a pain to do some of these things and sightly more work, but
leaving the issues to me isn't much fun either. I don't think anything
was intended by anything, it was mainly a desire to keep core up to
take and be able to take advantaged of new features in qemu.

I am very much aware that during holidays, people have different time
availability and this sometimes works in favour of productivity,
sometimes against it. I need to balance getting patch movement and
feedback back to contributors with some people taking a proper break
and it is hard to get right.

For the record, looking at a diff, the changes in this submission
appear to be:

* Upgrade from 4.6.1+git -> 4.7.0
* Addition of BBCLASSEXTEND for native/nativesdk
* Add DESCRIPTION and HOMEPAGE

Cheers,

Richard


