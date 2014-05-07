Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D26160559
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 02:53:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s472rfbm006334
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 19:53:41 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 6 May 2014 19:53:40 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 May 2014 10:53:51 +0800
Message-ID: <cover.1399431138.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2 0/1] sudo: upgrade from 1.8.9p5 to 1.8.10p2
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
X-List-Received-Date: Wed, 07 May 2014 02:53:40 -0000
Content-Type: text/plain

Changes since V1:
1. Modified the commit message to be more explicit on why the license checksums are changed.

The following changes since commit 82813d27640549255dc81a15d7fb63688431f747:

  tcmode-default.inc: Adjust for new toolchain component changes (2014-05-06 21:31:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/sudo-1.8.10p2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/sudo-1.8.10p2

Chen Qi (1):
  sudo: upgrade from 1.8.9p5 to 1.8.10p2

 meta/recipes-extended/sudo/files/volatiles.99_sudo |    1 +
 meta/recipes-extended/sudo/sudo.inc                |    6 +++---
 .../sudo/{sudo_1.8.9p5.bb => sudo_1.8.10p2.bb}     |   13 ++++++++++---
 3 files changed, 14 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/files/volatiles.99_sudo
 rename meta/recipes-extended/sudo/{sudo_1.8.9p5.bb => sudo_1.8.10p2.bb} (57%)

-- 
1.7.9.5


