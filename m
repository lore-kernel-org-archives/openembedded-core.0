Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC037821B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:45:37 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c69so1638957qke.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=UJ8W5IqmgvuoDYaMX5yLFH3S75192RhrA9dPoAKWAOk=;
	b=sttIFEmesylMS3ucm6CmKRs5pxMXoLT9UKrwJ4GY48mKNYx1T7Q/3YxonKrnsjXkUf
	e0Y/FSjKxZCuvJIoMCAd8+IWTnwEW4qJFTYJRMA0vOIgzwPQrPv8+mu8nK4EJnwdXFlZ
	CCtKXr60OvSZ15NXzs7zwx43u9Fe6YA7qrYfwZLy0yUHpAzxSfXqjyVTlrhczKq3w7KN
	qkwLuOzoDRwGMxSq5RzvuVRQB160CDx31ev98VX9tcSihjwzSaad5RU23AOA2tFKT1qs
	bVZDKGISWvR8fqXFdN3tqSKYciszEUk3r2IyIaRkSQuHt+M8nxz9SQMQl4F+dCk13AjG
	OLww==
X-Gm-Message-State: AHPjjUjWDxH+55MjKxnYLZC20dXKe7V6C+M3zumgCS9ZY2PC3LbEpQFC
	lp8Qgdn+IrE+4L3X
X-Google-Smtp-Source: AOwi7QC7C0kJWH8FBnXLMuEstXmZajVtkRCqNwoSp4/ZrNBNRijFRWHoaVx+ltZRwgXPALBGdgpbQQ==
X-Received: by 10.55.143.134 with SMTP id r128mr4158400qkd.211.1504881938297; 
	Fri, 08 Sep 2017 07:45:38 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	s90sm1344072qkl.81.2017.09.08.07.45.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:45:37 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:45:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:46 -0300
Message-Id: <20170908144454.14308-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 04/12] go: Remove Go 1.6 and 1.7 releases
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
X-List-Received-Date: Fri, 08 Sep 2017 14:45:38 -0000

The OE-Core has no reason to support multiple versions of Go as this
increases the maintenance work and testing efforts. So we are going to
support just a single version from now on which currently is 1.8.3.

The 1.4 release is kept around as it is used for bootstrap, as such,
it cannot be removed.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-devtools/go/go-1.6.inc                | 19 -------
 .../go/go-1.6/armhf-elf-header.patch               | 23 --------
 .../go/go-1.6/fix-cc-handling.patch                | 50 -----------------
 .../go/go-1.6/fix-target-cc-for-build.patch        | 17 ------
 meta/recipes-devtools/go/go-1.6/gotooldir.patch    | 30 -----------
 .../go/go-1.6/split-host-and-target-build.patch    | 63 ----------------------
 meta/recipes-devtools/go/go-1.6/syslog.patch       | 62 ---------------------
 meta/recipes-devtools/go/go-1.7.inc                | 19 -------
 .../go/go-1.7/armhf-elf-header.patch               | 23 --------
 .../go/go-1.7/fix-cc-handling.patch                | 50 -----------------
 .../go/go-1.7/fix-target-cc-for-build.patch        | 17 ------
 meta/recipes-devtools/go/go-1.7/gotooldir.patch    | 30 -----------
 .../go/go-1.7/split-host-and-target-build.patch    | 62 ---------------------
 meta/recipes-devtools/go/go-1.7/syslog.patch       | 62 ---------------------
 meta/recipes-devtools/go/go-cross_1.7.bb           |  5 --
 meta/recipes-devtools/go/go_1.6.bb                 |  4 --
 meta/recipes-devtools/go/go_1.7.bb                 |  2 -
 17 files changed, 538 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
 delete mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
 delete mode 100644 meta/recipes-devtools/go/go_1.7.bb

