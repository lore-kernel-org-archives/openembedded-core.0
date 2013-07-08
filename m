Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 66A696AB93
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 03:17:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r683HK4d027607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Jul 2013 20:17:20 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 7 Jul 2013 20:17:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 7 Jul 2013 23:17:12 -0400
Message-ID: <cover.1373253036.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/3 V2] make DESCRIPTION support newline
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
X-List-Received-Date: Mon, 08 Jul 2013 03:17:18 -0000
Content-Type: text/plain

Changes of V2: 
* Do not auto wrap when there is "\n" in the DESCRIPTION, let the user
  do the manual wrap.

// Robert

The following changes since commit dc86293f0444384e8ae5131fdd10b6cb077164b0:

  bitbake: HOB:Proper handle of SIGINT (2013-07-05 15:52:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/newline
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/newline

Robert Yang (3):
  package_rpm.bbclass: make DESCRIPTION support newline
  package_ipk.bbclass: make DESCRIPTION support newline
  package_deb.bbclass: make DESCRIPTION support newline

 meta/classes/package_deb.bbclass |   14 ++++++++++++--
 meta/classes/package_ipk.bbclass |   13 +++++++++++--
 meta/classes/package_rpm.bbclass |   20 +++++++++++++++-----
 3 files changed, 38 insertions(+), 9 deletions(-)

-- 
1.7.10.4


