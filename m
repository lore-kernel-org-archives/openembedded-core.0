Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E37937F8BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 15:22:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id h14so3107867pfe.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 07:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bzQ7raUYJ57tM5R4O836WuU3GhLooDRX8O/bJ4EwgWs=;
	b=W7DdrTdLDudtb5g8kpdzEWR/vt2QDOqtL+Me/OA1NKVadk8G2tFNQF803bJYzuHcUl
	3cwJ2ofqXYv3dKimVHVkxZe+F8MCqdblL4fVPdHHUaOUzYISec4cFtxvnR2+sbpLzlOk
	E5G+YG5/Nk4aWRorVZlNc84xB5e33FdQbD/K2pv6ar55CAfssWmQW/U1TvIZGQLN9n+M
	JAhVi0r2/48n0HvH6xgaCuOicq1+Yu2yeeXgNP6lyAmDH6JVjAmFXwlFkIZCMbe85izh
	suIPkXYJNzw8DdPSNAHnOMI9WpFcMQz6SJi25rLfN1eIHmabqmGMX933i0ZX72/9xqL3
	grsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=bzQ7raUYJ57tM5R4O836WuU3GhLooDRX8O/bJ4EwgWs=;
	b=olADyMz7jGuyaGBmVmSRaiuV8XmnxFBq9i1gQ7h/MsD6GI15DLLnjBxPC7x4d+vzxE
	FfzAzvmdTe5ufY47/mHvRdnxNt6cDxPv+8w1R61Fue7MT8wyHOO+FKJRJGqm6mstAc9r
	+hwhstoO/pw0mZ1EGocNNBsKB61BTcLTekgjUFULE5raF5V4A2OMlA4cYJdHPFqApXIl
	dNyCoQIzLqgGkpYHZXv9XIFhLfQxpHEHWrdMAu6nLbPTZzz2SOVq7nl3BDX5vhR4EoOj
	drUJ6+RMP7aBWUIxCbqkevyDJd7N6j0dNDpfmCK/dRKSBCm7msdeEMwf9fjB1CmFR5GE
	WWew==
X-Gm-Message-State: APjAAAW1ENdTIfOniIoXHdjKZ0g+568eeSlw7LzpUxAvjewCpJEzYnYx
	OIosfA54U0Q5b6sJ44lo+uldr/kU
X-Google-Smtp-Source: APXvYqyN8wgwe1bNbolFksDyhof67uJPcXhWduNbKfbKiPhaEDBYzMfIQ9EgZiTNpi3ldmx/ir5Lfg==
X-Received: by 2002:aa7:8f05:: with SMTP id x5mr8437115pfr.86.1574954563539;
	Thu, 28 Nov 2019 07:22:43 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:1045:7bbb:60b1:28c7?
	([2601:202:4180:a5c0:1045:7bbb:60b1:28c7])
	by smtp.gmail.com with ESMTPSA id
	u18sm5357709pgi.44.2019.11.28.07.22.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Nov 2019 07:22:43 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-2-alex.kanavin@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <158d5306-6ce3-8510-3c4c-20194b88eec6@gmail.com>
Date: Thu, 28 Nov 2019 07:22:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127164003.115980-2-alex.kanavin@gmail.com>
Subject: Re: [PATCH 02/14] rpm: upgrade to 4.15.1
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
X-List-Received-Date: Thu, 28 Nov 2019 15:22:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/27/19 8:39 AM, Alexander Kanavin wrote:
> Drop patches that were merged upstream.
>
> 0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> modifies a file that was removed upstream.
>
> Add a 0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> as unfortunately the new parallel file classification feature from
> upstream trips over somewhere in libmagic when inspected files are
> compressed:
> https://github.com/rpm-software-management/rpm/issues/756

Failed on ab selftest