diff --git a/meta/recipes-devtools/go/go-1.6.inc b/meta/recipes-devtools/go/go-1.6.inc
deleted file mode 100644
index 769c1d8f22..0000000000
--- a/meta/recipes-devtools/go/go-1.6.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-require go-common.inc
-
-PV = "1.6.3"
-GO_BASEVERSION = "1.6"
-FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
-
-SRC_URI += "\
-       file://armhf-elf-header.patch \
-       file://syslog.patch \
-       file://fix-target-cc-for-build.patch \
-       file://fix-cc-handling.patch \
-       file://split-host-and-target-build.patch \
-       file://gotooldir.patch \
-"
-SRC_URI[md5sum] = "bf3fce6ccaadd310159c9e874220e2a2"
-SRC_URI[sha256sum] = "6326aeed5f86cf18f16d6dc831405614f855e2d416a91fd3fdc334f772345b00"
-
diff --git a/meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch b/meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
deleted file mode 100644
index 1e3a16b319..0000000000
--- a/meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Encode arm EABI ( hard/soft ) calling convention in ELF header
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/cmd/link/internal/ld/elf.go
-===================================================================
---- go.orig/src/cmd/link/internal/ld/elf.go
-+++ go/src/cmd/link/internal/ld/elf.go
-@@ -827,7 +827,13 @@
- 	// 32-bit architectures
- 	case '5':
- 		// we use EABI on both linux/arm and freebsd/arm.
--		if HEADTYPE == obj.Hlinux || HEADTYPE == obj.Hfreebsd {
-+		if HEADTYPE == obj.Hlinux {
-+			if Ctxt.Goarm == 7 {
-+				ehdr.flags = 0x5000402 // has entry point, Version5 EABI, hard float
-+			} else {
-+				ehdr.flags = 0x5000202 // has entry point, Version5 EABI, soft float
-+			}
-+		} else if HEADTYPE == obj.Hfreebsd {
- 			// We set a value here that makes no indication of which
- 			// float ABI the object uses, because this is information
- 			// used by the dynamic linker to compare executables and
diff --git a/meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch b/meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
deleted file mode 100644
index 983323ace9..0000000000
--- a/meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Accept CC with multiple words in its name
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/cmd/go/build.go
-===================================================================
---- go.orig/src/cmd/go/build.go	2015-07-29 14:48:40.323185807 -0700
-+++ go/src/cmd/go/build.go	2015-07-30 07:37:40.529818586 -0700
-@@ -2805,12 +2805,24 @@
- 	return b.ccompilerCmd("CC", defaultCC, objdir)
- }
- 
-+// gccCmd returns a gcc command line prefix
-+// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
-+func (b *builder) gccCmdForReal() []string {
-+	return envList("CC", defaultCC)
-+}
-+
- // gxxCmd returns a g++ command line prefix
- // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
- func (b *builder) gxxCmd(objdir string) []string {
- 	return b.ccompilerCmd("CXX", defaultCXX, objdir)
- }
- 
-+// gxxCmd returns a g++ command line prefix
-+// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
-+func (b *builder) gxxCmdForReal() []string {
-+	return envList("CXX", defaultCXX)
-+}
-+
- // ccompilerCmd returns a command line prefix for the given environment
- // variable and using the default command when the variable is empty.
- func (b *builder) ccompilerCmd(envvar, defcmd, objdir string) []string {
-Index: go/src/cmd/go/env.go
-===================================================================
---- go.orig/src/cmd/go/env.go	2015-07-29 14:48:40.323185807 -0700
-+++ go/src/cmd/go/env.go	2015-07-30 07:40:54.461655721 -0700
-@@ -52,10 +52,9 @@
- 
- 	if goos != "plan9" {
- 		cmd := b.gccCmd(".")
--		env = append(env, envVar{"CC", cmd[0]})
-+		env = append(env, envVar{"CC", strings.Join(b.gccCmdForReal(), " ")})
- 		env = append(env, envVar{"GOGCCFLAGS", strings.Join(cmd[3:], " ")})
--		cmd = b.gxxCmd(".")
--		env = append(env, envVar{"CXX", cmd[0]})
-+		env = append(env, envVar{"CXX", strings.Join(b.gxxCmdForReal(), " ")})
- 	}
- 
- 	if buildContext.CgoEnabled {
diff --git a/meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch b/meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
deleted file mode 100644
index 2f6156ecd2..0000000000
--- a/meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Put Quotes around CC_FOR_TARGET since it can be mutliple words e.g. in OE
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/make.bash
-===================================================================
---- go.orig/src/make.bash	2015-07-29 13:28:11.334031696 -0700
-+++ go/src/make.bash	2015-07-29 13:36:55.814465630 -0700
-@@ -158,7 +158,7 @@
- fi
- 
- echo "##### Building packages and commands for $GOOS/$GOARCH."
--CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
-+CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
- echo
- 
- rm -f "$GOTOOLDIR"/go_bootstrap
diff --git a/meta/recipes-devtools/go/go-1.6/gotooldir.patch b/meta/recipes-devtools/go/go-1.6/gotooldir.patch
deleted file mode 100644
index 94670259f2..0000000000
--- a/meta/recipes-devtools/go/go-1.6/gotooldir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Define tooldir in relation to GOTOOLDIR env var
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/go/build/build.go
-===================================================================
---- go.orig/src/go/build/build.go
-+++ go/src/go/build/build.go
-@@ -1388,7 +1388,7 @@ func init() {
- }
- 
- // ToolDir is the directory containing build tools.
--var ToolDir = filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
- 
- // IsLocalImport reports whether the import path is
- // a local import path, like ".", "..", "./foo", or "../foo".
-Index: go/src/cmd/go/build.go
-===================================================================
---- go.orig/src/cmd/go/build.go
-+++ go/src/cmd/go/build.go
-@@ -1312,7 +1312,7 @@ func (b *builder) build(a *action) (err
- 		}
- 
- 		cgoExe := tool("cgo")
--		if a.cgo != nil && a.cgo.target != "" {
-+		if a.cgo != nil && a.cgo.target != "" && os.Getenv("GOTOOLDIR") == "" {
- 			cgoExe = a.cgo.target
- 		}
- 		outGo, outObj, err := b.cgo(a.p, cgoExe, obj, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, cxxfiles, a.p.MFiles)
diff --git a/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch b/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
deleted file mode 100644
index afbae02b4e..0000000000
--- a/meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Add new option --target-only to build target components
-Separates the host and target pieces of build
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/make.bash
-===================================================================
---- go.orig/src/make.bash
-+++ go/src/make.bash
-@@ -143,12 +143,23 @@ if [ "$1" = "--no-clean" ]; then
- 	buildall=""
- 	shift
- fi
--./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
--# Delay move of dist tool to now, because bootstrap may clear tool directory.
--mv cmd/dist/dist "$GOTOOLDIR"/dist
--echo
- 
--if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" != "$GOOS" ]; then
-+do_host_build="yes"
-+do_target_build="yes"
-+if [ "$1" = "--target-only" ]; then
-+	do_host_build="no"
-+	shift
-+elif [ "$1" = "--host-only" ]; then
-+	do_target_build="no"
-+	shift
-+fi
-+
-+if [ "$do_host_build" = "yes" ]; then
-+	./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
-+	# Delay move of dist tool to now, because bootstrap may clear tool directory.
-+	mv cmd/dist/dist "$GOTOOLDIR"/dist
-+	echo
-+
- 	echo "##### Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
- 	# CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
- 	# use the host compiler, CC, from `cmd/dist/dist env` instead.
-@@ -157,11 +168,20 @@ if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOH
- 	echo
- fi
- 
--echo "##### Building packages and commands for $GOOS/$GOARCH."
--CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
--echo
-+if [ "$do_target_build" = "yes" ]; then
-+    GO_INSTALL="${GO_TARGET_INSTALL:-std cmd}"
-+    echo "##### Building packages and commands for $GOOS/$GOARCH."
-+    if [ "$GOHOSTOS" = "$GOOS" -a "$GOHOSTARCH" = "$GOARCH" -a "$do_host_build" = "yes" ]; then
-+	rm -rf ./host-tools
-+	mkdir ./host-tools
-+	mv "$GOTOOLDIR"/* ./host-tools
-+	GOTOOLDIR="$PWD/host-tools"
-+    fi
-+    GOTOOLDIR="$GOTOOLDIR" CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v ${GO_INSTALL}
-+    echo
- 
--rm -f "$GOTOOLDIR"/go_bootstrap
-+    rm -f "$GOTOOLDIR"/go_bootstrap
-+fi
- 
- if [ "$1" != "--no-banner" ]; then
- 	"$GOTOOLDIR"/dist banner
diff --git a/meta/recipes-devtools/go/go-1.6/syslog.patch b/meta/recipes-devtools/go/go-1.6/syslog.patch
deleted file mode 100644
index 29be06f1bd..0000000000
--- a/meta/recipes-devtools/go/go-1.6/syslog.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Add timeouts to logger
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/syslog/syslog.go
---- go/src/log/syslog/syslog.go	2013-11-28 13:38:28.000000000 -0800
-+++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go	2014-10-03 11:44:37.710403200 -0700
-@@ -33,6 +33,9 @@
- const severityMask = 0x07
- const facilityMask = 0xf8
- 
-+var writeTimeout = 1 * time.Second
-+var connectTimeout = 1 * time.Second
-+
- const (
- 	// Severity.
- 
-@@ -100,6 +103,7 @@
- type serverConn interface {
- 	writeString(p Priority, hostname, tag, s, nl string) error
- 	close() error
-+	setWriteDeadline(t time.Time) error
- }
- 
- type netConn struct {
-@@ -273,7 +277,11 @@
- 		nl = "\n"
- 	}
- 
--	err := w.conn.writeString(p, w.hostname, w.tag, msg, nl)
-+	err := w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
-+	if err != nil {
-+		return 0, err
-+	}
-+	err = w.conn.writeString(p, w.hostname, w.tag, msg, nl)
- 	if err != nil {
- 		return 0, err
- 	}
-@@ -305,6 +313,10 @@
- 	return n.conn.Close()
- }
- 
-+func (n *netConn) setWriteDeadline(t time.Time) error {
-+	return n.conn.SetWriteDeadline(t)
-+}
-+
- // NewLogger creates a log.Logger whose output is written to
- // the system log service with the specified priority. The logFlag
- // argument is the flag set passed through to log.New to create
-diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go
---- go/src/log/syslog/syslog_unix.go	2013-11-28 13:38:28.000000000 -0800
-+++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go	2014-10-03 11:44:39.010403175 -0700
-@@ -19,7 +19,7 @@
- 	logPaths := []string{"/dev/log", "/var/run/syslog"}
- 	for _, network := range logTypes {
- 		for _, path := range logPaths {
--			conn, err := net.Dial(network, path)
-+			conn, err := net.DialTimeout(network, path, connectTimeout)
- 			if err != nil {
- 				continue
- 			} else {
diff --git a/meta/recipes-devtools/go/go-1.7.inc b/meta/recipes-devtools/go/go-1.7.inc
deleted file mode 100644
index 5c3004e875..0000000000
--- a/meta/recipes-devtools/go/go-1.7.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-require go-common.inc
-
-PV = "1.7.4"
-GO_BASEVERSION = "1.7"
-FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
-
-SRC_URI += "\
-       file://armhf-elf-header.patch \
-       file://syslog.patch \
-       file://fix-target-cc-for-build.patch \
-       file://fix-cc-handling.patch \
-       file://split-host-and-target-build.patch \
-       file://gotooldir.patch \
-"
-SRC_URI[md5sum] = "49c1076428a5d3b5ad7ac65233fcca2f"
-SRC_URI[sha256sum] = "4c189111e9ba651a2bb3ee868aa881fab36b2f2da3409e80885ca758a6b614cc"
-
diff --git a/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch b/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
deleted file mode 100644
index 1e3a16b319..0000000000
--- a/meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Encode arm EABI ( hard/soft ) calling convention in ELF header
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/cmd/link/internal/ld/elf.go
-===================================================================
---- go.orig/src/cmd/link/internal/ld/elf.go
-+++ go/src/cmd/link/internal/ld/elf.go
-@@ -827,7 +827,13 @@
- 	// 32-bit architectures
- 	case '5':
- 		// we use EABI on both linux/arm and freebsd/arm.
--		if HEADTYPE == obj.Hlinux || HEADTYPE == obj.Hfreebsd {
-+		if HEADTYPE == obj.Hlinux {
-+			if Ctxt.Goarm == 7 {
-+				ehdr.flags = 0x5000402 // has entry point, Version5 EABI, hard float
-+			} else {
-+				ehdr.flags = 0x5000202 // has entry point, Version5 EABI, soft float
-+			}
-+		} else if HEADTYPE == obj.Hfreebsd {
- 			// We set a value here that makes no indication of which
- 			// float ABI the object uses, because this is information
- 			// used by the dynamic linker to compare executables and
diff --git a/meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch b/meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
deleted file mode 100644
index a67caf41a5..0000000000
--- a/meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Accept CC with multiple words in its name
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/cmd/go/build.go
-===================================================================
---- go.orig/src/cmd/go/build.go
-+++ go/src/cmd/go/build.go
-@@ -2991,12 +2991,24 @@ func (b *builder) gccCmd(objdir string)
- 	return b.ccompilerCmd("CC", defaultCC, objdir)
- }
- 
-+// gccCmd returns a gcc command line prefix
-+// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
-+func (b *builder) gccCmdForReal() []string {
-+	return envList("CC", defaultCC)
-+}
-+
- // gxxCmd returns a g++ command line prefix
- // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
- func (b *builder) gxxCmd(objdir string) []string {
- 	return b.ccompilerCmd("CXX", defaultCXX, objdir)
- }
- 
-+// gxxCmd returns a g++ command line prefix
-+// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
-+func (b *builder) gxxCmdForReal() []string {
-+	return envList("CXX", defaultCXX)
-+}
-+
- // gfortranCmd returns a gfortran command line prefix.
- func (b *builder) gfortranCmd(objdir string) []string {
- 	return b.ccompilerCmd("FC", "gfortran", objdir)
-Index: go/src/cmd/go/env.go
-===================================================================
---- go.orig/src/cmd/go/env.go
-+++ go/src/cmd/go/env.go
-@@ -51,10 +51,9 @@ func mkEnv() []envVar {
- 
- 	if goos != "plan9" {
- 		cmd := b.gccCmd(".")
--		env = append(env, envVar{"CC", cmd[0]})
-+		env = append(env, envVar{"CC", strings.Join(b.gccCmdForReal(), " ")})
- 		env = append(env, envVar{"GOGCCFLAGS", strings.Join(cmd[3:], " ")})
--		cmd = b.gxxCmd(".")
--		env = append(env, envVar{"CXX", cmd[0]})
-+		env = append(env, envVar{"CXX", strings.Join(b.gxxCmdForReal(), " ")})
- 	}
- 
- 	if buildContext.CgoEnabled {
diff --git a/meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch b/meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
deleted file mode 100644
index 2f6156ecd2..0000000000
--- a/meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Put Quotes around CC_FOR_TARGET since it can be mutliple words e.g. in OE
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/make.bash
-===================================================================
---- go.orig/src/make.bash	2015-07-29 13:28:11.334031696 -0700
-+++ go/src/make.bash	2015-07-29 13:36:55.814465630 -0700
-@@ -158,7 +158,7 @@
- fi
- 
- echo "##### Building packages and commands for $GOOS/$GOARCH."
--CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
-+CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
- echo
- 
- rm -f "$GOTOOLDIR"/go_bootstrap
diff --git a/meta/recipes-devtools/go/go-1.7/gotooldir.patch b/meta/recipes-devtools/go/go-1.7/gotooldir.patch
deleted file mode 100644
index 94670259f2..0000000000
--- a/meta/recipes-devtools/go/go-1.7/gotooldir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Define tooldir in relation to GOTOOLDIR env var
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/go/build/build.go
-===================================================================
---- go.orig/src/go/build/build.go
-+++ go/src/go/build/build.go
-@@ -1388,7 +1388,7 @@ func init() {
- }
- 
- // ToolDir is the directory containing build tools.
--var ToolDir = filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
- 
- // IsLocalImport reports whether the import path is
- // a local import path, like ".", "..", "./foo", or "../foo".
-Index: go/src/cmd/go/build.go
-===================================================================
---- go.orig/src/cmd/go/build.go
-+++ go/src/cmd/go/build.go
-@@ -1312,7 +1312,7 @@ func (b *builder) build(a *action) (err
- 		}
- 
- 		cgoExe := tool("cgo")
--		if a.cgo != nil && a.cgo.target != "" {
-+		if a.cgo != nil && a.cgo.target != "" && os.Getenv("GOTOOLDIR") == "" {
- 			cgoExe = a.cgo.target
- 		}
- 		outGo, outObj, err := b.cgo(a.p, cgoExe, obj, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, cxxfiles, a.p.MFiles)
diff --git a/meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch b/meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
deleted file mode 100644
index b0dd95bbe7..0000000000
--- a/meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Add new option --target-only to build target components
-Separates the host and target pieces of build
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/make.bash
-===================================================================
---- go.orig/src/make.bash
-+++ go/src/make.bash
-@@ -154,13 +154,22 @@ if [ "$1" = "--no-clean" ]; then
- 	buildall=""
- 	shift
- fi
--./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
-+do_host_build="yes"
-+do_target_build="yes"
-+if [ "$1" = "--target-only" ]; then
-+	do_host_build="no"
-+	shift
-+elif [ "$1" = "--host-only" ]; then
-+	do_target_build="no"
-+	shift
-+fi
- 
--# Delay move of dist tool to now, because bootstrap may clear tool directory.
--mv cmd/dist/dist "$GOTOOLDIR"/dist
--echo
-+if [ "$do_host_build" = "yes" ]; then
-+	./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
-+	# Delay move of dist tool to now, because bootstrap may clear tool directory.
-+	mv cmd/dist/dist "$GOTOOLDIR"/dist
-+	echo
- 
--if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" != "$GOOS" ]; then
- 	echo "##### Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
- 	# CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
- 	# use the host compiler, CC, from `cmd/dist/dist env` instead.
-@@ -169,11 +178,20 @@ if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOH
- 	echo
- fi
- 
--echo "##### Building packages and commands for $GOOS/$GOARCH."
--CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
--echo
-+if [ "$do_target_build" = "yes" ]; then
-+    GO_INSTALL="${GO_TARGET_INSTALL:-std cmd}"
-+    echo "##### Building packages and commands for $GOOS/$GOARCH."
-+    if [ "$GOHOSTOS" = "$GOOS" -a "$GOHOSTARCH" = "$GOARCH" -a "$do_host_build" = "yes" ]; then
-+	rm -rf ./host-tools
-+	mkdir ./host-tools
-+	mv "$GOTOOLDIR"/* ./host-tools
-+	GOTOOLDIR="$PWD/host-tools"
-+    fi
-+    GOTOOLDIR="$GOTOOLDIR" CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v ${GO_INSTALL}
-+    echo
- 
--rm -f "$GOTOOLDIR"/go_bootstrap
-+    rm -f "$GOTOOLDIR"/go_bootstrap
-+fi
- 
- if [ "$1" != "--no-banner" ]; then
- 	"$GOTOOLDIR"/dist banner
diff --git a/meta/recipes-devtools/go/go-1.7/syslog.patch b/meta/recipes-devtools/go/go-1.7/syslog.patch
deleted file mode 100644
index 29be06f1bd..0000000000
--- a/meta/recipes-devtools/go/go-1.7/syslog.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Add timeouts to logger
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/syslog/syslog.go
---- go/src/log/syslog/syslog.go	2013-11-28 13:38:28.000000000 -0800
-+++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go	2014-10-03 11:44:37.710403200 -0700
-@@ -33,6 +33,9 @@
- const severityMask = 0x07
- const facilityMask = 0xf8
- 
-+var writeTimeout = 1 * time.Second
-+var connectTimeout = 1 * time.Second
-+
- const (
- 	// Severity.
- 
-@@ -100,6 +103,7 @@
- type serverConn interface {
- 	writeString(p Priority, hostname, tag, s, nl string) error
- 	close() error
-+	setWriteDeadline(t time.Time) error
- }
- 
- type netConn struct {
-@@ -273,7 +277,11 @@
- 		nl = "\n"
- 	}
- 
--	err := w.conn.writeString(p, w.hostname, w.tag, msg, nl)
-+	err := w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
-+	if err != nil {
-+		return 0, err
-+	}
-+	err = w.conn.writeString(p, w.hostname, w.tag, msg, nl)
- 	if err != nil {
- 		return 0, err
- 	}
-@@ -305,6 +313,10 @@
- 	return n.conn.Close()
- }
- 
-+func (n *netConn) setWriteDeadline(t time.Time) error {
-+	return n.conn.SetWriteDeadline(t)
-+}
-+
- // NewLogger creates a log.Logger whose output is written to
- // the system log service with the specified priority. The logFlag
- // argument is the flag set passed through to log.New to create
-diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go
---- go/src/log/syslog/syslog_unix.go	2013-11-28 13:38:28.000000000 -0800
-+++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go	2014-10-03 11:44:39.010403175 -0700
-@@ -19,7 +19,7 @@
- 	logPaths := []string{"/dev/log", "/var/run/syslog"}
- 	for _, network := range logTypes {
- 		for _, path := range logPaths {
--			conn, err := net.Dial(network, path)
-+			conn, err := net.DialTimeout(network, path, connectTimeout)
- 			if err != nil {
- 				continue
- 			} else {
diff --git a/meta/recipes-devtools/go/go-cross_1.7.bb b/meta/recipes-devtools/go/go-cross_1.7.bb
deleted file mode 100644
index 56ee084b10..0000000000
--- a/meta/recipes-devtools/go/go-cross_1.7.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require go-cross.inc
-require go_${PV}.bb
-
-# Go binaries are not understood by the strip tool.
-INHIBIT_SYSROOT_STRIP = "1"
diff --git a/meta/recipes-devtools/go/go_1.6.bb b/meta/recipes-devtools/go/go_1.6.bb
deleted file mode 100644
index 2f590338c4..0000000000
--- a/meta/recipes-devtools/go/go_1.6.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require go.inc
-require go-${PV}.inc
-
-BBCLASSEXTEND = "cross"
diff --git a/meta/recipes-devtools/go/go_1.7.bb b/meta/recipes-devtools/go/go_1.7.bb
deleted file mode 100644
index e7a6ab277e..0000000000
--- a/meta/recipes-devtools/go/go_1.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require go-${PV}.inc
-require go.inc
-- 
2.14.1


