Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B57B60F8C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 20:41:33 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b22so1166347pls.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 12:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Er9EI5qUq0+l529ciUup2ht7HMbXqqFH2uKr+KCRxVk=;
	b=c1L6gRqUakFKMXC928hefQv0Ow1eqwh8uH2Rsr0jMNURo48gfh4wz5IXSKtBpPVOBt
	/g6FrUpYuGRtoS/LwjAeS3gF7iD6AOr2uBqoc91Dhk3pajUCwTeHuwLPPSlCFCdMV45R
	BU8xRr7iW0JY5SoultvXcB3naGN8SrnbRxLXFX5ou7SrCP9U4MJ69O/fojHlbrUPd8hk
	kVhZ4ztqa8APE0u7SSjTiJcCbd+/EAlL6J7dmhn8XfzQap/89QqhA2Hyo1Ke3WfTCRVL
	KQu5FE7UB+JahfAz4vZK9YKIFaPxSZ362bCCNJe2liJ99yvbrErC9xZ489MVuz/TR6MM
	JIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Er9EI5qUq0+l529ciUup2ht7HMbXqqFH2uKr+KCRxVk=;
	b=t1QKCGMbpahpkndRlAL97q69DkljrXShwyeMuLFwTfQeOx8zpjQVQKkvxM5fwqBCKp
	l/tZEtr8/ZtbNO5Anub1m0whetoV2EdjFBIXPdCT3d6f2mUZ0lzv9kPfC3e1X5Vu6/2u
	wzICimgt9gBhbSfb+1TbTGj2dhBRp4DyMEcWXuE8wc0mxZ0pkgCcSlgGpt+aOUo5g8Z1
	9d6VK//AZ4J870MasLPKryCaK18qgCAvCDlcEyuhmKZBo9DQaVpNXpj2a9hjgSSsUZNA
	72QJG4qJmEKik26e37hc7ouNzzdNRE4CekTbVpgIcS2UuE+J2lSfh5yxr2t5TAoMpvT6
	ho2g==
X-Gm-Message-State: APjAAAVhtjb7QcXu0jxvZ6Rt97UtHRwJgjzKIgPeXi80/z/nYIEKRlZD
	0k/QQDKJRz5rw1UmX3OWnMxAbl7V
X-Google-Smtp-Source: APXvYqzz0XaUBskC4Lmc4G5BQDzF4SAFa26hZk1f4J4G0uwDgYhnURmpWPEGrF7BeFgkys2gtJohjA==
X-Received: by 2002:a17:902:462:: with SMTP id
	89mr5468583ple.270.1581194494042; 
	Sat, 08 Feb 2020 12:41:34 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:2c7a:b2c:b402:2f65?
	([2601:202:4180:a5c0:2c7a:b2c:b402:2f65])
	by smtp.gmail.com with ESMTPSA id
	cx18sm6882949pjb.26.2020.02.08.12.41.32
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 08 Feb 2020 12:41:33 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200207194559.527-1-alex.kanavin@gmail.com>
	<20200207194559.527-3-alex.kanavin@gmail.com>
	<CAMKF1srQWT2o-B-Rs3_8KWCDnRCNQXJyaTR7XYm3PLMNU+4VUw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
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
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
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
Message-ID: <5a26efc5-f0a7-1d1b-0cff-d1c6d81d7dd5@gmail.com>
Date: Sat, 8 Feb 2020 12:41:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srQWT2o-B-Rs3_8KWCDnRCNQXJyaTR7XYm3PLMNU+4VUw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] chkconfig: remove the recipe
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
X-List-Received-Date: Sat, 08 Feb 2020 20:41:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/8/20 11:01 AM, Khem Raj wrote:
> On Fri, Feb 7, 2020 at 11:47 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>> chkconfig is one of the options for virtual/update-alternatives,
>> however opkg-utils have been used as the default for a very long time,
>> while chkconfig isn't anymore tested in any way, and is stuck
>> at a very old version due to newer versions requiring selinux.
>>
> there are recipes in other layers depending on it. e.g. see
>
> 09:40:46 ERROR: Nothing RPROVIDES 'chkconfig' (but
> /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
> RDEPENDS on or otherwise requires it)
> 09:40:48 ERROR: Nothing RPROVIDES 'tigervnc-dev' (but
> /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
> RDEPENDS on or otherwise requires it)
> 09:40:48 No eligible RPROVIDERs exist for 'tigervnc-dev'

