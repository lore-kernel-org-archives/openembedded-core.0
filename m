Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DBA0E65D40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 06:28:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9O6S4oE007230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 23:28:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 23:28:03 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 14:25:15 +0800
Message-ID: <cover.1414131798.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 0/1] kmod: fix debuginfo is missing in shared library
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
X-List-Received-Date: Fri, 24 Oct 2014 06:28:09 -0000
Content-Type: text/plain

Change since v2:
pack kernel modules in test cases to avoid strip command failed

The following changes since commit ad065f94acb0bfb81e33935890a1db251d6e2979:

  ref-manual: Minor edits to variables. (2014-10-23 15:20:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/kmod
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/kmod

Chong Lu (1):
  kmod: fix debuginfo is missing in shared library

 meta/recipes-kernel/kmod/kmod/run-ptest | 1 +
 meta/recipes-kernel/kmod/kmod_git.bb    | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
1.9.1


