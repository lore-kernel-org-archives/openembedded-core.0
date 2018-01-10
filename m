Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 583307197B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 01:55:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0A1ta5t010368
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jan 2018 17:55:36 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 9 Jan 2018 17:55:23 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jan 2018 09:53:04 +0800
Message-ID: <cover.1515548571.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/2] rpcbind: fix a freeing issue and an assertion failure
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
X-List-Received-Date: Wed, 10 Jan 2018 01:55:35 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 205cfd702190026e64eed9cae27c05ff62d1637e:

  bitbake: fetch2/__init__: Disable pseudo in runfetchcmd() (2018-01-08 08:48:54 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_rpcbind_20180110_1
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_rpcbind_20180110_1

Jackie Huang (2):
  rpcbind: fix assertion failure
  rpcbind: Stop freeing a static pointer

 ...proc_dump-Fixed-typo-in-memory-leak-patch.patch |  33 +++++++
 ..._callit_com-Stop-freeing-a-static-pointer.patch | 100 +++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb     |   2 +
 3 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch

-- 
2.11.0


