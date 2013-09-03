Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 084D16BE4C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 12:41:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r83CfwvG022661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 05:41:58 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 3 Sep 2013 05:41:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 20:37:00 +0800
Message-ID: <cover.1378207842.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] glib-2.0: fix a host contamination issue
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
X-List-Received-Date: Tue, 03 Sep 2013 12:41:57 -0000
Content-Type: text/plain

* Changes of V2:
  - Use the patch to modify the file instead of the sed command.

// Robert

The following changes since commit 755f7d9afaab4e7424f5f57587aa45df3807acf0:

  pulseaudio: disable GTK+ by default (2013-09-02 18:04:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/glib-2.0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/glib-2.0

Robert Yang (1):
  glib-2.0: fix a host contamination issue

 .../glib-2.0/glib-2.0-configure-readlink.patch     | 29 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch

-- 
1.8.1.2


