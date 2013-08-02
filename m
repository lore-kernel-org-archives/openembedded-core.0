Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CA4306B22E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 09:46:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r729kjP8005952
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2013 02:46:45 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 2 Aug 2013 02:46:44 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2013 17:46:39 +0800
Message-ID: <cover.1375436283.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] multilib.bbclass: Expand the WHITELISTs with multilib prefix
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
X-List-Received-Date: Fri, 02 Aug 2013 09:46:44 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Tested with:
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
INCOMPATIBLE_LICENSE = "GPLv3"

--
The following changes since commit f192c444c2d88c49738bea4ff4c3af0cc72916de:

  texinfo: Update to 5.1 (2013-07-31 06:56:28 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_gplv3_0801_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_gplv3_0801_2

Jackie Huang (1):
  multilib.bbclass: Expand the WHITELISTs with multilib prefix

 meta/classes/multilib.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

-- 
1.7.4.1


