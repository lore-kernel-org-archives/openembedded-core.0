Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6B626002A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 07:50:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0Q7oHDh015148
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 23:50:17 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sat, 25 Jan 2014 23:50:16 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jan 2014 15:50:13 +0800
Message-ID: <cover.1390722297.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V3 0/1] acl: enable ptest support
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
X-List-Received-Date: Sun, 26 Jan 2014 07:50:17 -0000
Content-Type: text/plain

Changes since V2:
Delete incorrect patch for test cases and add gpasswd command in run-ptest.

The following changes since commit 1a9226f140f578f11696abf1a3c989fae1d4c14a:

  libtool-cross/native: Force usage of bash due to sstate inconsistencies (2014-01-23 12:18:05 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/acl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/acl

Chong Lu (1):
  acl: enable ptest support

 meta/recipes-support/attr/acl.inc       | 14 +++++++++++++-
 meta/recipes-support/attr/acl/run-ptest |  7 +++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/acl/run-ptest

-- 
1.8.1.2


