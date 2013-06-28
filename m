Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEBC6AB7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:49:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S7nLei019546
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2013 00:49:21 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 28 Jun 2013 00:49:21 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 28 Jun 2013 15:48:45 +0800
Message-ID: <cover.1372403777.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Disable qt and related packages on mips64 with 64 bits userspace
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
X-List-Received-Date: Fri, 28 Jun 2013 07:49:22 -0000
Content-Type: text/plain

The following changes since commit 8e9501ffa8726d69412d669580d787ffedb88d34:

  populate_sdk_base, adt_installer: abort install if path contains spaces (2013-06-25 17:59:17 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/qt4-mips64
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qt4-mips64

Kai Kang (2):
  qt4*.bbclass: disable build qt on mips64 with 64 bits userspace
  Disable build qt related packagegroups on mips64 with 64 bits
    userspace

 meta/classes/qt4e.bbclass                          |    3 +++
 meta/classes/qt4x11.bbclass                        |    3 +++
 .../packagegroups/packagegroup-core-qt.bb          |    3 +++
 .../packagegroups/packagegroup-core-qt4e.bb        |    3 +++
 .../packagegroup-qt-toolchain-target.inc           |    3 +++
 5 files changed, 15 insertions(+), 0 deletions(-)

-- 
1.7.5.4


