Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20C9179492
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 02:30:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8L2TnpB031960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 19:29:59 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 20 Sep 2018 19:29:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Sep 2018 10:34:55 +0800
Message-ID: <cover.1537497265.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] runqemu: fix handling of SIGTERM and the problem of line wrapping
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
X-List-Received-Date: Fri, 21 Sep 2018 02:30:09 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 18b90a0fd9bdc00d82140fbd55761e9cea308fb1:

  yocto-uninative: Add aarch64 uninative tarball checksum (2018-09-20 09:06:00 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/runqemu-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/runqemu-fix

Chen Qi (1):
  runqemu: fix handling of SIGTERM and the problem of line wrapping

 scripts/runqemu | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
1.9.1


