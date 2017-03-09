Return-Path: <matt@madison.systems>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id EAC3171D79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 13:17:33 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id j90so28050914lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 05:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RvCp/EmhJC8dyRoeguUhhKe5m39t1bO8bLNoGbbUGuc=;
	b=qv6jvJkS0WsMWaUyaEdAWwwMe9RGWWm4fSr3VUygZ15t4M/WMimzk4EIcdCnoLG1k2
	+yGuEnQ0i9uVmGjy6y0MY82XbL5BMfX72tweamM7x3K1+OIwSlrUt3yzfizKCpP/gZqc
	Q/PyLVqB7eNvjp7/ltt9kcG2RFlK3ed3/KWZHXGTGiAcFsaW54vTMn+MHMdxpFlJfi8/
	JYRJAqIFBTN8j0e6FlmNZcBtYi7MJfvC/Za6m2ZV4XV7BmJiW5ndcS+QZr13KN7dgUe/
	zew4zLG1ruYnAscecqJpOEMJIRgcHA8Tto2T6OmB7edP81vMUnCazzuuKpjKVLSPXYtS
	e78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RvCp/EmhJC8dyRoeguUhhKe5m39t1bO8bLNoGbbUGuc=;
	b=kbGRqTaoZN1Bz+fJEoPwEd056A8JBulU8UTFTq9wDFGOKMVIW06ek7naYNXjpdhuza
	RiJY4O4bJKRoa4S4tlv9hQnmQISZRCFNtlJ0cJM/8aD/Ok8h2AAB9ta+iePfCvi0FL7i
	MpI+VGB2HcXoJBVYrNaPSEUd+ojRHuMIEORERZNX4nhC4ebRq2o4KFBdmh8R+XHlcEQa
	1XIHMEdVdmCSqN+4tJSmqYRCYK2hmmFo1EFqC3GjvUx1+dMYx8BM3iUZ3oXJy3+LKwG7
	jkiWGGEwgi6Kg/EFhjzkLrAbCO+kxGwt2J6iNIG/Ux9wIYjU5w07dLnMelx6E+VOfbwf
	6p7g==
X-Gm-Message-State: AMke39n4XWcFxRJprjJ50lJEfamQ3YXARBA8T736ULM3ahjSKprUITM2VjKbhWn+pmDQ79+S1hZXj0Xbet+bQg==
X-Received: by 10.25.145.2 with SMTP id t2mr3526866lfd.91.1489065453777; Thu,
	09 Mar 2017 05:17:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.80.71 with HTTP; Thu, 9 Mar 2017 05:17:33 -0800 (PST)
In-Reply-To: <20170308221933.GA8506@haswell>
References: <20170303231811.27812-1-raj.khem@gmail.com>
	<CAGgRHJrrmcvv6CkO+fH++85YD+SxzrsrPeVCdP+MgsgP_iP23w@mail.gmail.com>
	<20170308221933.GA8506@haswell>
From: Matt Madison <matt@madison.systems>
Date: Thu, 9 Mar 2017 05:17:33 -0800
Message-ID: <CAGgRHJrUpiAbtYJkXy_2Ow4BBH3Jb-LcK7nQZ+DJvK+zrw_PeA@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Mar 2017 13:17:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2017 at 2:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Matt
>
> Thanks for good feedback.
> I have snipped the mail and replied below
>
> On 17-03-06 12:00:44, Matt Madison wrote:
>> On Fri, Mar 3, 2017 at 3:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > * This is converging the recipes for go from
>> >   meta-virtualization and oe-meta-go
>> >
>> > * Add recipes for go 1.7
>> >
>> > * go.bbclass is added to ease out writing
>> >   recipes for go packages
>> >
>> > * go-examples: Add an example, helloworld written in go
>> >   This should serve as temlate for writing go recipes
>>
>>
>> I have some specific comments below, but as a general question,
>> how about crosssdk and cross-canadian recipes for the toolchain?
>
> I think thats a good idea, may be for a later times, probbaly in 2.4
> timeframe

The compiler recipes in meta-golang already handle all of these variants.

