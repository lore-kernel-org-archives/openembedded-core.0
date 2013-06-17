Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD02A60E12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 12:31:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5HCVEsi015191
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:31:14 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 05:31:13 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 20:33:24 +0800
Message-ID: <cover.1371472283.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH 0/2] two patches for alsa-lib
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
X-List-Received-Date: Mon, 17 Jun 2013 12:31:12 -0000
Content-Type: text/plain

The following changes since commit c18249353697f8b3741ae2024308d195671d3598:

  rt-tests: fix error check in hackbench (2013-06-17 13:53:42 +0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib szhang/alsa
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=szhang/alsa

Jesse Zhang (2):
  alsa-lib: Change function type to "static __inline__"
  alsa-lib: check if wordexp is supported in libc

 .../Check-if-wordexp-function-is-supported.patch   | 48 +++++++++++++++++
 .../fix-O0-Optimize-unable-inline-function.patch   | 61 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb    |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch

-- 
1.7.11.7


