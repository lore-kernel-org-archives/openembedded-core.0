Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDxnb-0007CT-AR
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 14:20:40 +0200
Received: by vwe42 with SMTP id 42so483614vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 05:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=resent-from:resent-date:resent-message-id:resent-to:mime-version
	:in-reply-to:references:date:delivered-to:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Hkd3IBKX0Nf/x6VaDfdv5WRrXTf9hm3DCKXOzGdrx5s=;
	b=LCMR255vLSOOfE85McoHZ/YmWyUMVa7R/pzB86gT/11sI7H460a73TtJW8iXb8caaz
	gccLsFJPba6K6M+sjttZTa/bpxwuCF6egtsFeip/OC4FCb2uuV8Vzc78qGTppHBf+K6Y
	LCWExpW6fH+FXnEZsPmkjacpDvGc8wHGLiCgY=
Received: by 10.204.8.24 with SMTP id f24mr13190794bkf.64.1318421263807;
	Wed, 12 Oct 2011 05:07:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d17sm1839518bkq.11.2011.10.12.05.07.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 05:07:43 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Wed, 12 Oct 2011 14:07:32 +0200
Resent-Message-ID: <20111012120732.GN27073@jama.jama.net>
Resent-To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Received: by 10.142.172.12 with HTTP; Wed, 12 Oct 2011 05:06:32 -0700 (PDT)
In-Reply-To: <1317275552-19908-7-git-send-email-msm@freescale.com>
References: <1317275552-19908-1-git-send-email-msm@freescale.com>
	<1317275552-19908-7-git-send-email-msm@freescale.com>
Date: Wed, 12 Oct 2011 14:06:32 +0200
Message-ID: <CA+chaQerLbLcFTuuHZs_KimTQmqOHkhyFUCx-7FzTZfKHFkMgQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Matthew McClintock <msm@freescale.com>
Cc: yocto@yoctoproject.org
Subject: Re: [yocto] [PATCH 7/7] Add proper deps for nfs-utils, util-linux, and strace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 12:20:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 7:52 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> These packages need these deps for the RPM generation stage:

This was already applied, but I'll reply here and please send next
patch adressing those comments.

Today I've noticed that perl and libperl are pulled to my images only
because of util-linux and strace I belive I don't need them, see
inline comments

> =C2=A0error: Failed dependencies:
> | =C2=A0 =C2=A0 =C2=A0 /usr/bin/python is needed by nfs-utils-1.2.3-r2.pp=
ce5500
> | =C2=A0 =C2=A0 =C2=A0 /usr/bin/perl is needed by util-linux-2.19.1-r4.pp=
ce5500
> | =C2=A0 =C2=A0 =C2=A0 /usr/bin/perl is needed by strace-4.5.20-r2.ppce55=
00
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> =C2=A0.../nfs-utils/nfs-utils_1.2.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-core/util-linux/util-linux.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/strace/strace_4.5.20.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 ++
> =C2=A03 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> index 08468fe..e8b0490 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e=
8d672dc4c32c317bb3"
>
> =C2=A0# util-linux for libblkid
> =C2=A0DEPENDS =3D "libcap libnfsidmap libevent util-linux tcp-wrappers"
> -RDEPENDS_${PN} =3D "portmap"
> +RDEPENDS_${PN} =3D "portmap python"

python is needed only for
./usr/sbin/mountstats:#!/usr/bin/env python
./usr/sbin/nfsiostat:#!/usr/bin/python
could you please move them to separate packages and keep python
runtime dependency only there?

> =C2=A0RRECOMMENDS_${PN} =3D "kernel-module-nfsd"
>
> =C2=A0PR =3D "r2"
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 1f242b7..afce673 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -55,7 +55,7 @@ FILES_util-linux-libuuid-dev =3D "${libdir}/libuuid.so =
${libdir}/libuuid.a ${libdi
> =C2=A0FILES_util-linux-lscpu =3D "${bindir}/lscpu"
>
> =C2=A0RRECOMMENDS_${PN} =3D "util-linux-fdisk util-linux-cfdisk util-linu=
x-sfdisk util-linux-mount util-linux-readprofile "
> -RDEPENDS_${PN} =3D "util-linux-umount util-linux-swaponoff util-linux-lo=
setup"
> +RDEPENDS_${PN} =3D "util-linux-umount util-linux-swaponoff util-linux-lo=
setup perl"

perl is needed only for
/usr/bin/chkdupexe
could you please move chkdupexe to separate package and add perl only
to RDEPENDS_${PN}-chkdupexe?

> =C2=A0RRECOMMENDS_${PN}_virtclass-native =3D ""
> =C2=A0RDEPENDS_${PN}_virtclass-native =3D ""
> diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes=
-devtools/strace/strace_4.5.20.bb
> index 391669f..b3d2aa5 100644
> --- a/meta/recipes-devtools/strace/strace_4.5.20.bb
> +++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
> @@ -5,6 +5,8 @@ LICENSE =3D "BSD"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D4535377ede62550fdeaf39=
f595fd550a"
> =C2=A0PR =3D "r2"
>
> +RDEPENDS =3D "perl"

This should be RDEPENDS_${PN}
and much better would be to split
strace-graph to separate package and add perl only to
RDEPENDS_${PN}-graph

> +
> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sigmask.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> --
> 1.7.6.1

And also you need to bump PR when you're changing RDEPENDs (otherwise
issues are shown much later when it's rebuild because of some other
changes).

Regards,


