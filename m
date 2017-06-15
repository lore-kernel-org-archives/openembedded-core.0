Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 39857783A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:09:04 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5FC96xN029965
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:09:06 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v5FC95LT008835;
	Thu, 15 Jun 2017 14:09:05 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 8E6E042EB;
	Thu, 15 Jun 2017 14:09:05 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 14:08:32 +0200
Message-Id: <1497528519-19425-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v3 0/7] libxml2: Fix multiple CVEs
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
X-List-Received-Date: Thu, 15 Jun 2017 12:09:07 -0000

Fix CVE:
 - CVE-2017-0663
 - CVE-2017-9047
 - CVE-2017-9048
 - CVE-2017-9049
 - CVE-2017-9050
 - CVE-2017-5969
 - Sync necessary changes for CVE fixing from master.

Andrej Valek (7):
  libxml2: Disable LeakSanitizer when running API tests
  libxml2: Avoid reparsing and simplify control flow in
    xmlParseStartTag2
  libxml2: Fix CVE-2017-9047 and CVE-2017-9048
  libxml2: Fix CVE-2017-9049 and CVE-2017-9050
  libxml2: Fix CVE-2017-5969
  libxml2: Fix CVE-2017-0663
  libxml2: Revert "Add an XML_PARSE_NOXXE flag to block all entities
    loading even local"

 .../libxml/libxml2/CVE-2016-9318.patch             | 207 --------
 .../libxml/libxml2/libxml2-CVE-2017-0663.patch     |  40 ++
 .../libxml/libxml2/libxml2-CVE-2017-5969.patch     |  62 +++
 .../libxml2-CVE-2017-9047_CVE-2017-9048.patch      | 103 ++++
 .../libxml2-CVE-2017-9049_CVE-2017-9050.patch      | 291 ++++++++++
 ...ibxml2-fix_and_simplify_xmlParseStartTag2.patch | 590 +++++++++++++++++++++
 meta/recipes-core/libxml/libxml2/runtest.patch     |  25 +-
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   6 +-
 8 files changed, 1111 insertions(+), 213 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_CVE-2017-9048.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch

-- 
2.1.4


