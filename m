Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9A1730F9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 22:19:37 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id g2so719333pge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 14:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=QN3F1WEqNUThHD19jAFkkhkLTMgP8w0CY+hjP8MNj9w=;
	b=WjEB483T5AkacIAjCMdRdH/TlRVM9/MUnOc/zjVTWm/5Egok7THPM0zUZMYfOg1yfS
	pQt81aZ2J/frup2MULMMXILt5BVwdPO7EyRgRT3TxLekRLt+aMPc2HgyD0prokLv9ZZU
	A8ftm7KYhIOS+svQ31rezT9gz24XjNg5DNsl2NZsVTktcMrGt9zZ3FloWHLgomXU7aIo
	MeSCwigEm0LwdTiCfomBPz+6icov/MyQ7ZfrWMkiyJQ0RJonrToXvgpJCwFUtjgg93Vq
	Pmrj32N3O6H/XL5xYqTOQQxGkPs4Y/M9CvByV11LKVomeSPXSsnfifoFuytguhwNodSd
	8B3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=QN3F1WEqNUThHD19jAFkkhkLTMgP8w0CY+hjP8MNj9w=;
	b=KH6dShPTzdOE5Lhc8ZCiEtXJPUiBEPWzYRuuNHSg/XL+5j5Kn/emYyt9bqZG028Of8
	A5hLcL26xlXoD5A15EN5ZCevAXnHF/TRmznRa9NGIfumplLnM96OqlJz48690RZnvSQ4
	6g4wp1LNcYAxPA4i9eBFIeci70N4ZLu/hc+hnxkCWGhmGFdzLNfX3ktzZPHhkAzEetxT
	N3sZMNJeA+tz5XlnAABH2w2UJZQYErgwfQwEkISqmw5TvTp8boYeuTEryCM2q9ea5gua
	vK8Sj4fYODsiUBhqiv8bpnMn7W99T3o9COyKt+KtgieS7T9zPLuSNQpC4hNfj9CZ7IoH
	QOig==
X-Gm-Message-State: AMke39kTPFV0bAgMQ1fAWhyTLR+/KtVFJ7GhXZIb7OdwSJyoLjj5j891UVVVEy3FM2/1iA==
X-Received: by 10.99.217.17 with SMTP id r17mr9935203pgg.140.1489011579070;
	Wed, 08 Mar 2017 14:19:39 -0800 (PST)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	f3sm8096593pga.34.2017.03.08.14.19.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Mar 2017 14:19:38 -0800 (PST)
Date: Wed, 8 Mar 2017 14:19:33 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Matt Madison <matt@madison.systems>
Message-ID: <20170308221933.GA8506@haswell>
References: <20170303231811.27812-1-raj.khem@gmail.com>
	<CAGgRHJrrmcvv6CkO+fH++85YD+SxzrsrPeVCdP+MgsgP_iP23w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGgRHJrrmcvv6CkO+fH++85YD+SxzrsrPeVCdP+MgsgP_iP23w@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
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
X-List-Received-Date: Wed, 08 Mar 2017 22:19:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Matt

Thanks for good feedback.
I have snipped the mail and replied below

On 17-03-06 12:00:44, Matt Madison wrote:
> On Fri, Mar 3, 2017 at 3:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > * This is converging the recipes for go from
> >   meta-virtualization and oe-meta-go
> >
> > * Add recipes for go 1.7
> >
> > * go.bbclass is added to ease out writing
> >   recipes for go packages
> >
> > * go-examples: Add an example, helloworld written in go
> >   This should serve as temlate for writing go recipes
> 
> 
> I have some specific comments below, but as a general question,
> how about crosssdk and cross-canadian recipes for the toolchain?

I think thats a good idea, may be for a later times, probbaly in 2.4
timeframe

