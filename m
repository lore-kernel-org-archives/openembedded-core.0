Return-Path: <matt@madison.systems>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id D25B07315E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 20:00:46 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id y193so77569973lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 12:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=567ANMT0+koZv2zjp6rOR13D9OktcDI9P0Qh7uFoIKo=;
	b=pGQSkByJYsS/DbquMahz6sxZkPsGpnugIVHnfyVRyeDeP/iGlOtY55joyx+CgkVFPk
	C16TfW7lR5YjXMRYlj1nk3+r6hTAUDM5HrzyA86Rdhfg9vkphZDXYG39lcETswy9hghQ
	3irwoPRIogTn+wTb+HG9Njq2AlbUvrt3wdOvTmLYNDudXgHfNCP3hyTATlDIXRfxk1VB
	5zxzzdh0RmHuoG+DYC7hv9cOCKAFlFWqwD29WNvDinZMTMCAwGSi8XV8NB8Lkghri9aG
	C1zuWsAR+yYUaI106/uo2824G8zFqXGG8yMXL8wNaGtCIT+bOU1fEuFBMhlHSfUL0A53
	QA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=567ANMT0+koZv2zjp6rOR13D9OktcDI9P0Qh7uFoIKo=;
	b=ZxWULndi+YQ+lZf1vxYEIgxInDHHCgv4LM6aU50UH89yXNxCo595ZiEWq1GR51qvoM
	Zxy05vPhSYpkHV8qJvYpfFyuBfEc3t2S200SnSPfte0JNBgYz5yXSoNaDNflkN737vf+
	GmnO60JhTG81tqZwlOogJ9aIfSkSvCI9G/hv+GPogkTAXXnZ+hVYOCrj5cNaRGD1uLaR
	jeiE4KeHz6dQIBjSspQ0XCKjxEks5YeMWriMoKMoHNr5g3s2mKMBagHpae67yh1jsRFl
	KMD8uDgK1tLwLTo8aPJyjFvl0sguQ59qZWXgd7CgxLg6o7Oo/xpLu9VptF1xPE1nVOdV
	Bg1w==
X-Gm-Message-State: AMke39lghaoNimY1xbYjZYuDXns88y3BMAFEVIOpzGDZ2R9FRhWDeTKPXG+fuLDZtCLVZ2RBzb1xL6EAWdHoTA==
X-Received: by 10.25.43.205 with SMTP id r196mr4921321lfr.116.1488830445126;
	Mon, 06 Mar 2017 12:00:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.80.71 with HTTP; Mon, 6 Mar 2017 12:00:44 -0800 (PST)
In-Reply-To: <20170303231811.27812-1-raj.khem@gmail.com>
References: <20170303231811.27812-1-raj.khem@gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Mon, 6 Mar 2017 12:00:44 -0800
Message-ID: <CAGgRHJrrmcvv6CkO+fH++85YD+SxzrsrPeVCdP+MgsgP_iP23w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 06 Mar 2017 20:00:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 3, 2017 at 3:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * This is converging the recipes for go from
>   meta-virtualization and oe-meta-go
>
> * Add recipes for go 1.7
>
> * go.bbclass is added to ease out writing
>   recipes for go packages
>
> * go-examples: Add an example, helloworld written in go
>   This should serve as temlate for writing go recipes


I have some specific comments below, but as a general question,
how about crosssdk and cross-canadian recipes for the toolchain?


