Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA4A26FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:51:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2E6pqDo011913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:51:52 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:51:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:51:47 -0700
Message-ID: <cover.1457938004.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] [jethro] Consolidated pull
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
X-List-Received-Date: Mon, 14 Mar 2016 06:51:53 -0000
Content-Type: text/plain

The following changes since commit 1a51bb69b7600cbe6da7928d46e0ea058a14ccde:

  base: check for existing prefix when expanding names in PACKAGECONFIG (2016-03-11 23:15:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Chang Rebecca Swee Fun (1):
  make 4.1: fix segfault when ttyname fails

Jagadeesh Krishnanjanappa (1):
  license.bbclass: fix host contamination warnings for license files

Mariano Lopez (1):
  dhcp: CVE-2015-8605

Peter Kjellerstedt (1):
  lib/oe/patch: Make GitApplyTree._applypatch() support read-only
    .git/hooks

 meta/classes/license.bbclass                       |   10 ++
 meta/lib/oe/patch.py                               |   26 +++--
 .../dhcp/dhcp/CVE-2015-8605.patch                  |   99 ++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |    1 +
 ...-SV-43434-Handle-NULL-returns-from-ttynam.patch |   63 +++++++++++++
 meta/recipes-devtools/make/make_4.1.bb             |    2 +
 6 files changed, 187 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
 create mode 100644 meta/recipes-devtools/make/make-4.1/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch

-- 
1.7.9.5


