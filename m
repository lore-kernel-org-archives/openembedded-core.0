Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33DA0600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 02:57:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9N2vCrY015363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 19:57:12 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Sun, 22 Oct 2017 19:57:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Oct 2017 10:56:34 +0800
Message-ID: <cover.1508727336.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] sstate.bbclass: sstate_hardcode_path(): fix for multilib
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
X-List-Received-Date: Mon, 23 Oct 2017 02:57:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit 3b413a80578caacd9a7f405f3c51a3921d78a60d:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/2ssfixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/2ssfixes

Robert Yang (2):
  useradd.bbclass: print a warn when useradd not found
  sstate.bbclass: sstate_hardcode_path(): fix for multilib

 meta/classes/sstate.bbclass  | 6 +++---
 meta/classes/useradd.bbclass | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.7.4


