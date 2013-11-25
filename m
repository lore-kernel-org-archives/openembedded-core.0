Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 333D16D877
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 08:17:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAP8HDhs025726
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 00:17:13 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Mon, 25 Nov 2013 00:17:12 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Nov 2013 16:17:06 +0800
Message-ID: <cover.1385367202.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/1] Fix x264 libraries install directory when enable multilib
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
X-List-Received-Date: Mon, 25 Nov 2013 08:17:14 -0000
Content-Type: text/plain

The following changes since commit 6ddb9bf0976169fde7eee16d70a83210aa354416:

  bitbake: perforce: Fix path subdirectory issues (2013-11-24 12:25:37 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/x264
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/x264

Kai Kang (1):
  x264: install libraries to right directory when enable multilib

 meta/recipes-multimedia/x264/x264_git.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.1.2


