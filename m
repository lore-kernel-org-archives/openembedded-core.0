Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2061C71ACD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 01:08:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9E18ros001419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 18:08:53 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 13 Oct 2016 18:08:53 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2016 08:50:09 +0800
Message-ID: <cover.1476345470.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH 0/2] ppp: fix building with linux-4.8
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
X-List-Received-Date: Fri, 14 Oct 2016 01:08:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 371ab635086e2878ada1f00a59c7ec826481ba0a:

  build-appliance-image: Update to master head revision (2016-10-11 23:43:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_ppp-linux-4.8_161008-0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_ppp-linux-4.8_161008-0

Jackie Huang (2):
  Revert "linux-libc-headers: fix in/if.h includes"
  ppp: fix building with linux-4.8

 .../ppp/ppp/ppp-fix-building-with-linux-4.8.patch  | 44 ++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  1 +
 .../0001-ppp-fix-in-if.h-includes.patch            | 83 ----------------------
 .../linux-libc-headers/linux-libc-headers_4.8.bb   |  4 --
 4 files changed, 45 insertions(+), 87 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ppp-fix-in-if.h-includes.patch

-- 
2.8.3


