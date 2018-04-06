Return-Path: <charles-antoine.couret@essensium.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DF5AF71974
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 12:54:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u189so3328923wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=essensium-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HTqnrMfCuUs9mLlXYq95lOEiY9y3T0Vq7YUHZgr23fY=;
	b=Cli+8QqRD+jB+sM1s2tsplI0XrVe92Yi9myyhT1CRN+gejG2sn7amO3pfbsCcCVTxo
	8rQCXL3VOnLdagcNa1pb/NvUQpHG9ccD0Viq/C6TeafX0pR7rAKS/4KxxemsNAfeUiNy
	HruGXKgCZKByXagkANl31K4PVOCAosn5Q8aWtTlHEnifbVZZSwKfoJ+M8LUImVbi91WX
	lczTBmiCxDN8KhfRN+c5VP7gmLTlUKAXjbLYVc9DL5a1TofUkmKnB/xBuKNyvk5WosyY
	rEy6u/+x3ENAL8d95agmI4jbDf0j0h45RXgY5NVnsx9qraog9Kzpz2cXqXvUPzQQxvcJ
	dyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HTqnrMfCuUs9mLlXYq95lOEiY9y3T0Vq7YUHZgr23fY=;
	b=LVshAYfqRkcFMqHOnHLBVuMn9vbudOifw5hj+7lULzxCYe4k5alpIKiwaju6PAlWRb
	HzKREpz5nir/3zSG5X2faIG9ExEhiZVmVuN9TESiPtzTSYS2JRqopJ9OrDk4S1qEivam
	ZSzfvcC99DP4n/JihrW/n/PZexN8usH3XKbyKbpBp8PZlEQVyKIubY5lWtf9oMt/DDzV
	j3Ic0n4lcxx7eksZ/dUDbD+hruJTbbm7jOPj8KftW8GXsiJFAYbTo60jo4UqAXMVO4Kr
	xkV8rUJqa8xOjKKOmSYbtRQEG1t8qBmilHQE6DNcjUpxQYZmdGZ8gYgeqVYz4WdOcCGk
	+Gtg==
X-Gm-Message-State: ALQs6tB5SNrhPROHEal6DsrlRp60j3S+v0pGBuI5vhPIbpv3RPvlhWWm
	939Hn9jKqihHJLYYH06ZAInsQ3O19fY=
X-Google-Smtp-Source: AIpwx4+tKrgtK7IA6w9kmDvcRYigy845TfHvo5Um1OmliJRd1Ae5RoBbOSrANIL2ce0RxsJ1c6dBEA==
X-Received: by 10.80.202.8 with SMTP id d8mr6643370edi.227.1523019254631;
	Fri, 06 Apr 2018 05:54:14 -0700 (PDT)
Received: from localhost.localdomain
	([2a02:a03f:409a:6e00:7d53:e685:9f84:3421])
	by smtp.gmail.com with ESMTPSA id k8sm3418456edn.13.2018.04.06.05.54.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 05:54:14 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 14:53:54 +0200
Message-Id: <20180406125354.21247-3-charles-antoine.couret@essensium.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
References: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] perl: add patch to solve libcrypt incompatibility
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
X-List-Received-Date: Fri, 06 Apr 2018 12:54:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Perl's patch submitted to upstream to be compiled along with glibc with libcrypt split.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
---
 .../perl/perl-native_5.24.1.bb                |  1 +
 .../perl-5.26.1-guard_old_libcrypt_fix.patch  | 27 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb     |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
index 48113f05a9..a9ab17d16c 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
@@ -15,6 +15,7 @@ SRC_URI += "\
            file://dynaloaderhack.patch \
            file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
            file://0001-Configure-Remove-fstack-protector-strong-for-native-.patch \
+           file://perl-5.26.1-guard_old_libcrypt_fix.patch \
           "
 
 SRC_URI[md5sum] = "af6a84c7c3e2b8b269c105a5db2f6d53"
diff --git a/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch b/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
new file mode 100644
index 0000000000..bdf8e32dfc
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
@@ -0,0 +1,27 @@
+commit 13e70b397dcb0d1bf4a869b670f041c1d7b730d0
+Author: Bjรถrn Esser <besser82@fedoraproject.org>
+Date:   Sat Jan 20 20:22:53 2018 +0100
+
+    pp: Guard fix for really old bug in glibc libcrypt
+
+Upstream-Status: Pending
+
+diff --git a/pp.c b/pp.c
+index d50ad7ddbf..6510c7b15c 100644
+--- a/pp.c
++++ b/pp.c
+@@ -3650,8 +3650,12 @@ PP(pp_crypt)
+ #if defined(__GLIBC__) || defined(__EMX__)
+ 	if (PL_reentrant_buffer->_crypt_struct_buffer) {
+ 	    PL_reentrant_buffer->_crypt_struct_buffer->initialized = 0;
+-	    /* work around glibc-2.2.5 bug */
++#if (defined(__GLIBC__) && __GLIBC__ == 2) && \
++    (defined(__GLIBC_MINOR__) && __GLIBC_MINOR__ >= 2 && __GLIBC_MINOR__ < 4)
++	    /* work around glibc-2.2.5 bug, has been fixed at some
++	     * time in glibc-2.3.X */
+ 	    PL_reentrant_buffer->_crypt_struct_buffer->current_saltbits = 0;
++#endif
+ 	}
+ #endif
+     }
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index e5b4886a95..66ccd7f0be 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -63,6 +63,7 @@ SRC_URI += " \
         file://perl-errno-generation-gcc5.patch \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
+        file://perl-5.26.1-guard_old_libcrypt_fix.patch \
 "
 
 # Fix test case issues
-- 
2.17.0


