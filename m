Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBA116065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 07:16:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7G7GY10012474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 00:16:34 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 00:16:33 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 15:16:30 +0800
Message-ID: <cover.1376637245.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] texinfo: handle correctly @enumerate specification greater than 10
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
X-List-Received-Date: Fri, 16 Aug 2013 07:16:35 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:

  meta-skeleton: Add busybox config fragment example (2013-08-13 23:03:44 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_texinfo_mpatrol_0816_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_texinfo_mpatrol_0816_1

Jackie Huang (1):
  texinfo: handle correctly @enumerate specification greater than 10

 .../texinfo-5.1/enumerate_greater_than_ten.patch   |   51 ++++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_5.1.bb       |    1 +
 2 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-5.1/enumerate_greater_than_ten.patch

-- 
1.7.4.1


