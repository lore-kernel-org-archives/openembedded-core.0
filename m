Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8BDCD1297
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.130215.1712646645644326436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JpgP32hA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646646; x=1744182646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G8KwfBhrlswX0AT2Q5uY4fl06Ta3GRTLgGhhvKi/gp0=;
  b=JpgP32hAMfNi82ZVW1BIxSQX6Mipa6p9STwrJN0VoNOR+sXjh1ic8hxN
   Md3ll4EDaSz2ciNho5jgn0MVqFwkILwI6TnuuD4YZS+xueGB3WBo+FQAH
   UQ1ripWMjUywx33XDmTwXLQm0mZ5swAzNv56lm0TGipDUAXZsn6N/NUyY
   2K8gd7Sype/dYR4Gg7/ttwJqOE9rJ81KI7JyoZJnv767phSLt0IpgEbOh
   Xtuc3Sjs9Ydp9EoP7RblhFz5fftDdOq5cZyEqk2LKm5XaGmRkfKPeoWn4
   yYwbaalgyTuGwBX7m0MhPsDSn1KRRRPGZu0qIOWvjIGTWBCA0kf6+W4up
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="155056931"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="155056931"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:43 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 237D0E9A46
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 55AF2EA0B0
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D90D31EA82C
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 88DFA1A0002;
	Tue,  9 Apr 2024 15:10:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/33] librepo: upgrade 1.17.0 -> 1.17.1
Date: Tue,  9 Apr 2024 15:10:00 +0800
Message-Id: <1712646620-16608-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10-2.388800-10.000000
X-TMASE-MatchedRID: lJXJK5z5GImjz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyXkABvhO7aBvj4t
	lu4+KTBzONQPzQMMcIY4bJd2G5kbyQgZdhNSUCgfuce7gFxhKa1MkOX0UoduuaShvRjfn4cU6+f
	8731wcoUILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFK6+0HOVoSoNS9A3X1uuOBmeC
	LE2iu14C3Ubol29OQnTf4ewF9SxLaZqKCiWKpuTB1kSRHxj+Z5aEANKbBJN13CLmxD0pDZyZFzJ
	QEhbMPx+krPR8gRwV4iuks23f+hyT5VuIha4AdJeXXhejkivZfbN9Oiw7ZBytP7VmP7Drr6zojU
	n4YR+ojwx1fpYFo1NMkWs0jYwiwkXSJ4c3nT+QeTeuX4xo2DEEsY9G/RZ3FCtE8mz+ry/JQhjp7
	5eLVqH1slxAfd+6tXeTjw/FyRX6S/WXZS/HqJ2gtuKBGekqUpnH7sbImOEBR6k8G9Fel51s56bJ
	WiMCDDWmi39gqj/o8TywD6PmvwLqvvA/OoNB1OpNJeCioQPIEF0R+4PeDNyAoboFhu3gSlHpMIC
	0goSy7VRirBk7dv0usjkYn56VGqDVGHlX3Atkd4mTaDVMyoFGA7bUFBqh2V
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198032

From: Wang Mingyu <wangmy@fujitsu.com>

0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch
removed since it's included in 1.17.1

Changelog:
=============
-gpg_gpgme.c: fix build errors with older gcc
-Fix some compiler warnings
-Change header files to match a configured ABI regarding a zchunk support
-Fix building zchunk code if zchunk is enabled

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...me.c-fix-build-errors-with-older-gcc.patch | 36 -------------------
 .../{librepo_1.17.0.bb => librepo_1.17.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch
 rename meta/recipes-devtools/librepo/{librepo_1.17.0.bb => librepo_1.17.1.bb} (88%)

diff --git a/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch b/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch
deleted file mode 100644
index 8727b181b3..0000000000
--- a/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b525cdec3051d1c6ff0c3cd38bf3070b18d6fb50 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 6 Mar 2024 10:13:38 +0100
-Subject: [PATCH] gpg_gpgme.c: fix build errors with older gcc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When selinux is not enabled, older gcc versions error out this way:
-
-| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/hosttools/gcc -DG_LOG_DOMAIN=\"librepo\" -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -Dlibrepo_EXPORTS -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include/libmount -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include/blkid -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-19
 38845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/glib-2.0/include -I/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include/libxml2 -isystem/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/include -O2 -pipe -std=c99 -Wall -fPIC -MD -MT librepo/CMakeFiles/librepo.dir/gpg_gpgme.c.o -MF librepo/CMakeFiles/librepo.dir/gpg_gpgme.c.o.d -o librepo/CMakeFiles/librepo.dir/gpg_gpgme.c.o -c /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgme.c
-| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgme.c: In function ‘lr_gpg_ensure_socket_dir_exists’:
-| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgme.c:135:1: error: label at end of compound statement
-|   135 | exit:
-|       | ^~~~
-
-Ensuring the exit: block is not empty fixes the issue.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/librepo/pull/300]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- librepo/gpg_gpgme.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/librepo/gpg_gpgme.c b/librepo/gpg_gpgme.c
-index c4addb2..47c3153 100644
---- a/librepo/gpg_gpgme.c
-+++ b/librepo/gpg_gpgme.c
-@@ -144,6 +144,7 @@ exit:
-     }
-     freecon(old_default_context);
- #endif
-+    return;
- }
- 
- static gpgme_ctx_t
diff --git a/meta/recipes-devtools/librepo/librepo_1.17.0.bb b/meta/recipes-devtools/librepo/librepo_1.17.1.bb
similarity index 88%
rename from meta/recipes-devtools/librepo/librepo_1.17.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.17.1.bb
index 810191459d..beb8baf8d6 100644
--- a/meta/recipes-devtools/librepo/librepo_1.17.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.17.1.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
-           file://0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch \
            "
 
-SRCREV = "ae727d99086f70f39fba5695af5460e1da908c1b"
+SRCREV = "4ff11d85cb06026943f297bc3e06f047dd73bf0b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


