Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A585460EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 09:07:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBB978jA013583
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 01:07:08 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 11 Dec 2013 01:07:07 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Dec 2013 04:07:05 -0500
Message-ID: <cover.1386752117.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] rpcbind: fix init status and exit code
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
X-List-Received-Date: Wed, 11 Dec 2013 09:07:08 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Currently run the '/etc/init.d/rpcbind status' on target, it only exits
with 0/1 and not any prompt messages.

The change get it prints status messages and exit with proper code.This
also allows debian service script to get rpcbind status correctly.

The following changes since commit d754ddcec78f5e264100ceda854e8412679d6866:

  bitbake: process: Add timeout to select call (2013-12-10 17:55:29 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/rpcbind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/rpcbind

Wenzong Fan (1):
  rpcbind: fix init status and exit code

 meta/recipes-extended/rpcbind/rpcbind/init.d |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
1.7.9.5


