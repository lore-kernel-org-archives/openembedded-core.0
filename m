Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4978.1628580134272931824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 00:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17A7MCoY006435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 00:22:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 Aug 2021 00:22:12 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 Aug 2021 00:22:11 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 1/3] gnutls: Enable seccomp if FEATURE is set
Date: Tue, 10 Aug 2021 15:19:25 +0800
Message-ID: <20210810071927.35906-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f2527b5567252c7da4fbd863e119c8114e6debcd)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/gnutls/gnutls_3.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
index 51d472c828..3e1958c969 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] = "3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-PACKAGECONFIG ??= "libidn"
+PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-- 
2.29.2

