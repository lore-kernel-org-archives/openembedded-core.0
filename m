Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 373B36E51B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 03:28:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBH3SBUF015746
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 19:28:11 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 16 Dec 2013 19:28:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Dec 2013 19:33:56 +0800
Message-ID: <cover.1387279561.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/2] gcc-4.8/libstdc++-v3: disable sdt
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
X-List-Received-Date: Tue, 17 Dec 2013 03:28:13 -0000
Content-Type: text/plain

The following changes since commit 9daa1de753e58b7f678e68cf307f6028c0c79a6a:

  qemu/local.conf.sample: Add sdl PACKAGECONFIG (2013-12-16 12:13:59 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/gcc_sdt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/gcc_sdt

Robert Yang (2):
  gcc-4.8/libstdc++-v3: disable sdt
  gcc-4.7/gcc: disable sdt from configure.ac to keep compatibility with
    configure

 meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch | 44 ++++++++++--
 .../gcc/gcc-4.8/0031-Disable-sdt.patch             | 80 ++++++++++++++++++++--
 2 files changed, 113 insertions(+), 11 deletions(-)

-- 
1.8.3.1


