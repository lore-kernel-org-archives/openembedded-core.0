Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 26B1277058
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:47 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id 65so142175618pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fpDbPKk7k0vC0W1zAv+lv3Jy9Y032yzowXLAVFQNKn4=;
	b=C9EHXYyxxFT8pHjaUs9XtNYgcrBlNlVjCL/1DDMZkuhtIbdPAjTdjll/IJx1wSkQ8c
	kg7mSBLMyL8rSaP5G2noerzI2VztN5g1vYUSFfpHhUgg7qIscdPx3ne7XsbCPQeWew69
	/WJsa3cWWDslibo/ajzrAwRp5m2Sp4jlQXWJ9GsHvds+h+iM30R6WQQaviBcymTeI5jE
	nsJsnJIKtXbDX9fzOrhGugSS3iITNoNfu7dk3joW45q8nOeFsvhJgF/FcopLN1IkapSd
	M8LDzWquMPh3fLNYe2VmJ3BlOp/Z3BDscRCLTnqqdJt0jt/lEpZVJlbU14ZitI5GX1G7
	C5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=fpDbPKk7k0vC0W1zAv+lv3Jy9Y032yzowXLAVFQNKn4=;
	b=i3vtRoz0qKg3wU0JfvgMGKlDma3F7VyZdhlePVlYktlcjIqfHaQ6Dzjze28AqBIE3B
	cCM02jxDMsBM3kDzaO/334Qxt7xBAqkPaK4AVTwacEVnYrVMQwDoBeh3wOXdVWChHfbK
	QuVRkU/p5d+q1CQ0upKnNjHaA0xItcK/+VHKdHVKoasB1fl99H/yO4+y+O7bD5UcImbU
	XgzVVCmh4BHZOnJkmiIEm589qmP5lMZHon+DlrGgEJmKZNpH4+C5+ofmWa3Lo1YNnsEU
	JbH1zmZL3SLBgb24rDTvBfrvVZTjkVk6LL4PVThyHL3jezq5G0da4yiTkOz/2U1gA8My
	qHmg==
X-Gm-Message-State: ALoCoQmeClmL1lyUzjpCKqm7mca15EUHoc23lAfuULev9w/GxVKQRbHkn/TFEzotCWWCBvSiLLFZLQL25r0I8XiXyx5IF1gLyQ==
X-Received: by 10.98.79.140 with SMTP id f12mr28877486pfj.102.1453030668555;
	Sun, 17 Jan 2016 03:37:48 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:27 -0800
Message-Id: <4db181ab873afe453a8203c7f10a9e08a5e4f41c.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 54/73] btrfs-tools: Disable backtrace on musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:48 -0000

musl does not support backtrace APIs
include limit.h for PATH_MAX definition

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-btrfs-corrupt-blocks-Include-limits.h.patch | 34 ++++++++++++++++++++++
 .../btrfs-tools/btrfs-tools_4.3.1.bb               |  3 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-corrupt-blocks-Include-limits.h.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-corrupt-blocks-Include-limits.h.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-corrupt-blocks-Include-limits.h.patch
new file mode 100644
index 0000000..35bd021
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-corrupt-blocks-Include-limits.h.patch
@@ -0,0 +1,34 @@
+From 57f55247af39173d10c6332bd147a5169c478628 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Jan 2016 18:58:27 -0800
+Subject: [PATCH] btrfs-corrupt-blocks: Include limits.h
+
+limits.h is needed for PATH_MAX definition
+
+Fixes
+| btrfs-corrupt-block.c: In function 'corrupt_dir_item':
+| btrfs-corrupt-block.c:478:12: error: 'PATH_MAX' undeclared (first use in this function)
+|   char name[PATH_MAX];
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ btrfs-corrupt-block.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/btrfs-corrupt-block.c b/btrfs-corrupt-block.c
+index 0b26903..c908b7e 100644
+--- a/btrfs-corrupt-block.c
++++ b/btrfs-corrupt-block.c
+@@ -21,6 +21,7 @@
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <getopt.h>
++#include <limits.h>
+ 
+ #include "kerncompat.h"
+ #include "ctree.h"
+-- 
+2.7.0
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.3.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.3.1.bb
index e6b0132..339668c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.3.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.3.1.bb
@@ -15,11 +15,14 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 SRCREV = "7c3394ed9ef2063a7256d4bc078a485b6f826bc5"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://fix-parallel.patch \
+           file://0001-btrfs-corrupt-blocks-Include-limits.h.patch \
 "
 
 inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF += "--disable-documentation"
+EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
+
 
 do_configure_prepend() {
       sh autogen.sh
-- 
2.7.0


