Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 11FE376FC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:33 +0000 (UTC)
Received: by qgx61 with SMTP id 61so119655512qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=f4bpDPgUfypo0cp3mGmXA5jnIHoWT8JN+EKoLKnHUGk=;
	b=MtTjf1MW9HEmFUr6PBg+Cr0WLqu/ASs3mmuMKrKZRFvBpObJR9X37nwgOZBiBi4BlU
	YRDxwkR9BPXj8tAN1sEpWauyQovwTpt0NbaxADakdZO7Z2YbMC//G/0MMUUbToVjgBRt
	Iljg2YxzDWP1MqhNnDxmtjw9V8UaeqKq4/K9VeUjvg8HlEObF721B4V69bJ2tv0NZzpj
	OQ1H8ibBjXbGuqJ5oNTiTmBV5rzDyUfyHNq3w1zetE90qqxcyj0uCYAcmozZI7gWRAG9
	3U13qTqkAPJYzhEqJWjQX0sqNWxHCuDXHm3UNfC2UGECFht5KIqmU1UDXoBb9wH5baI+
	/kIA==
X-Received: by 10.140.23.8 with SMTP id 8mr3690611qgo.67.1442248293684;
	Mon, 14 Sep 2015 09:31:33 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:20 +0000
Message-Id: <455283dc1b384e7b7b82304aac9a2fbb3b04c13e.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 05/12] gummiboot: Fix build warnings seen with gcc5
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:36 -0000

gummiboot uses -mno-sse so we should disble using sse for mfpmath as
well

Fix syntax errors in struct defines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-C-syntax-errors-for-function-declaration.patch | 74 ++++++++++++++++++++++
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  3 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch

diff --git a/meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch b/meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
new file mode 100644
index 0000000..fa50bc4
--- /dev/null
+++ b/meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
@@ -0,0 +1,74 @@
+From 55957faf1272c8f5f304909faeebf647a78e3701 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Sep 2015 07:19:45 +0000
+Subject: [PATCH] console: Fix C syntax errors for function declaration
+
+To address this, the semicolons after the function parameters should be
+replaced by commas, and the last one should be omitted
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/efi/console.c | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/src/efi/console.c b/src/efi/console.c
+index 6206c80..66aa88f 100644
+--- a/src/efi/console.c
++++ b/src/efi/console.c
+@@ -27,8 +27,8 @@
+ struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
+ 
+ typedef EFI_STATUS (EFIAPI *EFI_INPUT_RESET_EX)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
+-        BOOLEAN ExtendedVerification;
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        BOOLEAN ExtendedVerification
+ );
+ 
+ typedef UINT8 EFI_KEY_TOGGLE_STATE;
+@@ -44,29 +44,29 @@ typedef struct {
+ } EFI_KEY_DATA;
+ 
+ typedef EFI_STATUS (EFIAPI *EFI_INPUT_READ_KEY_EX)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
+-        EFI_KEY_DATA *KeyData;
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        EFI_KEY_DATA *KeyData
+ );
+ 
+ typedef EFI_STATUS (EFIAPI *EFI_SET_STATE)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
+-        EFI_KEY_TOGGLE_STATE *KeyToggleState;
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        EFI_KEY_TOGGLE_STATE *KeyToggleState
+ );
+ 
+ typedef EFI_STATUS (EFIAPI *EFI_KEY_NOTIFY_FUNCTION)(
+-        EFI_KEY_DATA *KeyData;
++        EFI_KEY_DATA *KeyData
+ );
+ 
+ typedef EFI_STATUS (EFIAPI *EFI_REGISTER_KEYSTROKE_NOTIFY)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
+-        EFI_KEY_DATA KeyData;
+-        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction;
+-        VOID **NotifyHandle;
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        EFI_KEY_DATA KeyData,
++        EFI_KEY_NOTIFY_FUNCTION KeyNotificationFunction,
++        VOID **NotifyHandle
+ );
+ 
+ typedef EFI_STATUS (EFIAPI *EFI_UNREGISTER_KEYSTROKE_NOTIFY)(
+-        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This;
+-        VOID *NotificationHandle;
++        struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL *This,
++        VOID *NotificationHandle
+ );
+ 
+ typedef struct _EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL {
+-- 
+2.5.1
+
diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
index 91c3db9..376ab54 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -13,6 +13,7 @@ PV = "48+git${SRCPV}"
 SRCREV = "2bcd919c681c952eb867ef1bdb458f1bc49c2d55"
 SRC_URI = "git://anongit.freedesktop.org/gummiboot \
            file://fix-objcopy.patch \
+           file://0001-console-Fix-C-syntax-errors-for-function-declaration.patch \
           "
 
 # Note: Add COMPATIBLE_HOST here is only because it depends on gnu-efi
@@ -28,6 +29,8 @@ EXTRA_OECONF = "--disable-manpages --with-efi-includedir=${STAGING_INCDIR} \
 
 EXTRA_OEMAKE += "gummibootlibdir=${libdir}/gummiboot"
 
+TUNE_CCARGS_remove = "-mfpmath=sse"
+
 do_deploy () {
         install ${B}/gummiboot*.efi ${DEPLOYDIR}
 }
-- 
2.5.2


