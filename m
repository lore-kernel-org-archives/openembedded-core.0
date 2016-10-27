Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 906AB71A5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 07:49:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9R7nZ3r023069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 00:49:35 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 27 Oct 2016 00:49:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Oct 2016 15:49:46 +0800
Message-ID: <afc940231d3061121537c5eabd3abca6a40b73d3.1477554547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1477554547.git.Qi.Chen@windriver.com>
References: <cover.1477554547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: fix file location of rpm2cpio.real
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
X-List-Received-Date: Thu, 27 Oct 2016 07:49:34 -0000
Content-Type: text/plain

rpm2cpio is in ${PN}-common, but rpm2cpio.real is in ${PN}. This seperation
is really weird. Put them both in ${PN}-common.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 1332397..85eb5fe 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -384,10 +384,10 @@ FILES_${PN} =  "${bindir}/rpm \
 		${localstatedir}/lib/wdj \
 		${bindir}/rpm.real \
 		${bindir}/rpmconstant.real \
-		${bindir}/rpm2cpio.real \
 		"
 
 FILES_${PN}-common = "${bindir}/rpm2cpio \
+		${bindir}/rpm2cpio.real \
 		${bindir}/gendiff \
 		${sysconfdir}/rpm \
 		${localstatedir}/spool/repackage \
-- 
1.9.1


