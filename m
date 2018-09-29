Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3597998B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:11:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T7BwKP003667
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:11:58 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 00:11:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 15:23:09 +0800
Message-ID: <cover.1538205765.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] multilib: avoid expanding grub and grub-efi to multilib
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
X-List-Received-Date: Sat, 29 Sep 2018 07:11:57 -0000
Content-Type: text/plain

The following changes since commit 4dad1568f8f84ec9de4bf7235822f77a8ee6a413:

  glibc-package.inc: correct intention for deleting /usr/lib as needed (2018-09-27 23:39:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/multilib
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/multilib

Robert Yang (1):
  multilib: avoid expanding grub and grub-efi to multilib

 meta/classes/multilib.bbclass        | 8 ++++++--
 meta/classes/multilib_global.bbclass | 5 ++++-
 meta/conf/multilib.conf              | 4 ++++
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.7.4


