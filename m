Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC886B061
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 09:02:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA9927F9005588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 01:02:07 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 01:01:44 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 17:12:20 +0800
Message-ID: <cover.1541754618.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] Integrated the jitter entropy daemon to work around slow boot problems for Yocto
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
X-List-Received-Date: Fri, 09 Nov 2018 09:02:07 -0000
Content-Type: text/plain

The following changes since commit bb06900a1f29fdd4066f6d7e7a961d230c2e9438:

  perf: Disable libunwind for ARC & RISCV64 (2018-11-06 12:15:59 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/add-jitter
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/add-jitter

Hongxu Jia (2):
  rng-tools: 5 -> 6.6
  libjitterentropy: add 2.1.2

 .../files/0001-fix-do_install-failure-on-oe.patch  | 33 ++++++++
 .../libjitterentropy/libjitterentropy_2.1.2.bb     | 28 +++++++
 ...1-If-the-libc-is-lacking-argp-use-libargp.patch | 10 +--
 ...rgument-to-control-the-libargp-dependency.patch | 21 +++--
 .../rng-tools/rng-tools/read_error_msg.patch       | 98 ----------------------
 .../rng-tools-5-fix-textrels-on-PIC-x86.patch      | 35 +++++---
 .../rng-tools/rng-tools/underquote.patch           | 27 ++++--
 .../rng-tools/{rng-tools_5.bb => rng-tools_6.6.bb} | 25 ++++--
 8 files changed, 139 insertions(+), 138 deletions(-)
 create mode 100644 meta/recipes-support/libjitterentropy/files/0001-fix-do_install-failure-on-oe.patch
 create mode 100644 meta/recipes-support/libjitterentropy/libjitterentropy_2.1.2.bb
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/read_error_msg.patch
 rename meta/recipes-support/rng-tools/{rng-tools_5.bb => rng-tools_6.6.bb} (72%)

-- 
2.7.4


