Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 526177EE43
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:37 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id m9so17807933pls.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XgIIpTrPFZRWDDI5Vh7TOrm71k3GSVjkWjKa7LmZbr8=;
	b=Pim+A29L/3fZ1S5rJEMiJnwUU09wKeKfai5yKQvPcHpnTnDFNcRsgvY+9J0zdpKcly
	8zARnZQN+kdc4Y0Bn/LFLlZWC8WMfWT4ZezG2FCJmEBmMAk7JCX6WVisEucs3NZcNIIE
	IZ3Bc7rZf6JGnXPb4es8PHjSnZEOgKhgaeWsWWVAxASv9TxGh78sy6IwqDH1RrRVrLVI
	KQn4MIR8+FHBAPDWGAOYISYGPz2WI5aJ1ORrm81UFWoOplmnTP5/O3BixQFyY7ONecD8
	XfQ44qLcQ9yho/2XxdFeKGR+YJItQQn1i295+swBG40+xvSmlKYH6769RCgeS5ccfW7y
	tLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XgIIpTrPFZRWDDI5Vh7TOrm71k3GSVjkWjKa7LmZbr8=;
	b=JQAocyhwKGKurZMv4oYMYQRdsM9o5p422sNJV9JGSMKxw3SPIPDvOlD1tYDHzUYtG8
	4D1AKHwMa242K7mWzmJcm/i8zuQL1qd4THcooXkSS3tdaf/VvglLWNJHeEh3iPqf2q31
	RBiELqOLqhqOZ8kVxdC16WgOCa9VBL948iufwjrOvXEKzgKtSF+tG1dIAOrV1i54Z93/
	zQSnziyb2BoYGN5UvLOLYdTXvr4J12EaGhg50Nk45drzxRq/TGhy21FGGocYgg5M2eUS
	dwdSR6ggSOQaxCXqsL5aLuZh3tClUrpKKVLlyvA0L//t23y4jtoDGK1QaCfpgoaSRhoJ
	vqaQ==
X-Gm-Message-State: APjAAAVlV1HR+L1Z9xbDG1Kr5MA/VJ8TwI0F7zldC03hSxm3KVcT/qfI
	EeDRlplo6YbTDYeKjsJXqrQuQGWt
X-Google-Smtp-Source: APXvYqwhGFd6q/RVw35PtOMBSq4ZJ3LtvJzIL1ixFkHs+n1418s5yqR8dhWWpORiVNfzDyEoXk1WPg==
X-Received: by 2002:a17:902:8649:: with SMTP id
	y9mr68844650plt.289.1563719138318; 
	Sun, 21 Jul 2019 07:25:38 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:03 -0700
Message-Id: <69964488112899371b7fd88b6e86e533d968b457.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 14/30] go: Upgrade 1.11.1 -> 1.11.4 minor release
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:37 -0000

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