> > +DEPENDS += "go-cross-${TARGET_ARCH}"
> > +DEPENDS_class-native += "go-native"
> > +
> > +FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
> > +FILES_${PN}-staticdev += "${GOPKG_FINAL}/${GO_IMPORT}*"
> > +
> > +GO_INSTALL ?= "${GO_IMPORT}/..."
> > +
> > +do_go_compile() {
> > +       GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
> > +       if test -n "${GO_INSTALL}" ; then
> > +               GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install -v ${GO_INSTALL}
> 
> Have you tested to make sure that the go install won't update and
> install packages into the staging libdir during this compilation step?
>  There is that risk, as the go tool will update dependent packages
> even in GOROOT if it's writeable.  In meta-golang I added some patches
> to the go build tool to prevent this.

Currently, it does not check, and I havent run into problem for my go
apps feel free to send your enhancements in
this area, as follow up I will test it out here and include it in
susequent pulls

> 
> > +       fi
> > +}
> > +
> > +do_go_install() {
> > +       rm -rf ${WORKDIR}/staging
> > +       install -d ${WORKDIR}/staging${GOROOT_FINAL} ${D}${GOROOT_FINAL}
> > +       tar -C ${S} -cf - . | tar -C ${WORKDIR}/staging${GOROOT_FINAL} -xpvf -
> > +
> > +       find ${WORKDIR}/staging${GOROOT_FINAL} \( \
> > +               -name \*.indirectionsymlink -o \
> > +               -name .git\* -o                \
> > +               -name .hg -o                   \
> > +               -name .svn -o                  \
> > +               -name .pc\* -o                 \
> > +               -name patches\*                \
> > +               \) -print0 | \
> > +       xargs -r0 rm -rf
> 
> Perhaps you could use --exclude-vcs and --exclude=pattern on the tar
> command to prevent the files from being populated in the first place?

good point. I will do that in a followup.

> 
> > +
> > +       tar -C ${WORKDIR}/staging${GOROOT_FINAL} -cf - . | \
> > +       tar -C ${D}${GOROOT_FINAL} -xpvf -
> > +
> > +       chown -R root:root "${D}${GOROOT_FINAL}"
> 
> Use --no-same-owner on the tar command to eliminate the chown.

Right.

> > +
> > +       if test -e "${D}${GOBIN_FINAL}" ; then
> > +               install -d -m 0755 "${D}${bindir}"
> > +               find "${D}${GOBIN_FINAL}" ! -type d -print0 | xargs -r0 mv --target-directory="${D}${bindir}"
> > +               rmdir -p "${D}${GOBIN_FINAL}" || true
> > +       fi
> > +}
> > +
> > +do_compile() {
> > +       do_go_compile
> > +}
> > +
> > +do_install() {
> > +       do_go_install
> > +}
> 
> This is a bbclass, so these two functions should not be here, and the
> ones above should be named 'go_do_XXX' instead of 'do_go_XXX'.  Then
> add an EXPORT_FUNCTIONS line to export them.
> 

Seems sensible to do as well.

