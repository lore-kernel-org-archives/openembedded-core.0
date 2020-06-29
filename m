Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.9719.1593393356121238346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 18:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,293,1589212800"; 
   d="scan'208";a="95451997"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 09:15:22 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0049B49B10FE
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 09:04:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 09:15:18 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2] gnutls: Modied the license to GPLv2.1+ to keep with LICENSE file.
Date: Mon, 29 Jun 2020 09:15:06 +0800
Message-ID: <1593393306-49972-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0049B49B10FE.A6163
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Please reference to https://gitlab.com/gnutls/gnutls/-/issues/1018.

Upstream-Status: Backport
[https://gitlab.com/gnutls/gnutls/-/merge_requests/1285].

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...license-to-GPLv2.1-to-keep-with-LICENSE-f.patch | 88 ++++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.13.bb       |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch b/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
new file mode 100644
index 0000000..89682b7
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
@@ -0,0 +1,88 @@
+From a5f05cd4bc2bae3803e7cf8d7ae3dfa9abb34110 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Mon, 8 Jun 2020 16:15:07 +0900
+Subject: [PATCH] Modied the license to GPLv2.1+ to keep with LICENSE file.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ lib/x509/krb5.c | 20 +++++++++++---------
+ lib/x509/krb5.h | 20 +++++++++++---------
+ 2 files changed, 22 insertions(+), 18 deletions(-)
+
+diff --git a/lib/x509/krb5.c b/lib/x509/krb5.c
+index 7fe84e651..d68c73757 100644
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
+index d8926af67..815bb28f7 100644
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.13.bb b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
index f56d42a..594cb0f 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
@@ -19,6 +19,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
+           file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch \
 "
 
 SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
-- 
1.8.3.1



