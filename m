Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 81BE2794F5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 08:12:03 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s17-v6so5196915plp.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lE7zo6QGoCcYuC63T7S7LHCh5Rg2ff/CPjPCbZA1ztM=;
	b=G5R+jv7YiUKQoVvE8MBrOSNmAJQjw8e9R418vLeg1HgmzyKmSYNGNiUoaD5vWo/qRD
	CGyue5rJpCIu4fTkkFgl9cz/tUcIwhEJqTZCfryctuDXN5aGLOASs+bQ68R/Kvt8BdKJ
	JgIm5yrafwePUEXjsHd+Bp7XJ57KJOj4PrBv1ZGv2iElYW/AY5d0DRNlUsZetdGFmXFb
	Wq/44KIedKABPWOad4/mJBNfVAfKf7dBVYa+8xHdTY109VcmyHE9cIq9anylZ6rchYrG
	o4yBj5Xv5C1UGpy79hzZG0MByQrXgKUS0ys1YkUwVtecTZ2mAcxG8ZhP/DiLT8obY3kE
	J6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lE7zo6QGoCcYuC63T7S7LHCh5Rg2ff/CPjPCbZA1ztM=;
	b=bJX5aR7NFJijYY6xcEd7nRBX09bG1sRRK57mNykB5lN39c/QTaYHgtittASsd5UDy5
	Dzoh0soR8OAFFCECYZYW8eoFzCt0G1/8ZpmmLAsFXiwNW6t9WJ3KCyPmoV2m33ux03PW
	HyyGaJy2BLbg+s6KLfb2ZFjGaB3esZlRgZHcrsNLQeS7iquhB/tbZ3WXok9Y93suQpIZ
	InpZV5zwuJKet6q0qYRVeuyVERa2VYXn/Yqu4bg3wJ5lYpytV+jYHepDOxCq1W3rsBcv
	KW+jdtPOL5wH9tNdaHUlfU0taHJTWjGXIQ2h3QKtPRxRU9k36n4z6mtqrfPcPs7ZTU9k
	lugA==
X-Gm-Message-State: APzg51DHhNMoFOGRBgDnP+WCs+GrfcKRWkSp3yJ7INY/tmhMngio6gY0
	zG7QIum5Py6bxAuFtInJeQ4n8lF3
X-Google-Smtp-Source: ANB0Vdau2VnOmaL5FDLK4vC2Poxf+1LjLISaxteEkp6I+Se/hSIhL/873QkkhPk5oyylZ9h+iRP67w==
X-Received: by 2002:a17:902:b60b:: with SMTP id
	b11-v6mr15166690pls.301.1536999124018; 
	Sat, 15 Sep 2018 01:12:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	p4-v6sm12198424pfb.180.2018.09.15.01.12.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Sep 2018 01:12:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Sep 2018 01:11:54 -0700
Message-Id: <20180915081154.28018-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH] mtools: Fix build with clang
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
X-List-Received-Date: Sat, 15 Sep 2018 08:12:03 -0000
Content-Transfer-Encoding: 8bit

Identify with __clang__ to undefine UNUSED

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mtools/mtools/clang_UNUSED.patch            | 17 +++++++++++++++++
 meta/recipes-devtools/mtools/mtools_4.0.18.bb   |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
new file mode 100644
index 0000000000..6bb9d6a3da
--- /dev/null
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -0,0 +1,17 @@
+Undefine UNUSED macros with clang
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: mtools-4.0.18/sysincludes.h
+===================================================================
+--- mtools-4.0.18.orig/sysincludes.h
++++ mtools-4.0.18/sysincludes.h
+@@ -101,7 +101,7 @@ typedef void *caddr_t;
+ #if defined __GNUC__ && defined __STDC__
+ /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
+ # define PACKED __attribute__ ((packed))
+-# if __GNUC__ == 2 && __GNUC_MINOR__ > 6 || __GNUC__ >= 3
++# if (__GNUC__ == 2 && __GNUC_MINOR__ > 6 || __GNUC__ >= 3) && !defined(__clang__)
+ /* gcc 2.6.3 doesn't have "unused" */		/* mool */
+ #  define UNUSED(x) x __attribute__ ((unused));x
+ #  define UNUSEDP __attribute__ ((unused))
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 91f7b7c610..3c31aca3ad 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -32,6 +32,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://no-x11.gplv3.patch \
            file://0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch \
            file://0001-remove-LOCK_NB-to-use-blocking-request.patch \
+           file://clang_UNUSED.patch \
            "
 
 SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
-- 
2.19.0


