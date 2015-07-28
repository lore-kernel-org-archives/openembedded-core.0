Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72D6C601F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:40:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S9eubB015358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 02:40:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Tue, 28 Jul 2015 02:40:40 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 17:38:09 +0800
Message-ID: <cover.1438076053.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/1] Upgrade lighttpd to 1.4.36
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
X-List-Received-Date: Tue, 28 Jul 2015 09:41:01 -0000
Content-Type: text/plain

The following changes since commit cdabae3ec4684b534e7d613ea96c33739ec01d74:

  bitbake: build: Exit scripts with result of last shell function (2015-07-27 18:04:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/lighttpd
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/lighttpd

Kai Kang (1):
  lighttpd: 1.4.35 -> 1.4.36

 .../0001-mod_cgi-buffers-data-without-bound.patch  | 55 +++++++++++-----------
 .../{lighttpd_1.4.35.bb => lighttpd_1.4.36.bb}     |  9 ++--
 2 files changed, 31 insertions(+), 33 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.35.bb => lighttpd_1.4.36.bb} (93%)

-- 
1.9.1


