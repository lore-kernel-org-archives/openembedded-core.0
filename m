Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15A416CF1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:03:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9HA3Vt7010743
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 03:03:31 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 17 Oct 2013 03:03:30 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Oct 2013 18:03:12 +0800
Message-ID: <1382004192-12678-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.3.3
In-Reply-To: <1382004192-12678-1-git-send-email-ming.liu@windriver.com>
References: <1382004192-12678-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] screen: add pkg_postinst to register entry to /etc/shells
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
X-List-Received-Date: Thu, 17 Oct 2013 10:03:29 -0000
Content-Type: text/plain

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/screen/screen_4.0.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index 1a7eb20..81e418b 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -41,3 +41,8 @@ do_install_append () {
 		fi
 	done
 }
+
+pkg_postinst_${PN} () {
+	touch $D${sysconfdir}/shells
+	grep -q "${bindir}/screen" $D${sysconfdir}/shells || echo ${bindir}/screen >> $D${sysconfdir}/shells
+}
-- 
1.8.3.3


