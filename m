Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAA756FB3B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 03:27:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s543Rdme004796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jun 2014 20:27:39 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 3 Jun 2014 20:27:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 4 Jun 2014 11:27:24 +0800
Message-ID: <cover.1401852113.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V3 0/3] upgrade: apr to 1.5.1 and apr-utils to 1.5.3
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
X-List-Received-Date: Wed, 04 Jun 2014 03:27:45 -0000
Content-Type: text/plain

Change in apr V3:
- To help future bisecting this should be merged with the upgrade patch
  into a single upgrade-and-fix patch.
- Remove the 'tools' dir creation, it always existed. And it caused
  gen_test_char unexpected rebuilt at do_install time.

Change in apr V2:
- In the target build, use $BUILD_CC to compile tools/gen_test_char rather
  than to invoke the native one.

//Hongxu

The following changes since commit 894df445fa71a170397c6e0b4960a89ef20a4230:

  guile: Update to 2.0.11 version (2014-05-21 19:50:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-apr
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-apr

Hongxu Jia (3):
  apr-util: upgrade to 1.5.3
  apr: upgrade to 1.5.1
  apr: fix cross compiling failed

 .../apr/{apr-util_1.5.2.bb => apr-util_1.5.3.bb}   |  4 +-
 meta/recipes-support/apr/apr/upgrade-and-fix.patch | 48 ++++++++++++++++++++++
 .../apr/{apr_1.4.8.bb => apr_1.5.1.bb}             |  7 ++--
 3 files changed, 54 insertions(+), 5 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.5.2.bb => apr-util_1.5.3.bb} (93%)
 create mode 100644 meta/recipes-support/apr/apr/upgrade-and-fix.patch
 rename meta/recipes-support/apr/{apr_1.4.8.bb => apr_1.5.1.bb} (90%)

-- 
1.8.1.2


