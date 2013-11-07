Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D5C6A6D3E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 11:05:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA7B3Y4E002980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2013 03:05:00 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 7 Nov 2013 03:03:34 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2013 06:03:32 -0500
Message-ID: <cover.1383821844.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] udev: ship source files to related dbg package
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
X-List-Received-Date: Thu, 07 Nov 2013 11:05:26 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Just ship these sources to their own dbg packages instead of udev-dbg:

    libudev* -> libudev-dbg
    gudev*   -> libgudev-dbg
    others   -> udev-dbg

The following changes since commit d6cc7c8ed76c8b1117cf03c7bd4b0742f98f79b3:

  toolchain-scripts/meta-environment: Further cleanup code duplication (2013-11-06 11:02:27 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/udev-dbg-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/udev-dbg-fix

Wenzong Fan (1):
  udev: ship source files to related dbg package

 meta/recipes-core/udev/udev.inc |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.9.5


