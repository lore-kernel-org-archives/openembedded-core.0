Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 224DE73D37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 09:30:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3L9Ugdq028920
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 02:30:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 21 Apr 2015 02:30:42 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Apr 2015 17:30:45 +0800
Message-ID: <cover.1429608585.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix Yocto#5539 and Yocto#7137
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
X-List-Received-Date: Tue, 21 Apr 2015 09:30:42 -0000
Content-Type: text/plain

The following changes since commit c9b06c79ed8a082d1b385e9f61721aeeda9bf1af:

  init-install-efi.sh: fix gummiboot entry installation (2015-04-21 07:19:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/bug-5539-7137
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/bug-5539-7137

Chen Qi (2):
  shadow: fix `su' behaviour
  bash: explicitly define NON_INTERACTIVE_LOGIN_SHELLS in CFLAGS

 meta/recipes-extended/bash/bash.inc                |  5 +++++
 .../0001-su.c-fix-to-exec-command-correctly.patch  | 25 ----------------------
 meta/recipes-extended/shadow/shadow.inc            |  5 ++++-
 3 files changed, 9 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-su.c-fix-to-exec-command-correctly.patch

-- 
1.9.1