Thanks,
-Matt

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/go.bbclass                            |  72 +++++++
>  meta/classes/goarch.bbclass                        |  46 +++++
>  meta/recipes-devtools/go/go-1.4.inc                |  16 ++
>  ...alignment-for-the-.rel.plt-section-on-32-.patch |  30 +++
>  .../go/go-1.4/016-armhf-elf-header.patch           |  24 +++
>  ...ckport-cmd-link-support-new-386-amd64-rel.patch | 225 +++++++++++++++=
++++++
>  meta/recipes-devtools/go/go-1.4/syslog.patch       |  62 ++++++
>  meta/recipes-devtools/go/go-1.6.inc                |  19 ++
>  .../go/go-1.6/armhf-elf-header.patch               |  23 +++
>  .../go/go-1.6/fix-cc-handling.patch                |  50 +++++
>  .../go/go-1.6/fix-target-cc-for-build.patch        |  17 ++
>  meta/recipes-devtools/go/go-1.6/gotooldir.patch    |  30 +++
>  .../go/go-1.6/split-host-and-target-build.patch    |  63 ++++++
>  meta/recipes-devtools/go/go-1.6/syslog.patch       |  62 ++++++
>  meta/recipes-devtools/go/go-1.7.inc                |  19 ++
>  .../go/go-1.7/armhf-elf-header.patch               |  23 +++
>  .../go/go-1.7/fix-cc-handling.patch                |  50 +++++
>  .../go/go-1.7/fix-target-cc-for-build.patch        |  17 ++
>  meta/recipes-devtools/go/go-1.7/gotooldir.patch    |  30 +++
>  .../go/go-1.7/split-host-and-target-build.patch    |  62 ++++++
>  meta/recipes-devtools/go/go-1.7/syslog.patch       |  62 ++++++
>  meta/recipes-devtools/go/go-common.inc             |  22 ++
>  meta/recipes-devtools/go/go-cross.inc              |  10 +
>  meta/recipes-devtools/go/go-cross_1.7.bb           |   5 +
>  meta/recipes-devtools/go/go-native.inc             |  54 +++++
>  meta/recipes-devtools/go/go-native_1.4.bb          |   2 +
>  meta/recipes-devtools/go/go.inc                    |  80 ++++++++
>  meta/recipes-devtools/go/go_1.6.bb                 |   4 +
>  meta/recipes-devtools/go/go_1.7.bb                 |   2 +
>  .../go-examples/files/helloworld.go                |  10 +
>  meta/recipes-extended/go-examples/go-examples.inc  |  10 +
>  .../go-examples/go-helloworld_0.1.bb               |  13 ++
>  32 files changed, 1214 insertions(+)
>  create mode 100644 meta/classes/go.bbclass
>  create mode 100644 meta/classes/goarch.bbclass
>  create mode 100644 meta/recipes-devtools/go/go-1.4.inc
>  create mode 100644 meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-align=
ment-for-the-.rel.plt-section-on-32-.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.=
patch
>  create mode 100644 meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd=
-link-support-new-386-amd64-rel.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.4/syslog.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.6.inc
>  create mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.patc=
h
>  create mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.6/fix-target-cc-for-bui=
ld.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.6/split-host-and-target=
-build.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.7.inc
>  create mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.patc=
h
>  create mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.7/fix-target-cc-for-bui=
ld.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.7/split-host-and-target=
-build.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
>  create mode 100644 meta/recipes-devtools/go/go-common.inc
>  create mode 100644 meta/recipes-devtools/go/go-cross.inc
>  create mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
>  create mode 100644 meta/recipes-devtools/go/go-native.inc
>  create mode 100644 meta/recipes-devtools/go/go-native_1.4.bb
>  create mode 100644 meta/recipes-devtools/go/go.inc
>  create mode 100644 meta/recipes-devtools/go/go_1.6.bb
>  create mode 100644 meta/recipes-devtools/go/go_1.7.bb
>  create mode 100644 meta/recipes-extended/go-examples/files/helloworld.go
>  create mode 100644 meta/recipes-extended/go-examples/go-examples.inc
>  create mode 100644 meta/recipes-extended/go-examples/go-helloworld_0.1.b=
b
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> new file mode 100644
> index 0000000..e6ea996
> --- /dev/null
> +++ b/meta/classes/go.bbclass
> @@ -0,0 +1,72 @@
> +inherit goarch
> +
> +GOROOT_class-native =3D "${STAGING_LIBDIR_NATIVE}/go"
> +GOROOT =3D "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
> +GOBIN_FINAL_class-native =3D "${GOROOT_FINAL}/bin"
> +GOBIN_FINAL =3D "${GOROOT_FINAL}/bin/${GOOS}_${GOARCH}"
> +
> +export GOOS =3D "${TARGET_GOOS}"
> +export GOARCH =3D "${TARGET_GOARCH}"
> +export GOARM =3D "${TARGET_GOARM}"
> +export CGO_ENABLED =3D "1"
> +export GOROOT
> +export GOROOT_FINAL =3D "${libdir}/${TARGET_SYS}/go"
> +export GOBIN_FINAL
> +export GOPKG_FINAL =3D "${GOROOT_FINAL}/pkg/${GOOS}_${GOARCH}"
> +export GOSRC_FINAL =3D "${GOROOT_FINAL}/src"
> +export GO_GCFLAGS =3D "${TARGET_CFLAGS}"
> +export GO_LDFLAGS =3D "${TARGET_LDFLAGS}"
> +export CGO_CFLAGS =3D "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CF=
LAGS}"
> +export CGO_CPPFLAGS =3D "${TARGET_CPPFLAGS}"
> +export CGO_CXXFLAGS =3D "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_=
CXXFLAGS}"
> +export CGO_LDFLAGS =3D "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_L=
DFLAGS}"
> +
> +DEPENDS +=3D "go-cross-${TARGET_ARCH}"
> +DEPENDS_class-native +=3D "go-native"
> +
> +FILES_${PN}-staticdev +=3D "${GOSRC_FINAL}/${GO_IMPORT}"
> +FILES_${PN}-staticdev +=3D "${GOPKG_FINAL}/${GO_IMPORT}*"
> +
> +GO_INSTALL ?=3D "${GO_IMPORT}/..."
> +
> +do_go_compile() {
> +       GOPATH=3D${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
> +       if test -n "${GO_INSTALL}" ; then
> +               GOPATH=3D${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go insta=
ll -v ${GO_INSTALL}

Have you tested to make sure that the go install won't update and
install packages into the staging libdir during this compilation step?
 There is that risk, as the go tool will update dependent packages
even in GOROOT if it's writeable.  In meta-golang I added some patches
to the go build tool to prevent this.

> +       fi
> +}
> +
> +do_go_install() {
> +       rm -rf ${WORKDIR}/staging
> +       install -d ${WORKDIR}/staging${GOROOT_FINAL} ${D}${GOROOT_FINAL}
> +       tar -C ${S} -cf - . | tar -C ${WORKDIR}/staging${GOROOT_FINAL} -x=
pvf -
> +
> +       find ${WORKDIR}/staging${GOROOT_FINAL} \( \
> +               -name \*.indirectionsymlink -o \
> +               -name .git\* -o                \
> +               -name .hg -o                   \
> +               -name .svn -o                  \
> +               -name .pc\* -o                 \
> +               -name patches\*                \
> +               \) -print0 | \
> +       xargs -r0 rm -rf

Perhaps you could use --exclude-vcs and --exclude=3Dpattern on the tar
command to prevent the files from being populated in the first place?

> +
> +       tar -C ${WORKDIR}/staging${GOROOT_FINAL} -cf - . | \
> +       tar -C ${D}${GOROOT_FINAL} -xpvf -
> +
> +       chown -R root:root "${D}${GOROOT_FINAL}"

Use --no-same-owner on the tar command to eliminate the chown.
> +
> +       if test -e "${D}${GOBIN_FINAL}" ; then
> +               install -d -m 0755 "${D}${bindir}"
> +               find "${D}${GOBIN_FINAL}" ! -type d -print0 | xargs -r0 m=
v --target-directory=3D"${D}${bindir}"
> +               rmdir -p "${D}${GOBIN_FINAL}" || true
> +       fi
> +}
> +
> +do_compile() {
> +       do_go_compile
> +}
> +
> +do_install() {
> +       do_go_install
> +}

This is a bbclass, so these two functions should not be here, and the
ones above should be named 'go_do_XXX' instead of 'do_go_XXX'.  Then
add an EXPORT_FUNCTIONS line to export them.


> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> new file mode 100644
> index 0000000..119703c
> --- /dev/null
> +++ b/meta/classes/goarch.bbclass
> @@ -0,0 +1,46 @@
> +BUILD_GOOS =3D "${@go_map_os(d.getVar('BUILD_OS', True), d)}"
> +BUILD_GOARCH =3D "${@go_map_arch(d.getVar('BUILD_ARCH', True), d)}"
> +BUILD_GOTUPLE =3D "${BUILD_GOOS}_${BUILD_GOARCH}"
> +HOST_GOOS =3D "${@go_map_os(d.getVar('HOST_OS', True), d)}"
> +HOST_GOARCH =3D "${@go_map_arch(d.getVar('HOST_ARCH', True), d)}"
> +HOST_GOARM =3D "${@go_map_arm(d.getVar('HOST_ARCH', True), d.getVar('TUN=
E_FEATURES', True), d)}"
> +HOST_GOTUPLE =3D "${HOST_GOOS}_${HOST_GOARCH}"
> +TARGET_GOOS =3D "${@go_map_os(d.getVar('TARGET_OS', True), d)}"
> +TARGET_GOARCH =3D "${@go_map_arch(d.getVar('TARGET_ARCH', True), d)}"
> +TARGET_GOARM =3D "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getVar(=
'TUNE_FEATURES', True), d)}"
> +TARGET_GOTUPLE =3D "${TARGET_GOOS}_${TARGET_GOARCH}"
> +GO_BUILD_BINDIR =3D "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GO=
TUPLE',True) =3D=3D d.getVar('HOST_GOTUPLE',True)]}"
> +
> +def go_map_arch(a, d):
> +    import re
> +    if re.match('i.86', a):
> +        return '386'
> +    elif a =3D=3D 'x86_64':
> +        return 'amd64'
> +    elif re.match('arm.*', a):
> +        return 'arm'
> +    elif re.match('aarch64.*', a):
> +        return 'arm64'
> +    elif re.match('mips64el*', a):
> +        return 'mips64le'
> +    elif re.match('mips64*', a):
> +        return 'mips64'
> +    elif re.match('p(pc|owerpc)(64)', a):
> +        return 'ppc64'
> +    elif re.match('p(pc|owerpc)(64el)', a):
> +        return 'ppc64le'
> +    else:
> +        raise bb.parse.SkipPackage("Unsupported CPU architecture: %s" % =
a)
> +
> +def go_map_arm(a, f, d):
> +    import re
> +    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> +        return '7'
> +    return ''
> +
> +def go_map_os(o, d):
> +    if o.startswith('linux'):
> +        return 'linux'
> +    return o
> +
> +


For the following go-1.4 recipes:

I wouldn't recommend fixing go-native at version 1.4, which is now
postiviely ancient.
Instead, add go1.4.3's SRC_URI into the go-native recipe, loading it
in the right place so
that make.bash finds it.  This way, you can have all the go toolchain
recipes build at the
same version.  The go team only supports go1.4 for bootstrapping the
compiler build now
anyway, IIRC.

