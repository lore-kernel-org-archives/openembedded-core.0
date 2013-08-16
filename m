Return-Path: <Yang.Shi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 64CEA61222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 16:56:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7GGuSQX022258
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Aug 2013 09:56:28 -0700 (PDT)
Received: from localhost.localdomain (147.11.152.86) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 09:56:27 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 09:51:21 -0700
Message-ID: <1376671882-26213-1-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: Add comment for kernel module package naming in recipe
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
X-List-Received-Date: Fri, 16 Aug 2013 16:56:50 -0000
Content-Type: text/plain


To follow up the comment for the revert of the workaround which added "kernel-module-" prefix to the package name, add some comments to explain the renaming will happen automatically by inherit modules bbclass.

Yang Shi (1):
      hello-mod: Add comment for kernel module package naming

 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

