Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1A5B77340
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 06:16:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u136GKeP000366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 22:16:20 -0800 (PST)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 2 Feb 2016 22:16:19 -0800
From: Zhixiong Chi <Zhixiong.Chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Feb 2016 14:16:42 +0800
Message-ID: <1454480202-5265-1-git-send-email-Zhixiong.Chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mktemp: lower the priority of standalone mktemp package
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
X-List-Received-Date: Wed, 03 Feb 2016 06:16:20 -0000
Content-Type: text/plain

Lower the priority of the standalone mktemp package, so that
finally the mktemp command installed into SDK image is
coreutils.mktemp.

coreutils.mktemp is widely extended to support more feature,
and could not break some existing scripts and common usecases.

For example: at least three 'X's, and mktemp XXX.pdf(do not
have to be the trailing character for 'X')

Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
---
 meta/recipes-extended/mktemp/mktemp_1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
index d22668c..9accc6e 100644
--- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
+++ b/meta/recipes-extended/mktemp/mktemp_1.7.bb
@@ -27,7 +27,7 @@ do_install_append () {
 
 ALTERNATIVE_${PN} = "mktemp"
 ALTERNATIVE_LINK_NAME[mktemp] = "${base_bindir}/mktemp"
-ALTERNATIVE_PRIORITY = "200"
+ALTERNATIVE_PRIORITY = "60"
 
 ALTERNATIVE_${PN}-doc = "mktemp.1"
 ALTERNATIVE_PRIORITY_${PN}-doc = "300"
-- 
1.9.1