https://errors.yoctoproject.org/Errors/Details/288828/
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...satisfiable-dependency-when-building.patch |  28 +-
>  ...lib-rpm-as-the-installation-path-for.patch |  14 +-
>  ...kage-building-into-a-separate-functi.patch |  84 -----
>  ...es-requires-do-not-use-monodis-from-.patch |  58 ---
>  ...-run-file-classification-in-parallel.patch |  65 ++++
>  ...ry-package-creation-via-thread-pools.patch | 127 -------
>  ...e-operations-over-string-pools-threa.patch | 207 -----------
>  ...ove-static-local-variables-from-buil.patch | 336 ------------------
>  .../rpm/{rpm_4.14.2.1.bb => rpm_4.15.1.bb}    |  15 +-
>  9 files changed, 90 insertions(+), 844 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
>  rename meta/recipes-devtools/rpm/{rpm_4.14.2.1.bb => rpm_4.15.1.bb} (90%)
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> index 80e2f0fad70..4029233fb70 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> @@ -1,4 +1,4 @@
> -From 87cfc0db1ed6fe381a5ed5f0016d8c3344a31a11 Mon Sep 17 00:00:00 2001
> +From f39c28eb52f12ae6e82db360ffd5a903ac8faca5 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 9 Jan 2017 18:52:11 +0200
>  Subject: [PATCH] Do not add an unsatisfiable dependency when building rpms in
> @@ -9,25 +9,23 @@ hand produces rpms that way by design.
>  
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   build/pack.c | 4 ----
>   1 file changed, 4 deletions(-)
>  
>  diff --git a/build/pack.c b/build/pack.c
> -index 1261cdbba..bb2d6f4f6 100644
> +index e6cec1816..810cd7351 100644
>  --- a/build/pack.c
>  +++ b/build/pack.c
> -@@ -595,10 +595,6 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> - 	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
> - 	}
> +@@ -724,10 +724,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> + 	headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
> +     }
> + 
> +-    if (cheating) {
> +-	(void) rpmlibNeedsFeature(pkg, "ShortCircuited", "4.9.0-1");
> +-    }
> +-
> +     if ((rc = getPkgFilename(pkg->header, filename)))
> + 	return rc;
>   
> --	if (cheating) {
> --	    (void) rpmlibNeedsFeature(pkg, "ShortCircuited", "4.9.0-1");
> --	}
> --	
> - 	{   char *binFormat = rpmGetPath("%{_rpmfilename}", NULL);
> - 	    char *binRpm, *binDir;
> - 	    binRpm = headerFormat(pkg->header, binFormat, &errorString);
> --- 
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> index 82e7328757f..52440d68180 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> @@ -1,4 +1,4 @@
> -From bd08eb0ae1312f347f49949481daa7c923752df2 Mon Sep 17 00:00:00 2001
> +From 2f3d1619b6510bc131c4375827caf912559f0fa2 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 27 Feb 2017 09:43:30 +0200
>  Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
> @@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   3 files changed, 4 insertions(+), 4 deletions(-)
>  
>  diff --git a/configure.ac b/configure.ac
> -index 09af7c4..9bd6903 100644
> +index d3aeab86e..1a1f3f91f 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1055,7 +1055,7 @@ else
> +@@ -1086,7 +1086,7 @@ else
>       usrprefix=$prefix
>   fi
>   
> @@ -27,10 +27,10 @@ index 09af7c4..9bd6903 100644
>   
>   AC_SUBST(OBJDUMP)
>  diff --git a/macros.in b/macros.in
> -index a3aa7a9..62cee5c 100644
> +index fe9803aad..d128675bf 100644
>  --- a/macros.in
>  +++ b/macros.in
> -@@ -970,7 +970,7 @@ package or when debugging this package.\
> +@@ -985,7 +985,7 @@ package or when debugging this package.\
>   %_sharedstatedir	%{_prefix}/com
>   %_localstatedir		%{_prefix}/var
>   %_lib			lib
> @@ -40,7 +40,7 @@ index a3aa7a9..62cee5c 100644
>   %_infodir		%{_datadir}/info
>   %_mandir		%{_datadir}/man
>  diff --git a/rpm.am b/rpm.am
> -index 82c2d7c..6341b51 100644
> +index 40b4ec55f..3139ce8f6 100644
>  --- a/rpm.am
>  +++ b/rpm.am
>  @@ -1,10 +1,10 @@
> @@ -55,4 +55,4 @@ index 82c2d7c..6341b51 100644
>  +rpmconfigdir = $(libdir)/rpm
>   
>   # Libtool version (current-revision-age) for all our libraries
> - rpm_version_info = 9:0:1
> + rpm_version_info = 9:1:0
> diff --git a/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch b/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> deleted file mode 100644
> index 6e44f0b7fc9..00000000000
> --- a/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From 721a660a507d6d062e7aecafad886c643970a5d5 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Thu, 25 May 2017 18:15:27 +0300
> -Subject: [PATCH 1/4] Split binary package building into a separate function
> -
> -So that it can be run as a thread pool task.
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - build/pack.c | 33 +++++++++++++++++++++------------
> - 1 file changed, 21 insertions(+), 12 deletions(-)
> -
> -diff --git a/build/pack.c b/build/pack.c
> -index 518f4e92a..ccfd614cc 100644
> ---- a/build/pack.c
> -+++ b/build/pack.c
> -@@ -546,18 +546,13 @@ static rpmRC checkPackages(char *pkgcheck)
> -     return RPMRC_OK;
> - }
> - 
> --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> -+static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename)
> - {
> --    rpmRC rc;
> --    const char *errorString;
> --    Package pkg;
> --    char *pkglist = NULL;
> --
> --    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> --	char *fn;
> -+	const char *errorString;
> -+	rpmRC rc = RPMRC_OK;
> - 
> - 	if (pkg->fileList == NULL)
> --	    continue;
> -+	    return rc;
> - 
> - 	if ((rc = processScriptFiles(spec, pkg)))
> - 	    return rc;
> -@@ -587,7 +582,7 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> - 		     headerGetString(pkg->header, RPMTAG_NAME), errorString);
> - 		return RPMRC_FAIL;
> - 	    }
> --	    fn = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
> -+	    *filename = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
> - 	    if ((binDir = strchr(binRpm, '/')) != NULL) {
> - 		struct stat st;
> - 		char *dn;
> -@@ -609,14 +604,28 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> - 	    free(binRpm);
> - 	}
> - 
> --	rc = writeRPM(pkg, NULL, fn, NULL);
> -+	rc = writeRPM(pkg, NULL, *filename, NULL);
> - 	if (rc == RPMRC_OK) {
> - 	    /* Do check each written package if enabled */
> --	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", fn, NULL);
> -+	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
> - 	    if (pkgcheck[0] != ' ') {
> - 		rc = checkPackages(pkgcheck);
> - 	    }
> - 	    free(pkgcheck);
> -+	}
> -+	return rc;
> -+}
> -+
> -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> -+{
> -+    rpmRC rc;
> -+    Package pkg;
> -+    char *pkglist = NULL;
> -+
> -+    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> -+	char *fn = NULL;
> -+	rc = packageBinary(spec, pkg, cookie, cheating, &fn);
> -+	if (rc == RPMRC_OK) {
> - 	    rstrcat(&pkglist, fn);
> - 	    rstrcat(&pkglist, " ");
> - 	}
> --- 
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> deleted file mode 100644
> index 24aa4c7ffff..00000000000
> --- a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From 43fbc3f53302a395463e8450ac81c53f623eec3f Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Tue, 27 Aug 2019 17:42:34 +0200
> -Subject: [PATCH] mono-find-provides/requires: do not use monodis from the host
> -
> -There was a host contamination issue here: if monodis was installed
> -on the host, do_package would use that to resolve dependencies
> -of mono libraries (and often fail in that). Without monodis,
> -no dependencies are resolved, which is seemingly how things
> -are supposed to work.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - scripts/mono-find-provides | 8 ++++----
> - scripts/mono-find-requires | 8 ++++----
> - 2 files changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/scripts/mono-find-provides b/scripts/mono-find-provides
> -index 9348457d3..b28872ffb 100644
> ---- a/scripts/mono-find-provides
> -+++ b/scripts/mono-find-provides
> -@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
> - build_bindir="$2/usr/bin"
> - build_libdir="$2$3"
> - 
> --if [ -x $build_bindir/monodis ]; then
> --    monodis="$build_bindir/monodis"
> -+if [ -x $build_bindir/monodis.bogus ]; then
> -+    monodis="$build_bindir/monodis.bogus"
> -     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
> --elif [ -x /usr/bin/monodis ]; then
> --    monodis="/usr/bin/monodis"
> -+elif [ -x /usr/bin/monodis.bogus ]; then
> -+    monodis="/usr/bin/monodis.bogus"
> - else
> -     exit 0;
> - fi
> -diff --git a/scripts/mono-find-requires b/scripts/mono-find-requires
> -index ea58cae48..d270169e1 100644
> ---- a/scripts/mono-find-requires
> -+++ b/scripts/mono-find-requires
> -@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
> - build_bindir="$2/usr/bin"
> - build_libdir="$2$3"
> - 
> --if [ -x $build_bindir/monodis ]; then
> --    monodis="$build_bindir/monodis"
> -+if [ -x $build_bindir/monodis.bogus ]; then
> -+    monodis="$build_bindir/monodis.bogus"
> -     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
> --elif [ -x /usr/bin/monodis ]; then
> --    monodis="/usr/bin/monodis"
> -+elif [ -x /usr/bin/monodis.bogus ]; then
> -+    monodis="/usr/bin/monodis.bogus"
> - else
> -     exit 0;
> - fi
> diff --git a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> new file mode 100644
> index 00000000000..9a5cd7c80dc
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> @@ -0,0 +1,65 @@
> +From 93c3c7f043f62e96941274e957c4ad9432032af1 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 18 Nov 2019 16:22:56 +0100
> +Subject: [PATCH] rpmfc.c: do not run file classification in parallel
> +
> +This is causing freezes with libmagic when the file in question is compressed:
> +https://github.com/rpm-software-management/rpm/issues/756
> +
> +Upstream-Status: Inapppropriate [upstream wants a proper fix]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + build/rpmfc.c | 8 --------
> + 1 file changed, 8 deletions(-)
> +
> +diff --git a/build/rpmfc.c b/build/rpmfc.c
> +index 3db7a9352..17afdd57a 100644
> +--- a/build/rpmfc.c
> ++++ b/build/rpmfc.c
> +@@ -680,7 +680,6 @@ static void rpmfcAttributes(rpmfc fc, int ix, const char *ftype, const char *ful
> + 	/* Add attributes on libmagic type & path pattern matches */
> + 	if (matches(&(*attr)->incl, ftype, path, is_executable)) {
> + 	    argvAddTokens(&fc->fattrs[ix], (*attr)->name);
> +-	    #pragma omp critical(fahash)
> + 	    fattrHashAddEntry(fc->fahash, attr-fc->atypes, ix);
> + 	}
> +     }
> +@@ -1105,7 +1104,6 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv, rpm_mode_t * fmode)
> +     /* Build (sorted) file class dictionary. */
> +     fc->cdict = rpmstrPoolCreate();
> + 
> +-    #pragma omp parallel
> +     {
> +     /* libmagic is not thread-safe, each thread needs to a private handle */
> +     magic_t ms = magic_open(msflags);
> +@@ -1113,15 +1111,12 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv, rpm_mode_t * fmode)
> +     if (ms == NULL) {
> + 	rpmlog(RPMLOG_ERR, _("magic_open(0x%x) failed: %s\n"),
> + 		msflags, strerror(errno));
> +-	#pragma omp cancel parallel
> +     }
> + 
> +     if (magic_load(ms, NULL) == -1) {
> + 	rpmlog(RPMLOG_ERR, _("magic_load failed: %s\n"), magic_error(ms));
> +-	#pragma omp cancel parallel
> +     }
> + 
> +-    #pragma omp for ordered reduction(+:nerrors)
> +     for (int ix = 0; ix < fc->nfiles; ix++) {
> + 	rpmsid ftypeId;
> + 	const char * ftype;
> +@@ -1185,14 +1180,11 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv, rpm_mode_t * fmode)
> + 	fc->fcolor[ix] = fcolor;
> + 
> + 	/* Add to file class dictionary and index array */
> +-	#pragma omp ordered
> + 	if (fcolor != RPMFC_WHITE && (fcolor & RPMFC_INCLUDE)) {
> + 	    ftypeId = rpmstrPoolId(fc->cdict, ftype, 1);
> +-	    #pragma omp atomic
> + 	    fc->fknown++;
> + 	} else {
> + 	    ftypeId = rpmstrPoolId(fc->cdict, "", 1);
> +-	    #pragma omp atomic
> + 	    fc->fwhite++;
> + 	}
> + 	/* Pool id's start from 1, for headers we want it from 0 */
> diff --git a/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch b/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> deleted file mode 100644
> index d10041c2e14..00000000000
> --- a/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> +++ /dev/null
> @@ -1,127 +0,0 @@
> -From 513200cf76758de4668312c628d6362bdabfaf4b Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Thu, 25 May 2017 19:30:20 +0300
> -Subject: [PATCH 1/3] Run binary package creation via thread pools.
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - build/pack.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++-----------
> - configure.ac |  3 +++
> - 2 files changed, 70 insertions(+), 14 deletions(-)
> -
> -diff --git a/build/pack.c b/build/pack.c
> -index ccfd614cc..ed5b9ab4e 100644
> ---- a/build/pack.c
> -+++ b/build/pack.c
> -@@ -616,25 +616,78 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> - 	return rc;
> - }
> - 
> --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> -+struct binaryPackageTaskData
> - {
> --    rpmRC rc;
> -     Package pkg;
> -+    char *filename;
> -+    rpmRC result;
> -+    struct binaryPackageTaskData *next;
> -+};
> -+
> -+static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating)
> -+{
> -+    struct binaryPackageTaskData *tasks = NULL;
> -+    struct binaryPackageTaskData *task = NULL;
> -+    struct binaryPackageTaskData *prev = NULL;
> -+
> -+    for (Package pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> -+        task = rcalloc(1, sizeof(*task));
> -+        task->pkg = pkg;
> -+        if (pkg == spec->packages) {
> -+            // the first package needs to be processed ahead of others, as they copy
> -+            // changelog data from it, and so otherwise data races would happen
> -+            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename));
> -+            rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> -+            tasks = task;
> -+        }
> -+        if (prev != NULL) {
> -+            prev->next = task;
> -+        }
> -+        prev = task;
> -+    }
> -+
> -+    #pragma omp parallel
> -+    #pragma omp single
> -+    // re-declaring task variable is necessary, or older gcc versions will produce code that segfaults
> -+    for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
> -+        if (task != tasks)
> -+        #pragma omp task
> -+        {
> -+            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename));
> -+            rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> -+        }
> -+    }
> -+
> -+    return tasks;
> -+}
> -+
> -+static void freeBinaryPackageTasks(struct binaryPackageTaskData* tasks)
> -+{
> -+    while (tasks != NULL) {
> -+        struct binaryPackageTaskData* next = tasks->next;
> -+        rfree(tasks->filename);
> -+        rfree(tasks);
> -+        tasks = next;
> -+    }
> -+}
> -+
> -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> -+{
> -     char *pkglist = NULL;
> - 
> --    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> --	char *fn = NULL;
> --	rc = packageBinary(spec, pkg, cookie, cheating, &fn);
> --	if (rc == RPMRC_OK) {
> --	    rstrcat(&pkglist, fn);
> --	    rstrcat(&pkglist, " ");
> --	}
> --	free(fn);
> --	if (rc != RPMRC_OK) {
> --	    pkglist = _free(pkglist);
> --	    return rc;
> --	}
> -+    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating);
> -+
> -+    for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
> -+        if (task->result == RPMRC_OK) {
> -+            rstrcat(&pkglist, task->filename);
> -+            rstrcat(&pkglist, " ");
> -+        } else {
> -+            _free(pkglist);
> -+            freeBinaryPackageTasks(tasks);
> -+            return RPMRC_FAIL;
> -+        }
> -     }
> -+    freeBinaryPackageTasks(tasks);
> - 
> -     /* Now check the package set if enabled */
> -     if (pkglist != NULL) {
> -diff --git a/configure.ac b/configure.ac
> -index a506ec819..59fa0acaf 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -17,6 +17,9 @@ AC_DISABLE_STATIC
> - 
> - PKG_PROG_PKG_CONFIG
> - 
> -+AC_OPENMP
> -+RPMCFLAGS="$OPENMP_CFLAGS $RPMCFLAGS"
> -+
> - dnl Checks for programs.
> - AC_PROG_CXX
> - AC_PROG_AWK
> --- 
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch b/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
> deleted file mode 100644
> index c348ae5330e..00000000000
> --- a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
> +++ /dev/null
> @@ -1,207 +0,0 @@
> -From c80892f17e44331206c8318d53b63bb6a99554d0 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Tue, 30 May 2017 13:58:30 +0300
> -Subject: [PATCH 3/4] rpmstrpool.c: make operations over string pools
> - thread-safe
> -
> -Otherwise multithreaded rpm building explodes in various ways due
> -to data races.
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - rpmio/rpmstrpool.c | 56 +++++++++++++++++++++++++++++++++++++++++++++---------
> - 1 file changed, 47 insertions(+), 9 deletions(-)
> -
> -diff --git a/rpmio/rpmstrpool.c b/rpmio/rpmstrpool.c
> -index 30a57eb10..58ba95a02 100644
> ---- a/rpmio/rpmstrpool.c
> -+++ b/rpmio/rpmstrpool.c
> -@@ -113,6 +113,8 @@ static poolHash poolHashCreate(int numBuckets)
> -     return ht;
> - }
> - 
> -+static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid sid);
> -+
> - static void poolHashResize(rpmstrPool pool, int numBuckets)
> - {
> -     poolHash ht = pool->hash;
> -@@ -120,7 +122,7 @@ static void poolHashResize(rpmstrPool pool, int numBuckets)
> - 
> -     for (int i=0; i<ht->numBuckets; i++) {
> -         if (!ht->buckets[i].keyid) continue;
> --        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool, ht->buckets[i].keyid));
> -+        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool, ht->buckets[i].keyid));
> -         for (unsigned int j=0;;j++) {
> -             unsigned int hash = hashbucket(keyHash, j) % numBuckets;
> -             if (!buckets[hash].keyid) {
> -@@ -149,7 +151,7 @@ static void poolHashAddHEntry(rpmstrPool pool, const char * key, unsigned int ke
> -             ht->buckets[hash].keyid = keyid;
> -             ht->keyCount++;
> -             break;
> --        } else if (!strcmp(rpmstrPoolStr(pool, ht->buckets[hash].keyid), key)) {
> -+        } else if (!strcmp(rpmstrPoolStrNoLock(pool, ht->buckets[hash].keyid), key)) {
> -             return;
> -         }
> -     }
> -@@ -191,7 +193,7 @@ static void poolHashPrintStats(rpmstrPool pool)
> -     int maxcollisions = 0;
> - 
> -     for (i=0; i<ht->numBuckets; i++) {
> --        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool, ht->buckets[i].keyid));
> -+        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool, ht->buckets[i].keyid));
> -         for (unsigned int j=0;;j++) {
> -             unsigned int hash = hashbucket(keyHash, i) % ht->numBuckets;
> -             if (hash==i) {
> -@@ -221,7 +223,7 @@ static void rpmstrPoolRehash(rpmstrPool pool)
> - 
> -     pool->hash = poolHashCreate(sizehint);
> -     for (int i = 1; i <= pool->offs_size; i++)
> --	poolHashAddEntry(pool, rpmstrPoolStr(pool, i), i);
> -+	poolHashAddEntry(pool, rpmstrPoolStrNoLock(pool, i), i);
> - }
> - 
> - rpmstrPool rpmstrPoolCreate(void)
> -@@ -245,6 +247,8 @@ rpmstrPool rpmstrPoolCreate(void)
> - 
> - rpmstrPool rpmstrPoolFree(rpmstrPool pool)
> - {
> -+    #pragma omp critical(rpmstrpool)
> -+    {
> -     if (pool) {
> - 	if (pool->nrefs > 1) {
> - 	    pool->nrefs--;
> -@@ -260,18 +264,24 @@ rpmstrPool rpmstrPoolFree(rpmstrPool pool)
> - 	    free(pool);
> - 	}
> -     }
> -+    }
> -     return NULL;
> - }
> - 
> - rpmstrPool rpmstrPoolLink(rpmstrPool pool)
> - {
> -+    #pragma omp critical(rpmstrpool)
> -+    {
> -     if (pool)
> - 	pool->nrefs++;
> -+    }
> -     return pool;
> - }
> - 
> - void rpmstrPoolFreeze(rpmstrPool pool, int keephash)
> - {
> -+    #pragma omp critical(rpmstrpool)
> -+    {
> -     if (pool && !pool->frozen) {
> - 	if (!keephash) {
> - 	    pool->hash = poolHashFree(pool->hash);
> -@@ -281,16 +291,20 @@ void rpmstrPoolFreeze(rpmstrPool pool, int keephash)
> - 			      pool->offs_alloced * sizeof(*pool->offs));
> - 	pool->frozen = 1;
> -     }
> -+    }
> - }
> - 
> - void rpmstrPoolUnfreeze(rpmstrPool pool)
> - {
> -+    #pragma omp critical(rpmstrpool)
> -+    {
> -     if (pool) {
> - 	if (pool->hash == NULL) {
> - 	    rpmstrPoolRehash(pool);
> - 	}
> - 	pool->frozen = 0;
> -     }
> -+    }
> - }
> - 
> - static rpmsid rpmstrPoolPut(rpmstrPool pool, const char *s, size_t slen, unsigned int hash)
> -@@ -350,7 +364,7 @@ static rpmsid rpmstrPoolGet(rpmstrPool pool, const char * key, size_t keylen,
> -             return 0;
> -         }
> - 
> --	s = rpmstrPoolStr(pool, ht->buckets[hash].keyid);
> -+	s = rpmstrPoolStrNoLock(pool, ht->buckets[hash].keyid);
> - 	/* pool string could be longer than keylen, require exact matche */
> - 	if (strncmp(s, key, keylen) == 0 && s[keylen] == '\0')
> - 	    return ht->buckets[hash].keyid;
> -@@ -373,27 +387,31 @@ static inline rpmsid strn2id(rpmstrPool pool, const char *s, size_t slen,
> - rpmsid rpmstrPoolIdn(rpmstrPool pool, const char *s, size_t slen, int create)
> - {
> -     rpmsid sid = 0;
> --
> -+    #pragma omp critical(rpmstrpool)
> -+    {
> -     if (s != NULL) {
> - 	unsigned int hash = rstrnhash(s, slen);
> - 	sid = strn2id(pool, s, slen, hash, create);
> -     }
> -+    }
> -     return sid;
> - }
> - 
> - rpmsid rpmstrPoolId(rpmstrPool pool, const char *s, int create)
> - {
> -     rpmsid sid = 0;
> --
> -+    #pragma omp critical(rpmstrpool)
> -+    {
> -     if (s != NULL) {
> - 	size_t slen;
> - 	unsigned int hash = rstrlenhash(s, &slen);
> - 	sid = strn2id(pool, s, slen, hash, create);
> -     }
> -+    }
> -     return sid;
> - }
> - 
> --const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
> -+static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid sid)
> - {
> -     const char *s = NULL;
> -     if (pool && sid > 0 && sid <= pool->offs_size)
> -@@ -401,12 +419,25 @@ const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
> -     return s;
> - }
> - 
> -+const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
> -+{
> -+    const char *s = NULL;
> -+    #pragma omp critical(rpmstrpool)
> -+    {
> -+    s = rpmstrPoolStrNoLock(pool, sid);
> -+    }
> -+    return s;
> -+}
> -+
> - size_t rpmstrPoolStrlen(rpmstrPool pool, rpmsid sid)
> - {
> -     size_t slen = 0;
> -+    #pragma omp critical(rpmstrpool)
> -+    {
> -     if (pool && sid > 0 && sid <= pool->offs_size) {
> - 	slen = strlen(pool->offs[sid]);
> -     }
> -+    }
> -     return slen;
> - }
> - 
> -@@ -421,5 +452,12 @@ int rpmstrPoolStreq(rpmstrPool poolA, rpmsid sidA,
> - 
> - rpmsid rpmstrPoolNumStr(rpmstrPool pool)
> - {
> --    return (pool != NULL) ? pool->offs_size : 0;
> -+    rpmsid id = 0;
> -+    #pragma omp critical(rpmstrpool)
> -+    {
> -+    if (pool) {
> -+	id = pool->offs_size;
> -+    }
> -+    }
> -+    return id;
> - }
> --- 
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> deleted file mode 100644
> index 652e30b3e4a..00000000000
> --- a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> +++ /dev/null
> @@ -1,336 +0,0 @@
> -From 792693bb90768cfde4898e8dd31ee1b5de803d2f Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Thu, 8 Jun 2017 17:08:09 +0300
> -Subject: [PATCH] build/pack.c: remove static local variables from buildHost()
> - and getBuildTime()
> -
> -Their use is causing difficult to diagnoze data races when building multiple
> -packages in parallel, and is a bad idea in general, as it also makes it more
> -difficult to reason about code.
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - build/build.c             | 54 ++++++++++++++++++++++++++++--
> - build/pack.c              | 84 +++++++++--------------------------------------
> - build/rpmbuild_internal.h |  8 +++--
> - 3 files changed, 74 insertions(+), 72 deletions(-)
> -
> -diff --git a/build/build.c b/build/build.c
> -index 13c3df2..b154f08 100644
> ---- a/build/build.c
> -+++ b/build/build.c
> -@@ -6,6 +6,8 @@
> - #include "system.h"
> - 
> - #include <errno.h>
> -+#include <netdb.h>
> -+#include <time.h>
> - #include <sys/wait.h>
> - 
> - #include <rpm/rpmlog.h>
> -@@ -16,6 +18,50 @@
> - 
> - #include "debug.h"
> - 
> -+static rpm_time_t getBuildTime(void)
> -+{
> -+    rpm_time_t buildTime = 0;
> -+    char *srcdate;
> -+    time_t epoch;
> -+    char *endptr;
> -+
> -+    srcdate = getenv("SOURCE_DATE_EPOCH");
> -+    if (srcdate) {
> -+        errno = 0;
> -+        epoch = strtol(srcdate, &endptr, 10);
> -+        if (srcdate == endptr || *endptr || errno != 0)
> -+            rpmlog(RPMLOG_ERR, _("unable to parse SOURCE_DATE_EPOCH\n"));
> -+        else
> -+            buildTime = (int32_t) epoch;
> -+    } else
> -+        buildTime = (int32_t) time(NULL);
> -+
> -+    return buildTime;
> -+}
> -+
> -+static char * buildHost(void)
> -+{
> -+    char* hostname;
> -+    struct hostent *hbn;
> -+    char *bhMacro;
> -+
> -+    bhMacro = rpmExpand("%{?_buildhost}", NULL);
> -+    if (strcmp(bhMacro, "") != 0) {
> -+        rasprintf(&hostname, "%s", bhMacro);
> -+    } else {
> -+        hostname = rcalloc(1024, sizeof(*hostname));
> -+        (void) gethostname(hostname, 1024);
> -+        hbn = gethostbyname(hostname);
> -+        if (hbn)
> -+            strcpy(hostname, hbn->h_name);
> -+        else
> -+            rpmlog(RPMLOG_WARNING,
> -+                    _("Could not canonicalize hostname: %s\n"), hostname);
> -+    }
> -+    free(bhMacro);
> -+    return(hostname);
> -+}
> -+
> - /**
> -  */
> - static rpmRC doRmSource(rpmSpec spec)
> -@@ -201,6 +247,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
> -     rpmRC rc = RPMRC_OK;
> -     int test = (what & RPMBUILD_NOBUILD);
> -     char *cookie = buildArgs->cookie ? xstrdup(buildArgs->cookie) : NULL;
> -+    const char* host = buildHost();
> -+    rpm_time_t buildTime = getBuildTime();
> -+
> - 
> -     if (rpmExpandNumeric("%{?source_date_epoch_from_changelog}") &&
> - 	getenv("SOURCE_DATE_EPOCH") == NULL) {
> -@@ -269,11 +318,11 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
> - 		goto exit;
> - 
> - 	if (((what & RPMBUILD_PACKAGESOURCE) && !test) &&
> --	    (rc = packageSources(spec, &cookie)))
> -+	    (rc = packageSources(spec, &cookie, buildTime, host)))
> - 		goto exit;
> - 
> - 	if (((what & RPMBUILD_PACKAGEBINARY) && !test) &&
> --	    (rc = packageBinaries(spec, cookie, (didBuild == 0))))
> -+	    (rc = packageBinaries(spec, cookie, (didBuild == 0), buildTime, host)))
> - 		goto exit;
> - 	
> - 	if ((what & RPMBUILD_CLEAN) &&
> -@@ -293,6 +342,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
> - 	(void) unlink(spec->specFile);
> - 
> - exit:
> -+    free(host);
> -     free(cookie);
> -     spec->rootDir = NULL;
> -     if (rc != RPMRC_OK && rpmlogGetNrecs() > 0) {
> -diff --git a/build/pack.c b/build/pack.c
> -index df15876..17a4b09 100644
> ---- a/build/pack.c
> -+++ b/build/pack.c
> -@@ -6,8 +6,6 @@
> - #include "system.h"
> - 
> - #include <errno.h>
> --#include <netdb.h>
> --#include <time.h>
> - #include <sys/wait.h>
> - 
> - #include <rpm/rpmlib.h>			/* RPMSIGTAG*, rpmReadPackageFile */
> -@@ -152,57 +150,6 @@ exit:
> -     return rc;
> - }
> - 
> --static rpm_time_t * getBuildTime(void)
> --{
> --    static rpm_time_t buildTime[1];
> --    char *srcdate;
> --    time_t epoch;
> --    char *endptr;
> --
> --    if (buildTime[0] == 0) {
> --        srcdate = getenv("SOURCE_DATE_EPOCH");
> --        if (srcdate) {
> --            errno = 0;
> --            epoch = strtol(srcdate, &endptr, 10);
> --            if (srcdate == endptr || *endptr || errno != 0)
> --                rpmlog(RPMLOG_ERR, _("unable to parse SOURCE_DATE_EPOCH\n"));
> --            else
> --                buildTime[0] = (int32_t) epoch;
> --        } else
> --            buildTime[0] = (int32_t) time(NULL);
> --    }
> --
> --    return buildTime;
> --}
> --
> --static const char * buildHost(void)
> --{
> --    static char hostname[1024];
> --    static int oneshot = 0;
> --    struct hostent *hbn;
> --    char *bhMacro;
> --
> --    if (! oneshot) {
> --        bhMacro = rpmExpand("%{?_buildhost}", NULL);
> --        if (strcmp(bhMacro, "") != 0 && strlen(bhMacro) < 1024) {
> --            strcpy(hostname, bhMacro);
> --        } else {
> --            if (strcmp(bhMacro, "") != 0)
> --                rpmlog(RPMLOG_WARNING, _("The _buildhost macro is too long\n"));
> --            (void) gethostname(hostname, sizeof(hostname));
> --            hbn = gethostbyname(hostname);
> --            if (hbn)
> --                strcpy(hostname, hbn->h_name);
> --            else
> --                rpmlog(RPMLOG_WARNING,
> --                        _("Could not canonicalize hostname: %s\n"), hostname);
> --        }
> --        free(bhMacro);
> --        oneshot = 1;
> --    }
> --    return(hostname);
> --}
> --
> - static rpmRC processScriptFiles(rpmSpec spec, Package pkg)
> - {
> -     struct TriggerFileEntry *p;
> -@@ -476,7 +423,8 @@ exit:
> -  * order to how the RPM format is laid on disk.
> -  */
> - static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
> --		      const char *fileName, char **cookie)
> -+		      const char *fileName, char **cookie,
> -+		      rpm_time_t buildTime, const char* buildHost)
> - {
> -     FD_t fd = NULL;
> -     char * rpmio_flags = NULL;
> -@@ -500,7 +448,7 @@ static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
> - 
> -     /* Create and add the cookie */
> -     if (cookie) {
> --	rasprintf(cookie, "%s %d", buildHost(), (int) (*getBuildTime()));
> -+	rasprintf(cookie, "%s %d", buildHost, buildTime);
> - 	headerPutString(pkg->header, RPMTAG_COOKIE, *cookie);
> -     }
> - 
> -@@ -641,7 +589,7 @@ static rpmRC checkPackages(char *pkgcheck)
> -     return RPMRC_OK;
> - }
> - 
> --static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename)
> -+static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename, rpm_time_t buildTime, const char* buildHost)
> - {
> - 	const char *errorString;
> - 	rpmRC rc = RPMRC_OK;
> -@@ -660,8 +608,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> - 	headerCopyTags(spec->packages->header, pkg->header, copyTags);
> - 	
> - 	headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
> --	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost());
> --	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
> -+	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost);
> -+	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
> - 
> - 	if (spec->sourcePkgId != NULL) {
> - 	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
> -@@ -699,7 +647,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> - 	    free(binRpm);
> - 	}
> - 
> --	rc = writeRPM(pkg, NULL, *filename, NULL);
> -+	rc = writeRPM(pkg, NULL, *filename, NULL, buildTime, buildHost);
> - 	if (rc == RPMRC_OK) {
> - 	    /* Do check each written package if enabled */
> - 	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
> -@@ -719,7 +667,7 @@ struct binaryPackageTaskData
> -     struct binaryPackageTaskData *next;
> - };
> - 
> --static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating)
> -+static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char* buildHost)
> - {
> -     struct binaryPackageTaskData *tasks = NULL;
> -     struct binaryPackageTaskData *task = NULL;
> -@@ -731,7 +679,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
> -         if (pkg == spec->packages) {
> -             // the first package needs to be processed ahead of others, as they copy
> -             // changelog data from it, and so otherwise data races would happen
> --            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename));
> -+            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename), buildTime, buildHost);
> -             rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> -             tasks = task;
> -         }
> -@@ -748,7 +696,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
> -         if (task != tasks)
> -         #pragma omp task
> -         {
> --            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename));
> -+            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename), buildTime, buildHost);
> -             rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> -         }
> -     }
> -@@ -766,11 +714,11 @@ static void freeBinaryPackageTasks(struct binaryPackageTaskData* tasks)
> -     }
> - }
> - 
> --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char* buildHost)
> - {
> -     char *pkglist = NULL;
> - 
> --    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating);
> -+    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating, buildTime, buildHost);
> - 
> -     for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
> -         if (task->result == RPMRC_OK) {
> -@@ -797,7 +745,7 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> -     return RPMRC_OK;
> - }
> - 
> --rpmRC packageSources(rpmSpec spec, char **cookie)
> -+rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_t buildTime, char* buildHost)
> - {
> -     Package sourcePkg = spec->sourcePackage;
> -     rpmRC rc;
> -@@ -805,8 +753,8 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
> - 
> -     /* Add some cruft */
> -     headerPutString(sourcePkg->header, RPMTAG_RPMVERSION, VERSION);
> --    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost());
> --    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
> -+    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost);
> -+    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
> -     headerPutUint32(sourcePkg->header, RPMTAG_SOURCEPACKAGE, &one, 1);
> - 
> -     /* XXX this should be %_srpmdir */
> -@@ -814,7 +762,7 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
> - 	char *pkgcheck = rpmExpand("%{?_build_pkgcheck_srpm} ", fn, NULL);
> - 
> - 	spec->sourcePkgId = NULL;
> --	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie);
> -+	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie, buildTime, buildHost);
> - 
> - 	/* Do check SRPM package if enabled */
> - 	if (rc == RPMRC_OK && pkgcheck[0] != ' ') {
> -diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_internal.h
> -index 439b7d3..07e8338 100644
> ---- a/build/rpmbuild_internal.h
> -+++ b/build/rpmbuild_internal.h
> -@@ -427,19 +427,23 @@ rpmRC processSourceFiles(rpmSpec spec, rpmBuildPkgFlags pkgFlags);
> -  * @param spec		spec file control structure
> -  * @param cookie	build identifier "cookie" or NULL
> -  * @param cheating	was build shortcircuited?
> -+ * @param buildTime	the build timestamp that goes into packages
> -+ * @param buildHost	the hostname where the build is happening
> -  * @return		RPMRC_OK on success
> -  */
> - RPM_GNUC_INTERNAL
> --rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating);
> -+rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char* buildHost);
> - 
> - /** \ingroup rpmbuild
> -  * Generate source package.
> -  * @param spec		spec file control structure
> -  * @retval cookie	build identifier "cookie" or NULL
> -+ * @param buildTime	the build timestamp that goes into packages
> -+ * @param buildHost	the hostname where the build is happening
> -  * @return		RPMRC_OK on success
> -  */
> - RPM_GNUC_INTERNAL
> --rpmRC packageSources(rpmSpec spec, char **cookie);
> -+rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_t buildTime, char* buildHost);
> - 
> - RPM_GNUC_INTERNAL
> - int addLangTag(rpmSpec spec, Header h, rpmTagVal tag,
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> similarity index 90%
> rename from meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> rename to meta/recipes-devtools/rpm/rpm_4.15.1.bb
> index c37330eb4c6..5896e78e734 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> @@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
>  LICENSE = "GPL-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a"
>  
> -SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
> +SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
>             file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
>             file://0001-Do-not-read-config-files-from-HOME.patch \
>             file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
> @@ -34,18 +34,14 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
>             file://0001-Fix-build-with-musl-C-library.patch \
>             file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
>             file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
> -           file://0001-Split-binary-package-building-into-a-separate-functi.patch \
> -           file://0002-Run-binary-package-creation-via-thread-pools.patch \
> -           file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
> -           file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
>             file://0001-perl-disable-auto-reqs.patch \
>             file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
>             file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
> -           file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
> +           file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
>             "
>  
>  PE = "1"
> -SRCREV = "4a9440006398646583f0d9ae1837dad2875013aa"
> +SRCREV = "ab2179452c5be276a6b96c591afded485c7e58c3"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -59,7 +55,7 @@ export PYTHON_ABI
>  EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
>  
>  EXTRA_OECONF_append = " --without-lua --enable-python"
> -EXTRA_OECONF_append_libc-musl = " --disable-nls"
> +EXTRA_OECONF_append_libc-musl = " --disable-nls --disable-openmp"
>  
>  # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
>  #
> @@ -125,8 +121,7 @@ do_install_append () {
>  	    ${D}/${libdir}/rpm/macros
>  
>  	sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|' \
> -	    ${D}${libdir}/rpm/pythondistdeps.py \
> -	    ${D}${libdir}/rpm/python-macro-helper
> +	    ${D}${libdir}/rpm/pythondistdeps.py
>  }
>  
>  FILES_${PN} += "${libdir}/rpm-plugins/*.so \


