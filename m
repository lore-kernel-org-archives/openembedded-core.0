Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2CA773D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 07:57:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBE7vxYe005542
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:57:59 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Dec 2016 23:57:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 23:57:57 -0800
Message-ID: <cover.1481701322.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] oe/path.py: fix for "Argument list too long"
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
X-List-Received-Date: Wed, 14 Dec 2016 07:57:58 -0000
Content-Type: text/plain

* V2
  Fix oe/path.py:copyhardlinktree() as Ross suggested.

* V1
  package_manager.py: fix for "Argument list too long"

// Robert

The following changes since commit 4e412234c37efec42b3962c11d44903c0c58c92e:

  libpcap: Disable exposed bits of WinPCAP remote capture support (2016-12-13 22:47:35 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/long
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/long

Robert Yang (1):
  oe/path.py: fix for "Argument list too long"

 meta/lib/oe/path.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.10.2


