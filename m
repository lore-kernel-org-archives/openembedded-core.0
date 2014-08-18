Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61E84610F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 05:23:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I5Ngwj026580
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 22:23:43 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 22:23:42 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 13:19:20 +0800
Message-ID: <cover.1408339065.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] fix two ptest issues
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
X-List-Received-Date: Mon, 18 Aug 2014 05:23:47 -0000
Content-Type: text/plain

The following changes since commit 59b0f7f01bbac6f1c10ee00382c5136d1f327960:

  chrpath: Drop warning from darwn builds (2014-08-17 10:01:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/perl

Chong Lu (2):
  perl: fix the output format of all tests
  strace: fix ptest execution failure

 meta/recipes-devtools/perl/perl-5.20.0/run-ptest        |  2 +-
 .../strace/strace-4.8/Makefile-ptest.patch              | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
1.9.1