>
>> > +DEPENDS +=3D "go-cross-${TARGET_ARCH}"
>> > +DEPENDS_class-native +=3D "go-native"
>> > +
>> > +FILES_${PN}-staticdev +=3D "${GOSRC_FINAL}/${GO_IMPORT}"
>> > +FILES_${PN}-staticdev +=3D "${GOPKG_FINAL}/${GO_IMPORT}*"
>> > +
>> > +GO_INSTALL ?=3D "${GO_IMPORT}/..."
>> > +
>> > +do_go_compile() {
>> > +       GOPATH=3D${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
>> > +       if test -n "${GO_INSTALL}" ; then
>> > +               GOPATH=3D${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go in=
stall -v ${GO_INSTALL}
>>
>> Have you tested to make sure that the go install won't update and
>> install packages into the staging libdir during this compilation step?
>>  There is that risk, as the go tool will update dependent packages
>> even in GOROOT if it's writeable.  In meta-golang I added some patches
>> to the go build tool to prevent this.
>
> Currently, it does not check, and I havent run into problem for my go
> apps feel free to send your enhancements in
> this area, as follow up I will test it out here and include it in
> susequent pulls

OK.  The patch is here, in case you're interested:
https://github.com/madisongh/meta-golang/blob/master/recipes-devtools/golan=
g/golang-1.8/0005-Never-rebuild-already-installed-packages-in-GOROOT.patch

But if this patch is really going in as-is, I can submit it again later.

>
>>
>> > +       fi
>> > +}
>> > +
>> > +do_go_install() {
>> > +       rm -rf ${WORKDIR}/staging
>> > +       install -d ${WORKDIR}/staging${GOROOT_FINAL} ${D}${GOROOT_FINA=
L}
>> > +       tar -C ${S} -cf - . | tar -C ${WORKDIR}/staging${GOROOT_FINAL}=
 -xpvf -
>> > +
>> > +       find ${WORKDIR}/staging${GOROOT_FINAL} \( \
>> > +               -name \*.indirectionsymlink -o \
>> > +               -name .git\* -o                \
>> > +               -name .hg -o                   \
>> > +               -name .svn -o                  \
>> > +               -name .pc\* -o                 \
>> > +               -name patches\*                \
>> > +               \) -print0 | \
>> > +       xargs -r0 rm -rf
>>
>> Perhaps you could use --exclude-vcs and --exclude=3Dpattern on the tar
>> command to prevent the files from being populated in the first place?
>
> good point. I will do that in a followup.
>
>>
>> > +
>> > +       tar -C ${WORKDIR}/staging${GOROOT_FINAL} -cf - . | \
>> > +       tar -C ${D}${GOROOT_FINAL} -xpvf -
>> > +
>> > +       chown -R root:root "${D}${GOROOT_FINAL}"
>>
>> Use --no-same-owner on the tar command to eliminate the chown.
>
> Right.
>
>> > +
>> > +       if test -e "${D}${GOBIN_FINAL}" ; then
>> > +               install -d -m 0755 "${D}${bindir}"
>> > +               find "${D}${GOBIN_FINAL}" ! -type d -print0 | xargs -r=
0 mv --target-directory=3D"${D}${bindir}"
>> > +               rmdir -p "${D}${GOBIN_FINAL}" || true
>> > +       fi
>> > +}
>> > +
>> > +do_compile() {
>> > +       do_go_compile
>> > +}
>> > +
>> > +do_install() {
>> > +       do_go_install
>> > +}
>>
>> This is a bbclass, so these two functions should not be here, and the
>> ones above should be named 'go_do_XXX' instead of 'do_go_XXX'.  Then
>> add an EXPORT_FUNCTIONS line to export them.
>>
>
> Seems sensible to do as well.
>
>>
>> > diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> > new file mode 100644
>> > index 0000000..119703c
>> > --- /dev/null
>> > +++ b/meta/classes/goarch.bbclass
>> > @@ -0,0 +1,46 @@
>> > +BUILD_GOOS =3D "${@go_map_os(d.getVar('BUILD_OS', True), d)}"
>> > +BUILD_GOARCH =3D "${@go_map_arch(d.getVar('BUILD_ARCH', True), d)}"
>> > +BUILD_GOTUPLE =3D "${BUILD_GOOS}_${BUILD_GOARCH}"
>> > +HOST_GOOS =3D "${@go_map_os(d.getVar('HOST_OS', True), d)}"
>> > +HOST_GOARCH =3D "${@go_map_arch(d.getVar('HOST_ARCH', True), d)}"
>> > +HOST_GOARM =3D "${@go_map_arm(d.getVar('HOST_ARCH', True), d.getVar('=
TUNE_FEATURES', True), d)}"
>> > +HOST_GOTUPLE =3D "${HOST_GOOS}_${HOST_GOARCH}"
>> > +TARGET_GOOS =3D "${@go_map_os(d.getVar('TARGET_OS', True), d)}"
>> > +TARGET_GOARCH =3D "${@go_map_arch(d.getVar('TARGET_ARCH', True), d)}"
>> > +TARGET_GOARM =3D "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getV=
ar('TUNE_FEATURES', True), d)}"
>> > +TARGET_GOTUPLE =3D "${TARGET_GOOS}_${TARGET_GOARCH}"
>> > +GO_BUILD_BINDIR =3D "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD=
_GOTUPLE',True) =3D=3D d.getVar('HOST_GOTUPLE',True)]}"
>> > +
>> > +def go_map_arch(a, d):
>> > +    import re
>> > +    if re.match('i.86', a):
>> > +        return '386'
>> > +    elif a =3D=3D 'x86_64':
>> > +        return 'amd64'
>> > +    elif re.match('arm.*', a):
>> > +        return 'arm'
>> > +    elif re.match('aarch64.*', a):
>> > +        return 'arm64'
>> > +    elif re.match('mips64el*', a):
>> > +        return 'mips64le'
>> > +    elif re.match('mips64*', a):
>> > +        return 'mips64'
>> > +    elif re.match('p(pc|owerpc)(64)', a):
>> > +        return 'ppc64'
>> > +    elif re.match('p(pc|owerpc)(64el)', a):
>> > +        return 'ppc64le'
>> > +    else:
>> > +        raise bb.parse.SkipPackage("Unsupported CPU architecture: %s"=
 % a)
