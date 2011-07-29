Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qmq9y-00064l-G7
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 18:43:38 +0200
Received: by fxg11 with SMTP id 11so2733717fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wOK0LYltXEwMrSQa7L81DBCxuvessCnZ5FusKxRnpOg=;
	b=L4yk5B1fYaIMVg1Vbn+rOpUhRAx9miQ3jn4OYPxnItDtVUfXfHcsOfFkGlKVsE17r5
	jYJDiNbRS4YgEXxuo+sNdeHw4HUUD93YuG0+0yiPwTbKjeybnUCstMt4hVV/QgWteWqp
	6gxMqBT7WzrSP+mKupSE9yrCg/TsXEfksuD3I=
Received: by 10.223.14.204 with SMTP id h12mr1921552faa.89.1311957561707;
	Fri, 29 Jul 2011 09:39:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm1189772fak.10.2011.07.29.09.39.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 09:39:20 -0700 (PDT)
Date: Fri, 29 Jul 2011 18:39:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110729163912.GN15286@jama.jama.net>
References: <1311951571-18411-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1311951571-18411-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] classes, recipes: Replace use of ARM_INSTRUCTION_SET with contruct using TUNE_FEATURES
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
X-List-Received-Date: Fri, 29 Jul 2011 16:43:38 -0000
X-Groupsio-MsgNum: 7069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6yHiY5vv/BiPjcMt"
Content-Disposition: inline

--6yHiY5vv/BiPjcMt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2011 at 07:59:31AM -0700, Khem Raj wrote:
> Currently when using thumb feature all recipes can not be compiled in
> thumb mode. Therefore we had ARM_INSTRUCTION_SET to force arm intruction
> set even when thumb was global choice. With this patch we remove thumb
> from tune features for these recipes. This will make sure that compiler
> is not using thumb options to compile these recipes at all.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/qt4e.bbclass                          |    2 +-
>  meta/classes/qt4x11.bbclass                        |    2 +-
>  meta/conf/machine/include/tune-thumb.inc           |   32 --------------=
------
>  meta/recipes-core/eglibc/eglibc.inc                |    4 +-
>  meta/recipes-core/glib-2.0/glib.inc                |    4 ++-
>  meta/recipes-core/glibc/glibc.inc                  |    4 ++-
>  meta/recipes-core/glibc/glibc_2.10.1.bb            |    3 +-
>  meta/recipes-core/uclibc/uclibc.inc                |    2 +-
>  meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |    3 +-
>  .../xorg-xserver/xserver-kdrive.inc                |    4 ++-
>  meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb  |    3 +-
>  .../gstreamer/gst-plugins-bad_0.10.21.bb           |    3 +-
>  meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    4 ++-
>  meta/recipes-multimedia/tremor/tremor_20101121.bb  |    4 ++-
>  meta/recipes-qt/qt4/qt4_arch.inc                   |    3 +-
>  meta/recipes-support/boost/boost-36.inc            |    4 ++-
>  meta/recipes-support/gmp/gmp.inc                   |    3 +-
>  meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 +-
>  meta/recipes-support/liboil/liboil_0.3.17.bb       |    3 +-
>  19 files changed, 39 insertions(+), 51 deletions(-)
>  delete mode 100644 meta/conf/machine/include/tune-thumb.inc

this causes ie eglibc not only to disable thumb but also to pass=20
-march=3Darmv4 and look in wrong directory for toolchain.. which because
it's not filtering thumb is in armv4t-oe-linux-gnueabi

export PATH=3D"
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/armv4-oe-linux-gnueabi.gcc-c=
ross-initial:
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/armv4-oe-linux-gnueabi:
/OE/shr-core/tmp/sysroots/om-gta02/usr/bin/crossscripts:
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/sbin:
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin:
/OE/shr-core/tmp/sysroots/x86_64-linux/sbin:
/OE/shr-core/tmp/sysroots/x86_64-linux//bin:
/OE/shr-core/openembedded-core/scripts:
/OE/bin:
/usr/local/bin:
/usr/bin:
/bin:
/opt/bin:
/usr/x86_64-pc-linux-gnu/gcc-bin/4.6.1:
/OE/shr-core/openembedded-core/scripts"

simple forward of oe.dev arm-thumb.inc logic to arm-feature-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -5,7 +5,8 @@
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
 TUNEVALID[thumb] =3D "Use thumb instructions instead of ARM"
-TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb"=
, "-mno-thumb", d)}"
+ARM_THUMB_M_OPT =3D "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INST=
RUCTION_SET', d, 1) =3D=3D 'thumb']}"
+TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_TH=
UMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"

seems to work.. will send patch after more testing, but eglibc compiled fin=
e now..


Regards,

--6yHiY5vv/BiPjcMt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4y4jAACgkQN1Ujt2V2gBz6/wCcCJNxTJOjn5Ut2//ogOiEgG4Y
8eUAnA5ggKbZ6zrbSt4pN+sa7awKREgo
=T+cc
-----END PGP SIGNATURE-----

--6yHiY5vv/BiPjcMt--
