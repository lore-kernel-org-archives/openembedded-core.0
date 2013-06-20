Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C77136A901
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 11:18:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5KBIljG004889
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 04:18:47 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 20 Jun 2013 04:18:46 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2013 19:18:43 +0800
Message-ID: <cover.1371726748.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/2 v2] consolekit: fix two QA warnings
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
X-List-Received-Date: Thu, 20 Jun 2013 11:18:45 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Tested with:
DISTRO_FEATURES += 'pam'
WARN_QA = "unsafe-references-in-binaries unsafe-references-in-scripts"

---
The following changes since commit defa05f2085f78d9ec9ada7051c284e1fc72e6c1:

  bdwgc-native: Add missing pkgconfig DEPENDS (2013-06-19 18:03:21 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_consolekit_dbus_0620_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_consolekit_dbus_0620_2

Jackie Huang (2):
  dbus: move libdbus-1.so* to base_libdir
  consolekit: move libck-connector to base_libdir

 meta/recipes-core/dbus/dbus.inc                    |   10 +++++++++-
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   14 +++++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

-- 
1.7.4.1


