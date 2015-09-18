Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D484060125
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 03:28:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8I3SSq2016302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 20:28:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 17 Sep 2015 20:28:27 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Sep 2015 11:22:22 +0800
Message-ID: <cover.1442546459.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Upgrade bind to fix CVE issues
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
X-List-Received-Date: Fri, 18 Sep 2015 03:28:31 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Build for qemumips and qemux86-64.

The following changes since commit ea562de57590c966cd5a75fda8defecd397e6436:

  qemu: Update to upstream patches (2015-09-14 20:46:40 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/bind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/bind

Kai Kang (1):
  bind: 9.10.2-P4 -> 9.10.3

 .../0001-build-use-pkg-config-to-find-libxml2.patch  | 20 ++++++++++++++------
 .../bind/{bind_9.10.2-P4.bb => bind_9.10.3.bb}       |  4 ++--
 2 files changed, 16 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.2-P4.bb => bind_9.10.3.bb} (96%)

-- 
1.9.1


