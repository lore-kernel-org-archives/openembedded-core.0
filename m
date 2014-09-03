Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9170713C5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 09:10:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s839B084024543
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 02:11:00 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 02:10:59 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 17:05:28 +0800
Message-ID: <cover.1409735063.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] perf: fix issue about package splitting
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
X-List-Received-Date: Wed, 03 Sep 2014 09:11:04 -0000
Content-Type: text/plain

The following changes since commit 83ebcb1f0c6ec48c526d14324b3b2037f0f4fe43:

  bitbake: process: Ensure abnormal exits set an error level (2014-09-02 18:10:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/perf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/perf

Chong Lu (1):
  perf: fix issue about package splitting

 meta/recipes-kernel/perf/perf.bb | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
1.9.1


