Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 385CE65CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 10:52:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sABAq9XC020871
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Nov 2014 02:52:09 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 11 Nov 2014 02:52:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 11 Nov 2014 18:52:02 +0800
Message-ID: <cover.1415699201.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/3] fix install package "postinst-intercept oprofileui avahi" to image failed
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
X-List-Received-Date: Tue, 11 Nov 2014 10:52:13 -0000
Content-Type: text/plain

Changed in V2:
- Drop the fix of pointercal-xinput, it didn't generate recipe_name
  on purpose.
- Rename package, from avahi-daemon to avahi, and oprofileui-viewer
  to oprofileui, add RPROVIDES for compatibility

vim local.conf
...
IMAGE_INSTALL_append = " oprofileui avahi"
...

bitbake core-image-minimal

//Hongxu

The following changes since commit 7bd03ac24114b2c6015144a37e0c3fb4037baea6:

  bitbake: toastergui: fix invalid build url usage (2014-11-06 16:45:23 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-nonexist-pkg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nonexist-pkg

Hongxu Jia (3):
  avahi.inc: rename package to use avahi to instead of avahi-daemon
  oprofileui: rename package to use oprofileui to instead of
    oprofileui-viewer
  postinst-intercept: rename recipe for nativesdk only

 meta/recipes-connectivity/avahi/avahi.inc          | 29 +++++++++++-----------
 ..._1.0.bb => nativesdk-postinst-intercept_1.0.bb} |  6 ++---
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |  8 +++---
 3 files changed, 21 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/postinst-intercept/{postinst-intercept_1.0.bb => nativesdk-postinst-intercept_1.0.bb} (83%)

-- 
1.9.1


