Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BEDF6156F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 02:48:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8E2mBZ3022830
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 19:48:11 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 19:48:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 22:48:05 -0400
Message-ID: <cover.1379126654.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] linux-libc-headers: do_install: fix "Argument list too long" error
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
X-List-Received-Date: Sat, 14 Sep 2013 02:48:11 -0000
Content-Type: text/plain

Changes of V2: 
* There was already a patch which tried to fix this issue, so squash the 
  current change into the previous one as Bruce suggested.

// Robert


The following changes since commit a392877e57e07407be0e4fdf056d6e09c26f1ced:

  bitbake: bitbake: xmlrpc: delete unused code BitBakeUIEventServer (2013-09-13 17:45:22 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/linux_headers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/linux_headers

Robert Yang (1):
  linux-libc-headers: do_install: fix "Argument list too long" error

 ...efile.headersinst-install-headers-from-sc.patch |   39 +++++++++++++-------
 1 file changed, 26 insertions(+), 13 deletions(-)

-- 
1.7.10.4