> diff --git a/meta/recipes-devtools/go/go-1.4.inc b/meta/recipes-devtools/=
go/go-1.4.inc
> new file mode 100644
> index 0000000..2f500f3
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.4.inc
> @@ -0,0 +1,16 @@
> +require go-common.inc
> +
> +PV =3D "1.4.3"
> +GO_BASEVERSION =3D "1.4"
> +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> +
> +SRC_URI +=3D "\
> +        file://016-armhf-elf-header.patch \
> +        file://go-cross-backport-cmd-link-support-new-386-amd64-rel.patc=
h \
> +        file://syslog.patch \
> +        file://0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-=
.patch \
> +"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D591778525c869cdde0ab5a1bf283c=
d81"
> +SRC_URI[md5sum] =3D "dfb604511115dd402a77a553a5923a04"
> +SRC_URI[sha256sum] =3D "9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e5=
0278df4f23f64959"
> diff --git a/meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-fo=
r-the-.rel.plt-section-on-32-.patch b/meta/recipes-devtools/go/go-1.4/0001-=
cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
> new file mode 100644
> index 0000000..4cfa9d1
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-for-the-.=
rel.plt-section-on-32-.patch
> @@ -0,0 +1,30 @@
> +From 855145d5c03c4b4faf60736c38d7a299c682af4a Mon Sep 17 00:00:00 2001
> +From: Shenghou Ma <minux@golang.org>
> +Date: Sat, 7 Feb 2015 14:06:02 -0500
> +Subject: [PATCH] cmd/ld: set alignment for the .rel.plt section on 32-bi=
t
> + architectures
> +
> +Fixes #9802.
> +
> +Change-Id: I22c52a37bdb23a14cc4615c9519431bb14ca81ca
> +Reviewed-on: https://go-review.googlesource.com/4170
> +Reviewed-by: Ian Lance Taylor <iant@golang.org>
> +---
> + src/cmd/ld/elf.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/cmd/ld/elf.c b/src/cmd/ld/elf.c
> +index 12ced98..97ed4bd 100644
> +--- a/src/cmd/ld/elf.c
> ++++ b/src/cmd/ld/elf.c
> +@@ -1363,6 +1363,7 @@ asmbelf(vlong symo)
> +                       sh->type =3D SHT_REL;
> +                       sh->flags =3D SHF_ALLOC;
> +                       sh->entsize =3D ELF32RELSIZE;
> ++                      sh->addralign =3D 4;
> +                       sh->link =3D elfshname(".dynsym")->shnum;
> +                       shsym(sh, linklookup(ctxt, ".rel.plt", 0));
> +
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch b=
/meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
> new file mode 100644
> index 0000000..e6e414e
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
> @@ -0,0 +1,24 @@
> +Description: Use correct ELF header for armhf binaries.
> +Author: Adam Conrad <adconrad@ubuntu.com>
> +Last-Update: 2013-07-08
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: go/src/cmd/ld/elf.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/ld/elf.c   2015-02-20 10:49:58.763451586 -0800
> ++++ go/src/cmd/ld/elf.c        2015-02-20 10:49:27.895478521 -0800
> +@@ -57,7 +57,11 @@
> +       case '5':
> +               // we use EABI on both linux/arm and freebsd/arm.
> +               if(HEADTYPE =3D=3D Hlinux || HEADTYPE =3D=3D Hfreebsd)
> +-                      hdr.flags =3D 0x5000002; // has entry point, Vers=
ion5 EABI
> ++#ifdef __ARM_PCS_VFP
> ++                      hdr.flags =3D 0x5000402; // has entry point, Vers=
ion5 EABI, hard-float ABI
> ++#else
> ++                      hdr.flags =3D 0x5000202; // has entry point, Vers=
ion5 EABI, soft-float ABI
> ++#endif
> +               // fallthrough
> +       default:
> +               hdr.phoff =3D ELF32HDRSIZE;       /* Must be be ELF32HDRS=
IZE: first PHdr must follow ELF header */
> diff --git a/meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-s=
upport-new-386-amd64-rel.patch b/meta/recipes-devtools/go/go-1.4/go-cross-b=
ackport-cmd-link-support-new-386-amd64-rel.patch
> new file mode 100644
> index 0000000..95ca9d3
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-support-=
new-386-amd64-rel.patch
> @@ -0,0 +1,225 @@
> +From d6eefad445831c161fca130f9bdf7b3848aac23c Mon Sep 17 00:00:00 2001
> +From: Paul Gortmaker <paul.gortmaker@windriver.com>
> +Date: Tue, 29 Mar 2016 21:14:33 -0400
> +Subject: [PATCH] go-cross: backport "cmd/link: support new 386/amd64
> + relocations"
> +
> +Newer binutils won't support building older go-1.4.3 as per:
> +
> +https://github.com/golang/go/issues/13114
> +
> +Upstream commit 914db9f060b1fd3eb1f74d48f3bd46a73d4ae9c7 (see subj)
> +was identified as the fix and nominated for 1.4.4 but that release
> +never happened.  The paths in 1.4.3 aren't the same as go1.6beta1~662
> +where this commit appeared, but the NetBSD folks indicated what a
> +1.4.3 backport would look like here: https://gnats.netbsd.org/50777
> +
> +This is based on that, but without the BSD wrapper infrastructure
> +layer that makes things look like patches of patches.
> +
> +Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> +
> +Upstream-Status: Backport [ Partial ]
> +
> +diff --git a/src/cmd/6l/asm.c b/src/cmd/6l/asm.c
> +index 18b5aa311981..2e9d339aef87 100644
> +--- a/src/cmd/6l/asm.c
> ++++ b/src/cmd/6l/asm.c
> +@@ -118,6 +118,8 @@ adddynrel(LSym *s, Reloc *r)
> +               return;
> +
> +       case 256 + R_X86_64_GOTPCREL:
> ++      case 256 + R_X86_64_GOTPCRELX:
> ++      case 256 + R_X86_64_REX_GOTPCRELX:
> +               if(targ->type !=3D SDYNIMPORT) {
> +                       // have symbol
> +                       if(r->off >=3D 2 && s->p[r->off-2] =3D=3D 0x8b) {
> +diff --git a/src/cmd/8l/asm.c b/src/cmd/8l/asm.c
> +index 98c04240374f..cff29488e8af 100644
> +--- a/src/cmd/8l/asm.c
> ++++ b/src/cmd/8l/asm.c
> +@@ -115,6 +115,7 @@ adddynrel(LSym *s, Reloc *r)
> +               return;
> +
> +       case 256 + R_386_GOT32:
> ++      case 256 + R_386_GOT32X:
> +               if(targ->type !=3D SDYNIMPORT) {
> +                       // have symbol
> +                       if(r->off >=3D 2 && s->p[r->off-2] =3D=3D 0x8b) {
> +diff --git a/src/cmd/ld/elf.h b/src/cmd/ld/elf.h
> +index e84d996f2596..bbf2cfaa3cc0 100644
> +--- a/src/cmd/ld/elf.h
> ++++ b/src/cmd/ld/elf.h
> +@@ -478,32 +478,47 @@ typedef struct {
> +  * Relocation types.
> +  */
> +
> +-#define       R_X86_64_NONE   0       /* No relocation. */
> +-#define       R_X86_64_64     1       /* Add 64 bit symbol value. */
> +-#define       R_X86_64_PC32   2       /* PC-relative 32 bit signed sym =
value. */
> +-#define       R_X86_64_GOT32  3       /* PC-relative 32 bit GOT offset.=
 */
> +-#define       R_X86_64_PLT32  4       /* PC-relative 32 bit PLT offset.=
 */
> +-#define       R_X86_64_COPY   5       /* Copy data from shared object. =
*/
> +-#define       R_X86_64_GLOB_DAT 6     /* Set GOT entry to data address.=
 */
> +-#define       R_X86_64_JMP_SLOT 7     /* Set GOT entry to code address.=
 */
> +-#define       R_X86_64_RELATIVE 8     /* Add load address of shared obj=
ect. */
> +-#define       R_X86_64_GOTPCREL 9     /* Add 32 bit signed pcrel offset=
 to GOT. */
> +-#define       R_X86_64_32     10      /* Add 32 bit zero extended symbo=
l value */
> +-#define       R_X86_64_32S    11      /* Add 32 bit sign extended symbo=
l value */
> +-#define       R_X86_64_16     12      /* Add 16 bit zero extended symbo=
l value */
> +-#define       R_X86_64_PC16   13      /* Add 16 bit signed extended pc =
relative symbol value */
> +-#define       R_X86_64_8      14      /* Add 8 bit zero extended symbol=
 value */
> +-#define       R_X86_64_PC8    15      /* Add 8 bit signed extended pc r=
elative symbol value */
> +-#define       R_X86_64_DTPMOD64 16    /* ID of module containing symbol=
 */
> +-#define       R_X86_64_DTPOFF64 17    /* Offset in TLS block */
> +-#define       R_X86_64_TPOFF64 18     /* Offset in static TLS block */
> +-#define       R_X86_64_TLSGD  19      /* PC relative offset to GD GOT e=
ntry */
> +-#define       R_X86_64_TLSLD  20      /* PC relative offset to LD GOT e=
ntry */
> +-#define       R_X86_64_DTPOFF32 21    /* Offset in TLS block */
> +-#define       R_X86_64_GOTTPOFF 22    /* PC relative offset to IE GOT e=
ntry */
> +-#define       R_X86_64_TPOFF32 23     /* Offset in static TLS block */
> +-
> +-#define       R_X86_64_COUNT  24      /* Count of defined relocation ty=
pes. */
> ++#define       R_X86_64_NONE           0
> ++#define       R_X86_64_64             1
> ++#define       R_X86_64_PC32           2
> ++#define       R_X86_64_GOT32          3
> ++#define       R_X86_64_PLT32          4
> ++#define       R_X86_64_COPY           5
> ++#define       R_X86_64_GLOB_DAT       6
> ++#define       R_X86_64_JMP_SLOT       7
> ++#define       R_X86_64_RELATIVE       8
> ++#define       R_X86_64_GOTPCREL       9
> ++#define       R_X86_64_32             10
> ++#define       R_X86_64_32S            11
> ++#define       R_X86_64_16             12
> ++#define       R_X86_64_PC16           13
> ++#define       R_X86_64_8              14
> ++#define       R_X86_64_PC8            15
> ++#define       R_X86_64_DTPMOD64       16
> ++#define       R_X86_64_DTPOFF64       17
> ++#define       R_X86_64_TPOFF64        18
> ++#define       R_X86_64_TLSGD          19
> ++#define       R_X86_64_TLSLD          20
> ++#define       R_X86_64_DTPOFF32       21
> ++#define       R_X86_64_GOTTPOFF       22
> ++#define       R_X86_64_TPOFF32        23
> ++#define       R_X86_64_PC64           24
> ++#define       R_X86_64_GOTOFF64       25
> ++#define       R_X86_64_GOTPC32        26
> ++#define       R_X86_64_GOT64          27
> ++#define       R_X86_64_GOTPCREL64     28
> ++#define       R_X86_64_GOTPC64        29
> ++#define       R_X86_64_GOTPLT64       30
> ++#define       R_X86_64_PLTOFF64       31
> ++#define       R_X86_64_SIZE32         32
> ++#define       R_X86_64_SIZE64         33
> ++#define       R_X86_64_GOTPC32_TLSDEC 34
> ++#define       R_X86_64_TLSDESC_CALL   35
> ++#define       R_X86_64_TLSDESC        36
> ++#define       R_X86_64_IRELATIVE      37
> ++#define       R_X86_64_PC32_BND       40
> ++#define       R_X86_64_GOTPCRELX      41
> ++#define       R_X86_64_REX_GOTPCRELX  42
> +
> +
> + #define       R_ALPHA_NONE            0       /* No reloc */
> +@@ -581,39 +596,42 @@ typedef struct {
> + #define       R_ARM_COUNT             38      /* Count of defined reloc=
ation types. */
> +
> +
> +-#define       R_386_NONE      0       /* No relocation. */
> +-#define       R_386_32        1       /* Add symbol value. */
> +-#define       R_386_PC32      2       /* Add PC-relative symbol value. =
*/
> +-#define       R_386_GOT32     3       /* Add PC-relative GOT offset. */
> +-#define       R_386_PLT32     4       /* Add PC-relative PLT offset. */
> +-#define       R_386_COPY      5       /* Copy data from shared object. =
*/
> +-#define       R_386_GLOB_DAT  6       /* Set GOT entry to data address.=
 */
> +-#define       R_386_JMP_SLOT  7       /* Set GOT entry to code address.=
 */
> +-#define       R_386_RELATIVE  8       /* Add load address of shared obj=
ect. */
> +-#define       R_386_GOTOFF    9       /* Add GOT-relative symbol addres=
s. */
> +-#define       R_386_GOTPC     10      /* Add PC-relative GOT table addr=
ess. */
> +-#define       R_386_TLS_TPOFF 14      /* Negative offset in static TLS =
block */
> +-#define       R_386_TLS_IE    15      /* Absolute address of GOT for -v=
e static TLS */
> +-#define       R_386_TLS_GOTIE 16      /* GOT entry for negative static =
TLS block */
> +-#define       R_386_TLS_LE    17      /* Negative offset relative to st=
atic TLS */
> +-#define       R_386_TLS_GD    18      /* 32 bit offset to GOT (index,of=
f) pair */
> +-#define       R_386_TLS_LDM   19      /* 32 bit offset to GOT (index,ze=
ro) pair */
> +-#define       R_386_TLS_GD_32 24      /* 32 bit offset to GOT (index,of=
f) pair */
> +-#define       R_386_TLS_GD_PUSH 25    /* pushl instruction for Sun ABI =
GD sequence */
> +-#define       R_386_TLS_GD_CALL 26    /* call instruction for Sun ABI G=
D sequence */
> +-#define       R_386_TLS_GD_POP 27     /* popl instruction for Sun ABI G=
D sequence */
> +-#define       R_386_TLS_LDM_32 28     /* 32 bit offset to GOT (index,ze=
ro) pair */
> +-#define       R_386_TLS_LDM_PUSH 29   /* pushl instruction for Sun ABI =
LD sequence */
> +-#define       R_386_TLS_LDM_CALL 30   /* call instruction for Sun ABI L=
D sequence */
> +-#define       R_386_TLS_LDM_POP 31    /* popl instruction for Sun ABI L=
D sequence */
> +-#define       R_386_TLS_LDO_32 32     /* 32 bit offset from start of TL=
S block */
> +-#define       R_386_TLS_IE_32 33      /* 32 bit offset to GOT static TL=
S offset entry */
> +-#define       R_386_TLS_LE_32 34      /* 32 bit offset within static TL=
S block */
> +-#define       R_386_TLS_DTPMOD32 35   /* GOT entry containing TLS index=
 */
> +-#define       R_386_TLS_DTPOFF32 36   /* GOT entry containing TLS offse=
t */
> +-#define       R_386_TLS_TPOFF32 37    /* GOT entry of -ve static TLS of=
fset */
> +-
> +-#define       R_386_COUNT     38      /* Count of defined relocation ty=
pes. */
> ++#define       R_386_NONE          0
> ++#define       R_386_32            1
> ++#define       R_386_PC32          2
> ++#define       R_386_GOT32         3
> ++#define       R_386_PLT32         4
> ++#define       R_386_COPY          5
> ++#define       R_386_GLOB_DAT      6
> ++#define       R_386_JMP_SLOT      7
> ++#define       R_386_RELATIVE      8
> ++#define       R_386_GOTOFF        9
> ++#define       R_386_GOTPC         10
> ++#define       R_386_TLS_TPOFF     14
> ++#define       R_386_TLS_IE        15
> ++#define       R_386_TLS_GOTIE     16
> ++#define       R_386_TLS_LE        17
> ++#define       R_386_TLS_GD        18
> ++#define       R_386_TLS_LDM       19
> ++#define       R_386_TLS_GD_32     24
> ++#define       R_386_TLS_GD_PUSH   25
> ++#define       R_386_TLS_GD_CALL   26
> ++#define       R_386_TLS_GD_POP    27
> ++#define       R_386_TLS_LDM_32    28
> ++#define       R_386_TLS_LDM_PUSH  29
> ++#define       R_386_TLS_LDM_CALL  30
> ++#define       R_386_TLS_LDM_POP   31
> ++#define       R_386_TLS_LDO_32    32
> ++#define       R_386_TLS_IE_32     33
> ++#define       R_386_TLS_LE_32     34
> ++#define       R_386_TLS_DTPMOD32  35
> ++#define       R_386_TLS_DTPOFF32  36
> ++#define       R_386_TLS_TPOFF32   37
> ++#define       R_386_TLS_GOTDESC   39
> ++#define       R_386_TLS_DESC_CALL 40
> ++#define       R_386_TLS_DESC      41
> ++#define       R_386_IRELATIVE     42
> ++#define       R_386_GOT32X        43
> +
> + #define       R_PPC_NONE              0       /* No relocation. */
> + #define       R_PPC_ADDR32            1
> +diff --git a/src/cmd/ld/ldelf.c b/src/cmd/ld/ldelf.c
> +index dd5fa0d2a839..2e2fbd17377f 100644
> +--- a/src/cmd/ld/ldelf.c
> ++++ b/src/cmd/ld/ldelf.c
> +@@ -888,12 +888,15 @@ reltype(char *pn, int elftype, uchar *siz)
> +       case R('6', R_X86_64_PC32):
> +       case R('6', R_X86_64_PLT32):
> +       case R('6', R_X86_64_GOTPCREL):
> ++      case R('6', R_X86_64_GOTPCRELX):
> ++      case R('6', R_X86_64_REX_GOTPCRELX):
> +       case R('8', R_386_32):
> +       case R('8', R_386_PC32):
> +       case R('8', R_386_GOT32):
> +       case R('8', R_386_PLT32):
> +       case R('8', R_386_GOTOFF):
> +       case R('8', R_386_GOTPC):
> ++      case R('8', R_386_GOT32X):
> +               *siz =3D 4;
> +               break;
> +       case R('6', R_X86_64_64):
> +--
> +2.7.2
> +
> diff --git a/meta/recipes-devtools/go/go-1.4/syslog.patch b/meta/recipes-=
devtools/go/go-1.4/syslog.patch
> new file mode 100644
> index 0000000..29be06f
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.4/syslog.patch
> @@ -0,0 +1,62 @@
> +Add timeouts to logger
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
> +diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/sy=
slog/syslog.go
> +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 -08=
00
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03 11:44:=
37.710403200 -0700
> +@@ -33,6 +33,9 @@
> + const severityMask =3D 0x07
> + const facilityMask =3D 0xf8
> +
> ++var writeTimeout =3D 1 * time.Second
> ++var connectTimeout =3D 1 * time.Second
> ++
> + const (
> +       // Severity.
> +
> +@@ -100,6 +103,7 @@
> + type serverConn interface {
> +       writeString(p Priority, hostname, tag, s, nl string) error
> +       close() error
> ++      setWriteDeadline(t time.Time) error
> + }
> +
> + type netConn struct {
> +@@ -273,7 +277,11 @@
> +               nl =3D "\n"
> +       }
> +
> +-      err :=3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> ++      err :=3D w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
> ++      if err !=3D nil {
> ++              return 0, err
> ++      }
> ++      err =3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> +       if err !=3D nil {
> +               return 0, err
> +       }
> +@@ -305,6 +313,10 @@
> +       return n.conn.Close()
> + }
> +
> ++func (n *netConn) setWriteDeadline(t time.Time) error {
> ++      return n.conn.SetWriteDeadline(t)
> ++}
> ++
> + // NewLogger creates a log.Logger whose output is written to
> + // the system log service with the specified priority. The logFlag
> + // argument is the flag set passed through to log.New to create
> +diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/l=
og/syslog/syslog_unix.go
> +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 -08=
00
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-10-0=
3 11:44:39.010403175 -0700
> +@@ -19,7 +19,7 @@
> +       logPaths :=3D []string{"/dev/log", "/var/run/syslog"}
> +       for _, network :=3D range logTypes {
> +               for _, path :=3D range logPaths {
> +-                      conn, err :=3D net.Dial(network, path)
> ++                      conn, err :=3D net.DialTimeout(network, path, con=
nectTimeout)
> +                       if err !=3D nil {
> +                               continue
> +                       } else {
> diff --git a/meta/recipes-devtools/go/go-1.6.inc b/meta/recipes-devtools/=
go/go-1.6.inc
> new file mode 100644
> index 0000000..769c1d8
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.6.inc
> @@ -0,0 +1,19 @@
> +require go-common.inc
> +
> +PV =3D "1.6.3"
> +GO_BASEVERSION =3D "1.6"
> +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D591778525c869cdde0ab5a1bf283c=
d81"
> +
> +SRC_URI +=3D "\
> +       file://armhf-elf-header.patch \
> +       file://syslog.patch \
> +       file://fix-target-cc-for-build.patch \
> +       file://fix-cc-handling.patch \
> +       file://split-host-and-target-build.patch \
> +       file://gotooldir.patch \
> +"
> +SRC_URI[md5sum] =3D "bf3fce6ccaadd310159c9e874220e2a2"
> +SRC_URI[sha256sum] =3D "6326aeed5f86cf18f16d6dc831405614f855e2d416a91fd3=
fdc334f772345b00"
> +
> diff --git a/meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch b/met=
a/recipes-devtools/go/go-1.6/armhf-elf-header.patch
> new file mode 100644
> index 0000000..1e3a16b
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
> @@ -0,0 +1,23 @@
> +Encode arm EABI ( hard/soft ) calling convention in ELF header
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/cmd/link/internal/ld/elf.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/link/internal/ld/elf.go
> ++++ go/src/cmd/link/internal/ld/elf.go
> +@@ -827,7 +827,13 @@
> +       // 32-bit architectures
> +       case '5':
> +               // we use EABI on both linux/arm and freebsd/arm.
> +-              if HEADTYPE =3D=3D obj.Hlinux || HEADTYPE =3D=3D obj.Hfre=
ebsd {
> ++              if HEADTYPE =3D=3D obj.Hlinux {
> ++                      if Ctxt.Goarm =3D=3D 7 {
> ++                              ehdr.flags =3D 0x5000402 // has entry poi=
nt, Version5 EABI, hard float
> ++                      } else {
> ++                              ehdr.flags =3D 0x5000202 // has entry poi=
nt, Version5 EABI, soft float
> ++                      }
> ++              } else if HEADTYPE =3D=3D obj.Hfreebsd {
> +                       // We set a value here that makes no indication o=
f which
> +                       // float ABI the object uses, because this is inf=
ormation
> +                       // used by the dynamic linker to compare executab=
les and
> diff --git a/meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch b/meta=
/recipes-devtools/go/go-1.6/fix-cc-handling.patch
> new file mode 100644
> index 0000000..983323a
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
> @@ -0,0 +1,50 @@
> +Accept CC with multiple words in its name
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/cmd/go/build.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/build.go        2015-07-29 14:48:40.323185807 -07=
00
> ++++ go/src/cmd/go/build.go     2015-07-30 07:37:40.529818586 -0700
> +@@ -2805,12 +2805,24 @@
> +       return b.ccompilerCmd("CC", defaultCC, objdir)
> + }
> +
> ++// gccCmd returns a gcc command line prefix
> ++// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> ++func (b *builder) gccCmdForReal() []string {
> ++      return envList("CC", defaultCC)
> ++}
> ++
> + // gxxCmd returns a g++ command line prefix
> + // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *builder) gxxCmd(objdir string) []string {
> +       return b.ccompilerCmd("CXX", defaultCXX, objdir)
> + }
> +
> ++// gxxCmd returns a g++ command line prefix
> ++// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> ++func (b *builder) gxxCmdForReal() []string {
> ++      return envList("CXX", defaultCXX)
> ++}
> ++
> + // ccompilerCmd returns a command line prefix for the given environment
> + // variable and using the default command when the variable is empty.
> + func (b *builder) ccompilerCmd(envvar, defcmd, objdir string) []string =
{
> +Index: go/src/cmd/go/env.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/env.go  2015-07-29 14:48:40.323185807 -0700
> ++++ go/src/cmd/go/env.go       2015-07-30 07:40:54.461655721 -0700
> +@@ -52,10 +52,9 @@
> +
> +       if goos !=3D "plan9" {
> +               cmd :=3D b.gccCmd(".")
> +-              env =3D append(env, envVar{"CC", cmd[0]})
> ++              env =3D append(env, envVar{"CC", strings.Join(b.gccCmdFor=
Real(), " ")})
> +               env =3D append(env, envVar{"GOGCCFLAGS", strings.Join(cmd=
[3:], " ")})
> +-              cmd =3D b.gxxCmd(".")
> +-              env =3D append(env, envVar{"CXX", cmd[0]})
> ++              env =3D append(env, envVar{"CXX", strings.Join(b.gxxCmdFo=
rReal(), " ")})
> +       }
> +
> +       if buildContext.CgoEnabled {
> diff --git a/meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patc=
h b/meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
> new file mode 100644
> index 0000000..2f6156e
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
> @@ -0,0 +1,17 @@
> +Put Quotes around CC_FOR_TARGET since it can be mutliple words e.g. in O=
E
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/make.bash
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/make.bash      2015-07-29 13:28:11.334031696 -0700
> ++++ go/src/make.bash   2015-07-29 13:36:55.814465630 -0700
> +@@ -158,7 +158,7 @@
> + fi
> +
> + echo "##### Building packages and commands for $GOOS/$GOARCH."
> +-CC=3D$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflag=
s "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> ++CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcfl=
ags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> + echo
> +
> + rm -f "$GOTOOLDIR"/go_bootstrap
> diff --git a/meta/recipes-devtools/go/go-1.6/gotooldir.patch b/meta/recip=
es-devtools/go/go-1.6/gotooldir.patch
> new file mode 100644
> index 0000000..9467025
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.6/gotooldir.patch
> @@ -0,0 +1,30 @@
> +Define tooldir in relation to GOTOOLDIR env var
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/go/build/build.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/go/build/build.go
> ++++ go/src/go/build/build.go
> +@@ -1388,7 +1388,7 @@ func init() {
> + }
> +
> + // ToolDir is the directory containing build tools.
> +-var ToolDir =3D filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOO=
S+"_"+runtime.GOARCH)
> ++var ToolDir =3D envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg=
/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
> +
> + // IsLocalImport reports whether the import path is
> + // a local import path, like ".", "..", "./foo", or "../foo".
> +Index: go/src/cmd/go/build.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/build.go
> ++++ go/src/cmd/go/build.go
> +@@ -1312,7 +1312,7 @@ func (b *builder) build(a *action) (err
> +               }
> +
> +               cgoExe :=3D tool("cgo")
> +-              if a.cgo !=3D nil && a.cgo.target !=3D "" {
> ++              if a.cgo !=3D nil && a.cgo.target !=3D "" && os.Getenv("G=
OTOOLDIR") =3D=3D "" {
> +                       cgoExe =3D a.cgo.target
> +               }
> +               outGo, outObj, err :=3D b.cgo(a.p, cgoExe, obj, pcCFLAGS,=
 pcLDFLAGS, cgofiles, gccfiles, cxxfiles, a.p.MFiles)
> diff --git a/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.=
patch b/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
> new file mode 100644
> index 0000000..afbae02
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
> @@ -0,0 +1,63 @@
> +Add new option --target-only to build target components
> +Separates the host and target pieces of build
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/make.bash
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/make.bash
> ++++ go/src/make.bash
> +@@ -143,12 +143,23 @@ if [ "$1" =3D "--no-clean" ]; then
> +       buildall=3D""
> +       shift
> + fi
> +-./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootst=
rap
> +-# Delay move of dist tool to now, because bootstrap may clear tool dire=
ctory.
> +-mv cmd/dist/dist "$GOTOOLDIR"/dist
> +-echo
> +
> +-if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOHOSTOS" !=3D "$GOOS" ]; then
> ++do_host_build=3D"yes"
> ++do_target_build=3D"yes"
> ++if [ "$1" =3D "--target-only" ]; then
> ++      do_host_build=3D"no"
> ++      shift
> ++elif [ "$1" =3D "--host-only" ]; then
> ++      do_target_build=3D"no"
> ++      shift
> ++fi
> ++
> ++if [ "$do_host_build" =3D "yes" ]; then
> ++      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_=
bootstrap
> ++      # Delay move of dist tool to now, because bootstrap may clear too=
l directory.
> ++      mv cmd/dist/dist "$GOTOOLDIR"/dist
> ++      echo
> ++
> +       echo "##### Building packages and commands for host, $GOHOSTOS/$G=
OHOSTARCH."
> +       # CC_FOR_TARGET is recorded as the default compiler for the go to=
ol. When building for the host, however,
> +       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> +@@ -157,11 +168,20 @@ if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOH
> +       echo
> + fi
> +
> +-echo "##### Building packages and commands for $GOOS/$GOARCH."
> +-CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcfl=
ags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> +-echo
> ++if [ "$do_target_build" =3D "yes" ]; then
> ++    GO_INSTALL=3D"${GO_TARGET_INSTALL:-std cmd}"
> ++    echo "##### Building packages and commands for $GOOS/$GOARCH."
> ++    if [ "$GOHOSTOS" =3D "$GOOS" -a "$GOHOSTARCH" =3D "$GOARCH" -a "$do=
_host_build" =3D "yes" ]; then
> ++      rm -rf ./host-tools
> ++      mkdir ./host-tools
> ++      mv "$GOTOOLDIR"/* ./host-tools
> ++      GOTOOLDIR=3D"$PWD/host-tools"
> ++    fi
> ++    GOTOOLDIR=3D"$GOTOOLDIR" CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_boot=
strap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v ${=
GO_INSTALL}
> ++    echo
> +
> +-rm -f "$GOTOOLDIR"/go_bootstrap
> ++    rm -f "$GOTOOLDIR"/go_bootstrap
> ++fi
> +
> + if [ "$1" !=3D "--no-banner" ]; then
> +       "$GOTOOLDIR"/dist banner
> diff --git a/meta/recipes-devtools/go/go-1.6/syslog.patch b/meta/recipes-=
devtools/go/go-1.6/syslog.patch
> new file mode 100644
> index 0000000..29be06f
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.6/syslog.patch
> @@ -0,0 +1,62 @@
> +Add timeouts to logger


This patch was something that I brought into my go recipes a while back,
but probably isn't upstreamable and isn't generally needed any more.

> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
> +diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/sy=
slog/syslog.go
> +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 -08=
00
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03 11:44:=
37.710403200 -0700
> +@@ -33,6 +33,9 @@
> + const severityMask =3D 0x07
> + const facilityMask =3D 0xf8
> +
> ++var writeTimeout =3D 1 * time.Second
> ++var connectTimeout =3D 1 * time.Second
> ++
> + const (
> +       // Severity.
> +
> +@@ -100,6 +103,7 @@
> + type serverConn interface {
> +       writeString(p Priority, hostname, tag, s, nl string) error
> +       close() error
> ++      setWriteDeadline(t time.Time) error
> + }
> +
> + type netConn struct {
> +@@ -273,7 +277,11 @@
> +               nl =3D "\n"
> +       }
> +
> +-      err :=3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> ++      err :=3D w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
> ++      if err !=3D nil {
> ++              return 0, err
> ++      }
> ++      err =3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> +       if err !=3D nil {
> +               return 0, err
> +       }
> +@@ -305,6 +313,10 @@
> +       return n.conn.Close()
> + }
> +
> ++func (n *netConn) setWriteDeadline(t time.Time) error {
> ++      return n.conn.SetWriteDeadline(t)
> ++}
> ++
> + // NewLogger creates a log.Logger whose output is written to
> + // the system log service with the specified priority. The logFlag
> + // argument is the flag set passed through to log.New to create
> +diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/l=
og/syslog/syslog_unix.go
> +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 -08=
00
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-10-0=
3 11:44:39.010403175 -0700
> +@@ -19,7 +19,7 @@
> +       logPaths :=3D []string{"/dev/log", "/var/run/syslog"}
> +       for _, network :=3D range logTypes {
> +               for _, path :=3D range logPaths {
> +-                      conn, err :=3D net.Dial(network, path)
> ++                      conn, err :=3D net.DialTimeout(network, path, con=
nectTimeout)
> +                       if err !=3D nil {
> +                               continue
> +                       } else {
> diff --git a/meta/recipes-devtools/go/go-1.7.inc b/meta/recipes-devtools/=
go/go-1.7.inc
> new file mode 100644
> index 0000000..5c3004e
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.7.inc
> @@ -0,0 +1,19 @@
> +require go-common.inc
> +
> +PV =3D "1.7.4"
> +GO_BASEVERSION =3D "1.7"
> +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74=
707"
> +
> +SRC_URI +=3D "\
> +       file://armhf-elf-header.patch \
> +       file://syslog.patch \
> +       file://fix-target-cc-for-build.patch \
> +       file://fix-cc-handling.patch \
> +       file://split-host-and-target-build.patch \
> +       file://gotooldir.patch \
> +"
> +SRC_URI[md5sum] =3D "49c1076428a5d3b5ad7ac65233fcca2f"
> +SRC_URI[sha256sum] =3D "4c189111e9ba651a2bb3ee868aa881fab36b2f2da3409e80=
885ca758a6b614cc"
> +
> diff --git a/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch b/met=
a/recipes-devtools/go/go-1.7/armhf-elf-header.patch
> new file mode 100644
> index 0000000..1e3a16b
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
> @@ -0,0 +1,23 @@
> +Encode arm EABI ( hard/soft ) calling convention in ELF header

This patch shouldn't be needed, at least for go1.7 and later, possibly
even go1.6.  It's an artifact
leftover from the old C implementation of the compiler.

> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/cmd/link/internal/ld/elf.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/link/internal/ld/elf.go
> ++++ go/src/cmd/link/internal/ld/elf.go
> +@@ -827,7 +827,13 @@
> +       // 32-bit architectures
> +       case '5':
> +               // we use EABI on both linux/arm and freebsd/arm.
> +-              if HEADTYPE =3D=3D obj.Hlinux || HEADTYPE =3D=3D obj.Hfre=
ebsd {
> ++              if HEADTYPE =3D=3D obj.Hlinux {
> ++                      if Ctxt.Goarm =3D=3D 7 {
> ++                              ehdr.flags =3D 0x5000402 // has entry poi=
nt, Version5 EABI, hard float
> ++                      } else {
> ++                              ehdr.flags =3D 0x5000202 // has entry poi=
nt, Version5 EABI, soft float
> ++                      }
> ++              } else if HEADTYPE =3D=3D obj.Hfreebsd {
> +                       // We set a value here that makes no indication o=
f which
> +                       // float ABI the object uses, because this is inf=
ormation
> +                       // used by the dynamic linker to compare executab=
les and
> diff --git a/meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch b/meta=
/recipes-devtools/go/go-1.7/fix-cc-handling.patch
> new file mode 100644
> index 0000000..a67caf4
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
> @@ -0,0 +1,50 @@
> +Accept CC with multiple words in its name
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/cmd/go/build.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/build.go
> ++++ go/src/cmd/go/build.go
> +@@ -2991,12 +2991,24 @@ func (b *builder) gccCmd(objdir string)
> +       return b.ccompilerCmd("CC", defaultCC, objdir)
> + }
> +
> ++// gccCmd returns a gcc command line prefix
> ++// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> ++func (b *builder) gccCmdForReal() []string {
> ++      return envList("CC", defaultCC)
> ++}
> ++
> + // gxxCmd returns a g++ command line prefix
> + // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *builder) gxxCmd(objdir string) []string {
> +       return b.ccompilerCmd("CXX", defaultCXX, objdir)
> + }
> +
> ++// gxxCmd returns a g++ command line prefix
> ++// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> ++func (b *builder) gxxCmdForReal() []string {
> ++      return envList("CXX", defaultCXX)
> ++}
> ++
> + // gfortranCmd returns a gfortran command line prefix.
> + func (b *builder) gfortranCmd(objdir string) []string {
> +       return b.ccompilerCmd("FC", "gfortran", objdir)
> +Index: go/src/cmd/go/env.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/env.go
> ++++ go/src/cmd/go/env.go
> +@@ -51,10 +51,9 @@ func mkEnv() []envVar {
> +
> +       if goos !=3D "plan9" {
> +               cmd :=3D b.gccCmd(".")
> +-              env =3D append(env, envVar{"CC", cmd[0]})
> ++              env =3D append(env, envVar{"CC", strings.Join(b.gccCmdFor=
Real(), " ")})
> +               env =3D append(env, envVar{"GOGCCFLAGS", strings.Join(cmd=
[3:], " ")})
> +-              cmd =3D b.gxxCmd(".")
> +-              env =3D append(env, envVar{"CXX", cmd[0]})
> ++              env =3D append(env, envVar{"CXX", strings.Join(b.gxxCmdFo=
rReal(), " ")})
> +       }
> +
> +       if buildContext.CgoEnabled {
> diff --git a/meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patc=
h b/meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
> new file mode 100644
> index 0000000..2f6156e
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
> @@ -0,0 +1,17 @@
> +Put Quotes around CC_FOR_TARGET since it can be mutliple words e.g. in O=
E
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/make.bash
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/make.bash      2015-07-29 13:28:11.334031696 -0700
> ++++ go/src/make.bash   2015-07-29 13:36:55.814465630 -0700
> +@@ -158,7 +158,7 @@
> + fi
> +
> + echo "##### Building packages and commands for $GOOS/$GOARCH."
> +-CC=3D$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflag=
s "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> ++CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcfl=
ags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> + echo
> +
> + rm -f "$GOTOOLDIR"/go_bootstrap
> diff --git a/meta/recipes-devtools/go/go-1.7/gotooldir.patch b/meta/recip=
es-devtools/go/go-1.7/gotooldir.patch
> new file mode 100644
> index 0000000..9467025
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.7/gotooldir.patch
> @@ -0,0 +1,30 @@
> +Define tooldir in relation to GOTOOLDIR env var
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/go/build/build.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/go/build/build.go
> ++++ go/src/go/build/build.go
> +@@ -1388,7 +1388,7 @@ func init() {
> + }
> +
> + // ToolDir is the directory containing build tools.
> +-var ToolDir =3D filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOO=
S+"_"+runtime.GOARCH)
> ++var ToolDir =3D envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg=
/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
> +
> + // IsLocalImport reports whether the import path is
> + // a local import path, like ".", "..", "./foo", or "../foo".
> +Index: go/src/cmd/go/build.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/build.go
> ++++ go/src/cmd/go/build.go
> +@@ -1312,7 +1312,7 @@ func (b *builder) build(a *action) (err
> +               }
> +
> +               cgoExe :=3D tool("cgo")
> +-              if a.cgo !=3D nil && a.cgo.target !=3D "" {
> ++              if a.cgo !=3D nil && a.cgo.target !=3D "" && os.Getenv("G=
OTOOLDIR") =3D=3D "" {
> +                       cgoExe =3D a.cgo.target
> +               }
> +               outGo, outObj, err :=3D b.cgo(a.p, cgoExe, obj, pcCFLAGS,=
 pcLDFLAGS, cgofiles, gccfiles, cxxfiles, a.p.MFiles)
> diff --git a/meta/recipes-devtools/go/go-1.7/split-host-and-target-build.=
patch b/meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
> new file mode 100644
> index 0000000..b0dd95b
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
> @@ -0,0 +1,62 @@
> +Add new option --target-only to build target components
> +Separates the host and target pieces of build
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +Index: go/src/make.bash
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/make.bash
> ++++ go/src/make.bash
> +@@ -154,13 +154,22 @@ if [ "$1" =3D "--no-clean" ]; then
> +       buildall=3D""
> +       shift
> + fi
> +-./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootst=
rap
> ++do_host_build=3D"yes"
> ++do_target_build=3D"yes"
> ++if [ "$1" =3D "--target-only" ]; then
> ++      do_host_build=3D"no"
> ++      shift
> ++elif [ "$1" =3D "--host-only" ]; then
> ++      do_target_build=3D"no"
> ++      shift
> ++fi
> +
> +-# Delay move of dist tool to now, because bootstrap may clear tool dire=
ctory.
> +-mv cmd/dist/dist "$GOTOOLDIR"/dist
> +-echo
> ++if [ "$do_host_build" =3D "yes" ]; then
> ++      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_=
bootstrap
> ++      # Delay move of dist tool to now, because bootstrap may clear too=
l directory.
> ++      mv cmd/dist/dist "$GOTOOLDIR"/dist
> ++      echo
> +
> +-if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOHOSTOS" !=3D "$GOOS" ]; then
> +       echo "##### Building packages and commands for host, $GOHOSTOS/$G=
OHOSTARCH."
> +       # CC_FOR_TARGET is recorded as the default compiler for the go to=
ol. When building for the host, however,
> +       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> +@@ -169,11 +178,20 @@ if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOH
> +       echo
> + fi
> +
> +-echo "##### Building packages and commands for $GOOS/$GOARCH."
> +-CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcfl=
ags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> +-echo
> ++if [ "$do_target_build" =3D "yes" ]; then
> ++    GO_INSTALL=3D"${GO_TARGET_INSTALL:-std cmd}"
> ++    echo "##### Building packages and commands for $GOOS/$GOARCH."
> ++    if [ "$GOHOSTOS" =3D "$GOOS" -a "$GOHOSTARCH" =3D "$GOARCH" -a "$do=
_host_build" =3D "yes" ]; then
> ++      rm -rf ./host-tools
> ++      mkdir ./host-tools
> ++      mv "$GOTOOLDIR"/* ./host-tools
> ++      GOTOOLDIR=3D"$PWD/host-tools"
> ++    fi
> ++    GOTOOLDIR=3D"$GOTOOLDIR" CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_boot=
strap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v ${=
GO_INSTALL}
> ++    echo
> +
> +-rm -f "$GOTOOLDIR"/go_bootstrap
> ++    rm -f "$GOTOOLDIR"/go_bootstrap
> ++fi
> +
> + if [ "$1" !=3D "--no-banner" ]; then
> +       "$GOTOOLDIR"/dist banner
> diff --git a/meta/recipes-devtools/go/go-1.7/syslog.patch b/meta/recipes-=
devtools/go/go-1.7/syslog.patch
> new file mode 100644
> index 0000000..29be06f
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.7/syslog.patch
> @@ -0,0 +1,62 @@
> +Add timeouts to logger
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
> +diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/sy=
slog/syslog.go
> +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 -08=
00
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03 11:44:=
37.710403200 -0700
> +@@ -33,6 +33,9 @@
> + const severityMask =3D 0x07
> + const facilityMask =3D 0xf8
> +
> ++var writeTimeout =3D 1 * time.Second
> ++var connectTimeout =3D 1 * time.Second
> ++
> + const (
> +       // Severity.
> +
> +@@ -100,6 +103,7 @@
> + type serverConn interface {
> +       writeString(p Priority, hostname, tag, s, nl string) error
> +       close() error
> ++      setWriteDeadline(t time.Time) error
> + }
> +
> + type netConn struct {
> +@@ -273,7 +277,11 @@
> +               nl =3D "\n"
> +       }
> +
> +-      err :=3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> ++      err :=3D w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
> ++      if err !=3D nil {
> ++              return 0, err
> ++      }
> ++      err =3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> +       if err !=3D nil {
> +               return 0, err
> +       }
> +@@ -305,6 +313,10 @@
> +       return n.conn.Close()
> + }
> +
> ++func (n *netConn) setWriteDeadline(t time.Time) error {
> ++      return n.conn.SetWriteDeadline(t)
> ++}
> ++
> + // NewLogger creates a log.Logger whose output is written to
> + // the system log service with the specified priority. The logFlag
> + // argument is the flag set passed through to log.New to create
> +diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/l=
og/syslog/syslog_unix.go
> +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 -08=
00
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-10-0=
3 11:44:39.010403175 -0700
> +@@ -19,7 +19,7 @@
> +       logPaths :=3D []string{"/dev/log", "/var/run/syslog"}
> +       for _, network :=3D range logTypes {
> +               for _, path :=3D range logPaths {
> +-                      conn, err :=3D net.Dial(network, path)
> ++                      conn, err :=3D net.DialTimeout(network, path, con=
nectTimeout)
> +                       if err !=3D nil {
> +                               continue
> +                       } else {
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtoo=
ls/go/go-common.inc
> new file mode 100644
> index 0000000..f74b8b7
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Go programming language compiler"
> +DESCRIPTION =3D " The Go programming language is an open source project =
to make \
> + programmers more productive. Go is expressive, concise, clean, and\
> + efficient. Its concurrency mechanisms make it easy to write programs\
> + that get the most out of multicore and networked machines, while its\
> + novel type system enables flexible and modular program construction.\
> + Go compiles quickly to machine code yet has the convenience of\
> + garbage collection and the power of run-time reflection. It's a\
> + fast, statically typed, compiled language that feels like a\
> + dynamically typed, interpreted language."
> +
> +HOMEPAGE =3D " http://golang.org/"
> +LICENSE =3D "BSD-3-Clause"
> +
> +inherit goarch
> +
> +SRC_URI =3D "http://golang.org/dl/go${PV}.src.tar.gz"
> +S =3D "${WORKDIR}/go"
> +B =3D "${S}"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +SSTATE_SCAN_CMD =3D "true"
> diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtool=
s/go/go-cross.inc
> new file mode 100644
> index 0000000..a6b31c8
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-cross.inc
> @@ -0,0 +1,10 @@
> +inherit cross
> +
> +DEPENDS +=3D "gcc-cross-${TARGET_ARCH}"
> +
> +PN =3D "go-cross-${TARGET_ARCH}"
> +
> +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/go-cross:"
> +
> +GOROOT_FINAL =3D "${libdir}/go"
> +export GOROOT_FINAL
> diff --git a/meta/recipes-devtools/go/go-cross_1.7.bb b/meta/recipes-devt=
ools/go/go-cross_1.7.bb
> new file mode 100644
> index 0000000..56ee084
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-cross_1.7.bb
> @@ -0,0 +1,5 @@
> +require go-cross.inc
> +require go_${PV}.bb
> +
> +# Go binaries are not understood by the strip tool.
> +INHIBIT_SYSROOT_STRIP =3D "1"
> diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtoo=
ls/go/go-native.inc
> new file mode 100644
> index 0000000..89bc634
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-native.inc
> @@ -0,0 +1,54 @@
> +inherit native
> +
> +export GOOS =3D "${BUILD_GOOS}"
> +export GOARCH =3D "${BUILD_GOARCH}"
> +export GOROOT_FINAL =3D "${STAGING_LIBDIR_NATIVE}/go"
> +export CGO_ENABLED =3D "1"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +       export GOBIN=3D"${B}/bin"
> +       rm -rf ${GOBIN}
> +       mkdir ${GOBIN}
> +
> +       export TMPDIR=3D${WORKDIR}/build-tmp
> +       mkdir -p ${WORKDIR}/build-tmp
> +
> +       cd src
> +       CGO_ENABLED=3D0 ./make.bash --host-only
> +}
> +
> +make_wrapper() {
> +       rm -f ${D}${bindir}/$2
> +       cat <<END >${D}${bindir}/$2
> +#!/bin/bash
> +here=3D\`dirname \$0\`
> +export GOROOT=3D"${GOROOT:-\`readlink -f \$here/../lib/go\`}"
> +\$here/../lib/go/bin/$1 "\$@"
> +END
> +       chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> +       install -d ${D}${libdir}/go
> +       cp -a ${B}/pkg ${D}${libdir}/go/
> +       install -d ${D}${libdir}/go/src
> +       (cd ${S}/src; for d in *; do \
> +               [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
> +       done)
> +
> +       install -d ${D}${bindir} ${D}${libdir}/go/bin
> +       for f in ${B}/bin/*
> +       do
> +               base=3D`basename $f`
> +               install -m755 $f ${D}${libdir}/go/bin
> +               make_wrapper $base $base
> +       done
> +}
> +
> +do_package[noexec] =3D "1"
> +do_packagedata[noexec] =3D "1"
> +do_package_write_ipk[noexec] =3D "1"
> +do_package_write_deb[noexec] =3D "1"
> +do_package_write_rpm[noexec] =3D "1"
> diff --git a/meta/recipes-devtools/go/go-native_1.4.bb b/meta/recipes-dev=
tools/go/go-native_1.4.bb
> new file mode 100644
> index 0000000..bbf3c0d
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-native_1.4.bb
> @@ -0,0 +1,2 @@
> +require ${PN}.inc
> +require go-${PV}.inc
> diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/g=
o.inc
> new file mode 100644
> index 0000000..d0d443c
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go.inc
> @@ -0,0 +1,80 @@
> +inherit goarch
> +# libgcc is required for the target specific libraries to build properly
> +DEPENDS +=3D " go-native libgcc"
> +# Prevent runstrip from running because you get errors when the host arc=
h !=3D target arch
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +
> +export GOHOSTOS =3D "${BUILD_GOOS}"
> +export GOHOSTARCH =3D "${BUILD_GOARCH}"
> +export GOOS =3D "${TARGET_GOOS}"
> +export GOARCH =3D "${TARGET_GOARCH}"
> +export GOARM =3D "${TARGET_GOARM}"
> +export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL =3D "${libdir}/go"
> +export CGO_ENABLED =3D "1"
> +export CC_FOR_TARGET =3D "${CC}"
> +export CXX_FOR_TARGET =3D "${CXX}"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile_prepend_class-cross() {
> +       export CGO_ENABLED=3D0
> +}
> +
> +do_compile() {
> +       export GOBIN=3D"${B}/bin"
> +       export CC=3D"${@d.getVar('BUILD_CC', True).strip()}"
> +       rm -rf ${GOBIN} ${B}/pkg
> +       mkdir ${GOBIN}
> +
> +       export TMPDIR=3D${WORKDIR}/build-tmp
> +       mkdir -p ${WORKDIR}/build-tmp
> +
> +       cd src
> +       ./make.bash --host-only
> +       # Ensure cgo.a is built with the target toolchain
> +       export GOBIN=3D"${B}/target/bin"
> +       rm -rf ${GOBIN}
> +       mkdir -p ${GOBIN}
> +       GO_FLAGS=3D"-a" ./make.bash
> +}
> +
> +do_install_class-target() {
> +       install -d ${D}${libdir}/go
> +       cp -a ${B}/pkg ${D}${libdir}/go/
> +       install -d ${D}${libdir}/go/src
> +       (cd ${S}/src; for d in *; do \
> +               [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
> +       done)
> +       install -d ${D}${bindir}
> +       if [ -d ${B}/bin/${GOOS}_${GOARCH} ]
> +       then
> +               install -m 0755 ${B}/bin/${GOOS}_${GOARCH}/* ${D}${bindir=
}
> +       else
> +               install -m 0755 ${B}/bin/* ${D}${bindir}
> +       fi
> +}
> +
> +do_install_class-cross() {
> +       install -d ${D}${libdir}/go
> +       cp -a ${B}/pkg ${D}${libdir}/go/
> +       install -d ${D}${libdir}/go/src
> +       (cd ${S}/src; for d in *; do \
> +               [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
> +       done)
> +       install -d ${D}${bindir}
> +       for f in ${B}/bin/go*
> +       do
> +               install -m755 $f ${D}${bindir}
> +       done
> +}
> +
> +INSANE_SKIP_${PN} +=3D "staticdev"
> +RDEPENDS_${PN} +=3D "perl"
> +
> +do_package[noexec] =3D "1"
> +do_packagedata[noexec] =3D "1"
> +do_package_write_ipk[noexec] =3D "1"
> +do_package_write_deb[noexec] =3D "1"
> +do_package_write_rpm[noexec] =3D "1"
> diff --git a/meta/recipes-devtools/go/go_1.6.bb b/meta/recipes-devtools/g=
o/go_1.6.bb
> new file mode 100644
> index 0000000..2f59033
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go_1.6.bb
> @@ -0,0 +1,4 @@
> +require go.inc
> +require go-${PV}.inc
> +
> +BBCLASSEXTEND =3D "cross"
> diff --git a/meta/recipes-devtools/go/go_1.7.bb b/meta/recipes-devtools/g=
o/go_1.7.bb
> new file mode 100644
> index 0000000..e7a6ab2
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go_1.7.bb
> @@ -0,0 +1,2 @@
> +require go-${PV}.inc
> +require go.inc
> diff --git a/meta/recipes-extended/go-examples/files/helloworld.go b/meta=
/recipes-extended/go-examples/files/helloworld.go
> new file mode 100644
> index 0000000..0253c40
> --- /dev/null
> +++ b/meta/recipes-extended/go-examples/files/helloworld.go
> @@ -0,0 +1,10 @@
> +// You can edit this code!
> +// Click here and start typing.
> +// taken from https://golang.org/
> +package main
> +
> +import "fmt"
> +
> +func main() {
> +       fmt.Println("Hello, =E4=B8=96=E7=95=8C")
> +}
> diff --git a/meta/recipes-extended/go-examples/go-examples.inc b/meta/rec=
ipes-extended/go-examples/go-examples.inc
> new file mode 100644
> index 0000000..c632681
> --- /dev/null
> +++ b/meta/recipes-extended/go-examples/go-examples.inc

Does go-examples belong under meta/recipes-extended?  Maybe move it
under meta-skeleton/recipes-skeleton?

> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D "This is a simple example recipe that cross-compiles a G=
o program."
> +SECTION =3D "examples"
> +HOMEPAGE =3D "https://golang.org/"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> +
> +S =3D "${WORKDIR}"
> +
> +inherit go
> diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/met=
a/recipes-extended/go-examples/go-helloworld_0.1.bb
> new file mode 100644
> index 0000000..930c57d
> --- /dev/null
> +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> @@ -0,0 +1,13 @@
> +require go-examples.inc
> +
> +SRC_URI +=3D " \
> +  file://helloworld.go \
> +"
> +
> +do_compile() {
> +       go build helloworld.go
> +}
> +
> +do_install() {
> +       install -D -m 0755 ${S}/helloworld ${D}${bindir}/helloworld
> +}
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

