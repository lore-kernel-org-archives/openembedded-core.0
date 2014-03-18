Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE7F06E78E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 07:11:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2I7BKbb028260
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 00:11:20 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 18 Mar 2014 00:11:20 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Mar 2014 15:11:17 +0800
Message-ID: <cover.1395126237.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Tue, 18 Mar 2014 07:11:24 -0000
Content-Type: text/plain

Changes since V1:

It can't check IMAGE_FEATURES in a non-image recipe.
When ptest doesn't be included in DISTRO_FEATURES, we need RPROVIDES.

The following changes since commit 1f16ca9fba325f5ddbb1edad5bbad78d990de5e0:

  bitbake: hob: sync after image deploy (2014-03-17 15:57:35 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/dbus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/dbus

Chong Lu (1):
  dbus: fix a hard dependency about dbus-ptest

 meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => dbus-test_1.6.18.bb} | 0
 meta/recipes-core/dbus/dbus.inc                                      | 5 ++++-
 2 files changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => dbus-test_1.6.18.bb} (100%)

-- 
1.8.1.2


