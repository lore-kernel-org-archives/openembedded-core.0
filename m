Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7324D6A975
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 10:01:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6FA1hbk019887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 03:01:43 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 15 Jul 2013 03:01:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 18:01:21 +0800
Message-ID: <cover.1373881980.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] acl: fix the acl self contained test cases issue
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
X-List-Received-Date: Mon, 15 Jul 2013 10:01:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We added the acl self contained test cases in our testing layer and found
failures, this patch fixed the test scripts that cause the issues.

--
The following changes since commit 4f5009dcbbeb27bdf5dcaebb3b457fecef410ebe:

  security_flags: Add addition recipes to the non pie list (2013-07-10 09:40:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_acl_0715_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_acl_0715_2

Jackie Huang (1):
  acl: fix the acl self contained test cases issue

 meta/recipes-support/attr/acl.inc                  |    4 +-
 .../attr/files/fix-acl-test-cases.patch            |  210 ++++++++++++++++++++
 2 files changed, 213 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/attr/files/fix-acl-test-cases.patch

-- 
1.7.4.1


