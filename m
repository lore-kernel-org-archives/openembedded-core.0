Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 38A6D72EED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 09:47:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b21so8559652wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 02:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=jT1bNxS0020FQ1HBbrL8yy+6ZEeiq47+Ehloa9zy2TQ=;
	b=EjmAkSn50NmL+5YcvGuojA+Mc/gk3He5zGFQMIuYlSyMI0jh9InOOPVuepfQPxXghE
	8Ge6Lg++qaKvq817Olkq8EroV78la2JUEs/DlQpQlRz3KzH4sY5arfX9eFvnncNLmog8
	YKc77lO8QVPt+wmPrrWGj8ba0gUDBK487ZncMcoOhS0OqlObpgnUT0pO37hGe1TE5ypx
	g7v+ImUABTSWmQZK8qU85NUk4CuP82bgK0KAgX9VGEObJsttpI8AM9j+6ODns3wgdmSa
	UET9p9L/TElpjqeXFWo/qTMWqXjlKT/k76u5l82MfQJ//aNXsj3vYY+MZjjohz0P2X57
	39xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=jT1bNxS0020FQ1HBbrL8yy+6ZEeiq47+Ehloa9zy2TQ=;
	b=IryD+srHmRAOelvU/p/MS6q4feh/k1eI4LQNUTqdNOheHAeAh7MwH9cXkgFMxx360l
	bjMdDv98wY+49LUOLSYrkS9zKy4EtYLeOKyKqZhDACz/ubRRO8sWT3YhN5j2z20TFhZ3
	CsmBYiY3AdWz0WqZN0HwJhIsgF50DpLHATsVDqrwd635mU1Hudoz6kzBBUrBpVnbJiE8
	dOhq66T0SxdKwnptt8q64tLq5DNMiSo6K7DzzntaJqBAyQ1hk8bWdNFtOyYeceVSkFeK
	+6EMWQAXlcNc2SVXw7Vl49D/nNaQsM23RwDSUcDrG93LSicMqBLP5bdQODyQa1Vyo5C1
	PwSw==
X-Gm-Message-State: ALQs6tA34dNUwyI98+pwBRozSCdzn45F3bfO5U2NJam/bP6U6dEcmLd+
	euVIUW27/SDJuqE0wBH55mHcjAizgoE=
X-Google-Smtp-Source: AIpwx4+epAg4ZiEubZpQgdNqQBfzKVdwG1QbeRXDRNZFqcjvUfkRneu/TD0uIK2IJDCMqdTzMUum5Q==
X-Received: by 10.80.129.167 with SMTP id 36mr14000849ede.13.1523526446272;
	Thu, 12 Apr 2018 02:47:26 -0700 (PDT)
Received: from [172.20.0.85] ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id q10sm2235168eda.2.2018.04.12.02.47.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Apr 2018 02:47:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.15\))
Date: Thu, 12 Apr 2018 11:47:23 +0200
References: <20180409115657.16651-1-koen.kooi@linaro.org>
	<20180409115657.16651-2-koen.kooi@linaro.org>
	<1523291792.2942.100.camel@linuxfoundation.org>
	<9C357BAC-079B-4392-BF6F-D06CBEBEC242@dominion.thruhere.net>
To: OE-core <openembedded-core@lists.openembedded.org>
In-Reply-To: <9C357BAC-079B-4392-BF6F-D06CBEBEC242@dominion.thruhere.net>
Message-Id: <6A2998DD-74BD-42A3-8A15-8071D5C8010F@dominion.thruhere.net>
X-Mailer: Apple Mail (2.3445.6.15)
Subject: Re: [PATCH 2/3] bind: fix openSSL detection when using multiarch
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
X-List-Received-Date: Thu, 12 Apr 2018 09:47:26 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> Op 11 apr. 2018, om 11:25 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

[..]

> There is one change that will need careful consideration if it is =
meant for sumo, it looks like the sysroot code treats libdir differently =
from base_libdir:
>=20
> 	[koen@fedora-vm build-rpb]$ ls =
tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/rpb-console-image/1.0-r0/=
recipe-sysroot-native/lib/
> 	x86_64-linux
>=20
> 	[koen@fedora-vm build-rpb]$ ls =
tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/rpb-console-image/1.0-r0/=
recipe-sysroot-native/usr/lib/
> 	aarch64-linaro-linux   libcomps.so                libexpat.a     =
     libgdbm_compat.so             libgthread-2.0.so.0.5400.3  =
libmpc.so.3.1.0           libparted-fs-resize.so.0.0.1  libpython3.so    =
      libtermcap.so
> 	[..]
> 	libcheck.so.0.0.0      libelf.so.1                =
libgdbm_compat.a    libgthread-2.0.so.0           libmpc.so.3            =
     libparted-fs-resize.so.0  libpython3.5m.so.1.0          =
libssl.so.1.0.2
>=20
> E2fsprogs installs into base_libdir, which gets the multiarch =
treatment, and mkfs.ext4 fails to find its libs during image generation.=20=


The assumption seems to have been correct, trying a build with this =
change:

[koen@fedora-vm openembedded-core]$ git diff
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index a911f2a..7f2df17 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -78,6 +78,7 @@ exec_prefix =3D =
"${STAGING_DIR_NATIVE}${prefix_native}"
=20
 bindir =3D "${STAGING_BINDIR_NATIVE}"
 sbindir =3D "${STAGING_SBINDIR_NATIVE}"
+base_libdir =3D "${STAGING_LIBDIR_NATIVE}"
 libdir =3D "${STAGING_LIBDIR_NATIVE}"
 includedir =3D "${STAGING_INCDIR_NATIVE}"
 sysconfdir =3D "${STAGING_ETCDIR_NATIVE}"
@@ -89,6 +90,7 @@ export lt_cv_sys_lib_dlsearch_path_spec =3D "${libdir} =
${base_libdir} /lib /lib64
=20
 NATIVE_PACKAGE_PATH_SUFFIX ?=3D ""
 bindir .=3D "${NATIVE_PACKAGE_PATH_SUFFIX}"
+base_libdir .=3D "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libdir .=3D "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libexecdir .=3D "${NATIVE_PACKAGE_PATH_SUFFIX}"
=20


regards,

Koen


