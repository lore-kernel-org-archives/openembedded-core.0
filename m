Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18772605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 09:02:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4C92iVY029311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 02:02:44 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 12 May 2014 02:02:43 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 May 2014 17:02:41 +0800
Message-ID: <cover.1399885162.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] dbus: Update to 1.8.2 version
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
X-List-Received-Date: Mon, 12 May 2014 09:02:45 -0000
Content-Type: text/plain

The following changes since commit 50067e069c8cbc0d339819494f22ae7623d47aa6:

  bitbake: fetch2/perforce: Ensure command has a default (2014-05-11 15:26:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/dbus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/dbus

Chong Lu (1):
  dbus: Update to 1.8.2 version

 .../{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb}    |   3 +-
 meta/recipes-core/dbus/dbus.inc                    |   4 +-
 ...orrect-address-when-using-address-systemd.patch | 193 ---------------------
 ...y-freeing-if-error-during-listing-service.patch |  45 -----
 meta/recipes-core/dbus/dbus/ptest.patch            | 125 +++++++------
 meta/recipes-core/dbus/dbus_1.6.18.bb              |   4 -
 meta/recipes-core/dbus/dbus_1.8.2.bb               |   4 +
 7 files changed, 77 insertions(+), 301 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb} (96%)
 delete mode 100644 meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.18.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb

-- 
1.8.1.2


