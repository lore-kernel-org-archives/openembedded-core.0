Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3E9C6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 02:01:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7N21GK1005004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:01:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 22 Aug 2016 19:01:15 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2016 09:59:51 +0800
Message-ID: <cover.1471857211.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/1] openssh: fix CVE-2016-6515
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
X-List-Received-Date: Tue, 23 Aug 2016 02:01:18 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 70ccc66126552c0b9b606c7010ea6c3e737b2463:

  systemd-compat-units: Only enable for systemd in DISTRO_FEATURES (2016-08-18 16:52:06 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/openssh
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/openssh

Kai Kang (1):
  openssh: fix CVE-2016-6515

 .../openssh/openssh/fix-CVE-2016-6515.patch        | 57 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.2p2.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-6515.patch

-- 
2.9.3


