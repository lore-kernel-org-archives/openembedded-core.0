Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFD96FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 18:11:32 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i88so2798444pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 10:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=V+ETbJAcQZ53JVZbojg9dk6vesAkeyIz4LFQVMbnR4g=;
	b=XKF8Rt2M5BatgIOOX9sRJbCl0XQVtQKVgAiZtT0kuTJWLFQe6COI5pCxYH9C1YP+vT
	3YERGaWoylSzvdYQ+H/qjfEs3UM7heNkzlTx0ISuAjShiYMlNdP5Jw13y293iQQuCy05
	TVlQnRFSnC/5RrVm46uJGu0DVILiCoe4pPwBMx/WZym6Bj+tgyCVWD+E9JKzadrA6Jog
	/EcdENABFpPg9niC1DH8zBPNobPGVvS8hFKtKjLYwOuZH7HdmpZweg8i/rFPP2oWtEq8
	umMHtNA+53+bcaO9nsIkFeu30RpmvpZKq/HiAoM3xr0s9oF3FtNjFQ+xykIcnFmKM694
	xxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=V+ETbJAcQZ53JVZbojg9dk6vesAkeyIz4LFQVMbnR4g=;
	b=E/pqR8nzQBc3/gqa/wODRvhmVbAFQYew6OdmJ6yaWcDywGqtFt8yrha/TWew8I5eEe
	cXheIU4QywZ02alJuwC0jHdRXZfsRQM+Py4dPNOoFvDgVA/GJKPtQx0X7nMxslYuF6GK
	eVk2yhFB45opxFY3cqqLBJYb7iFcKaJVNcrXAVqvxW8Z42L7ksVUxy+pj9Biubq9YSad
	N+F9CQr+ETXeHeOb1X6ve7GbKaJMXBU7TCjAS5uUgBTFp4/3zCLq7oXbrNDHmpm4T7Q6
	BHywiduUN3pfAFYgWsxHvm1Julu2uXESHBLN4+jW3oxCE+Gd9uJ2wTydAccf0IrjE4jk
	qIkg==
X-Gm-Message-State: ABUngvciNn7v5kqEiWz4X9ChNW6rEOOrZlGTYsYKJRb+KPhzsRo1tzqunAdzdXyaxwiR6Q==
X-Received: by 10.98.65.72 with SMTP id o69mr9299748pfa.128.1478887892365;
	Fri, 11 Nov 2016 10:11:32 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:7d15:461d:dff0:71b0])
	by smtp.gmail.com with ESMTPSA id
	tx10sm16736010pab.40.2016.11.11.10.11.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Nov 2016 10:11:31 -0800 (PST)
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<CAD4b0_LQuuuwhhsMMto74KdT2NbfhrgY6Hp9A=2_H7VuyZ-E+g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <5c661051-f265-2238-3556-0b55a79df940@gmail.com>
Date: Fri, 11 Nov 2016 10:11:12 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CAD4b0_LQuuuwhhsMMto74KdT2NbfhrgY6Hp9A=2_H7VuyZ-E+g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Fri, 11 Nov 2016 18:11:32 -0000
X-Groupsio-MsgNum: 89299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="IFIaPLOpkAAx5FVsBpFG5gRdeSsVseMpR"

--IFIaPLOpkAAx5FVsBpFG5gRdeSsVseMpR
Content-Type: multipart/mixed; boundary="R9NNndAFqiXLaOqPKqfDO8W0pxIwTokfR";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <5c661051-f265-2238-3556-0b55a79df940@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] go: Add recipes for golang compilers and
 tools
References: <20161110003935.1858-1-raj.khem@gmail.com>
 <CAD4b0_LQuuuwhhsMMto74KdT2NbfhrgY6Hp9A=2_H7VuyZ-E+g@mail.gmail.com>
In-Reply-To: <CAD4b0_LQuuuwhhsMMto74KdT2NbfhrgY6Hp9A=2_H7VuyZ-E+g@mail.gmail.com>

