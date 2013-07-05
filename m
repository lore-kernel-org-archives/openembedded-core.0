Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F222C6077F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 10:18:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r65AIPlT008581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Jul 2013 03:18:25 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 5 Jul 2013 03:18:25 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jul 2013 18:18:09 +0800
Message-ID: <cover.1373019324.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: wenzhong.fan@windriver.com
Subject: [PATCH 0/2] Block some packages build for mips64 with 64 bit userspace
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
X-List-Received-Date: Fri, 05 Jul 2013 10:18:25 -0000
Content-Type: text/plain

Set COMPATIBLE_HOST for web-webkit, webkit-gtk and packagegroup-core-image-lsb to block them build for mips64 with 64 bit userspace

The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:

  bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/mips64
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/mips64

Kai Kang (2):
  webkit: set COMPATIBLE_HOST for mips64
  packagegroup-core-lsb: set COMPATIBLE_HOST to mips64

 .../packagegroups/packagegroup-core-lsb.bb         |    2 ++
 meta/recipes-sato/web/web-webkit_git.bb            |    3 +++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    3 +++
 3 files changed, 8 insertions(+)

-- 
1.7.9.5


