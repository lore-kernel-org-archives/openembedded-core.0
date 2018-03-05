Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 209D778A53
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:20:50 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v18so17452970wrv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3/2JROxAjnw8n5DES5zBKpHonxRpREt3fSp03SkY8OI=;
	b=0yQNdX1EeuS7TPCUMYBB8ij3LeAzqglebepsnU+E51FAfg4sVYQT4YhURNAlf3SVno
	I8bcK9UiDgZLfiUFL2V6j9f5GWDlfrlo7ZAu+W5mOTGMfI10lSvNDhYQViXjei6iJdAi
	xsmPGdjHIEu3eCVE4UpYp0ovX38t5Ng1qe0cEdxHpytkIjO6jyzSquAFm/UzSLMgtw/Q
	31Dtt1YLj7560ebJbSKE71OUPCB3b8XWao38x6Ok4gxKS533jx78YQ2IN+bnT3suVNNN
	1lfH6G7XxgzuqeROC2pHghtCvwgzxIrfkw0PKxy8KVqQxCYSOQx0FQCHJApkECQ/Foo3
	+PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3/2JROxAjnw8n5DES5zBKpHonxRpREt3fSp03SkY8OI=;
	b=GOxvEpvtPZ9J2BCGQI8UshIU7aARqi1enk1fkpft1b2hmE3EKYXcRmD1uLULoY0Xy8
	s4sxPeHuFjnG2ba89UJGQv99b4AX8hmfJS7FFY7hjQ0TU0/3MzAu0RJG03mWGeBZrtmR
	5CXuYkRNlHEAecU5yLU5vXfM11E51Mbe4HfEdMyn6wz60NA9F0zLpUWNecRbNR3EhT83
	yXs9X+d1cjLuHAPYzPriD9Y3FmRn1bzaAhTGnz3S4ZRatwV49NHHLL6ZGQuFNyIFvt+M
	PoaGCdHJ5zUEl3TyICUfQa1zxuLY8E27QxI7MgsduM5y0DrhDQm57BeDFwNDl2KdW10Y
	nC6Q==
X-Gm-Message-State: APf1xPDDB2Ri+GlHhy6PdyDevrkcm/sFazdWwVpdIoYONMW8a3qBpqde
	aTKDv69UCBfOdOqOn64icEWM9f4j
X-Google-Smtp-Source: AG47ELtfREicE4nHDMoaDfvyGH5Aar7ghfY7B3uoLijVOTVHpQXesTCYiyc38zY+hu46B4mmlz7XHA==
X-Received: by 10.223.144.2 with SMTP id h2mr12767392wrh.114.1520270451693;
	Mon, 05 Mar 2018 09:20:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.20.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:20:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:18 +0000
Message-Id: <20180305172046.21729-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 01/29] dbus: remove upstreamed patch
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
X-List-Received-Date: Mon, 05 Mar 2018 17:20:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...1-configure.ac-explicitely-check-stdint.h.patch | 38 ----------------------
 meta/recipes-core/dbus/dbus_1.12.2.bb              |  1 -
 2 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-configure.ac-explicitely-check-stdint.h.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-configure.ac-explicitely-check-stdint.h.patch b/meta/recipes-core/dbus/dbus/0001-configure.ac-explicitely-check-stdint.h.patch
deleted file mode 100644
index 85acb7b1ca6..00000000000
--- a/meta/recipes-core/dbus/dbus/0001-configure.ac-explicitely-check-stdint.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1bfde222926be624a30a6e4b2cdc2c5064a36298 Mon Sep 17 00:00:00 2001
-From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
-Date: Fri, 29 Jul 2016 01:19:37 +0300
-Subject: [PATCH] configure.ac: explicitely check stdint.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Otherwise HAVE_STDINT_H will not be defined or the var will not be
-picked up from cache so builds could fail with errors like:
-| ../../dbus-1.10.8/dbus/dbus-internals.h:239:8: error: ‘uintptr_t’ undeclared (first use in this function)
-
-Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
-[smcv: fix Autoconf underquoting]
-Reviewed-by: Simon McVittie <simon.mcvittie@collabora.co.uk>
-
-Upstream-Status: Backport [from dbus-1.10]
-
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index cf5c5b9..a228d63 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -699,6 +699,8 @@ AC_CHECK_HEADERS(byteswap.h)
- 
- AC_CHECK_HEADERS(unistd.h)
- 
-+AC_CHECK_HEADERS([stdint.h])
-+
- AC_CHECK_HEADERS(ws2tcpip.h)
- 
- AC_CHECK_HEADERS(alloca.h)
--- 
-2.9.2
-
diff --git a/meta/recipes-core/dbus/dbus_1.12.2.bb b/meta/recipes-core/dbus/dbus_1.12.2.bb
index d923d335586..fb5b69aa47b 100644
--- a/meta/recipes-core/dbus/dbus_1.12.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.2.bb
@@ -16,7 +16,6 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-           file://0001-configure.ac-explicitely-check-stdint.h.patch \
 "
 
 SRC_URI[md5sum] = "3361456cadb99aa6601bed5b48964254"
-- 
2.11.0


