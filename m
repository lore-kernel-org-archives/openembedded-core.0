Return-Path: <Shan.Hai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 176107402F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 05:29:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4F5TkAe011813
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 22:29:46 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 14 May 2015 22:29:45 -0700
From: Shan Hai <shan.hai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 May 2015 13:29:42 +0800
Message-ID: <1431667783-27190-1-git-send-email-shan.hai@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux: add runuser PAM config files
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
X-List-Received-Date: Fri, 15 May 2015 05:29:46 -0000
Content-Type: text/plain


Add PAM config files for util-linux to fix a runtime failure of the
runuser command.

meta/recipes-core/util-linux/util-linux.inc            | 8 ++++++++
 meta/recipes-core/util-linux/util-linux/runuser-l.pamd | 4 ++++
 meta/recipes-core/util-linux/util-linux/runuser.pamd   | 5 +++++
 meta/recipes-core/util-linux/util-linux_2.24.2.bb      | 2 ++
 4 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/runuser-l.pamd
 create mode 100644 meta/recipes-core/util-linux/util-linux/runuser.pamd

Thanks
Shan Hai

