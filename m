Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNvIj-0004hO-Jx
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 01:09:41 +0200
Received: by ewy5 with SMTP id 5so1536449ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 16:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=LA5YCkOVbvqh8WhjEWMAIcVQ9F9Pqg46CvGJBVj3qps=;
	b=HZXK+GCff0AWAYEwKPNCEXROAhStgfV9GVvKTkMnePxhMDvJVlW3ma+ZSU5oILz38d
	wLdv/0dvUJ7Z9NaH6U1xxPXBd/MbTyRWWkhpiDrJxeRcTfh+JYbpjgLc6iq9KwcIOUCb
	j6rfnNy0wfIyaxGZTilX/6h3KYhHSOp5pLOTY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=gFB+6YdshSEHO4eRujkJkVtXKN2y45gRVVlrwlvt1ORNo0Yc5KT+sEnTIDdwqxG1Fc
	PyXT7xux+1CChhtRLZzcJMjVImBHdJlPe1TDiFsiJmmklCIwHcU2U4bllyDCBJLf4+xU
	hTOcJpLNtSwYafOETONoE/NnVTV3xsJWtkdqA=
Received: by 10.14.18.147 with SMTP id l19mr298519eel.140.1306019203186; Sat,
	21 May 2011 16:06:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Sat, 21 May 2011 16:06:13 -0700 (PDT)
In-Reply-To: <353951f9ba342f8caabe1600d7b66658dc925223.1306002889.git.sgw@linux.intel.com>
References: <cover.1306002889.git.sgw@linux.intel.com>
	<353951f9ba342f8caabe1600d7b66658dc925223.1306002889.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 May 2011 16:06:13 -0700
Message-ID: <BANLkTinnqsPcKzzAx1wpdh08ObAecr1fVQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] opkg_svn.bb: Install rcS.d into $D instead of $IMAGE_ROOTFS
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
X-List-Received-Date: Sat, 21 May 2011 23:09:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 21, 2011 at 11:38 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Remove headerfix.patch, its already applied upstream
>

This patch had reviews to be addressed which I have done
the patch is updated in pull branch. Use that one

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-devtools/opkg/opkg/headerfix.patch | =C2=A0 19 -------=
------------
> =C2=A0meta/recipes-devtools/opkg/opkg_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A03 +--
> =C2=A02 files changed, 1 insertions(+), 21 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/headerfix.patch b/meta/recip=
es-devtools/opkg/opkg/headerfix.patch
> deleted file mode 100644
> index b3515a0..0000000
> --- a/meta/recipes-devtools/opkg/opkg/headerfix.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Without this, the FILE reference in this header can cause compile issues=
.
> -
> -RP - 29/1/10
> -
> -Upstream-Status: Pending
> -
> -Index: trunk/libopkg/pkg_dest.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- trunk.orig/libopkg/pkg_dest.h =C2=A0 =C2=A0 =C2=A02010-01-29 09:37:2=
2.000000000 +0000
> -+++ trunk/libopkg/pkg_dest.h =C2=A0 2010-01-29 09:37:33.000000000 +0000
> -@@ -18,6 +18,8 @@
> - #ifndef PKG_DEST_H
> - #define PKG_DEST_H
> -
> -+#include <stdio.h>
> -+
> - typedef struct pkg_dest pkg_dest_t;
> - struct pkg_dest
> - {
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtoo=
ls/opkg/opkg_svn.bb
> index 5964a47..3f2c22b 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -11,7 +11,6 @@ RREPLACES_${PN} =3D "opkg-nogpg"
>
> =C2=A0SRC_URI =3D "svn://opkg.googlecode.com/svn;module=3Dtrunk;proto=3Dh=
ttp \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add_vercmp.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://headerfix.patch \
> =C2=A0"
>
> =C2=A0S =3D "${WORKDIR}/trunk"
> @@ -34,7 +33,7 @@ do_install_append() {
> =C2=A0pkg_postinst_${PN} () {
> =C2=A0#!/bin/sh
> =C2=A0if [ "x$D" !=3D "x" ]; then
> - =C2=A0 =C2=A0 =C2=A0 install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
> + =C2=A0 =C2=A0 =C2=A0 install -d $D/${sysconfdir}/rcS.d
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# this happens at S98 where our good 'ole pack=
ages script used to run
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "#!/bin/sh
> =C2=A0opkg-cl configure
> --
> 1.7.3.4
>
>


