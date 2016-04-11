Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6F76FFD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 19:49:26 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a140so26767759wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=qxhKbJc6ivgZCuyCcVj/8I4GUO+l5ulkdzpfHApdAbw=;
	b=xEHr3qhY0arbR/6DrFudmQ26iE7FuvKvddb2uDvyGc5UN74lb+HjBi9eZ1n6jS/qaq
	o1m3IbxfAS0BCV+UMdqwJtF4Dj99jeeEQmxdJ9vedZu+mFTVXk/RdQqUvhsF83XuYBvq
	Tcz7IGX6ME8hlIvf7qFkEFfXq8EC27ggkRYZF7wmT4VsDgMV1evCOXshexZXaLdTveRx
	dQb3tjjlr3BNbtcEB8ps/6xQEmK/7uhX7w4JVZP/kg43zg7DsZWWGZIuhg5ksXEBXFTa
	E3V0xumDosvu6u2tYuisDZ6g1zEAGFuUXMfyojuPB0AvW8u09o7yZNqtl3yZfGIz9KNm
	6pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qxhKbJc6ivgZCuyCcVj/8I4GUO+l5ulkdzpfHApdAbw=;
	b=JJvODqL+e1X0fYLg0chN4vc3DmEI1zSZWyUiyNBPJ1LYMTC3Ky52gpYX2M3md8+M5A
	lZnNUSbZu1KGrehkSZy392UwKb/tBM8vR3lx1LIcD6TwxYAgLVuqmjao4X9KERAeh3s4
	eVk6On2zLgZbcTf+xJODwZXNOnglDxYT7heNpfGlwjk/4CweSe6xHAURq3d8mVjT5YC2
	DRnzBVgPveuKl9SfXVhbxcHFYfP4UpK63CNfsZhRmqxoj0hCyGAe+0372x4zrA5DmneG
	nwjrO9Idczl7ElAHyOGYECMM7kuvaDpq6+HaJ9vpVsUqP0MiNdr5AQhtD/sUVpnSRQfk
	FFbw==
X-Gm-Message-State: AD7BkJLUnzr2AKCFKhp+vnOug0uXH8e950Y1Cq3mb4b2J2dehz69TV8sc4pe0zQ87UBS0Kxc
X-Received: by 10.28.30.86 with SMTP id e83mr19420439wme.18.1460404167179;
	Mon, 11 Apr 2016 12:49:27 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm18996531wmf.8.2016.04.11.12.49.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 12:49:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 20:49:22 +0100
Message-Id: <1460404163-11259-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/2] meta/site: remove sizeof_off_t
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
X-List-Received-Date: Mon, 11 Apr 2016 19:49:28 -0000

The size of off_t depends on whether large file support is enabled through
preprocessor flags, so we can't cache this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/site/arm-linux       | 1 -
 meta/site/ix86-common     | 1 -
 meta/site/nios2-linux     | 1 -
 meta/site/powerpc32-linux | 1 -
 meta/site/x32-linux       | 1 -
 meta/site/x86_64-linux    | 1 -
 6 files changed, 6 deletions(-)

diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index 14b1889..e6b9a72 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -10,7 +10,6 @@ ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
 ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
 ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
 ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
 ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
 ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
 ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 135c305..23b8e8b 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -17,7 +17,6 @@ ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
 ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
 ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
-ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
 ac_cv_sizeof_uid_t=${ac_cv_sizeof_uid_t=4}
 ac_cv_sizeof_gid_t=${ac_cv_sizeof_gid_t=4}
 ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=4}
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 434f09b..95c09d3 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -241,7 +241,6 @@ ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
 ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
 ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
 ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
 ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
 ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
 ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index a7744fb..06d961f 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -203,7 +203,6 @@ apr_cv_pthreads_cflags=${apr_cv_pthreads_cflags=-pthread}
 apr_cv_pthreads_lib=${apr_cv_pthreads_lib=-lpthread}
 ac_cv_func_mmap=${ac_cv_func_mmap=yes}
 ac_cv_file__dev_zero=${ac_cv_file__dev_zero=yes}
-ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
 ac_cv_sizeof_pid_t=${ac_cv_sizeof_pid_t=4}
 ac_cv_socklen_t=${ac_cv_socklen_t=yes}
 ac_cv_struct_rlimit=${ac_cv_struct_rlimit=yes}
diff --git a/meta/site/x32-linux b/meta/site/x32-linux
index 36ee68b..308d6e2 100644
--- a/meta/site/x32-linux
+++ b/meta/site/x32-linux
@@ -1,6 +1,5 @@
 # general
 ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
-ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
 ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=8}
 ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
 ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 573a907..ebdcf69 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -18,7 +18,6 @@ ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=8}
 ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
 ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=8}
 ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
 ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
 ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
 ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-- 
2.8.0.rc3