Should it move to meta-oe then?
>
>
>> [YOCTO #11264]
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  meta/conf/distro/include/maintainers.inc      |  2 -
>>  .../packagegroups/packagegroup-self-hosted.bb |  1 -
>>  .../chkconfig-alternatives-native_1.3.59.bb   | 44 ------------
>>  .../chkconfig/chkconfig/replace_caddr_t.patch | 33 ---------
>>  .../chkconfig/chkconfig_1.3.58.bb             | 71 -------------------
>>  5 files changed, 151 deletions(-)
>>  delete mode 100644 meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
>>  delete mode 100644 meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
>>  delete mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> index a80e85a2f6..c68e9edf63 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -94,8 +94,6 @@ RECIPE_MAINTAINER_pn-cairo = "Anuj Mittal <anuj.mittal@intel.com>"
>>  RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>  RECIPE_MAINTAINER_pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
>>  RECIPE_MAINTAINER_pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
>> -RECIPE_MAINTAINER_pn-chkconfig = "Yi Zhao <yi.zhao@windriver.com>"
>> -RECIPE_MAINTAINER_pn-chkconfig-alternatives-native = "Yi Zhao <yi.zhao@windriver.com>"
>>  RECIPE_MAINTAINER_pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
>>  RECIPE_MAINTAINER_pn-clutter-1.0 = "Ross Burton <ross.burton@intel.com>"
>>  RECIPE_MAINTAINER_pn-clutter-gst-3.0 = "Ross Burton <ross.burton@intel.com>"
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
>> index ea6d567301..9a70b189a4 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
>> @@ -108,7 +108,6 @@ RDEPENDS_packagegroup-self-hosted-debug = " \
>>
>>  RDEPENDS_packagegroup-self-hosted-extended = "\
>>      bzip2 \
>> -    chkconfig \
>>      chrpath \
>>      cpio \
>>      curl \
>> diff --git a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
>> deleted file mode 100644
>> index 87fa8eb605..0000000000
>> --- a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -require recipes-extended/chkconfig/chkconfig_1.3.58.bb
>> -
>> -SUMMARY = "${SUMMARY_chkconfig-alternatives}"
>> -DESCRIPTION = "${DESCRIPTION_chkconfig-alternatives}"
>> -DEPENDS = ""
>> -PROVIDES += "virtual/update-alternatives-native"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> -
>> -# The sysroot branch is 1.3.59 + some git commits from master + --sysroot
>> -# support for alternatives.
>> -SRC_URI = "git://github.com/kergoth/chkconfig;branch=sysroot"
>> -S = "${WORKDIR}/git"
>> -UPSTREAM_CHECK_GITTAGREGEX = "chkconfig-(?P<pver>(\d+(\.\d+)+))"
>> -
>> -SRCREV = "cd437ecbd8986c894442f8fce1e0061e20f04dee"
>> -PV = "1.3.59+${SRCPV}"
>> -
>> -inherit native
>> -
>> -# We want our native recipes to build using the target paths rather than paths
>> -# into the sysroot, as we may use them to construct the rootfs. As such, we
>> -# only adjust the paths to match the metadata for the target, not native.
>> -obey_variables () {
>> -       sed -i 's,ALTERNATIVES_ROOT,OPKG_OFFLINE_ROOT,' ${S}/alternatives.c
>> -}
>> -
>> -do_compile () {
>> -       oe_runmake alternatives
>> -}
>> -
>> -do_install () {
>> -       install -d ${D}${sysconfdir}/alternatives \
>> -                  ${D}${localstatedir}/lib/alternatives
>> -
>> -       install -D -m 0755 alternatives ${D}${bindir}/alternatives
>> -       install -D -m 0644 alternatives.8 ${D}${mandir}/man8/alternatives.8
>> -
>> -       ln -s alternatives ${D}${bindir}/update-alternatives
>> -       ln -s alternatives.8 ${D}${mandir}/man8/update-alternatives.8
>> -}
>> -
>> -do_install_append_linuxstdbase() {
>> -       rm -rf ${D}${libdir}/lsb
>> -}
>> diff --git a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch b/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
>> deleted file mode 100644
>> index 96d1938791..0000000000
>> --- a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -caddr_t is a legacy BSD type which was rejected by the POSIX standard.
>> -Use void * instead.
>> -
>> -sys/unitstd.h is not needed and moreover its not available on all C library
>> -implementations e.g. musl
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Index: chkconfig-1.3.58/alternatives.c
>> -===================================================================
>> ---- chkconfig-1.3.58.orig/alternatives.c
>> -+++ chkconfig-1.3.58/alternatives.c
>> -@@ -22,7 +22,6 @@
>> - #include <stdio.h>
>> - #include <string.h>
>> - #include <sys/stat.h>
>> --#include <sys/unistd.h>
>> - #include <unistd.h>
>> -
>> - #define       FLAGS_TEST      (1 << 0)
>> -Index: chkconfig-1.3.58/leveldb.c
>> -===================================================================
>> ---- chkconfig-1.3.58.orig/leveldb.c
>> -+++ chkconfig-1.3.58/leveldb.c
>> -@@ -442,7 +442,7 @@ int parseServiceInfo(int fd, char * name
>> -     fstat(fd, &sb);
>> -
>> -     bufstart = mmap(NULL, sb.st_size, PROT_READ, MAP_SHARED, fd, 0);
>> --    if (bufstart == ((caddr_t) -1)) {
>> -+    if (bufstart == ((void*) -1)) {
>> -       close(fd);
>> -       return -1;
>> -     }
>> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
>> deleted file mode 100644
>> index d21dd69704..0000000000
>> --- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
>> +++ /dev/null
>> @@ -1,71 +0,0 @@
>> -SUMMARY = "A system tool for maintaining the /etc/rc*.d hierarchy"
>> -DESCRIPTION = "Chkconfig is a basic system utility.  It updates and queries runlevel \
>> -information for system services.  Chkconfig manipulates the numerous \
>> -symbolic links in /etc/rc.d, to relieve system administrators of some \
>> -of the drudgery of manually editing the symbolic links."
>> -
>> -RECIPE_NO_UPDATE_REASON = "Version 1.5 requires selinux"
>> -
>> -HOMEPAGE = "https://github.com/fedora-sysv"
>> -
>> -LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
>> -
>> -DEPENDS = "libnewt popt"
>> -PROVIDES += "virtual/update-alternatives"
>> -
>> -PR = "r7"
>> -
>> -S = "${WORKDIR}/${BPN}-${BPN}-${PV}"
>> -
>> -SRC_URI = "git://github.com/fedora-sysv/chkconfig.git \
>> -           file://replace_caddr_t.patch \
>> -          "
>> -
>> -SRCREV = "3e0b3909ff6328d232b27b9c32f1a9309c6cd0a4"
>> -UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -inherit gettext
>> -
>> -# Makefile uses RPM_OPT_FLAGS to construct CFLAGS
>> -#
>> -EXTRA_OEMAKE = "\
>> -    'RPM_OPT_FLAGS=${CFLAGS}' \
>> -    'LDFLAGS=${LDFLAGS}' \
>> -    'BINDIR=${base_sbindir}' \
>> -    'SBINDIR=${sbindir}' \
>> -    'MANDIR=${mandir}' \
>> -    'ALTDIR=${localstatedir}/lib/alternatives' \
>> -    'ALTDATADIR=${sysconfdir}/alternatives' \
>> -"
>> -
>> -do_unpack[postfuncs] += "obey_variables"
>> -do_unpack[vardeps] += "obey_variables"
>> -obey_variables () {
>> -       sed -i -e 's,/etc,${sysconfdir},; s,/lib/systemd,${base_libdir}/systemd,' ${S}/leveldb.h
>> -       sed -i -e 's,/etc/alternatives,${sysconfdir}/alternatives,' \
>> -              -e 's,/var/lib/alternatives,${localstatedir}/lib/alternatives,' \
>> -              -e 's,/usr/share/locale,${datadir}/locale,' ${S}/alternatives.c
>> -}
>> -
>> -do_install() {
>> -       oe_runmake 'DESTDIR=${D}' 'INSTALLNLSDIR=${D}${datadir}/locale' \
>> -               'BINDIR=${sbindir}' install
>> -       install -d ${D}${sysconfdir}/chkconfig.d
>> -}
>> -
>> -PACKAGES =+ "${PN}-alternatives ${PN}-alternatives-doc"
>> -SUMMARY_${PN}-alternatives = "Maintain symbolic links determining default commands"
>> -DESCRIPTION_${PN}-alternatives = "alternatives creates, removes, maintains and displays \
>> -information about the symbolic links comprising the alternatives system."
>> -SUMMARY_${PN}-alternatives-doc = "${SUMMARY_${PN}-alternatives} - Documentation files"
>> -DESCRIPTION_${PN}-alternatives-doc = "${DESCRIPTION_${PN}-alternatives}  \
>> -This package contains documentation."
>> -RPROVIDES_${PN}-alternatives += "update-alternatives"
>> -RCONFLICTS_${PN}-alternatives = "update-alternatives-opkg update-alternatives-dpkg"
>> -FILES_${PN}-alternatives = "${sbindir}/alternatives ${sbindir}/update-alternatives \
>> -                           ${sysconfdir}/alternatives ${localstatedir}/lib/alternatives"
>> -FILES_${PN}-alternatives-doc = "${mandir}/man8/alternatives.8 \
>> -                                ${mandir}/man8/update-alternatives.8"
>> --
>> 2.25.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


