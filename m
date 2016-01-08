Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 66BC87705F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:53 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id 6so270216381qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QlVOwoz4b3fAt/QfkBFYXGArRiwPVnKfDk8GLxYkBrc=;
	b=0DSJ2Mt6V9EyB90y4ZZwxi5MPwJVqWbCjjta4LhCH5XeZKSXggmCMVVAEzlbb0skrS
	7vsgiGmKTR36y1nki7A5/hd8AW4zUCQRbXxpuqqw7p5zzPGculziU9u+TC84/fVbFFL1
	g582Ey9ogX4LWI4GFu1TXjxTTgRjW/UnWzfF91AG6Q+FeRud0DRalO/nExOPVSKgrO7d
	IG6H8i/7jHyRk67noYfPSxBVN6HnXUGePiksGtsoR9dQ9fPQZT5C6yJn8FOK47G8bMLH
	2MNKUgGleIK2pJBMKvu6ioosuDXhOHahNUIsC1oXwIcFmla7UfZ1Jx9y6f+qZFIowHUn
	13IQ==
X-Received: by 10.140.255.9 with SMTP id a9mr78431992qhd.103.1452248394048;
	Fri, 08 Jan 2016 02:19:54 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:07 +0000
Message-Id: <51f9e3688c0a62b740217e62a64665c170931e1f.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 39/53] webkitgtk: Update patch status
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch     | 2 +-
 .../webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch    | 2 +-
 meta/recipes-sato/webkit/webkitgtk/clang.patch                          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
index 146087b..d7e4ef6 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
@@ -7,7 +7,7 @@ We dont have backtrace() implemented on non-glibc libc's on linux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
+Upstream-Status: Accepted
 
  Source/WTF/wtf/Assertions.cpp | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
index c57fcde..77ebf37 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
@@ -9,7 +9,7 @@ let ctype be used on non-glibc ( musl ) C library
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Submitted
+Upstream-Status: Accepted
 
  Source/JavaScriptCore/runtime/Options.cpp                    | 2 +-
  Source/WTF/wtf/DisallowCType.h                               | 2 +-
diff --git a/meta/recipes-sato/webkit/webkitgtk/clang.patch b/meta/recipes-sato/webkit/webkitgtk/clang.patch
index ef77755..e526713 100644
--- a/meta/recipes-sato/webkit/webkitgtk/clang.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/clang.patch
@@ -8,7 +8,7 @@ Source/JavaScriptCore/assembler/ARM64Assembler.h:2857:33: error: cannot initiali
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
 
 Index: webkitgtk-2.8.5/Source/JavaScriptCore/assembler/ARM64Assembler.h
 ===================================================================
-- 
2.7.0


