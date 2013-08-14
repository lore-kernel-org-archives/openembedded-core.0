Return-Path: <Yang.Shi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE80D600A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 16:47:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7EGkvDA014677
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Aug 2013 09:46:57 -0700 (PDT)
Received: from localhost.localdomain (147.11.152.86) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 14 Aug 2013 09:46:57 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 09:41:53 -0700
Message-ID: <1376498514-23057-1-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: Revert kernel-moudle- workaround for out-of-tree module package
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
X-List-Received-Date: Wed, 14 Aug 2013 16:47:33 -0000
Content-Type: text/plain


The package runtime mapping rename issue is already fixed by
commit 0bc564af07c1bae8112f834a60aea3b72af7de13, the "kernel-module-" workaround
is not necessary anymore for out-of-tree module package, so revert that commit.

Yang Shi (1):
      Revert "hello-mod: Ensure the produced package name begins with kernel-module-"

 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

