Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4EB677E76
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 03:25:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v853PDx7006954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 4 Sep 2017 20:25:13 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Sep 2017 20:25:12 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 5 Sep 2017 11:12:59 +0800
Message-ID: <cover.1504580538.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 0/1] dbus: fix ptest runtime failures
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
X-List-Received-Date: Tue, 05 Sep 2017 03:25:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* Fix typos. It should disable the configure options when ptest is disabled.

The following changes since commit ee5bce2d11e783c0921df47b629025a6b67c44bf:

  kernel-dev: Removed bad reference for creating patches. (2017-09-02 00:52:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/dbus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/dbus

Kai Kang (1):
  dbus: fix ptest runtime failures

 meta/recipes-core/dbus/dbus-test_1.10.20.bb | 3 +++
 meta/recipes-core/dbus/dbus_1.10.20.bb      | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.14.1


