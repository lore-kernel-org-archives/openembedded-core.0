Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3E05605BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 05:27:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9R5RQ0j003147
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 22:27:27 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 26 Oct 2014 22:27:26 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Oct 2014 13:24:22 +0800
Message-ID: <cover.1414387265.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/1] kmod: fix debuginfo is missing in shared library
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
X-List-Received-Date: Mon, 27 Oct 2014 05:27:38 -0000
Content-Type: text/plain

Change since V2:
Delete the modules after test cases have ran.

The following changes since commit ad065f94acb0bfb81e33935890a1db251d6e2979:

  ref-manual: Minor edits to variables. (2014-10-23 15:20:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/kmod
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/kmod

Chong Lu (1):
  kmod: fix debuginfo is missing in shared library

 meta/recipes-kernel/kmod/kmod/run-ptest | 2 ++
 meta/recipes-kernel/kmod/kmod_git.bb    | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
1.9.1


