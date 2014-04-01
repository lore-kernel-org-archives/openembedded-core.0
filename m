Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F3E8560E68
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 01:59:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s311xkDU022277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 18:59:46 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Mon, 31 Mar 2014 18:59:45 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Apr 2014 09:59:35 +0800
Message-ID: <1396317576-25426-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH] Fix some bash errors
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
X-List-Received-Date: Tue, 01 Apr 2014 01:59:46 -0000
Content-Type: text/plain

Fix some errors for bash 3.2.48 by take patches from bash 4.3.

Yong Zhang (1):
  bash-3.2.48: fix error path of getc_with_restart

 .../bash-fix-error-path-of-getc_with_restart.patch | 41 ++++++++++++++++++++++
 .../bash-3.2.48/bash-fix-getc_with_restart.patch   | 28 +++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |  2 ++
 3 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-error-path-of-getc_with_restart.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-getc_with_restart.patch

-- 
1.8.1.2


