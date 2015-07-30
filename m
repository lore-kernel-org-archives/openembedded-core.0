Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F13AC7638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 05:21:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6U5LDIc027088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 22:21:13 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Wed, 29 Jul 2015 22:20:54 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 13:20:23 +0800
Message-ID: <1438233623-13827-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH v2] tzdata: Add marking for config files in recipe
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
X-List-Received-Date: Thu, 30 Jul 2015 05:21:17 -0000
Content-Type: text/plain

The tzdata recipe does not mark the /etc/timezone file and
/etc/localtime link as configuration files. An on target update would
then overwite the user modified versions of those files.
Add those files in CONFFILES_${PN}.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-extended/tzdata/tzdata_2015e.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tzdata/tzdata_2015e.bb b/meta/recipes-extended/tzdata/tzdata_2015e.bb
index 9179d7b..92389a9 100644
--- a/meta/recipes-extended/tzdata/tzdata_2015e.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2015e.bb
@@ -203,3 +203,5 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/zone.tab             \
                 ${datadir}/zoneinfo/iso3166.tab          \
                 ${datadir}/zoneinfo/Etc/*"
+
+CONFFILES_${PN} += "${sysconfdir}/timezone ${sysconfdir}/localtime"
-- 
1.7.9.5


