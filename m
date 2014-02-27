Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 248C26E8DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:32:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1R9WRpG023225
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Feb 2014 01:32:27 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 27 Feb 2014 01:32:26 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Feb 2014 17:32:18 +0800
Message-ID: <cover.1393493207.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, saul.wold@intel.com
Subject: [PATCH 0/1] qt-mobility:fix qmetaobjectbuilder fails to build
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
X-List-Received-Date: Thu, 27 Feb 2014 09:32:27 -0000
Content-Type: text/plain

https://qt.gitorious.org/qt-mobility/qt-mobility/commit/f102053b28009b3094b0e5777177208afa6097c5
It is the backported patch linked above, although it is a bit large.

Test Steps:
1) Add below lines to local.conf:
# Remove '-fpermissive' option from CXXFLAGS
export BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
export TARGET_CXXFLAGS = "${TARGET_CFLAGS}"

2) bitbake qt-mobility-x11 && bitbake qt-mobility-embedded

//Hongxu

The following changes since commit e47afff7d812c74f8091d85facfdf34d6a1b698e:

  runqemu: Use readlink instead of realpath (2014-02-25 21:29:53 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/qt-mobility
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/qt-mobility

Hongxu Jia (1):
  qt-mobility: fix metaobjectbuilder build errors

 .../fix_metaobjectbuilder_build_err.patch          | 4707 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    1 +
 2 files changed, 4708 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/fix_metaobjectbuilder_build_err.patch

-- 
1.8.1.2