> 
> > diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> > new file mode 100644
> > index 0000000..119703c
> > --- /dev/null
> > +++ b/meta/classes/goarch.bbclass
> > @@ -0,0 +1,46 @@
> > +BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS', True), d)}"
> > +BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH', True), d)}"
> > +BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
> > +HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS', True), d)}"
> > +HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH', True), d)}"
> > +HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH', True), d.getVar('TUNE_FEATURES', True), d)}"
> > +HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
> > +TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS', True), d)}"
> > +TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH', True), d)}"
> > +TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEATURES', True), d)}"
> > +TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
> > +GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
> > +
> > +def go_map_arch(a, d):
> > +    import re
> > +    if re.match('i.86', a):
> > +        return '386'
> > +    elif a == 'x86_64':
> > +        return 'amd64'
> > +    elif re.match('arm.*', a):
> > +        return 'arm'
> > +    elif re.match('aarch64.*', a):
> > +        return 'arm64'
> > +    elif re.match('mips64el*', a):
> > +        return 'mips64le'
> > +    elif re.match('mips64*', a):
> > +        return 'mips64'
> > +    elif re.match('p(pc|owerpc)(64)', a):
> > +        return 'ppc64'
> > +    elif re.match('p(pc|owerpc)(64el)', a):
> > +        return 'ppc64le'
> > +    else:
> > +        raise bb.parse.SkipPackage("Unsupported CPU architecture: %s" % a)
> > +
> > +def go_map_arm(a, f, d):
> > +    import re
> > +    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> > +        return '7'
> > +    return ''
> > +
> > +def go_map_os(o, d):
> > +    if o.startswith('linux'):
> > +        return 'linux'
> > +    return o
> > +
> > +
> 
> 
> For the following go-1.4 recipes:
> 
> I wouldn't recommend fixing go-native at version 1.4, which is now
> postiviely ancient.
> Instead, add go1.4.3's SRC_URI into the go-native recipe, loading it
> in the right place so
> that make.bash finds it.  This way, you can have all the go toolchain
> recipes build at the
> same version.  The go team only supports go1.4 for bootstrapping the
> compiler build now
> anyway, IIRC.

since we do not use go-native for anything other than bootstrapping
right now, thats why it is there. there is no intent of providing a
go-native version for general consumption

