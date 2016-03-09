Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE71760124
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 11:18:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u29BIlbN012006
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 03:18:47 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 03:18:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 9 Mar 2016 06:18:44 -0500
Message-ID: <cover.1457522031.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] fix python3 do_configure failed on meta-fsl-ppc with MACHINE = "p1022ds"
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
X-List-Received-Date: Wed, 09 Mar 2016 11:18:50 -0000
Content-Type: text/plain

I am running a world build, and find build failures:
- usdpaa do_compile failed
  Send patch to meta-freescale mailing list "usdpaa: remove default -mcpu=e500mc64 in Makefile"

- pywbem do_compile failed
  Already a patch in oe-dev for discussing "[oe] [meta-python][jethro][fido][PATCH] python-m2crypto: fix SSLv2 symbol issue"

The world build is not finished, and other failures is in analysis.

//Hongxu

The following changes since commit 5ac3dc76a5afc2ed35b1abfc8e330e0c580eadf0:

  image.bbclass: fix incomplete .rootfs customization (2016-03-07 22:10:54 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-python3-gcc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (1):
  tune-ppce500v2.inc: explicitly set gcc float

 meta/conf/machine/include/tune-ppce500v2.inc | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1


