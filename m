Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE786C00A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 05:38:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8B5chGd012706
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 22:38:43 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 10 Sep 2013 22:38:42 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2013 13:38:27 +0800
Message-ID: <cover.1378877737.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/1] Exclude midori from mips64 temporarily
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
X-List-Received-Date: Wed, 11 Sep 2013 05:38:42 -0000
Content-Type: text/plain

The following changes since commit 6b4f7e4b26c51f0c1517c0a697031e7bc488b76f:

  systemd.bbclass: get the correct /lib directory (2013-09-10 23:15:16 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/midori
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/midori

Kai Kang (1):
  midori: excluded from mips64 temporarily

 meta/recipes-sato/midori/midori_0.5.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.8.1.2


