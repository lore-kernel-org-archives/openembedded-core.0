Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC04710C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 05:53:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s825rgen005474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Sep 2014 22:53:43 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Sep 2014 22:53:42 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 01:53:39 -0400
Message-ID: <cover.1409628729.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] pango / ptest: clean CFLAGS for host binary
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
X-List-Received-Date: Tue, 02 Sep 2014 05:53:46 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The binary gen-all-unicode needs to be compiled for the host
architecture, the CFLAGS passed to target system could cause
build issues for it.

Such as if CFLAGS includes ARM specific flag '-mapcs-frame',
then it will cause build errors:

  cc1: error: unrecognized command line option "-mapcs-frame" 

The following changes since commit bb00d83675a1293ee8d7a3ac22cf01243fa2397b:

  conf: Account for eglibc->glibc move (2014-09-01 18:03:06 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/fix-pango
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/fix-pango

Wenzong Fan (1):
  pango / ptest: clean CFLAGS for host binary

 meta/recipes-graphics/pango/pango.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


