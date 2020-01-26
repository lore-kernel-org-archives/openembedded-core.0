Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id D5139916D2
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:09 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id a6so2004460pjh.2
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=85dTwuI3n8J+zuPIUiY0tLUHjz18PBJ+ctp66N8/yRM=;
	b=Br6/ibDMFPg/HVBN+mX0TH/e66hmzVqa29KZnyQ0GrY21rUhxK90RPw5Oix0HbpeNS
	iCP7/1llhGKYK/tcsskgvhgfZuzQ3N0gpYzg6o0niu+1ZbFsJtIyd1+e8bIkNhaDU/Md
	DnpaTU54lgkw5Ifv2Cp0Z7TNZbDkWT/k4NJtFrVeejHyybpEMujr5i+Vce0DCh5FkrLp
	m3FMLo8VovBre83yMWwgyAIoj4VsqBy3kcx8iaGdEFm6uxoPFu1eCh87vnwuV3hDfEf7
	6/nDP1EHSHcywMtbESR9u5S9QJV9XpOE2xmJ+Y7B141ldW6lcFIfK5GE6K5pzKldNybT
	nQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=85dTwuI3n8J+zuPIUiY0tLUHjz18PBJ+ctp66N8/yRM=;
	b=grTWN2yqE6mWPzh2KyHCuRoKpuNqlQ4fRQ6iH5hKHn3Vl5fuYDbsTpFGorbeEqzFE6
	e9oXYt0jS2rg7Ne3415HCNKGYiRw5DqGCTAAcQR6oPe7643C7BYeqmksnGT4d0RZaB16
	jIkmZAQ2Zx/TXZrfTakvV2iI8TIaTyDavF65XnZYplmL7w9ixi+9/axML4PpxPDA53tz
	q+m3DRgwrVUDghfNKb2qwJRtoFBXNoeTuG0SBHLZS2NvU6GGgAupCOX3bkSoiWxYrQ5X
	UBSVy4wAhyWl1U+fb/LdLlvo6JD1dNb7DaCU6nlMcj4EvCjwlYvTpk4o2xI16W3q5h5e
	LTkg==
X-Gm-Message-State: APjAAAUqhYikgoag8nKwz7UZeu4bk8n8Bet8X/TO/sdhaKaa3/GhGfxh
	A2q2+R6eD4uahpwu4R+KVkNPZzLm
X-Google-Smtp-Source: APXvYqy6gMA4/Mp0BkS9qYDE5colWyyuYAQQA0N9H2IleEF237+ZL87nhuyyY7gsClaBiNpm2jLHng==
X-Received: by 2002:a17:902:8e8a:: with SMTP id
	bg10mr13749430plb.12.1580055909825; 
	Sun, 26 Jan 2020 08:25:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.09
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:41 -0800
Message-Id: <a8adb7d23172acb587c259a28aa0c9e2df83f228.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 16/29] go: fix CVE-2019-17596
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:10 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

https://github.com/golang/go/commit/2017d88dbc096381d4f348d2fb08bfb3c2b7ed73

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/go/go-1.12.inc          |  1 +
 .../go/go-1.12/0010-fix-CVE-2019-17596.patch  | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index ed14b175e6..6aecaad75d 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -17,6 +17,7 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
+    file://0010-fix-CVE-2019-17596.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch b/meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch
new file mode 100644
index 0000000000..134cfab737
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch
@@ -0,0 +1,42 @@
+From f1783e1ce44a86c000a7c380a57a805c89c3efbe Mon Sep 17 00:00:00 2001
+From: Katie Hockman <katie@golang.org>
+Date: Mon, 14 Oct 2019 16:42:21 -0400
+Subject: [PATCH] crypto/dsa: prevent bad public keys from causing panic
+
+dsa.Verify might currently use a nil s inverse in a
+multiplication if the public key contains a non-prime Q,
+causing a panic. Change this to check that the mod
+inverse exists before using it.
+
+Fixes CVE-2019-17596
+
+Change-Id: I94d5f3cc38f1b5d52d38dcb1d253c71b7fd1cae7
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/572809
+Reviewed-by: Filippo Valsorda <valsorda@google.com>
+(cherry picked from commit 9119dfb0511326d4485b248b83d4fde19c95d0f7)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/575232
+
+CVE: CVE-2019-17596
+Upstream-Status: Backport [https://github.com/golang/go/commit/2017d88dbc096381d4f348d2fb08bfb3c2b7ed73]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/crypto/dsa/dsa.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/crypto/dsa/dsa.go b/src/crypto/dsa/dsa.go
+index 575314b..2fc4f1f 100644
+--- a/src/crypto/dsa/dsa.go
++++ b/src/crypto/dsa/dsa.go
+@@ -279,6 +279,9 @@ func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool {
+ 	}
+ 
+ 	w := new(big.Int).ModInverse(s, pub.Q)
++	if w == nil {
++		return false
++	}
+ 
+ 	n := pub.Q.BitLen()
+ 	if n&7 != 0 {
+-- 
+2.23.0
+
-- 
2.17.1


