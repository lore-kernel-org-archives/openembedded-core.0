Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7C76B5FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:15:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0A9FGKB027589
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 01:15:16 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 10 Jan 2014 01:15:15 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 17:13:52 +0800
Message-ID: <cover.1389344939.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] acl: enable ptest support
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
X-List-Received-Date: Fri, 10 Jan 2014 09:15:17 -0000
Content-Type: text/plain

The following changes since commit 6ee5d95317de77c1cfb6db6f1ab2de77f5fa085e:

  bitbake: fetch2/gitannex: Fix function arguments to match bitbake master (2014-01-08 15:27:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/acl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/acl

Chong Lu (1):
  acl: enable ptest support

 meta/recipes-support/attr/acl.inc                  |  15 +-
 .../attr/acl/acl-make-ptest-pass.patch             | 457 +++++++++++++++++++++
 meta/recipes-support/attr/acl/run-ptest            |   5 +
 3 files changed, 476 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/acl/acl-make-ptest-pass.patch
 create mode 100644 meta/recipes-support/attr/acl/run-ptest

-- 
1.8.1.2


