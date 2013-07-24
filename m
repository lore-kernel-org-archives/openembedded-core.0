Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1F3A60629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 09:07:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6O97SJi014154
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 02:07:29 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 24 Jul 2013 02:07:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jul 2013 17:07:21 +0800
Message-ID: <cover.1374653739.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/2]fix invalid options while invoking reboot on lsb image
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
X-List-Received-Date: Wed, 24 Jul 2013 09:07:29 -0000
Content-Type: text/plain

Invoke reboot is not easy to trace the result, invoke status also could
verify this issue.

Test Case:

*On host: build core-image-lsb

*On target:
~# . /etc/init.d/functions
~# status sshd
sshd (pid  670) is running...

//Hongxu


The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-pidof
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-pidof

Hongxu Jia (2):
  sysvinit: pidof add -m option for lsbinitscripts
  lsbinitscripts: remove x permission on functions

 .../sysvinit-2.88dsf/pidof-add-m-option.patch      | 189 +++++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   1 +
 meta/recipes-extended/lsb/lsbinitscripts_9.48.bb   |   2 +-
 3 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-2.88dsf/pidof-add-m-option.patch

-- 
1.8.1.2


