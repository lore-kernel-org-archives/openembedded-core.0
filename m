Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A275708F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 07:05:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6T754OS000392
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 00:05:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 29 Jul 2014 00:05:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jul 2014 00:05:03 -0700
Message-ID: <cover.1406617454.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] image-vmdk.bbclass: use sda rather than hda
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
X-List-Received-Date: Tue, 29 Jul 2014 07:05:06 -0000
Content-Type: text/plain

The following changes since commit 91ca6b1b2e009381d8e813906654c0958eee7efc:

  lib/oe/rootfs: Improve error message whitespace (2014-07-28 12:20:56 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/vmdk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/vmdk

Robert Yang (1):
  image-vmdk.bbclass: use sda rather than hda

 meta/classes/image-live.bbclass |    2 +-
 meta/classes/image-vmdk.bbclass |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5


