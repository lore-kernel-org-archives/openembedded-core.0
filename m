Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 973C96E8DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 08:06:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2686MfN001668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 00:06:23 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 00:06:22 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Mar 2014 16:06:19 +0800
Message-ID: <cover.1394093112.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Thu, 06 Mar 2014 08:06:27 -0000
Content-Type: text/plain

The following changes since commit a01af0202558e6ed9d16590b3a8d1dd1b95c0374:

  recipes: bump PRs (2014-03-05 17:36:37 +0000)

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


