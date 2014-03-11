Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 845D8617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 07:23:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2B7N6id027459
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 00:23:06 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 00:23:05 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Mar 2014 15:23:03 +0800
Message-ID: <cover.1394522537.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] ltp: Don't link against libfl
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
X-List-Received-Date: Tue, 11 Mar 2014 07:23:06 -0000
Content-Type: text/plain

The following changes since commit 5f81d9d1fa537445d5da49e12de1e16300e94552:

  bitbake: runqueue: Use SIGCHLD instead of polling waitpid (2014-03-10 11:10:02 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/ltp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/ltp

Chong Lu (1):
  ltp: Don't link against libfl

 .../ltp/ltp/ltp-Do-not-link-against-libfl.patch    | 31 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140115.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/ltp-Do-not-link-against-libfl.patch

-- 
1.8.1.2


