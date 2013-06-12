Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 120B16A984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 12:21:06 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id c10so410989wiw.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 05:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=KZqGV6yR3jGy43XECB63LHpHLWmRbfOIR6V8tJk5aDg=;
	b=j9DkTf/kZZPkDOmwKLSWEialUr0Ksn0rVEZSYepgJKzCbUP9mqRznUWonHhZTydkha
	+eQay5SYKuKvU7ITdtswyEO5n0gZWpemOIRhKwZDxdeSLOrKbentWjBBxbTfto5Ow6xz
	vddrMfp8Yr6spypSj4Wjf1tT5BJ2z5q6SKO/I6crtKPRfEh6aTaR1KTpqu5rhqkcqt3d
	cpxOuJuv8u0fMjAwTwyaXwnHUSzg/Oy0Pm9/t28ALW9QG/cdTVcTc1BRxPoHgHlMcT70
	eBC9eFkHA/J0i3p+zgLivNC7S0TXryMtInzsUBi7VAiG/KziHYs7isbfY970iNJ6oKBU
	SMoA==
X-Received: by 10.180.9.7 with SMTP id v7mr4271723wia.61.1371039666902;
	Wed, 12 Jun 2013 05:21:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fb9sm3076003wid.2.2013.06.12.05.21.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 05:21:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 13:17:41 +0100
Message-Id: <1371039461-21154-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQn7sTEL7lzO6n3mAJyIiTrTPKmY2YsNePEp936rHD5zpYVz28aYLxY9ffwacL8/FWJ4bAC+
Subject: [PATCH] site: add more alignment values for at-spi2-core
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
X-List-Received-Date: Wed, 12 Jun 2013 12:21:07 -0000

x86 and x86_64 values were added in 8c46ec. The x86-64 values were missing an
entry, add MIPS and PowerPC values from myself in qemu, and ARM values from
Martin Jansa.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/site/arm-common     |   10 ++++++++++
 meta/site/ix86-common    |    2 +-
 meta/site/mips-common    |   10 ++++++++++
 meta/site/powerpc-common |    9 +++++++++
 meta/site/x86_64-linux   |    3 ++-
 5 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index cad8027..1893dc0 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -185,3 +185,13 @@ jm_cv_func_working_readdir=yes
 
 # evolution-data-server
 ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
+
+# at-spi2-core
+ac_cv_alignof_char=1
+ac_cv_alignof_dbind_pointer=4
+ac_cv_alignof_dbind_struct=1
+ac_cv_alignof_dbus_bool_t=4
+ac_cv_alignof_dbus_int16_t=2
+ac_cv_alignof_dbus_int32_t=4
+ac_cv_alignof_dbus_int64_t=8
+ac_cv_alignof_double=8
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 5c90865..21fcf38 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -221,7 +221,7 @@ nfsd_cv_broken_setfsuid=${nfsd_cv_broken_setfsuid=0}
 nfsd_cv_func_statfs=${nfsd_cv_func_statfs=statfs2_bsize}
 nfsd_cv_bsd_signals=${nfsd_cv_bsd_signals=yes}
 
-# dbind, in at-spi2-core
+# at-spi2-core
 ac_cv_alignof_char=1
 ac_cv_alignof_dbind_pointer=4
 ac_cv_alignof_dbind_struct=1
diff --git a/meta/site/mips-common b/meta/site/mips-common
index b4aaa7f..89d72cb 100644
--- a/meta/site/mips-common
+++ b/meta/site/mips-common
@@ -44,3 +44,13 @@ ac_cv_alignof_unsigned_long=4
 
 # slrn
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
+
+# at-spi2-core
+ac_cv_alignof_char=1
+ac_cv_alignof_dbind_pointer=4
+ac_cv_alignof_dbind_struct=1
+ac_cv_alignof_dbus_bool_t=4
+ac_cv_alignof_dbus_int16_t=2
+ac_cv_alignof_dbus_int32_t=4
+ac_cv_alignof_dbus_int64_t=8
+ac_cv_alignof_double=8
diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
index a0c4951..efa299c 100644
--- a/meta/site/powerpc-common
+++ b/meta/site/powerpc-common
@@ -3,3 +3,12 @@ ac_cv_alignof_guint32=4
 ac_cv_alignof_guint64=8
 ac_cv_alignof_unsigned_long=4
 
+# at-spi2-core
+ac_cv_alignof_char=1
+ac_cv_alignof_dbind_pointer=4
+ac_cv_alignof_dbind_struct=1
+ac_cv_alignof_dbus_bool_t=4
+ac_cv_alignof_dbus_int16_t=2
+ac_cv_alignof_dbus_int32_t=4
+ac_cv_alignof_dbus_int64_t=8
+ac_cv_alignof_double=8
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 78a3b85..b4434fe 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -125,7 +125,8 @@ ac_cv_func__restgpr_14_x=no
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
-# dbind
+# at-spi2-core
+ac_cv_alignof_char=1
 ac_cv_alignof_dbind_pointer=8
 ac_cv_alignof_dbind_struct=1
 ac_cv_alignof_dbus_bool_t=4
-- 
1.7.10.4


