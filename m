Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33F0A6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 08:10:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0I8A2mp019789
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jan 2016 00:10:02 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jan 2016 00:10:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 18 Jan 2016 03:09:57 -0500
Message-ID: <cover.1453104253.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453052640.27999.23.camel@linuxfoundation.org>
References: <1453052640.27999.23.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH V3 0/2] upgrade pax-utils and ghostscript
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
X-List-Received-Date: Mon, 18 Jan 2016 08:10:07 -0000
Content-Type: text/plain

Changed in V3: 
- ghostscript: fix compile failure on arm

Changed in V2: 
- pax-utils: Support autotools
- ghostscript: Backport patches to fix build failure caused by
               '--without-jbig2dec' and '--without-jbig2dec'.

//Hongxu

The following changes since commit 0fe6e2dc7ba02fe03fe2c8434a469580ead6ebcd:

  bitbake: toaster: increase timeout (2016-01-16 10:36:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-11012016
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/upgrade-11012016

Hongxu Jia (2):
  pax-utils: 1.0.5 -> 1.1.4
  ghostscript: 9.16 -> 9.18

 .../pax-utils/files/fix-configure-failure.patch    | 146 +++++++++++++++++++++
 .../{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb}     |  23 +++-
 ...Fix-support-for-building-with-no-jbig2-de.patch |  81 ++++++++++++
 ...part-2-fix-support-for-building-with-a-JP.patch |  48 +++++++
 .../files/do-not-check-local-libpng-source.patch   |  38 ++++++
 .../{ghostscript_9.16.bb => ghostscript_9.18.bb}   |  11 +-
 6 files changed, 339 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/pax-utils/files/fix-configure-failure.patch
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb} (48%)
 create mode 100644 meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.16.bb => ghostscript_9.18.bb} (87%)

-- 
1.9.1


