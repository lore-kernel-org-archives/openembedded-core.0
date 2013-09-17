Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2BF76C8B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 05:31:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8H5VNSa018887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 22:31:23 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 16 Sep 2013 22:31:21 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Sep 2013 13:31:18 +0800
Message-ID: <cover.1379395520.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libunistring: remove the test to convert euc-jp in configure
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
X-List-Received-Date: Tue, 17 Sep 2013 05:31:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 1ab0813c819d3b785178faa458486efa6992c636:

  linux-yocto/3.10: genericx86 meta data factoring (2013-09-14 08:36:23 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_guile-libunstring_0916_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_guile-libunstring_0916_1

Jackie Huang (1):
  libunistring: remove the test to convert euc-jp in configure

 ...conv-m4-remove-the-test-to-convert-euc-jp.patch |   36 ++++++++++++++++++++
 .../libunistring/libunistring_0.9.3.bb             |    4 ++-
 2 files changed, 39 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch

-- 
1.7.4.1


