Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3427D7B71B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 05:54:50 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id g62so5781363pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2018 21:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L6UppjbTCLXu7LU1d+0H9uD7IMiCIUoA7puERHfUxY4=;
	b=ufiS+/u8vccul+dpJIT9xT2c/aIIaSzoySW0pAMWhry6wKOpSqTVXAqwh4bbw8DLyy
	7dmLFSzaXseuhSU9CUd4h4yoL2OMNyzKLkAv3NtZncGLnxl+idOpQzJqQd9K4Tu8gCUa
	BpUeutojCf0w/AwKggJV3TeffcGCzCL7Noe5zJ+x1JWxY/22ZXSJMdoUwslIvScvk2g1
	C+4pJJdCH8KL77+3avcyo8ZBaIqTDzk9hvcr8aeXBaIBQOi4IpGTD6OXwNkvMAEO+5Ix
	c2VwpTITNxOpicMFlKWW5obtVdvL6pomsXvisVwF5Zz9yxvT1Lc+EMCm5XV1Cm6VT//f
	RiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L6UppjbTCLXu7LU1d+0H9uD7IMiCIUoA7puERHfUxY4=;
	b=X9cAZazETX3T+qNOmR43nSTYkNx27QVwlAZXpJNzbb8Y2YLMht1vY9i7KkB1xoKbU4
	0EXVQphBIno9DTurRLW8cZnan6fTCCCM8L8vb88uxnIp94kQ+A6+4nelUHtoU1QSgHvw
	f3k8dlOTgIuSf7ONDF3Dg7ccFIePsWxk/J8mcOE41PKzpYBHRem1E87Yuho/tzNfGCEV
	6YmBop1AldPE+sajdK6VeRJCtj+kTLUsM7tPthEeyze9a9Xf7/6NV7rRgaOuRK/aQKO/
	1H9U6lpBQM+p9vSfSryVGU4crOWYP5L1uhJc21h0pvrMFAU68bm7QjbVBfcMZ8iebZrP
	2LXQ==
X-Gm-Message-State: AA+aEWabTHLNrxpbqV3Qx+aDMj26Qg3brhXYMm6WBC/2LlJofQlOZNX2
	3KjZwhTF8zAWTafei5svC70veym08tk=
X-Google-Smtp-Source: AFSGD/XBrHUv2QNuXgrPysIe03OPOJlKUjRHvDPfCF5/NErGb0nHP94klUjs0XKuRKff6SqcmnZdQA==
X-Received: by 2002:a63:d005:: with SMTP id z5mr11118789pgf.64.1545026091520; 
	Sun, 16 Dec 2018 21:54:51 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::6872])
	by smtp.gmail.com with ESMTPSA id
	u126sm21263551pgb.2.2018.12.16.21.54.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Dec 2018 21:54:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Dec 2018 21:54:40 -0800
Message-Id: <20181217055442.13735-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] go: Upgrade 1.11.1 -> 1.11.4 minor release
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
X-List-Received-Date: Mon, 17 Dec 2018 05:54:51 -0000
Content-Transfer-Encoding: 8bit

Changes: https://golang.org/doc/devel/release.html#go1.11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.11.inc                |  7 +++----
 ...007-cmd-go-make-GOROOT-precious-by-default.patch |  6 +++---
 .../0008-use-GOBUILDMODE-to-set-buildmode.patch     | 13 +++++--------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.11.inc b/meta/recipes-devtools/go/go-1.11.inc
index d626514ae6..d03e26cea0 100644
--- a/meta/recipes-devtools/go/go-1.11.inc
+++ b/meta/recipes-devtools/go/go-1.11.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.11"
-GO_MINOR = ".1"
+GO_MINOR = ".4"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -17,8 +17,7 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "eb9e9792247143705a7aacea9398cde0"
-SRC_URI[main.sha256sum] = "558f8c169ae215e25b81421596e8de7572bd3ba824b79add22fba6e284db1117"
+SRC_URI[main.md5sum] = "a77697673215be465d1b583680ef2318"
+SRC_URI[main.sha256sum] = "4cfd42720a6b1e79a8024895fa6607b69972e8e32446df76d6ce79801bbadb15"
diff --git a/meta/recipes-devtools/go/go-1.11/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.11/0007-cmd-go-make-GOROOT-precious-by-default.patch
index f317e48a33..29ef947abd 100644
--- a/meta/recipes-devtools/go/go-1.11/0007-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go-1.11/0007-cmd-go-make-GOROOT-precious-by-default.patch
@@ -65,8 +65,8 @@ Index: go/src/cmd/go/internal/work/exec.go
 ===================================================================
 --- go.orig/src/cmd/go/internal/work/exec.go
 +++ go/src/cmd/go/internal/work/exec.go
-@@ -440,6 +440,23 @@ func (b *Builder) build(a *Action) (err
- 		return fmt.Errorf("module requires Go %s", p.Module.GoVersion)
+@@ -436,6 +436,23 @@ func (b *Builder) build(a *Action) (err
+ 		return fmt.Errorf("missing or invalid binary-only package; expected file %q", a.Package.Target)
  	}
  
 +	if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
@@ -89,7 +89,7 @@ Index: go/src/cmd/go/internal/work/exec.go
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1435,6 +1452,14 @@ func BuildInstallFunc(b *Builder, a *Act
+@@ -1438,6 +1455,14 @@ func BuildInstallFunc(b *Builder, a *Act
  		return nil
  	}
  
diff --git a/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
index b6ab504335..225cf439c5 100644
--- a/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
+++ b/meta/recipes-devtools/go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch
@@ -18,11 +18,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  src/cmd/go/internal/work/build.go | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
 
-diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index 145b875..595d703 100644
---- a/src/cmd/go/internal/work/build.go
-+++ b/src/cmd/go/internal/work/build.go
-@@ -218,7 +218,11 @@ func AddBuildFlags(cmd *base.Command) {
+Index: go/src/cmd/go/internal/work/build.go
+===================================================================
+--- go.orig/src/cmd/go/internal/work/build.go
++++ go/src/cmd/go/internal/work/build.go
+@@ -223,7 +223,11 @@ func AddBuildFlags(cmd *base.Command) {
  
  	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
  	cmd.Flag.Var(buildCompiler{}, "compiler", "")
@@ -35,6 +35,3 @@ index 145b875..595d703 100644
  	cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
  	cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
  	cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
--- 
-2.7.4
-
-- 
2.20.1


