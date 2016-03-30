Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E5E6B60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 07:26:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U7Q6R5002161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 00:26:06 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Mar 2016 00:25:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 00:25:43 -0700
Message-ID: <cover.1459322726.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] linux-yocto 4.4: enable overlayfs
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
X-List-Received-Date: Wed, 30 Mar 2016 07:26:06 -0000
Content-Type: text/plain

The following changes since commit b3f80743cd1b9a15a8ee4d20c2a54c2f6cbcd13c:

  gcc: Backport fixes for musl ssp configuration (2016-03-29 23:19:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib 3ea4adf79751bb2c9a140cec6900490b52c5a6b6
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3ea4adf79751bb2c9a140cec6900490b52c5a6b6

Robert Yang (1):
  linux-yocto 4.4: enable overlayfs

 meta/recipes-kernel/linux/linux-yocto_4.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4


