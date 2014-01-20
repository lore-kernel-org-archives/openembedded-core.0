Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFC846E51F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:42:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0KBgPsV007814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 03:42:25 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 20 Jan 2014 03:42:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 19:42:33 +0800
Message-ID: <cover.1390210254.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1 V3] sstate.bbclass: remove previous version's stamp
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
X-List-Received-Date: Mon, 20 Jan 2014 11:42:25 -0000
Content-Type: text/plain

* V3: (Fix RP's comments)
  - Avoid matching multiple tasks
  - Fix the removing for BB_SIGNATURE_HANDLER = "noop".

* V2: (Fix RP's comments)
  - Use STAMPCLEAN instead of STAMP
  - Respect to the extrainf

// Robert

The following changes since commit b908caca1af1d4150eafd3d3001ea19599657270:

  poky-tiny.conf: Add PACKAGECONFIG to disable opkg-utils python dependencies (2014-01-19 17:18:04 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/clean_stamp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/clean_stamp

Robert Yang (1):
  sstate.bbclass: remove previous version's stamp

 meta/classes/sstate.bbclass | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

-- 
1.8.3.1


