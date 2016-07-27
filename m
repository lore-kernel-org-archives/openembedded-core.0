Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 061C473190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:28:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6R9S28o030135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:28:02 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 02:28:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 02:27:53 -0700
Message-ID: <3ee267475703df27122f6fdd3c862d61954e200d.1469609666.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469609666.git.liezhi.yang@windriver.com>
References: <cover.1469609666.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/9] mdadm: remove duplicated udev setting from FILES_${PN}
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
X-List-Received-Date: Wed, 27 Jul 2016 09:28:03 -0000
Content-Type: text/plain

bitbake.conf already sets it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_3.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.4.bb
index 513a3ce..261054e 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.4.bb
@@ -46,8 +46,6 @@ do_install() {
 	autotools_do_install
 }
 
-FILES_${PN} += "${base_libdir}/udev/rules.d/*.rules"
-
 inherit ptest
 
 do_compile_ptest() {
-- 
2.9.0