>> > +
>> > +def go_map_arm(a, f, d):
>> > +    import re
>> > +    if re.match('arm.*', a) and re.match('arm.*7.*', f):
>> > +        return '7'
>> > +    return ''
>> > +
>> > +def go_map_os(o, d):
>> > +    if o.startswith('linux'):
>> > +        return 'linux'
>> > +    return o
>> > +
>> > +
>>
>>
>> For the following go-1.4 recipes:
>>
>> I wouldn't recommend fixing go-native at version 1.4, which is now
>> postiviely ancient.
>> Instead, add go1.4.3's SRC_URI into the go-native recipe, loading it
>> in the right place so
>> that make.bash finds it.  This way, you can have all the go toolchain
>> recipes build at the
>> same version.  The go team only supports go1.4 for bootstrapping the
>> compiler build now
>> anyway, IIRC.
>
> since we do not use go-native for anything other than bootstrapping
> right now, thats why it is there. there is no intent of providing a
> go-native version for general consumption

That could be a problem for folks needing to build packages that need
the native-side go compiler.  Anything that uses protobufs, for
instance, and that's used in at least one of the golang.org/x
packages, which are pretty commonly used.

>
>>
>> > diff --git a/meta/recipes-devtools/go/go-1.4.inc b/meta/recipes-devtoo=
ls/go/go-1.4.inc
>> > new file mode 100644
>> > index 0000000..2f500f3
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/go/go-1.4.inc
>> > @@ -0,0 +1,16 @@
>> > +require go-common.inc
>> > +
>> > +PV =3D "1.4.3"
>> > +GO_BASEVERSION =3D "1.4"
>> > +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>> > +
>> > +SRC_URI +=3D "\
>> > +        file://016-armhf-elf-header.patch \
>> > +        file://go-cross-backport-cmd-link-support-new-386-amd64-rel.p=
atch \
>> > +        file://syslog.patch \
>> > +        file://0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-=
32-.patch \
>> > +"
>> > diff --git a/meta/recipes-devtools/go/go-1.6/split-host-and-target-bui=
ld.patch b/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patc=
h
>> > new file mode 100644
>> > index 0000000..afbae02
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patc=
h
>> > @@ -0,0 +1,63 @@
>> > +Add new option --target-only to build target components
>> > +Separates the host and target pieces of build
>> > +
>> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > +Upstream-Status: Pending
>> > +Index: go/src/make.bash
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +--- go.orig/src/make.bash
>> > ++++ go/src/make.bash
>> > +@@ -143,12 +143,23 @@ if [ "$1" =3D "--no-clean" ]; then
>> > +       buildall=3D""
>> > +       shift
>> > + fi
>> > +-./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_boo=
tstrap
>> > +-# Delay move of dist tool to now, because bootstrap may clear tool d=
irectory.
>> > +-mv cmd/dist/dist "$GOTOOLDIR"/dist
>> > +-echo
>> > +
>> > +-if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOHOSTOS" !=3D "$GOOS" ]; the=
n
>> > ++do_host_build=3D"yes"
>> > ++do_target_build=3D"yes"
>> > ++if [ "$1" =3D "--target-only" ]; then
>> > ++      do_host_build=3D"no"
>> > ++      shift
>> > ++elif [ "$1" =3D "--host-only" ]; then
>> > ++      do_target_build=3D"no"
>> > ++      shift
>> > ++fi
>> > ++
>> > ++if [ "$do_host_build" =3D "yes" ]; then
>> > ++      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds =
go_bootstrap
>> > ++      # Delay move of dist tool to now, because bootstrap may clear =
tool directory.
>> > ++      mv cmd/dist/dist "$GOTOOLDIR"/dist
>> > ++      echo
>> > ++
>> > +       echo "##### Building packages and commands for host, $GOHOSTOS=
/$GOHOSTARCH."
>> > +       # CC_FOR_TARGET is recorded as the default compiler for the go=
 tool. When building for the host, however,
