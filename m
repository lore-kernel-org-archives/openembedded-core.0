Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF53365DD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 03:15:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I3Fc8c025188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 20:15:39 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 20:15:38 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 11:11:17 +0800
Message-ID: <cover.1408331425.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] piglit: enable ptest support
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
X-List-Received-Date: Mon, 18 Aug 2014 03:15:45 -0000
Content-Type: text/plain

The following changes since commit 59b0f7f01bbac6f1c10ee00382c5136d1f327960:

  chrpath: Drop warning from darwn builds (2014-08-17 10:01:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/piglit
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/piglit

Chong Lu (1):
  piglit: enable ptest support

 meta/recipes-graphics/piglit/piglit/run-ptest |  5 +++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 10 +++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/run-ptest

-- 
1.9.1


