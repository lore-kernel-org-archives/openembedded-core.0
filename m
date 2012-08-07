Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Syj0A-0007tx-TN
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 14:35:10 +0200
Received: by eaad12 with SMTP id d12so1210514eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 05:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ZiGJQ9TkzNEdCYGnfUf5CTS2LkvUgSVEolhpjfC6ClU=;
	b=lFTcQqUkVUM5PR1B7ZWrJex50oSZTF9ORW4mI5nX8PHiN12JPimY3ivf4eg66uC57m
	Fs6+VlOi2RsexB+5W4YvSzmOPcCqIQQArxTg/u/Zn87aVs1YjDVZc6vJCcIaYGFduaNj
	a8xDLr9aWYnXsvC4C6cKZZuHH2XbYkeVbfbkFtjUdzG1dkWU5qUivOsk5+uKQt+dv3FT
	1qLe5FI3owIhG/LE8cbxY9lAAvFZzhaJTIMdDZ2WLuLiCQ4VtyxBChLoMEAZ4QP0WZwI
	HpA3Ve4E8Q/W8h03nHmCyfrMxt1P3ZAGQrR6iQdMzT3pH5os2X3EYBN6+w0/TQ2GaNaa
	kENw==
Received: by 10.14.175.130 with SMTP id z2mr17580373eel.0.1344342205072;
	Tue, 07 Aug 2012 05:23:25 -0700 (PDT)
Received: from ?IPv6:2001:610:612::cc97:7ad6:f5c2:543f?
	([2001:610:612:0:cc97:7ad6:f5c2:543f])
	by mx.google.com with ESMTPS id h42sm55763277eem.5.2012.08.07.05.23.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 05:23:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <38e3b88585fd93495837f9f071887989a080ccd6.1344341416.git.wenzong.fan@windriver.com>
Date: Tue, 7 Aug 2012 14:23:42 +0200
Message-Id: <4B47D650-7569-4396-825C-92CB04489F87@dominion.thruhere.net>
References: <cover.1344341416.git.wenzong.fan@windriver.com>
	<38e3b88585fd93495837f9f071887989a080ccd6.1344341416.git.wenzong.fan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnANVgXalXijsqfP4lCg1RlDOMhyMTke/zhI8Zfw6eIgVLyKc/O3EAWxQWQrJ48SS/z6FFA
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] sysfsutils: install libs to base_libdir
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
X-List-Received-Date: Tue, 07 Aug 2012 12:35:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 aug. 2012, om 14:14 heeft wenzong.fan@windriver.com het volgende =
geschreven:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> Fix the warning form pcmciautils building:
>=20
> "WARNING: QA Issue: pcmciautils: /sbin/pccardctl, installed in the
> base_prefix, requires a shared library under exec_prefix (/usr):
> libsysfs.so.2 =3D> /usr/lib/libsysfs.so.2"
>=20
> Just refer to Debian/Ubuntu distributions, install sysfsutils libs
> to "/lib*" instead of "/usr/lib*".
>=20
> [YOCTO #2907]
>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
> meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb =
b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
> index 3e4fdda..f01d19b 100644
> --- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
> +++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
> @@ -8,7 +8,7 @@ LICENSE_libsysfs =3D "LGPLv2.1"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D3d06403ea54c7574a9e581c6478cc393 \
>                     =
file://cmd/GPL;md5=3Dd41d4e2e1e108554e0388ea4aecd8d27 \
>                     =
file://lib/LGPL;md5=3Db75d069791103ffe1c0d6435deeff72e"
> -PR =3D "r3"
> +PR =3D "r4"
>=20
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz =
\
> 	  file://sysfsutils-2.0.0-class-dup.patch \
> @@ -24,3 +24,5 @@ PACKAGES =3D+ "libsysfs libsysfs-dev =
libsysfs-staticdev"
> FILES_libsysfs =3D "${libdir}/lib*${SOLIBS}"
> FILES_libsysfs-dev =3D "${libdir}/lib*${SOLIBSDEV} ${includedir}"
> FILES_libsysfs-staticdev =3D "${libdir}/lib*.a"

Ahem! ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> +
> +export libdir =3D "${base_libdir}"

And can you post the buildhistory diff to see if anything else moved =
when it shouldn't have e.g. package config files?=20=