--R9NNndAFqiXLaOqPKqfDO8W0pxIwTokfR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/11/16 9:16 AM, Maciej Borz=C4=99cki wrote:
> On Thu, Nov 10, 2016 at 1:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> This is converging the recipes for go from
>> meta-virtualization and oe-meta-go
>>
>> Add recipes for go 1.7
>>
>> go.bbclass is added to ease out writing
>> recipes for go packages
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/go.bbclass                            |  74 +++++++
>>  meta/classes/goarch.bbclass                        |  40 ++++
>>  meta/recipes-devtools/go/go-1.4.inc                |  15 ++
>>  .../go/go-1.4/016-armhf-elf-header.patch           |  24 +++
>>  ...ckport-cmd-link-support-new-386-amd64-rel.patch | 225 ++++++++++++=
+++++++++
>>  meta/recipes-devtools/go/go-1.4/syslog.patch       |  62 ++++++
>>  meta/recipes-devtools/go/go-1.6.inc                |  19 ++
>>  .../go/go-1.6/armhf-elf-header.patch               |  23 +++
>>  .../go/go-1.6/fix-cc-handling.patch                |  50 +++++
>>  .../go/go-1.6/fix-target-cc-for-build.patch        |  17 ++
>>  meta/recipes-devtools/go/go-1.6/gotooldir.patch    |  30 +++
>>  .../go/go-1.6/split-host-and-target-build.patch    |  63 ++++++
>>  meta/recipes-devtools/go/go-1.6/syslog.patch       |  62 ++++++
>>  meta/recipes-devtools/go/go-1.7.inc                |  18 ++
>>  .../go/go-1.7/armhf-elf-header.patch               |  23 +++
>>  .../go/go-1.7/fix-cc-handling.patch                |  50 +++++
>>  .../go/go-1.7/fix-target-cc-for-build.patch        |  17 ++
>>  meta/recipes-devtools/go/go-1.7/gotooldir.patch    |  30 +++
>>  .../go/go-1.7/split-host-and-target-build.patch    |  62 ++++++
>>  meta/recipes-devtools/go/go-1.7/syslog.patch       |  62 ++++++
>>  meta/recipes-devtools/go/go-common.inc             |  21 ++
>>  meta/recipes-devtools/go/go-native.inc             |  54 +++++
>>  meta/recipes-devtools/go/go-native_1.4.bb          |   2 +
>>  meta/recipes-devtools/go/go.inc                    |  74 +++++++
>>  meta/recipes-devtools/go/go_1.6.bb                 |   4 +
>>  meta/recipes-devtools/go/go_1.7.bb                 |   4 +
>>  26 files changed, 1125 insertions(+)
>>  create mode 100644 meta/classes/go.bbclass
>>  create mode 100644 meta/classes/goarch.bbclass
>>  create mode 100644 meta/recipes-devtools/go/go-1.4.inc
>>  create mode 100644 meta/recipes-devtools/go/go-1.4/016-armhf-elf-head=
er.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.4/go-cross-backport-=
cmd-link-support-new-386-amd64-rel.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.4/syslog.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.6.inc
>>  create mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.p=
atch
>>  create mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.pa=
tch
>>  create mode 100644 meta/recipes-devtools/go/go-1.6/fix-target-cc-for-=
build.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.6/split-host-and-tar=
get-build.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.7.inc
>>  create mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.p=
atch
>>  create mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.pa=
tch
>>  create mode 100644 meta/recipes-devtools/go/go-1.7/fix-target-cc-for-=
build.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.7/split-host-and-tar=
get-build.patch
>>  create mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
>>  create mode 100644 meta/recipes-devtools/go/go-common.inc
>>  create mode 100644 meta/recipes-devtools/go/go-native.inc
>>  create mode 100644 meta/recipes-devtools/go/go-native_1.4.bb
>>  create mode 100644 meta/recipes-devtools/go/go.inc
>>  create mode 100644 meta/recipes-devtools/go/go_1.6.bb
>>  create mode 100644 meta/recipes-devtools/go/go_1.7.bb
>>
>> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>> new file mode 100644
>> index 0000000..e10864d
>> --- /dev/null
>> +++ b/meta/classes/go.bbclass
>> @@ -0,0 +1,74 @@
>> +inherit goarch
>> +
>> +GOROOT_class-native =3D "${STAGING_LIBDIR_NATIVE}/go"
>> +GOROOT =3D "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>> +GOBIN_FINAL_class-native =3D "${GOROOT_FINAL}/bin"
>> +GOBIN_FINAL =3D "${GOROOT_FINAL}/bin/${GOOS}_${GOARCH}"
>> +
>> +export GOOS =3D "${TARGET_GOOS}"
>> +export GOARCH =3D "${TARGET_GOARCH}"
>> +export GOARM =3D "${TARGET_GOARM}"
>> +export CGO_ENABLED =3D "1"
>> +export GOROOT
>> +export GOROOT_FINAL =3D "${libdir}/${TARGET_SYS}/go"
>> +export GOBIN_FINAL
>> +export GOPKG_FINAL =3D "${GOROOT_FINAL}/pkg/${GOOS}_${GOARCH}"
>> +export GOSRC_FINAL =3D "${GOROOT_FINAL}/src"
>> +export GO_GCFLAGS =3D "${TARGET_CFLAGS}"
>> +export GO_LDFLAGS =3D "${TARGET_LDFLAGS}"
>> +export CGO_CFLAGS =3D "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET=
_CFLAGS}"
>> +export CGO_CPPFLAGS =3D "${TARGET_CPPFLAGS}"
>> +export CGO_CXXFLAGS =3D "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARG=
ET_CXXFLAGS}"
>> +export CGO_LDFLAGS =3D "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGE=
T_LDFLAGS}"
>> +
>> +DEPENDS +=3D "go-cross"
>> +DEPENDS_class-native +=3D "go-native"
>> +
>> +INHIBIT_PACKAGE_STRIP =3D "1"
>> +
>> +FILES_${PN}-staticdev +=3D "${GOSRC_FINAL}/${GO_IMPORT}"
>> +FILES_${PN}-staticdev +=3D "${GOPKG_FINAL}/${GO_IMPORT}*"
>> +
>> +GO_INSTALL ?=3D "${GO_IMPORT}/..."
>> +
>> +do_go_compile() {
>> +       GOPATH=3D${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
>> +       if test -n "${GO_INSTALL}" ; then
>> +               GOPATH=3D${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go in=
stall -v ${GO_INSTALL}
>> +       fi
>> +}
>> +
>> +do_go_install() {
>> +       rm -rf ${WORKDIR}/staging
>> +       install -d ${WORKDIR}/staging${GOROOT_FINAL} ${D}${GOROOT_FINA=
L}
>> +       tar -C ${S} -cf - . | tar -C ${WORKDIR}/staging${GOROOT_FINAL}=
 -xpvf -
>> +
>> +       find ${WORKDIR}/staging${GOROOT_FINAL} \( \
>> +               -name \*.indirectionsymlink -o \
>> +               -name .git\* -o                \
>> +               -name .hg -o                   \
>> +               -name .svn -o                  \
>> +               -name .pc\* -o                 \
>> +               -name patches\*                \
>> +               \) -print0 | \
>> +       xargs -r0 rm -rf
>> +
>> +       tar -C ${WORKDIR}/staging${GOROOT_FINAL} -cf - . | \
>> +       tar -C ${D}${GOROOT_FINAL} -xpvf -
>> +
>> +       chown -R root:root "${D}${GOROOT_FINAL}"
>> +
>> +       if test -e "${D}${GOBIN_FINAL}" ; then
>> +               install -d -m 0755 "${D}${bindir}"
>> +               find "${D}${GOBIN_FINAL}" ! -type d -print0 | xargs -r=
0 mv --target-directory=3D"${D}${bindir}"
>> +               rmdir -p "${D}${GOBIN_FINAL}" || true
>> +       fi
>> +}
>> +
>> +do_compile() {
>> +       do_go_compile
>> +}
>> +
>> +do_install() {
>> +       do_go_install
>> +}
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass=

>> new file mode 100644
>> index 0000000..bb330b1
>> --- /dev/null
>> +++ b/meta/classes/goarch.bbclass
>> @@ -0,0 +1,40 @@
>> +BUILD_GOOS =3D "${@go_map_os(d.getVar('BUILD_OS', True), d)}"
>> +BUILD_GOARCH =3D "${@go_map_arch(d.getVar('BUILD_ARCH', True), d)}"
>> +BUILD_GOTUPLE =3D "${BUILD_GOOS}_${BUILD_GOARCH}"
>> +HOST_GOOS =3D "${@go_map_os(d.getVar('HOST_OS', True), d)}"
>> +HOST_GOARCH =3D "${@go_map_arch(d.getVar('HOST_ARCH', True), d)}"
>> +HOST_GOARM =3D "${@go_map_arm(d.getVar('HOST_ARCH', True), d.getVar('=
TUNE_FEATURES', True), d)}"
>> +HOST_GOTUPLE =3D "${HOST_GOOS}_${HOST_GOARCH}"
>> +TARGET_GOOS =3D "${@go_map_os(d.getVar('TARGET_OS', True), d)}"
>> +TARGET_GOARCH =3D "${@go_map_arch(d.getVar('TARGET_ARCH', True), d)}"=

>> +TARGET_GOARM =3D "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getV=
ar('TUNE_FEATURES', True), d)}"
>> +TARGET_GOTUPLE =3D "${TARGET_GOOS}_${TARGET_GOARCH}"
>> +GO_BUILD_BINDIR =3D "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD=
_GOTUPLE',True) =3D=3D d.getVar('HOST_GOTUPLE',True)]}"
>> +
>> +def go_map_arch(a, d):
>> +    import re
>> +    if re.match('i.86', a):
>> +        return '386'
>> +    elif a =3D=3D 'x86_64':
>> +        return 'amd64'
>> +    elif re.match('arm.*', a):
>> +        return 'arm'
>> +    elif re.match('aarch64.*', a):
>> +        return 'arm64'
>> +    elif re.match('p(pc|owerpc)(|64)', a):
>> +        return 'powerpc'
>> +    else:
>> +        bb.error("cannot map '%s' to a Go architecture" % a)
>> +
>> +def go_map_arm(a, f, d):
>> +    import re
>> +    if re.match('arm.*', a) and re.match('arm.*7.*', f):
>> +        return '7'
>> +    return ''
>> +
>> +def go_map_os(o, d):
>> +    if o.startswith('linux'):
>> +        return 'linux'
>> +    return o
>> +
>> +
>> diff --git a/meta/recipes-devtools/go/go-1.4.inc b/meta/recipes-devtoo=
ls/go/go-1.4.inc
>> new file mode 100644
>> index 0000000..a65459f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.4.inc
>> @@ -0,0 +1,15 @@
>> +require go-common.inc
>> +
>> +PV =3D "1.4.3"
>> +GO_BASEVERSION =3D "1.4"
>> +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>> +
>> +SRC_URI +=3D "\
>> +        file://016-armhf-elf-header.patch \
>> +        file://go-cross-backport-cmd-link-support-new-386-amd64-rel.p=
atch \
>> +        file://syslog.patch \
>> +"
>> +
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D591778525c869cdde0ab5a1bf2=
83cd81"
>> +SRC_URI[md5sum] =3D "dfb604511115dd402a77a553a5923a04"
>> +SRC_URI[sha256sum] =3D "9947fc705b0b841b5938c48b22dc33e9647ec0752bae6=
6e50278df4f23f64959"
>> diff --git a/meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patc=
h b/meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
>> new file mode 100644
>> index 0000000..e6e414e
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
>> @@ -0,0 +1,24 @@
>> +Description: Use correct ELF header for armhf binaries.
>> +Author: Adam Conrad <adconrad@ubuntu.com>
>> +Last-Update: 2013-07-08
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Index: go/src/cmd/ld/elf.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/cmd/ld/elf.c   2015-02-20 10:49:58.763451586 -0800
>> ++++ go/src/cmd/ld/elf.c        2015-02-20 10:49:27.895478521 -0800
>> +@@ -57,7 +57,11 @@
>> +       case '5':
>> +               // we use EABI on both linux/arm and freebsd/arm.
>> +               if(HEADTYPE =3D=3D Hlinux || HEADTYPE =3D=3D Hfreebsd)=

>> +-                      hdr.flags =3D 0x5000002; // has entry point, V=
ersion5 EABI
>> ++#ifdef __ARM_PCS_VFP
>> ++                      hdr.flags =3D 0x5000402; // has entry point, V=
ersion5 EABI, hard-float ABI
>> ++#else
>> ++                      hdr.flags =3D 0x5000202; // has entry point, V=
ersion5 EABI, soft-float ABI
>> ++#endif
>> +               // fallthrough
>> +       default:
>> +               hdr.phoff =3D ELF32HDRSIZE;       /* Must be be ELF32H=
DRSIZE: first PHdr must follow ELF header */
>> diff --git a/meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-lin=
k-support-new-386-amd64-rel.patch b/meta/recipes-devtools/go/go-1.4/go-cr=
oss-backport-cmd-link-support-new-386-amd64-rel.patch
>> new file mode 100644
>> index 0000000..95ca9d3
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-suppo=
rt-new-386-amd64-rel.patch
>> @@ -0,0 +1,225 @@
>> +From d6eefad445831c161fca130f9bdf7b3848aac23c Mon Sep 17 00:00:00 200=
1
>> +From: Paul Gortmaker <paul.gortmaker@windriver.com>
>> +Date: Tue, 29 Mar 2016 21:14:33 -0400
>> +Subject: [PATCH] go-cross: backport "cmd/link: support new 386/amd64
>> + relocations"
>> +
>> +Newer binutils won't support building older go-1.4.3 as per:
>> +
>> +https://github.com/golang/go/issues/13114
>> +
>> +Upstream commit 914db9f060b1fd3eb1f74d48f3bd46a73d4ae9c7 (see subj)
>> +was identified as the fix and nominated for 1.4.4 but that release
>> +never happened.  The paths in 1.4.3 aren't the same as go1.6beta1~662=

