Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5164.1594188871395335511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 23:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,326,1589212800"; 
   d="scan'208";a="95920460"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 14:14:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1DD064CE4BD0
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 14:14:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 14:14:24 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v3] Modied the license to GPLv2.1+ to keep with LICENSE file.
Date: Wed, 8 Jul 2020 14:14:24 +0800
Message-ID: <1594188864-88267-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 1DD064CE4BD0.A9315
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Please reference to https://gitlab.com/gnutls/gnutls/-/issues/1018.

Upstream-Status: Backport
[https://gitlab.com/gnutls/gnutls/-/merge_requests/1285].

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...se-to-GPLv2.1-to-keep-with-LICENSE-f.patch | 88 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch b/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
new file mode 100644
index 0000000000..1a3191dfb0
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
@@ -0,0 +1,88 @@
+From c0ae3f659c6c130d151378ba4d7d861e3b7b970f Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 8 Jul 2020 14:50:27 +0900
+Subject: [PATCH] Modied the license to GPLv2.1+ to keep with LICENSE file.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ lib/x509/krb5.c | 20 +++++++++++---------
+ lib/x509/krb5.h | 20 +++++++++++---------
+ 2 files changed, 22 insertions(+), 18 deletions(-)
+
+diff --git a/lib/x509/krb5.c b/lib/x509/krb5.c
+index 7fe84e6..d68c737 100644
+--- a/lib/x509/krb5.c
++++ b/lib/x509/krb5.c
+@@ -1,21 +1,23 @@
+ /*
+  * Copyright (C) 2015 Red Hat, Inc.
+  *
++ * Author: Nikos Mavrogiannopoulos
++ *
+  * This file is part of GnuTLS.
+  *
+- * GnuTLS is free software: you can redistribute it and/or modify it
+- * under the terms of the GNU General Public License as published by
+- * the Free Software Foundation, either version 3 of the License, or
+- * (at your option) any later version.
++ * The GnuTLS is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public License
++ * as published by the Free Software Foundation; either version 2.1 of
++ * the License, or (at your option) any later version.
+  *
+- * GnuTLS is distributed in the hope that it will be useful, but
++ * This library is distributed in the hope that it will be useful, but
+  * WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * General Public License for more details.
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>
+  *
+- * You should have received a copy of the GNU General Public License
+- * along with this program.  If not, see
+- * <https://www.gnu.org/licenses/>.
+  */
+ 
+ #include <config.h>
+diff --git a/lib/x509/krb5.h b/lib/x509/krb5.h
+index d8926af..815bb28 100644
+--- a/lib/x509/krb5.h
++++ b/lib/x509/krb5.h
+@@ -1,21 +1,23 @@
+ /*
+  * Copyright (C) 2015 Red Hat, Inc.
+  *
++ * Author: Nikos Mavrogiannopoulos
++ *
+  * This file is part of GnuTLS.
+  *
+- * GnuTLS is free software: you can redistribute it and/or modify it
+- * under the terms of the GNU General Public License as published by
+- * the Free Software Foundation, either version 3 of the License, or
+- * (at your option) any later version.
++ * The GnuTLS is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public License
++ * as published by the Free Software Foundation; either version 2.1 of
++ * the License, or (at your option) any later version.
+  *
+- * GnuTLS is distributed in the hope that it will be useful, but
++ * This library is distributed in the hope that it will be useful, but
+  * WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * General Public License for more details.
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>
+  *
+- * You should have received a copy of the GNU General Public License
+- * along with this program.  If not, see
+- * <https://www.gnu.org/licenses/>.
+  */
+ 
+ #ifndef GNUTLS_LIB_X509_KRB5_H
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index a285e5a1f1..cc0454a561 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -19,6 +19,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
+           file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.17.1



