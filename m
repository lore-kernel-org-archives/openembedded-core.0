Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A612760C11
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 10:03:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s09A3Rpn023295
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jan 2014 02:03:27 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 9 Jan 2014 02:03:27 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jan 2014 18:02:10 +0800
Message-ID: <cover.1389259902.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] attr: enable ptest support
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
X-List-Received-Date: Thu, 09 Jan 2014 10:03:26 -0000
Content-Type: text/plain

The following changes since commit 6ee5d95317de77c1cfb6db6f1ab2de77f5fa085e:

  bitbake: fetch2/gitannex: Fix function arguments to match bitbake master (2014-01-08 15:27:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/attr
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/attr

Chong Lu (1):
  attr: enable ptest support

 meta/recipes-support/attr/attr.inc                 | 15 +++-
 .../attr/files/attr-make-ptest-pass.patch          | 82 ++++++++++++++++++++++
 meta/recipes-support/attr/files/run-ptest          |  5 ++
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/files/attr-make-ptest-pass.patch
 create mode 100644 meta/recipes-support/attr/files/run-ptest

-- 
1.8.1.2


