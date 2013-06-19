Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21D6A60668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 03:21:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5J3LD7U013397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 20:21:13 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 20:21:12 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 23:21:10 -0400
Message-ID: <cover.1371611649.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] procps: fix that top will quit after cpu offline
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
X-List-Received-Date: Wed, 19 Jun 2013 03:21:12 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

top utiliy fails to read /proc/stat after cpu offline, because Cpu_tot
is still the original cpu numbers when calling cpus_refresh, in which
it is trying to read and sscanf Cpu_tot times /proc/stat.
 
The patch is from procps-3.2.8-2.fc12.src.rpm

The following changes since commit 590010a6525b0e1bc1de73e794764e23404591df:

  core-image-weston: add weston-examples to the image (2013-06-18 17:33:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/procps
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/procps

Wenzong Fan (1):
  procps: fix that top will quit after cpu offline

 .../procps-3.2.8/procps-3.2.7-top-remcpu.patch     |  111 ++++++++++++++++++++
 meta/recipes-extended/procps/procps_3.2.8.bb       |    1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch

-- 
1.7.9.5


