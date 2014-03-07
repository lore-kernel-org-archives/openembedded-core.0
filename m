Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DAF2E6E9A3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 09:27:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s279ROVY018591
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Mar 2014 01:27:24 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 7 Mar 2014 01:27:23 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 17:27:21 +0800
Message-ID: <cover.1394183877.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/1] diffutils: enable ptest support
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
X-List-Received-Date: Fri, 07 Mar 2014 09:27:24 -0000
Content-Type: text/plain

Changes since V1:

Modify Makefile of source code instead of create a new Makefile.

The following changes since commit e9554464d42e5972a483ec992c912e6f98c4e090:

  bitbake: runqueue: Fix typo (2014-03-06 22:35:55 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/0307diffutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/0307diffutils

Chong Lu (1):
  diffutils: enable ptest support

 .../diffutils/diffutils-3.3/run-ptest                |  3 +++
 meta/recipes-extended/diffutils/diffutils_3.3.bb     | 20 +++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/run-ptest

-- 
1.8.1.2


