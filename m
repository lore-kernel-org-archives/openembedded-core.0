Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOF4L-0004Bh-K0
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 23:20:41 +0200
Received: by dakh32 with SMTP id h32so2355477dak.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2012 14:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=Sfv2xAJ10vinpshGdX8YmWJSSoB7LZbGyhxh5iVAscQ=;
	b=A4v3EAqJRaGhTJOQEiIgwd0m2/qd/Dj5Sowdy9YYhbKZlueom/bCIHOOG2JWr/0NbR
	jmjEfUStln7B/PUBlbrTnbFvm0uPgmI8qcPsb7B3YBIMMsN5X1ahQcMrrp2voD4Dx0ZA
	fupVOeGDLS93K1Gcafkftswt6qDH/SeI3tEc7Rde9jPoh1eaF9kEvtdF2RWGxQTtLiEP
	eRAjgKWFCwx5zWnw/KHc3+f7AJrCz4fNqleiUX9AxtMCY/VFUyExnoFyb48LcgQEn3V8
	evUyLWADIhnjLujlL9in3k2eiTvvuKueyb9SdEzrAoNDghpiKgJlSzuqVuWkzjQQRXsI
	lNdg==
Received: by 10.68.130.67 with SMTP id oc3mr1537316pbb.164.1335647461055;
	Sat, 28 Apr 2012 14:11:01 -0700 (PDT)
Received: from [192.168.1.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id la9sm10711048pbc.1.2012.04.28.14.10.58
	(version=SSLv3 cipher=OTHER); Sat, 28 Apr 2012 14:10:59 -0700 (PDT)
Message-ID: <4F9C5CE0.1000309@gmail.com>
Date: Sat, 28 Apr 2012 14:10:56 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1334159995-3392-1-git-send-email-florin.sarbu@windriver.com>
In-Reply-To: <1334159995-3392-1-git-send-email-florin.sarbu@windriver.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH] vala: Add vala package as a devtool (version 0.12.1)
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
X-List-Received-Date: Sat, 28 Apr 2012 21:20:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/11/2012 08:59 AM, Florin Sarbu wrote:
> Added the vala package from meta-oe to support future systemd
> integration.
> 
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com> --- 
> meta/recipes-devtools/vala/vala.inc       |   25
> +++++++++++++++++++++++++ meta/recipes-devtools/vala/vala_0.12.1.bb
> |    7 +++++++ 2 files changed, 32 insertions(+), 0 deletions(-) 
> create mode 100644 meta/recipes-devtools/vala/vala.inc create mode
> 100644 meta/recipes-devtools/vala/vala_0.12.1.bb
> 
> diff --git a/meta/recipes-devtools/vala/vala.inc
> b/meta/recipes-devtools/vala/vala.inc new file mode 100644 index
> 0000000..0815c66 --- /dev/null +++
> b/meta/recipes-devtools/vala/vala.inc @@ -0,0 +1,25 @@ +DESCRIPTION
> = "Vala is a C#-like language dedicated to ease GObject
> programming. \ +Vala compiles to plain C and has no runtime
> environment nor penalities whatsoever." +SECTION = "devel" +DEPENDS
> = "glib-2.0 dbus" +BBCLASSEXTEND = "native" 
> +DEPENDS_virtclass-native = "glib-2.0-native dbus-native" +HOMEPAGE
> = "http://vala-project.org" +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM
> = "file://COPYING;md5=fbc093901857fcd118f065f900982c24" +INC_PR =
> "r0"

just delete the above line

> + +# +# WARNING: This source release has specifically been built
> for OpenEmbedded. +# Don't update to any upstream release without
> consulting the recipe maintainer. +# + +SRC_URI = "\ +
> http://downloads.freesmartphone.org/sources/vala-${PV}.tar.bz2;name=archive
> \ +" + +inherit autotools + +EXTRA_OECONF = "--disable-vapigen" + 
> +FILES_${PN}-doc += "${datadir}/devhelp" diff --git
> a/meta/recipes-devtools/vala/vala_0.12.1.bb
> b/meta/recipes-devtools/vala/vala_0.12.1.bb new file mode 100644 
> index 0000000..1049ed6 --- /dev/null +++
> b/meta/recipes-devtools/vala/vala_0.12.1.bb @@ -0,0 +1,7 @@ 
> +require vala.inc +SRC_URI =
> "ftp://ftp.gnome.org/pub/GNOME/sources/vala/0.12/vala-${PV}.tar.bz2"
>
> 
+
> +FILES_${PN} += "${datadir}/vala-0.12/vapi" + +SRC_URI[md5sum] =
> "bf35262cc611de447147d01cbac33767" +SRC_URI[sha256sum] =
> "d9a2be21bb8ab88eab838e7f3a4d0aaa2a1fddf35615dca32bef6a0051f58ea8"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+cXOAACgkQuwUzVZGdMxRKwACfQup0S660aQArw8pusBeQrUUX
23cAn2yTG9/+XySR5ff50o/ECvLeM6Bp
=tYWi
-----END PGP SIGNATURE-----


