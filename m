Return-Path: <Sen.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8524261EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 07:35:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r537Zblv023694
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Jun 2013 00:35:37 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 3 Jun 2013 00:35:36 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jun 2013 15:37:47 +0800
Message-ID: <cover.1370244833.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass: make sure python is a full install
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
X-List-Received-Date: Mon, 03 Jun 2013 07:35:36 -0000
Content-Type: text/plain

Robert sent a fix on the same bug. This is a rework per Ross Burton's advice.

jesse

The following changes since commit 73dae11852c656adbf5a2b0e44ac4c7e0078cd8d:

  rpm: remove .real hacks in argument parsing (2013-05-31 14:02:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib szhang/glib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=szhang/glib

Jesse Zhang (1):
  sanity.bbclass: make sure python is a full install

 meta/classes/sanity.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.7.11.7


