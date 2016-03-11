Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76E3E6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 07:40:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2B7ePBC001745
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 10 Mar 2016 23:40:25 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 10 Mar 2016 23:40:24 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 11 Mar 2016 02:40:21 -0500
Message-ID: <cover.1457681854.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] fix python3 do_configure failed on meta-fsl-ppc with MACHINE = "p1022ds"
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
X-List-Received-Date: Fri, 11 Mar 2016 07:40:29 -0000
Content-Type: text/plain

Changed in V1: Fix python3 rather than gcc-cross to minimize the influence.

//Hongxu

The following changes since commit 37b61b059031e3c272a929b834e12fd83f46598c:

  siteinfo: Add ppc64le support. (2016-03-10 23:13:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-python3-gcc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (1):
  python3: fix do_configure check platform triplet error

 .../tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch | 52 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.1.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch

-- 
1.9.1


