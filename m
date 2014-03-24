Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD5AB6E9D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 08:12:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2O8Cndl008368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 01:12:49 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 24 Mar 2014 01:12:48 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 16:12:46 +0800
Message-ID: <cover.1395648707.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] acl: fix the order of expected output of getfacl
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
X-List-Received-Date: Mon, 24 Mar 2014 08:12:50 -0000
Content-Type: text/plain

The following changes since commit 24979a1f7ecc155cf36f61ffb2d2a32c2fb64734:

  busybox: disable fsck.minix and mkfs.minix (2014-03-23 09:08:54 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/acl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/acl

Chong Lu (1):
  acl: fix the order of expected output of getfacl

 meta/recipes-support/attr/acl.inc                  |   1 +
 ...x-the-order-of-expected-output-of-getfacl.patch | 198 +++++++++++++++++++++
 2 files changed, 199 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch

-- 
1.8.1.2


