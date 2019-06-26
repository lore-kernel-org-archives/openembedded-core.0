Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 21F416D7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:48 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id w10so1484103pgj.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XgIIpTrPFZRWDDI5Vh7TOrm71k3GSVjkWjKa7LmZbr8=;
	b=hySNWhnuCfGuvi3H1p+/S3uKcf2if8W4/cLnWc9tQtEawOH247FkvfB/eImwSTFeWi
	umf85xDrfzQAuNzAJ6OF8n1hSFqEZXHbGNHiBdKJqjPhQ5KMDkccYHcNTDBsj0l0EyLc
	U1roHFnSgNVvH+enVz+DEMuCX4AdvGNlCqwOyHyPnjD3RD1zvsqnEytxEtjA3RAjJLJv
	8HKIHSiuN3QG8aIzYGUWZUT6epYoX7bh7TH9GusbfT+BAAjSULkRi/CKOQvBXzD3l62F
	zAFUZbJzW5Xs5DYpOUT3tfY2s9cFTzuYNo+JyySNAMfPCnUU6hjN4aF3mE/rWABCSkLb
	n7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XgIIpTrPFZRWDDI5Vh7TOrm71k3GSVjkWjKa7LmZbr8=;
	b=iD8p42DBQNx6g8Iypy4DXbFkIB/+zA0etV5iLBZqYnI97SQsfnVb5fPteXOOt3OuFM
	bMpj7IGqWISJ1WbiL3iKF7/F5ICWhaRJ6MQBbcBo8Pq+fFEGz6a0OL5Ahw69NhfvM4d4
	xCRtKyxfMxgyVl2lnA/5XvD29+qWUhXkf3znYTIg24djOneRLBcI1V/4JCyu7r1JwTYK
	hlQTvCZbX0IBjBG0UqWeqqViYPWHIS5RxDU2w3x1hd7O5AMyn/octlylxwmhLQwheTyQ
	TL44WrVfREa9YHE7NBAEVNsPJxJY5z+28LnMIiVAz/O6cyKl1jJD3mBHD8KdaXM2osl8
	/TgA==
X-Gm-Message-State: APjAAAUxyQAVwtoxdCb65eBNzxnSWULaNGni1Crl4UyGG+QoI93H0q1J
	XDtKz93aUW94Z8owQfIOlMb3in4Qu1U=
X-Google-Smtp-Source: APXvYqz+iVzvlvjOYlATxNcxkjs7yucrFZQwY+ex37PlPhxc1ndkg5HX+V6xKzhk33Sho0sXBuGMXA==
X-Received: by 2002:a17:90a:3ac2:: with SMTP id b60mr64899pjc.74.1561568029004;
	Wed, 26 Jun 2019 09:53:49 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:15 -0700
Message-Id: <69964488112899371b7fd88b6e86e533d968b457.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 14/25] go: Upgrade 1.11.1 -> 1.11.4 minor release
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:48 -0000

From: Khem Raj <raj.khem@gmail.com>

Source: OpenEmbedded.org
MR: 98328, 98329, 98330
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/go?h=warrior&id=b964551a0d08aa921d4e0ceea2f1e28a5e83510e

ChangeID: 0b4cc69c357ba14c4e7a6c7ff926cfc6f09489b2
Description:
include:
CVE-2018-16873
CVE-2018-16874
CVE-2018-16875

Changes: https://golang.org/doc/devel/release.html#go1.11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/go/go-1.11.inc                        |  7 +++----
 .../0007-cmd-go-make-GOROOT-precious-by-default.patch       |  6 +++---
 .../go/go-1.11/0008-use-GOBUILDMODE-to-set-buildmode.patch  | 13 +++++--------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.11.inc b/meta/recipes-devtools/go/go-1.11.inc
index d626514..d03e26c 100644
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
index f317e48..29ef947 100644
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
index b6ab504..225cf43 100644
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
2.7.4


