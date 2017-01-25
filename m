Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 20C6F71DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 17:12:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so43757401wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 09:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kWQw4pa5TnWZ1AwLyI6geJ8hzVBEEoccXHh1UpwEbfs=;
	b=Xmz++s3s8ZiAGZL/wq/jnSws0koHNLBcXp3YvjE2iWjpvdOA6Hxr9LwirQ7dvsKRcf
	/dOmuT0Zg8gEms8ZF+ChlcmvIuGooDgiRZl3FvNBrk03CWRcpz/CfZHce+na0xmpsIWR
	n1diyy/TOolD6o5SKwu/XYBgPJtPmiGifwx1ZhRBH2nvwDpZNniuP9AiEvyZjRP61pJO
	rTS946QixlWJjJzjx9OBAIdCbKil109FM/AUG1pRMSJqL7RJXApwPNX6+JIdRGJxk9ix
	z6zapO/QKIBgFYJdbNAhCrSz5VPeBmDzk++rSVd8s4ThU/TlAS+8aZMq/z0dNOQTWZlL
	JFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kWQw4pa5TnWZ1AwLyI6geJ8hzVBEEoccXHh1UpwEbfs=;
	b=eKWxIZh2x9aARhAbz/plKvAMwqzyis1Kige0UMNZmpuEUmI5rdOW9JVA4PQBmMbOpg
	k4pWsIprzCgwzH6z8j9uyhMlihHbZk4XKq+xBZsL8WRkbheDRS3ctISB9d0RjCc73CPa
	wLiPpYptMrAkj/mt1aJ/UMGhh1obEYJek0FC7W1sxW6KK7YcysRTf4Mz1T5eVJb3eMw2
	+zgc4uwNNa0uDxDNqhCnn5lg2tpG2bwQz6PoHND6hcIZUDAq/64gD2MnCgg27cglGUiU
	1zog5yoWY0soGlO6aPRKGgz1YBMvVUI32dn+NXxJOSKwGlJMe/CoaiycokXqX3GL1EUO
	tKhQ==
X-Gm-Message-State: AIkVDXKvIWshTCrWwZngsdhp4yZJryoloC/HNWCFHBjNBIPccqPmXLiSedhItnVtF9SdNA==
X-Received: by 10.28.198.139 with SMTP id w133mr22349537wmf.80.1485364321517; 
	Wed, 25 Jan 2017 09:12:01 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	18sm25919424wrb.14.2017.01.25.09.11.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 09:12:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jan 2017 18:12:02 +0100
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20170125171202.GH3260@jama>
References: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] screen: Upgrade 4.4.0 -> 4.5.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2017 17:12:02 -0000
X-Groupsio-MsgNum: 92378
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jHkwA2TBA/ec6v+"
Content-Disposition: inline

--9jHkwA2TBA/ec6v+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2017 at 11:58:57AM +0200, Maxin B. John wrote:
> Removed the following Backported patches:
>  1. 0001-fix-for-multijob-build.patch
>  2. 0002-comm.h-now-depends-on-term.h.patch

Maybe it's worth waiting a bit with this upgrade until this is resolved:
https://bugs.gentoo.org/show_bug.cgi?id=3D607116

> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../screen/0001-fix-for-multijob-build.patch       | 58 ----------------=
------
>  .../screen/0002-comm.h-now-depends-on-term.h.patch | 33 ------------
>  .../screen/{screen_4.4.0.bb =3D> screen_4.5.0.bb}    |  6 +--
>  3 files changed, 2 insertions(+), 95 deletions(-)
>  delete mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-mult=
ijob-build.patch
>  delete mode 100644 meta/recipes-extended/screen/screen/0002-comm.h-now-d=
epends-on-term.h.patch
>  rename meta/recipes-extended/screen/{screen_4.4.0.bb =3D> screen_4.5.0.b=
b} (88%)
>=20
> diff --git a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-bu=
ild.patch b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build=
=2Epatch
> deleted file mode 100644
> index fbdb0eb..0000000
> --- a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.pat=
ch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 79ad2885e26631077dd6b8aebe17ae95b38133a6 Mon Sep 17 00:00:00 2001
> -From: Jackie Huang <jackie.huang@windriver.com>
> -Date: Tue, 26 Jul 2016 14:23:59 +0800
> -Subject: [PATCH] fix for multijob build
> -
> -make sure that comm.sh script generates comm.h header before doing
> -anything else
> -
> -Signed-off-by: Amadeusz Sawiski <amade@asmblr.net>
> -
> -Upstream-Status: Backport
> -
> -Backport patch to fix parallel build failure and update context to make =
patch
> -coulde be applied.
> -
> -http://git.savannah.gnu.org/cgit/screen.git/commit?id=3Dc0de6dd
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - Makefile.in | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index aca7da3..3607711 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -298,7 +298,7 @@ search.o: layout.h viewport.h canvas.h search.c conf=
ig.h screen.h os.h osdef.h a
> -  comm.h layer.h term.h image.h display.h window.h mark.h extern.h
> - tty.o: layout.h viewport.h canvas.h tty.c config.h screen.h os.h osdef.=
h ansi.h acls.h comm.h \
> -  layer.h term.h image.h display.h window.h extern.h
> --term.o: layout.h viewport.h canvas.h term.c term.h
> -+term.o: layout.h viewport.h canvas.h term.c term.h comm.h
> - window.o: layout.h viewport.h canvas.h window.c config.h screen.h os.h =
osdef.h ansi.h acls.h \
> -  comm.h layer.h term.h image.h display.h window.h extern.h logfile.h
> - utmp.o: layout.h viewport.h canvas.h utmp.c config.h screen.h os.h osde=
f.h ansi.h acls.h \
> -@@ -324,7 +324,7 @@ canvas.o: layout.h viewport.h canvas.h canvas.c conf=
ig.h screen.h os.h osdef.h a
> -  comm.h layer.h term.h image.h display.h window.h extern.h \
> -  braille.h
> - comm.o: layout.h viewport.h canvas.h comm.c config.h acls.h comm.h
> --kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h
> -+kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h comm.h
> - acls.o: layout.h viewport.h canvas.h acls.c config.h screen.h os.h osde=
f.h ansi.h acls.h comm.h \
> -  layer.h term.h image.h display.h window.h extern.h
> - braille.o: layout.h viewport.h canvas.h braille.c config.h screen.h os.=
h osdef.h ansi.h acls.h \
> -@@ -350,7 +350,7 @@ layout.o: layout.h viewport.h canvas.h layout.c conf=
ig.h screen.h os.h osdef.h a
> - viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h o=
s.h osdef.h ansi.h acls.h \
> -  comm.h layer.h term.h image.h display.h window.h extern.h \
> -  braille.h
> --list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h
> --list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h
> -+list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h =
comm.h
> -+list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h =
comm.h
> - list_window.o: list_generic.h list_window.c window.h layer.h screen.h o=
sdef.h comm.h
> -=20
> ---=20
> -1.9.1
> -
> diff --git a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-=
on-term.h.patch b/meta/recipes-extended/screen/screen/0002-comm.h-now-depen=
ds-on-term.h.patch
> deleted file mode 100644
> index b5d71cc..0000000
> --- a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term=
=2Eh.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Upstream-Status: Backport
> -
> -Backport from:
> -
> -http://git.savannah.gnu.org/cgit/screen.git/commit/?id=3D39c5f1c
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -From 39c5f1c76f1fcef4b5958bf828a63f53426b6984 Mon Sep 17 00:00:00 2001
> -From: Mike Gerwitz <mike@mikegerwitz.com>
> -Date: Tue, 24 Dec 2013 22:16:31 -0500
> -Subject: [PATCH] comm.h now depends on term.h
> -
> ----
> - src/Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/Makefile.in b/src/Makefile.in
> -index e791e79..d4f7c0b 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -113,7 +113,7 @@ term.h: term.c term.sh
> -=20
> - kmapdef.c: term.h
> -=20
> --comm.h: comm.c comm.sh config.h
> -+comm.h: comm.c comm.sh config.h term.h
> - 	AWK=3D$(AWK) CC=3D"$(CC) $(CFLAGS)" srcdir=3D${srcdir} sh $(srcdir)/co=
mm.sh
> -=20
> - docs:
> ---=20
> -2.4.1
> -
> diff --git a/meta/recipes-extended/screen/screen_4.4.0.bb b/meta/recipes-=
extended/screen/screen_4.5.0.bb
> similarity index 88%
> rename from meta/recipes-extended/screen/screen_4.4.0.bb
> rename to meta/recipes-extended/screen/screen_4.5.0.bb
> index 769bac1..4e4a95f 100644
> --- a/meta/recipes-extended/screen/screen_4.4.0.bb
> +++ b/meta/recipes-extended/screen/screen_4.5.0.bb
> @@ -22,12 +22,10 @@ SRC_URI =3D "${GNU_MIRROR}/screen/screen-${PV}.tar.gz=
 \
>             file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patc=
h \
>             file://Skip-host-file-system-checks-when-cross-compiling.patc=
h \
>             file://Avoid-mis-identifying-systems-as-SVR4.patch \
> -           file://0002-comm.h-now-depends-on-term.h.patch \
> -           file://0001-fix-for-multijob-build.patch \
>            "
> =20
> -SRC_URI[md5sum] =3D "d26e11a3648c2b11aaefa215a55dfd39"
> -SRC_URI[sha256sum] =3D "ef722a54759a3bf23aad272bbf33c414c1078cad6bcd982f=
ada93c0d7917218b"
> +SRC_URI[md5sum] =3D "a32105a91359afab1a4349209a028e31"
> +SRC_URI[sha256sum] =3D "01c3a7c362185f35d6a95dff52d64337076496acd034d717=
de3c263500cfefb0"
> =20
>  inherit autotools texinfo
> =20
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9jHkwA2TBA/ec6v+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIjcYgAKCRA3VSO3ZXaA
HMbTAJ0fIAysydHRXqvqc7xx6miklhYNrQCcDSty5dPTY1isUDEkSNIeDmQK5Lo=
=/dCX
-----END PGP SIGNATURE-----

--9jHkwA2TBA/ec6v+--
