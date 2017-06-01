Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB90A7782F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:38:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v519ciOS008717
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Jun 2017 02:38:44 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 02:38:44 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Jun 2017 05:38:40 -0400
Message-ID: <cover.1496309470.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/2] json-glib,dropbear: upgrade to new version
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
X-List-Received-Date: Thu, 01 Jun 2017 09:38:43 -0000
Content-Type: text/plain

The following changes since commit bd063fa288b49b6e3ea77982d0ccc46610feb1ad:

  tune-mips32*.inc: use consistent comments across all three .inc files (2017-05-30 10:15:20 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/json-glib_dropbear_upgrade
  https://github.com//tree/dengke/json-glib_dropbear_upgrade

Dengke Du (2):
  json-glib: upgrade 1.2.2 -> 1.2.8
  dropbear: upgrade 2016.74 -> 2017.75

 .../dropbear/support-out-of-tree-builds.patch      | 43 ----------------------
 meta/recipes-core/dropbear/dropbear_2016.74.bb     |  7 ----
 meta/recipes-core/dropbear/dropbear_2017.75.bb     |  5 +++
 .../{json-glib_1.2.2.bb => json-glib_1.2.8.bb}     |  4 +-
 4 files changed, 7 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/support-out-of-tree-builds.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2016.74.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2017.75.bb
 rename meta/recipes-gnome/json-glib/{json-glib_1.2.2.bb => json-glib_1.2.8.bb} (82%)

-- 
2.8.1


