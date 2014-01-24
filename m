Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7126E721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 10:04:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0OA4Akl019506
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 02:04:10 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 24 Jan 2014 02:04:10 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jan 2014 18:04:20 +0800
Message-ID: <cover.1390557768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] Fixes for run-postinsts
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
X-List-Received-Date: Fri, 24 Jan 2014 10:04:11 -0000
Content-Type: text/plain

This patchset is target to making run-postinsts work on systemd based images
no matter 'package-management' is in IMAGE_FEATURES or not.

//Chen Qi

The following changes since commit 24d5b449e5f4d91119f0d8e13c457618811aadfc:

  libtool-cross/native: Force usage of bash due to sstate inconsistencies (2014-01-23 12:14:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/postinsts-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/postinsts-fixes

Chen Qi (2):
  run-postinsts: remove the init script after a clean start-up
  dpkg: use systemd service for first boot configuration

Ross Burton (3):
  run-postinsts: Add systemd service file
  systemd-compat-units: remove run-postints service
  image.bbclass: fix paths to run-postinsts

 meta/classes/image.bbclass                         |    4 ++--
 meta/recipes-core/systemd/systemd-compat-units.bb  |   19 +----------------
 meta/recipes-devtools/dpkg/dpkg.inc                |   21 +++++++++++++++++--
 .../dpkg/dpkg/dpkg-configure.service               |   17 +++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |    1 +
 .../run-postinsts/run-postinsts/run-postinsts      |   15 +++++++++----
 .../run-postinsts/run-postinsts/run-postinsts.init |    3 +++
 .../run-postinsts}/run-postinsts.service           |    8 +++----
 .../run-postinsts/run-postinsts_1.0.bb             |   22 ++++++++++++++++----
 9 files changed, 76 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service
 create mode 100644 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.init
 rename meta/{recipes-core/systemd/systemd-compat-units => recipes-devtools/run-postinsts/run-postinsts}/run-postinsts.service (63%)

-- 
1.7.9.5


