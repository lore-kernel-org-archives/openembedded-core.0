Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDD76AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 22:51:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r79MpPNG006709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 15:51:25 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 9 Aug 2013 15:51:24 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2013 17:51:28 -0500
Message-ID: <1376088690-24013-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] RPM changes
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
X-List-Received-Date: Fri, 09 Aug 2013 22:51:27 -0000
Content-Type: text/plain

We first to a long overdue cleanup and change the RPM_VENDOR_POKY to
RPM_VENDOR_OE.  Then we fix a bug with older RPM packages that has been
found when attempting to install some of the LSB test packages.

The change was verified by <corneliux.stoicescu@intel.com> who reported
the issue to me.

Mark Hatle (2):
  rpm: Change references from RPM_VENDOR_POKY to RPM_VENDOR_OE
  rpm: Enable compatibility with older RPM packages that have invalid
    platforms

 .../rpm/rpm/python-rpm-rpmsense.patch              |  4 ++--
 .../rpm/rpm/rpm-lsb-compatibility.patch            | 24 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |  2 +-
 .../rpm/rpm/rpm-platform-file-fix.patch            |  2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |  8 ++++----
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |  6 +++---
 .../rpm/rpm/rpm-scriptletexechelper.patch          | 22 ++++++++++----------
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  3 ++-
 8 files changed, 48 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch

-- 
1.8.3