>> +where this commit appeared, but the NetBSD folks indicated what a
>> +1.4.3 backport would look like here: https://gnats.netbsd.org/50777
>> +
>> +This is based on that, but without the BSD wrapper infrastructure
>> +layer that makes things look like patches of patches.
>> +
>> +Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> +
>> +Upstream-Status: Backport [ Partial ]
>> +
>> +diff --git a/src/cmd/6l/asm.c b/src/cmd/6l/asm.c
>> +index 18b5aa311981..2e9d339aef87 100644
>> +--- a/src/cmd/6l/asm.c
>> ++++ b/src/cmd/6l/asm.c
>> +@@ -118,6 +118,8 @@ adddynrel(LSym *s, Reloc *r)
>> +               return;
>> +
>> +       case 256 + R_X86_64_GOTPCREL:
>> ++      case 256 + R_X86_64_GOTPCRELX:
>> ++      case 256 + R_X86_64_REX_GOTPCRELX:
>> +               if(targ->type !=3D SDYNIMPORT) {
>> +                       // have symbol
>> +                       if(r->off >=3D 2 && s->p[r->off-2] =3D=3D 0x8b=
) {
>> +diff --git a/src/cmd/8l/asm.c b/src/cmd/8l/asm.c
>> +index 98c04240374f..cff29488e8af 100644
>> +--- a/src/cmd/8l/asm.c
>> ++++ b/src/cmd/8l/asm.c
>> +@@ -115,6 +115,7 @@ adddynrel(LSym *s, Reloc *r)
>> +               return;
>> +
>> +       case 256 + R_386_GOT32:
>> ++      case 256 + R_386_GOT32X:
>> +               if(targ->type !=3D SDYNIMPORT) {
>> +                       // have symbol
>> +                       if(r->off >=3D 2 && s->p[r->off-2] =3D=3D 0x8b=
) {
>> +diff --git a/src/cmd/ld/elf.h b/src/cmd/ld/elf.h
>> +index e84d996f2596..bbf2cfaa3cc0 100644
>> +--- a/src/cmd/ld/elf.h
>> ++++ b/src/cmd/ld/elf.h
>> +@@ -478,32 +478,47 @@ typedef struct {
>> +  * Relocation types.
>> +  */
>> +
>> +-#define       R_X86_64_NONE   0       /* No relocation. */
>> +-#define       R_X86_64_64     1       /* Add 64 bit symbol value. */=

>> +-#define       R_X86_64_PC32   2       /* PC-relative 32 bit signed s=
ym value. */
>> +-#define       R_X86_64_GOT32  3       /* PC-relative 32 bit GOT offs=
et. */
>> +-#define       R_X86_64_PLT32  4       /* PC-relative 32 bit PLT offs=
et. */
>> +-#define       R_X86_64_COPY   5       /* Copy data from shared objec=
t. */
>> +-#define       R_X86_64_GLOB_DAT 6     /* Set GOT entry to data addre=
ss. */
>> +-#define       R_X86_64_JMP_SLOT 7     /* Set GOT entry to code addre=
ss. */
>> +-#define       R_X86_64_RELATIVE 8     /* Add load address of shared =
object. */
>> +-#define       R_X86_64_GOTPCREL 9     /* Add 32 bit signed pcrel off=
set to GOT. */
>> +-#define       R_X86_64_32     10      /* Add 32 bit zero extended sy=
mbol value */
>> +-#define       R_X86_64_32S    11      /* Add 32 bit sign extended sy=
mbol value */
>> +-#define       R_X86_64_16     12      /* Add 16 bit zero extended sy=
mbol value */
>> +-#define       R_X86_64_PC16   13      /* Add 16 bit signed extended =
pc relative symbol value */
>> +-#define       R_X86_64_8      14      /* Add 8 bit zero extended sym=
bol value */
>> +-#define       R_X86_64_PC8    15      /* Add 8 bit signed extended p=
c relative symbol value */
>> +-#define       R_X86_64_DTPMOD64 16    /* ID of module containing sym=
bol */
>> +-#define       R_X86_64_DTPOFF64 17    /* Offset in TLS block */
>> +-#define       R_X86_64_TPOFF64 18     /* Offset in static TLS block =
*/
>> +-#define       R_X86_64_TLSGD  19      /* PC relative offset to GD GO=
T entry */
>> +-#define       R_X86_64_TLSLD  20      /* PC relative offset to LD GO=
T entry */
>> +-#define       R_X86_64_DTPOFF32 21    /* Offset in TLS block */
>> +-#define       R_X86_64_GOTTPOFF 22    /* PC relative offset to IE GO=
T entry */
>> +-#define       R_X86_64_TPOFF32 23     /* Offset in static TLS block =
*/
>> +-
>> +-#define       R_X86_64_COUNT  24      /* Count of defined relocation=
 types. */
>> ++#define       R_X86_64_NONE           0
>> ++#define       R_X86_64_64             1
>> ++#define       R_X86_64_PC32           2
>> ++#define       R_X86_64_GOT32          3
>> ++#define       R_X86_64_PLT32          4
>> ++#define       R_X86_64_COPY           5
>> ++#define       R_X86_64_GLOB_DAT       6
>> ++#define       R_X86_64_JMP_SLOT       7
>> ++#define       R_X86_64_RELATIVE       8
>> ++#define       R_X86_64_GOTPCREL       9
>> ++#define       R_X86_64_32             10
>> ++#define       R_X86_64_32S            11
>> ++#define       R_X86_64_16             12
>> ++#define       R_X86_64_PC16           13
>> ++#define       R_X86_64_8              14
>> ++#define       R_X86_64_PC8            15
>> ++#define       R_X86_64_DTPMOD64       16
>> ++#define       R_X86_64_DTPOFF64       17
>> ++#define       R_X86_64_TPOFF64        18
>> ++#define       R_X86_64_TLSGD          19
>> ++#define       R_X86_64_TLSLD          20
>> ++#define       R_X86_64_DTPOFF32       21
>> ++#define       R_X86_64_GOTTPOFF       22
>> ++#define       R_X86_64_TPOFF32        23
>> ++#define       R_X86_64_PC64           24
>> ++#define       R_X86_64_GOTOFF64       25
>> ++#define       R_X86_64_GOTPC32        26
>> ++#define       R_X86_64_GOT64          27
>> ++#define       R_X86_64_GOTPCREL64     28
>> ++#define       R_X86_64_GOTPC64        29
>> ++#define       R_X86_64_GOTPLT64       30
>> ++#define       R_X86_64_PLTOFF64       31
>> ++#define       R_X86_64_SIZE32         32
>> ++#define       R_X86_64_SIZE64         33
>> ++#define       R_X86_64_GOTPC32_TLSDEC 34
>> ++#define       R_X86_64_TLSDESC_CALL   35
>> ++#define       R_X86_64_TLSDESC        36
>> ++#define       R_X86_64_IRELATIVE      37
>> ++#define       R_X86_64_PC32_BND       40
>> ++#define       R_X86_64_GOTPCRELX      41
>> ++#define       R_X86_64_REX_GOTPCRELX  42
>> +
>> +
>> + #define       R_ALPHA_NONE            0       /* No reloc */
>> +@@ -581,39 +596,42 @@ typedef struct {
>> + #define       R_ARM_COUNT             38      /* Count of defined re=
location types. */
>> +
>> +
>> +-#define       R_386_NONE      0       /* No relocation. */
>> +-#define       R_386_32        1       /* Add symbol value. */
>> +-#define       R_386_PC32      2       /* Add PC-relative symbol valu=
e. */
>> +-#define       R_386_GOT32     3       /* Add PC-relative GOT offset.=
 */
>> +-#define       R_386_PLT32     4       /* Add PC-relative PLT offset.=
 */
>> +-#define       R_386_COPY      5       /* Copy data from shared objec=
t. */
>> +-#define       R_386_GLOB_DAT  6       /* Set GOT entry to data addre=
ss. */
>> +-#define       R_386_JMP_SLOT  7       /* Set GOT entry to code addre=
ss. */
>> +-#define       R_386_RELATIVE  8       /* Add load address of shared =
object. */
>> +-#define       R_386_GOTOFF    9       /* Add GOT-relative symbol add=
ress. */
>> +-#define       R_386_GOTPC     10      /* Add PC-relative GOT table a=
ddress. */
>> +-#define       R_386_TLS_TPOFF 14      /* Negative offset in static T=
LS block */
>> +-#define       R_386_TLS_IE    15      /* Absolute address of GOT for=
 -ve static TLS */
>> +-#define       R_386_TLS_GOTIE 16      /* GOT entry for negative stat=
ic TLS block */
>> +-#define       R_386_TLS_LE    17      /* Negative offset relative to=
 static TLS */
>> +-#define       R_386_TLS_GD    18      /* 32 bit offset to GOT (index=
,off) pair */
>> +-#define       R_386_TLS_LDM   19      /* 32 bit offset to GOT (index=
,zero) pair */
>> +-#define       R_386_TLS_GD_32 24      /* 32 bit offset to GOT (index=
,off) pair */
>> +-#define       R_386_TLS_GD_PUSH 25    /* pushl instruction for Sun A=
BI GD sequence */
>> +-#define       R_386_TLS_GD_CALL 26    /* call instruction for Sun AB=
I GD sequence */
>> +-#define       R_386_TLS_GD_POP 27     /* popl instruction for Sun AB=
I GD sequence */
>> +-#define       R_386_TLS_LDM_32 28     /* 32 bit offset to GOT (index=
,zero) pair */
>> +-#define       R_386_TLS_LDM_PUSH 29   /* pushl instruction for Sun A=
BI LD sequence */
>> +-#define       R_386_TLS_LDM_CALL 30   /* call instruction for Sun AB=
I LD sequence */
>> +-#define       R_386_TLS_LDM_POP 31    /* popl instruction for Sun AB=
I LD sequence */
>> +-#define       R_386_TLS_LDO_32 32     /* 32 bit offset from start of=
 TLS block */
>> +-#define       R_386_TLS_IE_32 33      /* 32 bit offset to GOT static=
 TLS offset entry */
>> +-#define       R_386_TLS_LE_32 34      /* 32 bit offset within static=
 TLS block */
>> +-#define       R_386_TLS_DTPMOD32 35   /* GOT entry containing TLS in=
dex */
>> +-#define       R_386_TLS_DTPOFF32 36   /* GOT entry containing TLS of=
fset */
>> +-#define       R_386_TLS_TPOFF32 37    /* GOT entry of -ve static TLS=
 offset */
>> +-
>> +-#define       R_386_COUNT     38      /* Count of defined relocation=
 types. */
>> ++#define       R_386_NONE          0
>> ++#define       R_386_32            1
>> ++#define       R_386_PC32          2
>> ++#define       R_386_GOT32         3
>> ++#define       R_386_PLT32         4
>> ++#define       R_386_COPY          5
>> ++#define       R_386_GLOB_DAT      6
>> ++#define       R_386_JMP_SLOT      7
>> ++#define       R_386_RELATIVE      8
>> ++#define       R_386_GOTOFF        9
>> ++#define       R_386_GOTPC         10
>> ++#define       R_386_TLS_TPOFF     14
>> ++#define       R_386_TLS_IE        15
>> ++#define       R_386_TLS_GOTIE     16
>> ++#define       R_386_TLS_LE        17
>> ++#define       R_386_TLS_GD        18
>> ++#define       R_386_TLS_LDM       19
>> ++#define       R_386_TLS_GD_32     24
>> ++#define       R_386_TLS_GD_PUSH   25
>> ++#define       R_386_TLS_GD_CALL   26
>> ++#define       R_386_TLS_GD_POP    27
>> ++#define       R_386_TLS_LDM_32    28
>> ++#define       R_386_TLS_LDM_PUSH  29
>> ++#define       R_386_TLS_LDM_CALL  30
>> ++#define       R_386_TLS_LDM_POP   31
>> ++#define       R_386_TLS_LDO_32    32
>> ++#define       R_386_TLS_IE_32     33
>> ++#define       R_386_TLS_LE_32     34
>> ++#define       R_386_TLS_DTPMOD32  35
>> ++#define       R_386_TLS_DTPOFF32  36
>> ++#define       R_386_TLS_TPOFF32   37
>> ++#define       R_386_TLS_GOTDESC   39
>> ++#define       R_386_TLS_DESC_CALL 40
>> ++#define       R_386_TLS_DESC      41
>> ++#define       R_386_IRELATIVE     42
>> ++#define       R_386_GOT32X        43
>> +
>> + #define       R_PPC_NONE              0       /* No relocation. */
>> + #define       R_PPC_ADDR32            1
>> +diff --git a/src/cmd/ld/ldelf.c b/src/cmd/ld/ldelf.c
>> +index dd5fa0d2a839..2e2fbd17377f 100644
>> +--- a/src/cmd/ld/ldelf.c
>> ++++ b/src/cmd/ld/ldelf.c
>> +@@ -888,12 +888,15 @@ reltype(char *pn, int elftype, uchar *siz)
>> +       case R('6', R_X86_64_PC32):
>> +       case R('6', R_X86_64_PLT32):
>> +       case R('6', R_X86_64_GOTPCREL):
>> ++      case R('6', R_X86_64_GOTPCRELX):
>> ++      case R('6', R_X86_64_REX_GOTPCRELX):
>> +       case R('8', R_386_32):
>> +       case R('8', R_386_PC32):
>> +       case R('8', R_386_GOT32):
>> +       case R('8', R_386_PLT32):
>> +       case R('8', R_386_GOTOFF):
>> +       case R('8', R_386_GOTPC):
>> ++      case R('8', R_386_GOT32X):
>> +               *siz =3D 4;
>> +               break;
>> +       case R('6', R_X86_64_64):
>> +--
>> +2.7.2
>> +
>> diff --git a/meta/recipes-devtools/go/go-1.4/syslog.patch b/meta/recip=
es-devtools/go/go-1.4/syslog.patch
>> new file mode 100644
>> index 0000000..29be06f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.4/syslog.patch
>> @@ -0,0 +1,62 @@
>> +Add timeouts to logger
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +
>> +diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log=
/syslog/syslog.go
>> +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 =
-0800
>> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03 11:=
44:37.710403200 -0700
>> +@@ -33,6 +33,9 @@
>> + const severityMask =3D 0x07
>> + const facilityMask =3D 0xf8
>> +
>> ++var writeTimeout =3D 1 * time.Second
>> ++var connectTimeout =3D 1 * time.Second
>> ++
>> + const (
>> +       // Severity.
>> +
>> +@@ -100,6 +103,7 @@
>> + type serverConn interface {
>> +       writeString(p Priority, hostname, tag, s, nl string) error
>> +       close() error
>> ++      setWriteDeadline(t time.Time) error
>> + }
>> +
>> + type netConn struct {
>> +@@ -273,7 +277,11 @@
>> +               nl =3D "\n"
>> +       }
>> +
>> +-      err :=3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
>> ++      err :=3D w.conn.setWriteDeadline(time.Now().Add(writeTimeout))=

>> ++      if err !=3D nil {
>> ++              return 0, err
>> ++      }
>> ++      err =3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
>> +       if err !=3D nil {
>> +               return 0, err
>> +       }
>> +@@ -305,6 +313,10 @@
>> +       return n.conn.Close()
>> + }
>> +
>> ++func (n *netConn) setWriteDeadline(t time.Time) error {
>> ++      return n.conn.SetWriteDeadline(t)
>> ++}
>> ++
>> + // NewLogger creates a log.Logger whose output is written to
>> + // the system log service with the specified priority. The logFlag
>> + // argument is the flag set passed through to log.New to create
>> +diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/sr=
c/log/syslog/syslog_unix.go
>> +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 =
-0800
>> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-1=
0-03 11:44:39.010403175 -0700
>> +@@ -19,7 +19,7 @@
>> +       logPaths :=3D []string{"/dev/log", "/var/run/syslog"}
>> +       for _, network :=3D range logTypes {
>> +               for _, path :=3D range logPaths {
>> +-                      conn, err :=3D net.Dial(network, path)
>> ++                      conn, err :=3D net.DialTimeout(network, path, =
connectTimeout)
>> +                       if err !=3D nil {
>> +                               continue
>> +                       } else {
>> diff --git a/meta/recipes-devtools/go/go-1.6.inc b/meta/recipes-devtoo=
ls/go/go-1.6.inc
>> new file mode 100644
>> index 0000000..769c1d8
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.6.inc
>> @@ -0,0 +1,19 @@
>> +require go-common.inc
>> +
>> +PV =3D "1.6.3"
>> +GO_BASEVERSION =3D "1.6"
>> +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>> +
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D591778525c869cdde0ab5a1bf2=
83cd81"
>> +
>> +SRC_URI +=3D "\
>> +       file://armhf-elf-header.patch \
>> +       file://syslog.patch \
>> +       file://fix-target-cc-for-build.patch \
>> +       file://fix-cc-handling.patch \
>> +       file://split-host-and-target-build.patch \
>> +       file://gotooldir.patch \
>> +"
>> +SRC_URI[md5sum] =3D "bf3fce6ccaadd310159c9e874220e2a2"
>> +SRC_URI[sha256sum] =3D "6326aeed5f86cf18f16d6dc831405614f855e2d416a91=
fd3fdc334f772345b00"
>> +
>> diff --git a/meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch b/=
meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
>> new file mode 100644
>> index 0000000..1e3a16b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
>> @@ -0,0 +1,23 @@
>> +Encode arm EABI ( hard/soft ) calling convention in ELF header
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/cmd/link/internal/ld/elf.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/cmd/link/internal/ld/elf.go
>> ++++ go/src/cmd/link/internal/ld/elf.go
>> +@@ -827,7 +827,13 @@
>> +       // 32-bit architectures
>> +       case '5':
>> +               // we use EABI on both linux/arm and freebsd/arm.
>> +-              if HEADTYPE =3D=3D obj.Hlinux || HEADTYPE =3D=3D obj.H=
freebsd {
>> ++              if HEADTYPE =3D=3D obj.Hlinux {
>> ++                      if Ctxt.Goarm =3D=3D 7 {
>> ++                              ehdr.flags =3D 0x5000402 // has entry =
point, Version5 EABI, hard float
>> ++                      } else {
>> ++                              ehdr.flags =3D 0x5000202 // has entry =
point, Version5 EABI, soft float
>> ++                      }
>> ++              } else if HEADTYPE =3D=3D obj.Hfreebsd {
>> +                       // We set a value here that makes no indicatio=
n of which
>> +                       // float ABI the object uses, because this is =
information
>> +                       // used by the dynamic linker to compare execu=
tables and
>> diff --git a/meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch b/m=
eta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
>> new file mode 100644
>> index 0000000..983323a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
>> @@ -0,0 +1,50 @@
>> +Accept CC with multiple words in its name
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/cmd/go/build.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/cmd/go/build.go        2015-07-29 14:48:40.323185807 =
-0700
>> ++++ go/src/cmd/go/build.go     2015-07-30 07:37:40.529818586 -0700
>> +@@ -2805,12 +2805,24 @@
>> +       return b.ccompilerCmd("CC", defaultCC, objdir)
>> + }
>> +
>> ++// gccCmd returns a gcc command line prefix
>> ++// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
>> ++func (b *builder) gccCmdForReal() []string {
>> ++      return envList("CC", defaultCC)
>> ++}
>> ++
>> + // gxxCmd returns a g++ command line prefix
>> + // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
>> + func (b *builder) gxxCmd(objdir string) []string {
>> +       return b.ccompilerCmd("CXX", defaultCXX, objdir)
>> + }
>> +
>> ++// gxxCmd returns a g++ command line prefix
>> ++// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
>> ++func (b *builder) gxxCmdForReal() []string {
>> ++      return envList("CXX", defaultCXX)
>> ++}
>> ++
>> + // ccompilerCmd returns a command line prefix for the given environm=
ent
>> + // variable and using the default command when the variable is empty=
=2E
>> + func (b *builder) ccompilerCmd(envvar, defcmd, objdir string) []stri=
ng {
>> +Index: go/src/cmd/go/env.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/cmd/go/env.go  2015-07-29 14:48:40.323185807 -0700
>> ++++ go/src/cmd/go/env.go       2015-07-30 07:40:54.461655721 -0700
>> +@@ -52,10 +52,9 @@
>> +
>> +       if goos !=3D "plan9" {
>> +               cmd :=3D b.gccCmd(".")
>> +-              env =3D append(env, envVar{"CC", cmd[0]})
>> ++              env =3D append(env, envVar{"CC", strings.Join(b.gccCmd=
ForReal(), " ")})
>> +               env =3D append(env, envVar{"GOGCCFLAGS", strings.Join(=
cmd[3:], " ")})
>> +-              cmd =3D b.gxxCmd(".")
>> +-              env =3D append(env, envVar{"CXX", cmd[0]})
>> ++              env =3D append(env, envVar{"CXX", strings.Join(b.gxxCm=
dForReal(), " ")})
>> +       }
>> +
>> +       if buildContext.CgoEnabled {
>> diff --git a/meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.p=
atch b/meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
>> new file mode 100644
>> index 0000000..2f6156e
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
>> @@ -0,0 +1,17 @@
>> +Put Quotes around CC_FOR_TARGET since it can be mutliple words e.g. i=
n OE
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/make.bash
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/make.bash      2015-07-29 13:28:11.334031696 -0700
>> ++++ go/src/make.bash   2015-07-29 13:36:55.814465630 -0700
>> +@@ -158,7 +158,7 @@
>> + fi
>> +
>> + echo "##### Building packages and commands for $GOOS/$GOARCH."
>> +-CC=3D$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcf=
lags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
>> ++CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -g=
cflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
>> + echo
>> +
>> + rm -f "$GOTOOLDIR"/go_bootstrap
>> diff --git a/meta/recipes-devtools/go/go-1.6/gotooldir.patch b/meta/re=
cipes-devtools/go/go-1.6/gotooldir.patch
>> new file mode 100644
>> index 0000000..9467025
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.6/gotooldir.patch
>> @@ -0,0 +1,30 @@
>> +Define tooldir in relation to GOTOOLDIR env var
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/go/build/build.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/go/build/build.go
>> ++++ go/src/go/build/build.go
>> +@@ -1388,7 +1388,7 @@ func init() {
>> + }
>> +
>> + // ToolDir is the directory containing build tools.
>> +-var ToolDir =3D filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.=
GOOS+"_"+runtime.GOARCH)
>> ++var ToolDir =3D envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "=
pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
>> +
>> + // IsLocalImport reports whether the import path is
>> + // a local import path, like ".", "..", "./foo", or "../foo".
>> +Index: go/src/cmd/go/build.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/cmd/go/build.go
>> ++++ go/src/cmd/go/build.go
>> +@@ -1312,7 +1312,7 @@ func (b *builder) build(a *action) (err
>> +               }
>> +
>> +               cgoExe :=3D tool("cgo")
>> +-              if a.cgo !=3D nil && a.cgo.target !=3D "" {
>> ++              if a.cgo !=3D nil && a.cgo.target !=3D "" && os.Getenv=
("GOTOOLDIR") =3D=3D "" {
>> +                       cgoExe =3D a.cgo.target
>> +               }
>> +               outGo, outObj, err :=3D b.cgo(a.p, cgoExe, obj, pcCFLA=
GS, pcLDFLAGS, cgofiles, gccfiles, cxxfiles, a.p.MFiles)
>> diff --git a/meta/recipes-devtools/go/go-1.6/split-host-and-target-bui=
ld.patch b/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.pa=
tch
>> new file mode 100644
>> index 0000000..afbae02
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patc=
h
>> @@ -0,0 +1,63 @@
>> +Add new option --target-only to build target components
>> +Separates the host and target pieces of build
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/make.bash
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/make.bash
>> ++++ go/src/make.bash
>> +@@ -143,12 +143,23 @@ if [ "$1" =3D "--no-clean" ]; then
>> +       buildall=3D""
>> +       shift
>> + fi
>> +-./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_boo=
tstrap
>> +-# Delay move of dist tool to now, because bootstrap may clear tool d=
irectory.
>> +-mv cmd/dist/dist "$GOTOOLDIR"/dist
>> +-echo
>> +
>> +-if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOHOSTOS" !=3D "$GOOS" ]; the=
n
>> ++do_host_build=3D"yes"
>> ++do_target_build=3D"yes"
>> ++if [ "$1" =3D "--target-only" ]; then
>> ++      do_host_build=3D"no"
>> ++      shift
>> ++elif [ "$1" =3D "--host-only" ]; then
>> ++      do_target_build=3D"no"
>> ++      shift
>> ++fi
>> ++
>> ++if [ "$do_host_build" =3D "yes" ]; then
>> ++      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds =
go_bootstrap
>> ++      # Delay move of dist tool to now, because bootstrap may clear =
tool directory.
>> ++      mv cmd/dist/dist "$GOTOOLDIR"/dist
>> ++      echo
>> ++
>> +       echo "##### Building packages and commands for host, $GOHOSTOS=
/$GOHOSTARCH."
>> +       # CC_FOR_TARGET is recorded as the default compiler for the go=
 tool. When building for the host, however,
>> +       # use the host compiler, CC, from `cmd/dist/dist env` instead.=

>> +@@ -157,11 +168,20 @@ if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOH
>> +       echo
>> + fi
>> +
>> +-echo "##### Building packages and commands for $GOOS/$GOARCH."
>> +-CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -g=
cflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
>> +-echo
>> ++if [ "$do_target_build" =3D "yes" ]; then
>> ++    GO_INSTALL=3D"${GO_TARGET_INSTALL:-std cmd}"
>> ++    echo "##### Building packages and commands for $GOOS/$GOARCH."
>> ++    if [ "$GOHOSTOS" =3D "$GOOS" -a "$GOHOSTARCH" =3D "$GOARCH" -a "=
$do_host_build" =3D "yes" ]; then
>> ++      rm -rf ./host-tools
>> ++      mkdir ./host-tools
>> ++      mv "$GOTOOLDIR"/* ./host-tools
>> ++      GOTOOLDIR=3D"$PWD/host-tools"
>> ++    fi
>> ++    GOTOOLDIR=3D"$GOTOOLDIR" CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_b=
ootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" =
-v ${GO_INSTALL}
>> ++    echo
>> +
>> +-rm -f "$GOTOOLDIR"/go_bootstrap
>> ++    rm -f "$GOTOOLDIR"/go_bootstrap
>> ++fi
>> +
>> + if [ "$1" !=3D "--no-banner" ]; then
>> +       "$GOTOOLDIR"/dist banner
>> diff --git a/meta/recipes-devtools/go/go-1.6/syslog.patch b/meta/recip=
es-devtools/go/go-1.6/syslog.patch
>> new file mode 100644
>> index 0000000..29be06f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.6/syslog.patch
>> @@ -0,0 +1,62 @@
>> +Add timeouts to logger
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +
>> +diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log=
/syslog/syslog.go
>> +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 =
-0800
>> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03 11:=
44:37.710403200 -0700
>> +@@ -33,6 +33,9 @@
>> + const severityMask =3D 0x07
>> + const facilityMask =3D 0xf8
>> +
>> ++var writeTimeout =3D 1 * time.Second
>> ++var connectTimeout =3D 1 * time.Second
>> ++
>> + const (
>> +       // Severity.
>> +
>> +@@ -100,6 +103,7 @@
>> + type serverConn interface {
>> +       writeString(p Priority, hostname, tag, s, nl string) error
>> +       close() error
>> ++      setWriteDeadline(t time.Time) error
>> + }
>> +
>> + type netConn struct {
>> +@@ -273,7 +277,11 @@
>> +               nl =3D "\n"
>> +       }
>> +
>> +-      err :=3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
>> ++      err :=3D w.conn.setWriteDeadline(time.Now().Add(writeTimeout))=

>> ++      if err !=3D nil {
>> ++              return 0, err
>> ++      }
>> ++      err =3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
>> +       if err !=3D nil {
>> +               return 0, err
>> +       }
>> +@@ -305,6 +313,10 @@
>> +       return n.conn.Close()
>> + }
>> +
>> ++func (n *netConn) setWriteDeadline(t time.Time) error {
>> ++      return n.conn.SetWriteDeadline(t)
>> ++}
>> ++
>> + // NewLogger creates a log.Logger whose output is written to
>> + // the system log service with the specified priority. The logFlag
>> + // argument is the flag set passed through to log.New to create
>> +diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/sr=
c/log/syslog/syslog_unix.go
>> +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 =
-0800
>> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-1=
0-03 11:44:39.010403175 -0700
>> +@@ -19,7 +19,7 @@
>> +       logPaths :=3D []string{"/dev/log", "/var/run/syslog"}
>> +       for _, network :=3D range logTypes {
>> +               for _, path :=3D range logPaths {
>> +-                      conn, err :=3D net.Dial(network, path)
>> ++                      conn, err :=3D net.DialTimeout(network, path, =
connectTimeout)
>> +                       if err !=3D nil {
>> +                               continue
>> +                       } else {
>> diff --git a/meta/recipes-devtools/go/go-1.7.inc b/meta/recipes-devtoo=
ls/go/go-1.7.inc
>> new file mode 100644
>> index 0000000..1f73715
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.7.inc
>> @@ -0,0 +1,18 @@
>> +require go-common.inc
>> +
>> +PV =3D "1.7.3"
>> +GO_BASEVERSION =3D "1.7"
>> +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>> +
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0d=
d74707"
>> +
>> +SRC_URI +=3D "\
>> +       file://armhf-elf-header.patch \
>> +       file://syslog.patch \
>> +       file://fix-target-cc-for-build.patch \
>> +       file://fix-cc-handling.patch \
>> +       file://split-host-and-target-build.patch \
>> +       file://gotooldir.patch \
>> +"
>> +SRC_URI[md5sum] =3D "83d1b7bd4281479ab7d153e5152c9fc9"
>> +SRC_URI[sha256sum] =3D "79430a0027a09b0b3ad57e214c4c1acfdd7af290961dd=
08d322818895af1ef44"
>> diff --git a/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch b/=
meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
>> new file mode 100644
>> index 0000000..1e3a16b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
>> @@ -0,0 +1,23 @@
>> +Encode arm EABI ( hard/soft ) calling convention in ELF header
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/cmd/link/internal/ld/elf.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/cmd/link/internal/ld/elf.go
>> ++++ go/src/cmd/link/internal/ld/elf.go
>> +@@ -827,7 +827,13 @@
>> +       // 32-bit architectures
>> +       case '5':
>> +               // we use EABI on both linux/arm and freebsd/arm.
>> +-              if HEADTYPE =3D=3D obj.Hlinux || HEADTYPE =3D=3D obj.H=
freebsd {
>> ++              if HEADTYPE =3D=3D obj.Hlinux {
>> ++                      if Ctxt.Goarm =3D=3D 7 {
>> ++                              ehdr.flags =3D 0x5000402 // has entry =
point, Version5 EABI, hard float
>> ++                      } else {
>> ++                              ehdr.flags =3D 0x5000202 // has entry =
point, Version5 EABI, soft float
>> ++                      }
>> ++              } else if HEADTYPE =3D=3D obj.Hfreebsd {
>> +                       // We set a value here that makes no indicatio=
n of which
>> +                       // float ABI the object uses, because this is =
information
>> +                       // used by the dynamic linker to compare execu=
tables and
>> diff --git a/meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch b/m=
eta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
>> new file mode 100644
>> index 0000000..a67caf4
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
>> @@ -0,0 +1,50 @@
>> +Accept CC with multiple words in its name
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/cmd/go/build.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/cmd/go/build.go
>> ++++ go/src/cmd/go/build.go
>> +@@ -2991,12 +2991,24 @@ func (b *builder) gccCmd(objdir string)
>> +       return b.ccompilerCmd("CC", defaultCC, objdir)
>> + }
>> +
>> ++// gccCmd returns a gcc command line prefix
>> ++// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
>> ++func (b *builder) gccCmdForReal() []string {
>> ++      return envList("CC", defaultCC)
>> ++}
>> ++
>> + // gxxCmd returns a g++ command line prefix
>> + // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
>> + func (b *builder) gxxCmd(objdir string) []string {
>> +       return b.ccompilerCmd("CXX", defaultCXX, objdir)
>> + }
>> +
>> ++// gxxCmd returns a g++ command line prefix
>> ++// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
>> ++func (b *builder) gxxCmdForReal() []string {
>> ++      return envList("CXX", defaultCXX)
>> ++}
>> ++
>> + // gfortranCmd returns a gfortran command line prefix.
>> + func (b *builder) gfortranCmd(objdir string) []string {
>> +       return b.ccompilerCmd("FC", "gfortran", objdir)
>> +Index: go/src/cmd/go/env.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/cmd/go/env.go
>> ++++ go/src/cmd/go/env.go
>> +@@ -51,10 +51,9 @@ func mkEnv() []envVar {
>> +
>> +       if goos !=3D "plan9" {
>> +               cmd :=3D b.gccCmd(".")
>> +-              env =3D append(env, envVar{"CC", cmd[0]})
>> ++              env =3D append(env, envVar{"CC", strings.Join(b.gccCmd=
ForReal(), " ")})
>> +               env =3D append(env, envVar{"GOGCCFLAGS", strings.Join(=
cmd[3:], " ")})
>> +-              cmd =3D b.gxxCmd(".")
>> +-              env =3D append(env, envVar{"CXX", cmd[0]})
>> ++              env =3D append(env, envVar{"CXX", strings.Join(b.gxxCm=
dForReal(), " ")})
>> +       }
>> +
>> +       if buildContext.CgoEnabled {
>> diff --git a/meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.p=
atch b/meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
>> new file mode 100644
>> index 0000000..2f6156e
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
>> @@ -0,0 +1,17 @@
>> +Put Quotes around CC_FOR_TARGET since it can be mutliple words e.g. i=
n OE
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/make.bash
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/make.bash      2015-07-29 13:28:11.334031696 -0700
>> ++++ go/src/make.bash   2015-07-29 13:36:55.814465630 -0700
>> +@@ -158,7 +158,7 @@
>> + fi
>> +
>> + echo "##### Building packages and commands for $GOOS/$GOARCH."
>> +-CC=3D$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcf=
lags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
>> ++CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -g=
cflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
>> + echo
>> +
>> + rm -f "$GOTOOLDIR"/go_bootstrap
>> diff --git a/meta/recipes-devtools/go/go-1.7/gotooldir.patch b/meta/re=
cipes-devtools/go/go-1.7/gotooldir.patch
>> new file mode 100644
>> index 0000000..9467025
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.7/gotooldir.patch
>> @@ -0,0 +1,30 @@
>> +Define tooldir in relation to GOTOOLDIR env var
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/go/build/build.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/go/build/build.go
>> ++++ go/src/go/build/build.go
>> +@@ -1388,7 +1388,7 @@ func init() {
>> + }
>> +
>> + // ToolDir is the directory containing build tools.
>> +-var ToolDir =3D filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.=
GOOS+"_"+runtime.GOARCH)
>> ++var ToolDir =3D envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "=
pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
>> +
>> + // IsLocalImport reports whether the import path is
>> + // a local import path, like ".", "..", "./foo", or "../foo".
>> +Index: go/src/cmd/go/build.go
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/cmd/go/build.go
>> ++++ go/src/cmd/go/build.go
>> +@@ -1312,7 +1312,7 @@ func (b *builder) build(a *action) (err
>> +               }
>> +
>> +               cgoExe :=3D tool("cgo")
>> +-              if a.cgo !=3D nil && a.cgo.target !=3D "" {
>> ++              if a.cgo !=3D nil && a.cgo.target !=3D "" && os.Getenv=
("GOTOOLDIR") =3D=3D "" {
>> +                       cgoExe =3D a.cgo.target
>> +               }
>> +               outGo, outObj, err :=3D b.cgo(a.p, cgoExe, obj, pcCFLA=
GS, pcLDFLAGS, cgofiles, gccfiles, cxxfiles, a.p.MFiles)
>> diff --git a/meta/recipes-devtools/go/go-1.7/split-host-and-target-bui=
ld.patch b/meta/recipes-devtools/go/go-1.7/split-host-and-target-build.pa=
tch
>> new file mode 100644
>> index 0000000..b0dd95b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patc=
h
>> @@ -0,0 +1,62 @@
>> +Add new option --target-only to build target components
>> +Separates the host and target pieces of build
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +Index: go/src/make.bash
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- go.orig/src/make.bash
>> ++++ go/src/make.bash
>> +@@ -154,13 +154,22 @@ if [ "$1" =3D "--no-clean" ]; then
>> +       buildall=3D""
>> +       shift
>> + fi
>> +-./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_boo=
tstrap
>> ++do_host_build=3D"yes"
>> ++do_target_build=3D"yes"
>> ++if [ "$1" =3D "--target-only" ]; then
>> ++      do_host_build=3D"no"
>> ++      shift
>> ++elif [ "$1" =3D "--host-only" ]; then
>> ++      do_target_build=3D"no"
>> ++      shift
>> ++fi
>> +
>> +-# Delay move of dist tool to now, because bootstrap may clear tool d=
irectory.
>> +-mv cmd/dist/dist "$GOTOOLDIR"/dist
>> +-echo
>> ++if [ "$do_host_build" =3D "yes" ]; then
>> ++      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds =
go_bootstrap
>> ++      # Delay move of dist tool to now, because bootstrap may clear =
tool directory.
>> ++      mv cmd/dist/dist "$GOTOOLDIR"/dist
>> ++      echo
>> +
>> +-if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOHOSTOS" !=3D "$GOOS" ]; the=
n
>> +       echo "##### Building packages and commands for host, $GOHOSTOS=
/$GOHOSTARCH."
>> +       # CC_FOR_TARGET is recorded as the default compiler for the go=
 tool. When building for the host, however,
>> +       # use the host compiler, CC, from `cmd/dist/dist env` instead.=

>> +@@ -169,11 +178,20 @@ if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOH
>> +       echo
>> + fi
>> +
>> +-echo "##### Building packages and commands for $GOOS/$GOARCH."
>> +-CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -g=
cflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
>> +-echo
>> ++if [ "$do_target_build" =3D "yes" ]; then
>> ++    GO_INSTALL=3D"${GO_TARGET_INSTALL:-std cmd}"
>> ++    echo "##### Building packages and commands for $GOOS/$GOARCH."
>> ++    if [ "$GOHOSTOS" =3D "$GOOS" -a "$GOHOSTARCH" =3D "$GOARCH" -a "=
$do_host_build" =3D "yes" ]; then
>> ++      rm -rf ./host-tools
>> ++      mkdir ./host-tools
>> ++      mv "$GOTOOLDIR"/* ./host-tools
>> ++      GOTOOLDIR=3D"$PWD/host-tools"
>> ++    fi
>> ++    GOTOOLDIR=3D"$GOTOOLDIR" CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_b=
ootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" =
-v ${GO_INSTALL}
>> ++    echo
>> +
>> +-rm -f "$GOTOOLDIR"/go_bootstrap
>> ++    rm -f "$GOTOOLDIR"/go_bootstrap
>> ++fi
>> +
>> + if [ "$1" !=3D "--no-banner" ]; then
>> +       "$GOTOOLDIR"/dist banner
>> diff --git a/meta/recipes-devtools/go/go-1.7/syslog.patch b/meta/recip=
es-devtools/go/go-1.7/syslog.patch
>> new file mode 100644
>> index 0000000..29be06f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.7/syslog.patch
>> @@ -0,0 +1,62 @@
>> +Add timeouts to logger
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +
>> +diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log=
/syslog/syslog.go
>> +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 =
-0800
>> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03 11:=
44:37.710403200 -0700
>> +@@ -33,6 +33,9 @@
>> + const severityMask =3D 0x07
>> + const facilityMask =3D 0xf8
>> +
>> ++var writeTimeout =3D 1 * time.Second
>> ++var connectTimeout =3D 1 * time.Second
>> ++
>> + const (
>> +       // Severity.
>> +
>> +@@ -100,6 +103,7 @@
>> + type serverConn interface {
>> +       writeString(p Priority, hostname, tag, s, nl string) error
>> +       close() error
>> ++      setWriteDeadline(t time.Time) error
>> + }
>> +
>> + type netConn struct {
>> +@@ -273,7 +277,11 @@
>> +               nl =3D "\n"
>> +       }
>> +
>> +-      err :=3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
>> ++      err :=3D w.conn.setWriteDeadline(time.Now().Add(writeTimeout))=

>> ++      if err !=3D nil {
>> ++              return 0, err
>> ++      }
>> ++      err =3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
>> +       if err !=3D nil {
>> +               return 0, err
>> +       }
>> +@@ -305,6 +313,10 @@
>> +       return n.conn.Close()
>> + }
>> +
>> ++func (n *netConn) setWriteDeadline(t time.Time) error {
>> ++      return n.conn.SetWriteDeadline(t)
>> ++}
>> ++
>> + // NewLogger creates a log.Logger whose output is written to
>> + // the system log service with the specified priority. The logFlag
>> + // argument is the flag set passed through to log.New to create
>> +diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/sr=
c/log/syslog/syslog_unix.go
>> +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 =
-0800
>> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-1=
0-03 11:44:39.010403175 -0700
>> +@@ -19,7 +19,7 @@
>> +       logPaths :=3D []string{"/dev/log", "/var/run/syslog"}
>> +       for _, network :=3D range logTypes {
>> +               for _, path :=3D range logPaths {
>> +-                      conn, err :=3D net.Dial(network, path)
>> ++                      conn, err :=3D net.DialTimeout(network, path, =
connectTimeout)
>> +                       if err !=3D nil {
>> +                               continue
>> +                       } else {
>> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-dev=
tools/go/go-common.inc
>> new file mode 100644
>> index 0000000..8897cb1
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-common.inc
>> @@ -0,0 +1,21 @@
>> +SUMMARY =3D "Go programming language compiler"
>> +DESCRIPTION =3D " The Go programming language is an open source proje=
ct to make \
>> + programmers more productive. Go is expressive, concise, clean, and\
>> + efficient. Its concurrency mechanisms make it easy to write programs=
\
>> + that get the most out of multicore and networked machines, while its=
\
>> + novel type system enables flexible and modular program construction.=
\
>> + Go compiles quickly to machine code yet has the convenience of\
>> + garbage collection and the power of run-time reflection. It's a\
>> + fast, statically typed, compiled language that feels like a\
>> + dynamically typed, interpreted language."
>> +
>> +HOMEPAGE =3D " http://golang.org/"
>> +LICENSE =3D "BSD-3-Clause"
>> +
>> +inherit goarch
>> +
>> +SRC_URI =3D "http://golang.org/dl/go${PV}.src.tar.gz"
>> +S =3D "${WORKDIR}/go"
>> +B =3D "${S}"
>> +
>> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
>> diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-dev=
tools/go/go-native.inc
>> new file mode 100644
>> index 0000000..cb2dd2a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-native.inc
>> @@ -0,0 +1,54 @@
>> +inherit native
>> +
>> +export GOOS =3D "${BUILD_GOOS}"
>> +export GOARCH =3D "${BUILD_GOARCH}"
>> +export GOROOT_FINAL =3D "${STAGING_LIBDIR_NATIVE}/go"
>> +export CGO_ENABLED =3D "1"
>> +
>> +do_configure[noexec] =3D "1"
>> +
>> +do_compile() {
>> +    export GOBIN=3D"${B}/bin"
>> +    rm -rf ${GOBIN}
>> +    mkdir ${GOBIN}
>> +
>> +    export TMPDIR=3D${WORKDIR}/build-tmp
>> +    mkdir -p ${WORKDIR}/build-tmp
>> +
>> +    cd src
>> +    CGO_ENABLED=3D0 ./make.bash --host-only
>> +}
>> +
>> +
>> +make_wrapper() {
>> +    rm -f ${D}${bindir}/$2
>> +    cat <<END >${D}${bindir}/$2
>> +#!/bin/bash
>> +here=3D\`dirname \$0\`
>> +export GOROOT=3D"${GOROOT:-\`readlink -f \$here/../lib/go\`}"
>> +\$here/../lib/go/bin/$1 "\$@"
>> +END
>> +    chmod +x ${D}${bindir}/$2
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}${libdir}/go
>> +    cp -a ${B}/pkg ${D}${libdir}/go/
>> +    install -d ${D}${libdir}/go/src
>> +    (cd ${S}/src; for d in *; do \
>> +        [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
>> +    done)
>> +    install -d ${D}${bindir} ${D}${libdir}/go/bin
>> +    for f in ${B}/bin/*
>> +    do
>> +        base=3D`basename $f`
>> +        install -m755 $f ${D}${libdir}/go/bin
>> +        make_wrapper $base $base
>> +    done
>> +}
>> +
>> +do_package[noexec] =3D "1"
>> +do_packagedata[noexec] =3D "1"
>> +do_package_write_ipk[noexec] =3D "1"
>> +do_package_write_deb[noexec] =3D "1"
>> +do_package_write_rpm[noexec] =3D "1"
>> diff --git a/meta/recipes-devtools/go/go-native_1.4.bb b/meta/recipes-=
devtools/go/go-native_1.4.bb
>> new file mode 100644
>> index 0000000..bbf3c0d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-native_1.4.bb
>> @@ -0,0 +1,2 @@
>> +require ${PN}.inc
>> +require go-${PV}.inc
>> diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/g=
o/go.inc
>> new file mode 100644
>> index 0000000..732ffa4
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go.inc
>> @@ -0,0 +1,74 @@
>> +inherit goarch
>> +# libgcc is required for the target specific libraries to build prope=
rly
>> +DEPENDS +=3D " go-native libgcc"
>> +# Prevent runstrip from running because you get errors when the host =
arch !=3D target arch
>> +INHIBIT_PACKAGE_STRIP =3D "1"
>> +INHIBIT_SYSROOT_STRIP =3D "1"
>> +
>> +export GOHOSTOS =3D "${BUILD_GOOS}"
>> +export GOHOSTARCH =3D "${BUILD_GOARCH}"
>> +export GOOS =3D "${TARGET_GOOS}"
>> +export GOARCH =3D "${TARGET_GOARCH}"
>> +export GOARM =3D "${TARGET_GOARM}"
>> +export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
>> +export GOROOT_FINAL =3D "${libdir}/go"
>> +export CGO_ENABLED =3D "1"
>> +export CC_FOR_TARGET=3D"${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysro=
ot=3D${STAGING_DIR_TARGET}"
>> +export CXX_FOR_TARGET=3D"${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysr=
oot=3D${STAGING_DIR_TARGET}"
>> +
>> +do_configure[noexec] =3D "1"
>> +
>> +do_compile() {
>> +    export GOBIN=3D"${B}/bin"
>> +    export CC=3D"${@d.getVar('BUILD_CC', True).strip()}"
>> +    rm -rf ${GOBIN} ${B}/pkg
>> +    mkdir ${GOBIN}
>> +
>> +    export TMPDIR=3D${WORKDIR}/build-tmp
>> +    mkdir -p ${WORKDIR}/build-tmp
>> +
>> +    cd src
>> +    ./make.bash --host-only
>> +    # Ensure cgo.a is built with the target toolchain
>> +    export GOBIN=3D"${B}/target/bin"
>> +    rm -rf ${GOBIN}
>> +    mkdir -p ${GOBIN}
>> +    GO_FLAGS=3D"-a" ./make.bash
>> +}
>> +
>> +do_install_class-target() {
>> +    install -d ${D}${libdir}/go
>> +    cp -a ${B}/pkg ${D}${libdir}/go/
>> +    install -d ${D}${libdir}/go/src
>> +    (cd ${S}/src; for d in *; do \
>> +        [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
>> +    done)
>> +    install -d ${D}${bindir}
>> +    for f in ${B}/bin/${GOOS}_${GOARCH}/*
>> +    do
>> +        install -m755 $f ${D}${bindir}
>> +    done
>> +}
>> +
>> +do_install_class-cross() {
>> +    install -d ${D}${libdir}/go
>> +    cp -a ${B}/pkg ${D}${libdir}/go/
>> +    install -d ${D}${libdir}/go/src
>> +    (cd ${S}/src; for d in *; do \
>> +        [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
>> +    done)
>> +    install -d ${D}${bindir}
>> +    for f in ${B}/bin/go*
>> +    do
>> +        install -m755 $f ${D}${bindir}
>> +    done
>> +}
>> +
>> +INSANE_SKIP_${PN} +=3D "staticdev"
>> +RDEPENDS_${PN} +=3D "perl"
>> +
>> +do_package[noexec] =3D "1"
>> +do_packagedata[noexec] =3D "1"
>> +do_package_write_ipk[noexec] =3D "1"
>> +do_package_write_deb[noexec] =3D "1"
>> +do_package_write_rpm[noexec] =3D "1"
>> diff --git a/meta/recipes-devtools/go/go_1.6.bb b/meta/recipes-devtool=
s/go/go_1.6.bb
>> new file mode 100644
>> index 0000000..2f59033
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go_1.6.bb
>> @@ -0,0 +1,4 @@
>> +require go.inc
>> +require go-${PV}.inc
>> +
>> +BBCLASSEXTEND =3D "cross"
>> diff --git a/meta/recipes-devtools/go/go_1.7.bb b/meta/recipes-devtool=
s/go/go_1.7.bb
>> new file mode 100644
>> index 0000000..8186427
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go_1.7.bb
>> @@ -0,0 +1,4 @@
>> +require go-${PV}.inc
>> +require go.inc
>> +
>> +BBCLASSEXTEND =3D "cross"
>=20
>=20
> +1 for adding Go to oe-core. We already use it in Mender and are
> currently including oe-meta-go. This way we could limit the number of
> layers that meta-mender depends on.
>=20
> As for the patch itself, can you include information about oe-meta-go
> revision that you used? I recall there was a policy commit messages in
> patches including commits/recipes from other layers, though I'm not
> sure if it's still in place or not.

Good point, its head of layer, actually the patch merged best from meta-v=
irt
and oe-meta-go, meta-virt recipes were cleaner and using that as base I h=
ave
added the support for bbclassextend from oe-meta-go. I will amend the com=
mit
message in a follow up

>=20
> BTW. one thing that I particularly dislike is the find/tar trampoline
> and destsuffix. Though, I'm not sure if there's a sensible way around
> it. Go enforces a particular project structure that's not entirely
> flexible in use outside of one's private workspace.

we could think of including govendor or some such tool ?

>=20
> I've also seen destsuffix break recipes that always build the latest
> version. I believe the issue is caused by git fetcher but have not had
> time to get down a debug it thoroughly.

I dont think this patch uses destsuffix the way oe-meta-go did
but if you still have these issues please report.

>=20
>=20


--R9NNndAFqiXLaOqPKqfDO8W0pxIwTokfR--

--IFIaPLOpkAAx5FVsBpFG5gRdeSsVseMpR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgmCdEACgkQuwUzVZGdMxSFAgCfaamr+fHP3TbTK6aZT2PQMG86
BZgAnRxDY5XDVLGoDlegkISVkAV/3zZo
=3BXK
-----END PGP SIGNATURE-----

--IFIaPLOpkAAx5FVsBpFG5gRdeSsVseMpR--