>> > +       # use the host compiler, CC, from `cmd/dist/dist env` instead.
>> > +@@ -157,11 +168,20 @@ if [ "$GOHOSTARCH" !=3D "$GOARCH" -o "$GOH
>> > +       echo
>> > + fi
>> > +
>> > +-echo "##### Building packages and commands for $GOOS/$GOARCH."
>> > +-CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -g=
cflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
>> > +-echo
>> > ++if [ "$do_target_build" =3D "yes" ]; then
>> > ++    GO_INSTALL=3D"${GO_TARGET_INSTALL:-std cmd}"
>> > ++    echo "##### Building packages and commands for $GOOS/$GOARCH."
>> > ++    if [ "$GOHOSTOS" =3D "$GOOS" -a "$GOHOSTARCH" =3D "$GOARCH" -a "=
$do_host_build" =3D "yes" ]; then
>> > ++      rm -rf ./host-tools
>> > ++      mkdir ./host-tools
>> > ++      mv "$GOTOOLDIR"/* ./host-tools
>> > ++      GOTOOLDIR=3D"$PWD/host-tools"
>> > ++    fi
>> > ++    GOTOOLDIR=3D"$GOTOOLDIR" CC=3D"$CC_FOR_TARGET" "$GOTOOLDIR"/go_b=
ootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v=
 ${GO_INSTALL}
>> > ++    echo
>> > +
>> > +-rm -f "$GOTOOLDIR"/go_bootstrap
>> > ++    rm -f "$GOTOOLDIR"/go_bootstrap
>> > ++fi
>> > +
>> > + if [ "$1" !=3D "--no-banner" ]; then
>> > +       "$GOTOOLDIR"/dist banner
>> > diff --git a/meta/recipes-devtools/go/go-1.6/syslog.patch b/meta/recip=
es-devtools/go/go-1.6/syslog.patch
>> > new file mode 100644
>> > index 0000000..29be06f
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/go/go-1.6/syslog.patch
>> > @@ -0,0 +1,62 @@
>> > +Add timeouts to logger
>>
>>
>> This patch was something that I brought into my go recipes a while back,
>> but probably isn't upstreamable and isn't generally needed any more.
>
> I think we should get rid of 1.6 completely, I did run into issues
> compiling host target seprately and this patch helped. we should test go
> 1.8 e.g. if its not needed anymore

Sorry, I was referring to the syslog patch here, not the host/target
separation patch.  Removing it shouldn't have any effect on building
the toolchain.

>
>>
>> > +
>> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > +Upstream-Status: Pending
>> > +
>> > +diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log=
/syslog/syslog.go
>> > +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 =
-0800
>> > ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03 11:=
44:37.710403200 -0700
>> > +@@ -33,6 +33,9 @@
>> > + const severityMask =3D 0x07
>> > + const facilityMask =3D 0xf8
>> > +
>> > ++var writeTimeout =3D 1 * time.Second
>> > ++var connectTimeout =3D 1 * time.Second
>> > ++
>> > + const (
>> > +       // Severity.
>> > +
>> > +@@ -100,6 +103,7 @@
>> > + type serverConn interface {
>> > +       writeString(p Priority, hostname, tag, s, nl string) error
>> > +       close() error
>> > ++      setWriteDeadline(t time.Time) error
>> > + }
>> > +
>> > + type netConn struct {
>> > +@@ -273,7 +277,11 @@
>> > +               nl =3D "\n"
>> > +       }
>> > +
>> > +-      err :=3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
>> > ++      err :=3D w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
>> > ++      if err !=3D nil {
>> > ++              return 0, err
>> > ++      }
>> > ++      err =3D w.conn.writeString(p, w.hostname, w.tag, msg, nl)
>> > +       if err !=3D nil {
>> > +               return 0, err
>> > +       }
>> > +@@ -305,6 +313,10 @@
>> > +       return n.conn.Close()
>> > + }
>> > +
>> > ++func (n *netConn) setWriteDeadline(t time.Time) error {
>> > ++      return n.conn.SetWriteDeadline(t)
>> > ++}
>> > ++
>> > + // NewLogger creates a log.Logger whose output is written to
>> > + // the system log service with the specified priority. The logFlag
>> > + // argument is the flag set passed through to log.New to create
>> > +diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/sr=
c/log/syslog/syslog_unix.go
>> > +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 =
-0800
>> > ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-1=
0-03 11:44:39.010403175 -0700
>> > +@@ -19,7 +19,7 @@
>> > +       logPaths :=3D []string{"/dev/log", "/var/run/syslog"}
>> > +       for _, network :=3D range logTypes {
>> > +               for _, path :=3D range logPaths {
>> > +-                      conn, err :=3D net.Dial(network, path)
>> > ++                      conn, err :=3D net.DialTimeout(network, path, =
connectTimeout)
>> > +                       if err !=3D nil {
>> > +                               continue
>> > +                       } else {
>> > diff --git a/meta/recipes-devtools/go/go-1.7.inc b/meta/recipes-devtoo=
ls/go/go-1.7.inc
>> > new file mode 100644
>> > index 0000000..5c3004e
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/go/go-1.7.inc
>> > @@ -0,0 +1,19 @@
>> > +require go-common.inc
>> > +
>> > +PV =3D "1.7.4"
>> > +GO_BASEVERSION =3D "1.7"
>> > +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>> > +
>> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0d=
d74707"
>> > +
>> > +SRC_URI +=3D "\
>> > +       file://armhf-elf-header.patch \
>> > +       file://syslog.patch \
>> > +       file://fix-target-cc-for-build.patch \
>> > +       file://fix-cc-handling.patch \
>> > +       file://split-host-and-target-build.patch \
>> > +       file://gotooldir.patch \
>> > +"
>> > +SRC_URI[md5sum] =3D "49c1076428a5d3b5ad7ac65233fcca2f"
>> > +SRC_URI[sha256sum] =3D "4c189111e9ba651a2bb3ee868aa881fab36b2f2da3409=
e80885ca758a6b614cc"
>> > +
>> > diff --git a/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch b/=
meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
>> > new file mode 100644
>> > index 0000000..1e3a16b
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
>> > @@ -0,0 +1,23 @@
>> > +Encode arm EABI ( hard/soft ) calling convention in ELF header
>>
>> This patch shouldn't be needed, at least for go1.7 and later, possibly
>> even go1.6.  It's an artifact
>> leftover from the old C implementation of the compiler.
>
> if you can point out where it was fixed in go compiler, it would help in
> assessing usablity of this

Thinking back on it, I should revisit this. If a build uses go's
built-in linker rather than the external linker, the patch is still
needed.

>
>>
>> > +
>> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > +Upstream-Status: Pending
>> > +Index: go/src/cmd/link/internal/ld/elf.go
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +--- go.orig/src/cmd/link/internal/ld/elf.go
>> > ++++ go/src/cmd/link/internal/ld/elf.go
>> > +@@ -827,7 +827,13 @@
>> > +       // 32-bit architectures
>> > +       case '5':
>> > +               // we use EABI on both linux/arm and freebsd/arm.
>> > +-              if HEADTYPE =3D=3D obj.Hlinux || HEADTYPE =3D=3D obj.H=
freebsd {
>> > ++              if HEADTYPE =3D=3D obj.Hlinux {
>> > ++                      if Ctxt.Goarm =3D=3D 7 {
>> > ++                              ehdr.flags =3D 0x5000402 // has entry =
point, Version5 EABI, hard float
>> > ++                      } else {
>> > ++                              ehdr.flags =3D 0x5000202 // has entry =
point, Version5 EABI, soft float
>> > ++                      }
>> > ++              } else if HEADTYPE =3D=3D obj.Hfreebsd {
>> > +                       // We set a value here that makes no indicatio=
n of which
>> > +                       // float ABI the object uses, because this is =
information
>> > +                       // used by the dynamic linker to compare execu=
tables and
>> > --- /dev/null
>> > +++ b/meta/recipes-extended/go-examples/files/helloworld.go
>> > @@ -0,0 +1,10 @@
>> > +// You can edit this code!
>> > +// Click here and start typing.
>> > +// taken from https://golang.org/
>> > +package main
>> > +
>> > +import "fmt"
>> > +
>> > +func main() {
>> > +       fmt.Println("Hello, =E4=B8=96=E7=95=8C")
>> > +}
>> > diff --git a/meta/recipes-extended/go-examples/go-examples.inc b/meta/=
recipes-extended/go-examples/go-examples.inc
>> > new file mode 100644
>> > index 0000000..c632681
>> > --- /dev/null
>> > +++ b/meta/recipes-extended/go-examples/go-examples.inc
>>
>> Does go-examples belong under meta/recipes-extended?  Maybe move it
>> under meta-skeleton/recipes-skeleton?
>>
>
> We want to run it as a unit test, I am not sure if we include
> meta-skeleton in our regular layer mix

I see.

Thanks,
-Matt

>
>> > @@ -0,0 +1,10 @@
>> > +DESCRIPTION =3D "This is a simple example recipe that cross-compiles =
a Go program."
>> > +SECTION =3D "examples"
>> > +HOMEPAGE =3D "https://golang.org/"
>> > +
>> > +LICENSE =3D "MIT"
>> > +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade6=
98e0bcf8506ecda2f7b4f302"
>> > +
>> > +S =3D "${WORKDIR}"
>> > +
>> > +inherit go
>> > diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/=
meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>> > new file mode 100644
>> > index 0000000..930c57d
>> > --- /dev/null
>> > +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>> > @@ -0,0 +1,13 @@
>> > +require go-examples.inc
>> > +
>> > +SRC_URI +=3D " \
>> > +  file://helloworld.go \
>> > +"
>> > +
>> > +do_compile() {
>> > +       go build helloworld.go
>> > +}
>> > +
>> > +do_install() {
>> > +       install -D -m 0755 ${S}/helloworld ${D}${bindir}/helloworld
>> > +}
>> > --
>> > 2.10.2
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