> 
> > diff --git a/meta/recipes-devtools/go/go-1.4.inc b/meta/recipes-devtools/go/go-1.4.inc
> > new file mode 100644
> > index 0000000..2f500f3
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.4.inc
> > @@ -0,0 +1,16 @@
> > +require go-common.inc
> > +
> > +PV = "1.4.3"
> > +GO_BASEVERSION = "1.4"
> > +FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> > +
> > +SRC_URI += "\
> > +        file://016-armhf-elf-header.patch \
> > +        file://go-cross-backport-cmd-link-support-new-386-amd64-rel.patch \
> > +        file://syslog.patch \
> > +        file://0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch \
> > +"
> > diff --git a/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch b/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
> > new file mode 100644
> > index 0000000..afbae02
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
> > @@ -0,0 +1,63 @@
> > +Add new option --target-only to build target components
> > +Separates the host and target pieces of build
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Upstream-Status: Pending
> > +Index: go/src/make.bash
> > +===================================================================
> > +--- go.orig/src/make.bash
> > ++++ go/src/make.bash
> > +@@ -143,12 +143,23 @@ if [ "$1" = "--no-clean" ]; then
> > +       buildall=""
> > +       shift
> > + fi
> > +-./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
> > +-# Delay move of dist tool to now, because bootstrap may clear tool directory.
> > +-mv cmd/dist/dist "$GOTOOLDIR"/dist
> > +-echo
> > +
> > +-if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" != "$GOOS" ]; then
> > ++do_host_build="yes"
> > ++do_target_build="yes"
> > ++if [ "$1" = "--target-only" ]; then
> > ++      do_host_build="no"
> > ++      shift
> > ++elif [ "$1" = "--host-only" ]; then
> > ++      do_target_build="no"
> > ++      shift
> > ++fi
> > ++
> > ++if [ "$do_host_build" = "yes" ]; then
> > ++      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
> > ++      # Delay move of dist tool to now, because bootstrap may clear tool directory.
> > ++      mv cmd/dist/dist "$GOTOOLDIR"/dist
> > ++      echo
> > ++
> > +       echo "##### Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
> > +       # CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
> > +       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> > +@@ -157,11 +168,20 @@ if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOH
> > +       echo
> > + fi
> > +
> > +-echo "##### Building packages and commands for $GOOS/$GOARCH."
> > +-CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> > +-echo
> > ++if [ "$do_target_build" = "yes" ]; then
> > ++    GO_INSTALL="${GO_TARGET_INSTALL:-std cmd}"
> > ++    echo "##### Building packages and commands for $GOOS/$GOARCH."
> > ++    if [ "$GOHOSTOS" = "$GOOS" -a "$GOHOSTARCH" = "$GOARCH" -a "$do_host_build" = "yes" ]; then
> > ++      rm -rf ./host-tools
> > ++      mkdir ./host-tools
> > ++      mv "$GOTOOLDIR"/* ./host-tools
> > ++      GOTOOLDIR="$PWD/host-tools"
> > ++    fi
> > ++    GOTOOLDIR="$GOTOOLDIR" CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v ${GO_INSTALL}
> > ++    echo
> > +
> > +-rm -f "$GOTOOLDIR"/go_bootstrap
> > ++    rm -f "$GOTOOLDIR"/go_bootstrap
> > ++fi
> > +
> > + if [ "$1" != "--no-banner" ]; then
> > +       "$GOTOOLDIR"/dist banner
> > diff --git a/meta/recipes-devtools/go/go-1.6/syslog.patch b/meta/recipes-devtools/go/go-1.6/syslog.patch
> > new file mode 100644
> > index 0000000..29be06f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.6/syslog.patch
> > @@ -0,0 +1,62 @@
> > +Add timeouts to logger
> 
> 
> This patch was something that I brought into my go recipes a while back,
> but probably isn't upstreamable and isn't generally needed any more.

I think we should get rid of 1.6 completely, I did run into issues
compiling host target seprately and this patch helped. we should test go
1.8 e.g. if its not needed anymore

> 
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Upstream-Status: Pending
> > +
> > +diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/syslog/syslog.go
> > +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 -0800
> > ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03 11:44:37.710403200 -0700
> > +@@ -33,6 +33,9 @@
> > + const severityMask = 0x07
> > + const facilityMask = 0xf8
> > +
> > ++var writeTimeout = 1 * time.Second
> > ++var connectTimeout = 1 * time.Second
> > ++
> > + const (
> > +       // Severity.
> > +
> > +@@ -100,6 +103,7 @@
> > + type serverConn interface {
> > +       writeString(p Priority, hostname, tag, s, nl string) error
> > +       close() error
> > ++      setWriteDeadline(t time.Time) error
> > + }
> > +
> > + type netConn struct {
> > +@@ -273,7 +277,11 @@
> > +               nl = "\n"
> > +       }
> > +
> > +-      err := w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> > ++      err := w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
> > ++      if err != nil {
> > ++              return 0, err
> > ++      }
> > ++      err = w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> > +       if err != nil {
> > +               return 0, err
> > +       }
> > +@@ -305,6 +313,10 @@
> > +       return n.conn.Close()
> > + }
> > +
> > ++func (n *netConn) setWriteDeadline(t time.Time) error {
> > ++      return n.conn.SetWriteDeadline(t)
> > ++}
> > ++
> > + // NewLogger creates a log.Logger whose output is written to
> > + // the system log service with the specified priority. The logFlag
> > + // argument is the flag set passed through to log.New to create
> > +diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go
> > +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 -0800
> > ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-10-03 11:44:39.010403175 -0700
> > +@@ -19,7 +19,7 @@
> > +       logPaths := []string{"/dev/log", "/var/run/syslog"}
> > +       for _, network := range logTypes {
> > +               for _, path := range logPaths {
> > +-                      conn, err := net.Dial(network, path)
> > ++                      conn, err := net.DialTimeout(network, path, connectTimeout)
> > +                       if err != nil {
> > +                               continue
> > +                       } else {
> > diff --git a/meta/recipes-devtools/go/go-1.7.inc b/meta/recipes-devtools/go/go-1.7.inc
> > new file mode 100644
> > index 0000000..5c3004e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.7.inc
> > @@ -0,0 +1,19 @@
> > +require go-common.inc
> > +
> > +PV = "1.7.4"
> > +GO_BASEVERSION = "1.7"
> > +FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> > +
> > +SRC_URI += "\
> > +       file://armhf-elf-header.patch \
> > +       file://syslog.patch \
> > +       file://fix-target-cc-for-build.patch \
> > +       file://fix-cc-handling.patch \
> > +       file://split-host-and-target-build.patch \
> > +       file://gotooldir.patch \
> > +"
> > +SRC_URI[md5sum] = "49c1076428a5d3b5ad7ac65233fcca2f"
> > +SRC_URI[sha256sum] = "4c189111e9ba651a2bb3ee868aa881fab36b2f2da3409e80885ca758a6b614cc"
> > +
> > diff --git a/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch b/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
> > new file mode 100644
> > index 0000000..1e3a16b
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
> > @@ -0,0 +1,23 @@
> > +Encode arm EABI ( hard/soft ) calling convention in ELF header
> 
> This patch shouldn't be needed, at least for go1.7 and later, possibly
> even go1.6.  It's an artifact
> leftover from the old C implementation of the compiler.

if you can point out where it was fixed in go compiler, it would help in
assessing usablity of this

> 
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Upstream-Status: Pending
> > +Index: go/src/cmd/link/internal/ld/elf.go
> > +===================================================================
> > +--- go.orig/src/cmd/link/internal/ld/elf.go
> > ++++ go/src/cmd/link/internal/ld/elf.go
> > +@@ -827,7 +827,13 @@
> > +       // 32-bit architectures
> > +       case '5':
> > +               // we use EABI on both linux/arm and freebsd/arm.
> > +-              if HEADTYPE == obj.Hlinux || HEADTYPE == obj.Hfreebsd {
> > ++              if HEADTYPE == obj.Hlinux {
> > ++                      if Ctxt.Goarm == 7 {
> > ++                              ehdr.flags = 0x5000402 // has entry point, Version5 EABI, hard float
> > ++                      } else {
> > ++                              ehdr.flags = 0x5000202 // has entry point, Version5 EABI, soft float
> > ++                      }
> > ++              } else if HEADTYPE == obj.Hfreebsd {
> > +                       // We set a value here that makes no indication of which
> > +                       // float ABI the object uses, because this is information
> > +                       // used by the dynamic linker to compare executables and
> > --- /dev/null
> > +++ b/meta/recipes-extended/go-examples/files/helloworld.go
> > @@ -0,0 +1,10 @@
> > +// You can edit this code!
> > +// Click here and start typing.
> > +// taken from https://golang.org/
> > +package main
> > +
> > +import "fmt"
> > +
> > +func main() {
> > +       fmt.Println("Hello, 世界")
> > +}
> > diff --git a/meta/recipes-extended/go-examples/go-examples.inc b/meta/recipes-extended/go-examples/go-examples.inc
> > new file mode 100644
> > index 0000000..c632681
> > --- /dev/null
> > +++ b/meta/recipes-extended/go-examples/go-examples.inc
> 
> Does go-examples belong under meta/recipes-extended?  Maybe move it
> under meta-skeleton/recipes-skeleton?
> 

We want to run it as a unit test, I am not sure if we include
meta-skeleton in our regular layer mix

> > @@ -0,0 +1,10 @@
> > +DESCRIPTION = "This is a simple example recipe that cross-compiles a Go program."
> > +SECTION = "examples"
> > +HOMEPAGE = "https://golang.org/"
> > +
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> > +
> > +S = "${WORKDIR}"
> > +
> > +inherit go
> > diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> > new file mode 100644
> > index 0000000..930c57d
> > --- /dev/null
> > +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> > @@ -0,0 +1,13 @@
> > +require go-examples.inc
> > +
> > +SRC_URI += " \
> > +  file://helloworld.go \
> > +"
> > +
> > +do_compile() {
> > +       go build helloworld.go
> > +}
> > +
> > +do_install() {
> > +       install -D -m 0755 ${S}/helloworld ${D}${bindir}/helloworld
> > +}
> > --
> > 2.10.2
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

