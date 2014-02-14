Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFB566EFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 09:47:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1E9lTIB008097
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 01:47:29 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 14 Feb 2014 01:47:28 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2014 17:47:25 +0800
Message-ID: <cover.1392371084.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/2] flex: upgrade to 2.5.38 and enable ptest support
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
X-List-Received-Date: Fri, 14 Feb 2014 09:47:29 -0000
Content-Type: text/plain

The following changes since commit b60ed2d0fd86a3ae5ce7facbb044677aa7ec2889:

  bitbake: runqueue: Ensure we do run 'masked' setscene tasks if specified as targets (2014-02-13 17:57:20 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/flex
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/flex

Chong Lu (2):
  flex: upgrade to 2.5.38
  flex: enable ptest support

 meta/recipes-devtools/flex/files/run-ptest         | 29 ++++++++++++++++++++++
 meta/recipes-devtools/flex/flex.inc                | 21 ++++++++++++++--
 .../flex/{flex_2.5.37.bb => flex_2.5.38.bb}        |  4 +--
 3 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100755 meta/recipes-devtools/flex/files/run-ptest
 rename meta/recipes-devtools/flex/{flex_2.5.37.bb => flex_2.5.38.bb} (57%)

-- 
1.8.1.2


