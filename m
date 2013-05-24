Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3C660974
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:56:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4O9v0GO023192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 02:57:00 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 24 May 2013 02:56:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 May 2013 17:56:57 +0800
Message-ID: <cover.1369389192.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1]cracklib: do_compile failed on RHEL5.8 in which glibc version less than 2.9
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
X-List-Received-Date: Fri, 24 May 2013 09:56:59 -0000
Content-Type: text/plain

The following changes since commit 350c36fcd97e8ef223b91e548d39c346c1c4cb29:

  bitbake: test/fetch: Allow the conditional network tests to work under python 2.6 (2013-05-17 12:42:08 +0300)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-cracklib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-cracklib

Hongxu Jia (1):
  cracklib: do_compile failed on RHEL5.8 in which glibc version less
    than 2.9

 .../0003-cracklib-fix-do_compile-failed.patch      |  189 ++++++++++++++++++++
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb  |    4 +-
 2 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0003-cracklib-fix-do_compile-failed.patch

-- 
1.7.10.4


