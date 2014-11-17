Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C89ED6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 08:38:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAH8cBTo023990
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 00:38:11 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 17 Nov 2014 00:38:10 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Nov 2014 03:38:08 -0500
Message-ID: <cover.1416213365.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] uprev serf: 1.3.6 -> 1.3.8
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
X-List-Received-Date: Mon, 17 Nov 2014 08:38:21 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Release changes:

Serf 1.3.8 [2014-10-20, from /tags/1.3.8, rxxxx]
  Fix issue #152: CRC calculation error for gzipped http reponses > 4GB.
  Fix issue #153: SSPI CredHandle not freed when APR pool is destroyed.
  Fix issue #154: Disable SSLv2 and SSLv3 as both or broken.

Serf 1.3.7 [2014-08-11, from /tags/1.3.7, r2411]
  Handle NUL bytes in fields of an X.509 certificate. (r2393, r2399)

The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:

  bitbake: cooker.py: fix loginfo op being set to an invalid value (2014-11-12 17:04:50 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/serf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/serf

Wenzong Fan (1):
  serf: 1.3.6 -> 1.3.8

 .../serf/{serf_1.3.6.bb => serf_1.3.8.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.8.bb} (74%)

-- 
1.7.9.5


