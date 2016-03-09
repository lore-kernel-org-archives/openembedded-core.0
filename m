Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC4926057A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 09:19:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u299JJZ5027730
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Mar 2016 01:19:22 -0800
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Wed, 9 Mar 2016 01:19:17 -0800
From: Zhixiong Chi <Zhixiong.Chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Mar 2016 17:19:40 +0800
Message-ID: <1457515180-31107-1-git-send-email-Zhixiong.Chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libpam: define limits.conf as CONFFILES of package libpam-runtime
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
X-List-Received-Date: Wed, 09 Mar 2016 09:19:24 -0000
Content-Type: text/plain

Based as security reason, the system must limit users to
simultaneous system logins, or a site-defined number.
To avoid overwriting the /etc/security/limits.conf file after
upgrading this rpm package, we will define the file as
CONFFILES of package libpam-runtime.

Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/pam/libpam_1.2.1.bb b/meta/recipes-extended/pam/libpam_1.2.1.bb
index 3e69f11..341ea24 100644
--- a/meta/recipes-extended/pam/libpam_1.2.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.2.1.bb
@@ -168,3 +168,4 @@ CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-auth"
 CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-password"
 CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
 CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-account"
+CONFFILES_${PN}-runtime += "${sysconfdir}/security/limits.conf"
-- 
1.9.1


