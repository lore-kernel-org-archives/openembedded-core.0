Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFCB77E13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 08:57:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4J8vFSx026145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 May 2017 01:57:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 19 May 2017 01:57:14 -0700
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 19 May 2017 16:52:45 +0800
Message-ID: <cover.1495183828.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Build bind with threads
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
X-List-Received-Date: Fri, 19 May 2017 08:57:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit ef506f58da3a95fba2696df749b2b81f9c118847:

  cve-check-tool: backport a patch to make CVE checking work (2017-05-18 14:01:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/bind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/bind

Kai Kang (2):
  bind: build with threads and update configure options
  dhcp: build shared libraries

 .../bind/bind/generate-rndc-key.sh                 |   1 +
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |  10 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   6 +-
 .../dhcp/dhcp/build-shared-libs.patch              | 186 +++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb       |   1 +
 5 files changed, 200 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch

-- 
2.10.1


