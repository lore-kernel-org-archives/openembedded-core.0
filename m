Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C876665EB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 10:13:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5AADeZY006265
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 03:13:40 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 10 Jun 2014 03:13:39 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jun 2014 18:13:38 +0800
Message-ID: <cover.1402395182.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] kexec-tools: Refine kdump device_tree sort
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
X-List-Received-Date: Tue, 10 Jun 2014 10:13:44 -0000
Content-Type: text/plain

The following changes since commit 66d5be204fd339cc84a0ae92d3923a8c1e6f1389:

  bitbake: bitbake: show wildcard appends for bitbake-layers (2014-06-06 10:33:19 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/kexec-tools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/kexec-tools

Chong Lu (1):
  kexec-tools: Refine kdump device_tree sort

 meta/recipes-kernel/kexec/kexec-tools.inc          |  3 +-
 ...kexec-tools-Refine-kdump-device_tree-sort.patch | 82 ++++++++++++++++++++++
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch

-- 
1.8.1.2


