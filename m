Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFE9606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 09:20:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6K9K8lv026270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 02:20:09 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 20 Jul 2016 02:20:08 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2016 17:17:36 +0800
Message-ID: <cover.1469006054.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix avahi resource temporarily unavailable issue
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
X-List-Received-Date: Wed, 20 Jul 2016 09:20:09 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit aae4c2a629d5314a1ccf17e87827adb080cbbe53:

  ref-manual: Updated the "Recipe Logging Mechanisms" section (2016-07-19 15:04:52 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/avahi
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/avahi

Kai Kang (1):
  avahi: fix resource temporarily unavailable issue

 meta/recipes-connectivity/avahi/avahi_0.6.32.bb    |  2 ++
 .../files/avahi-fix-resource-unavaiable.patch      | 30 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch

-- 
2.6.1


