Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED75560557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 07:57:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA77v8KX006892
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 23:57:08 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 6 Nov 2014 23:57:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 15:57:00 +0800
Message-ID: <cover.1415346812.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] fix install package "postinst-intercept pointercal-xinput oprofileui avahi" to image failed
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
X-List-Received-Date: Fri, 07 Nov 2014 07:57:12 -0000
Content-Type: text/plain

vim local.conf
...
IMAGE_INSTALL_append = " pointercal-xinput oprofileui avahi"
...

bitbake core-image-minimal

//Hongxu

The following changes since commit 9bfd0dee4f585825f27d314c4fd7cd26cf93da79:

  poky-tiny.conf: remove inherit of blacklist (2014-11-04 15:14:23 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-nonexist-pkg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nonexist-pkg

Hongxu Jia (4):
  avahi.inc: use avahi-daemon as avahi's provider
  oprofileui: use oprofileui-viewer as oprofileui's provider
  pointercal-xinput: add the missing ALLOW_EMPTY
  postinst-intercept: rename recipe for nativesdk only

 meta/recipes-connectivity/avahi/avahi.inc                          | 2 ++
 ...stinst-intercept_1.0.bb => nativesdk-postinst-intercept_1.0.bb} | 6 +++---
 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb   | 1 +
 meta/recipes-kernel/oprofile/oprofileui_git.bb                     | 7 ++++---
 4 files changed, 10 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/postinst-intercept/{postinst-intercept_1.0.bb => nativesdk-postinst-intercept_1.0.bb} (83%)

-- 
1.9.1


