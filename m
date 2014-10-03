Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC250708B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 14:51:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s93EpQ1v022004
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Oct 2014 07:51:27 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 3 Oct 2014 07:51:26 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Oct 2014 09:51:24 -0500
Message-ID: <1412347885-57716-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] Bash bug fixes and CVE updates
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
X-List-Received-Date: Fri, 03 Oct 2014 14:51:26 -0000
Content-Type: text/plain

Use the official community fixes by patching to the latest patch level.

The key patches for the active CVEs are listed below:

bash32-052      CVE-2014-6271                           9/24/2014
bash32-053      CVE-2014-7169                           9/26/2014
bash32-054      exported function namespace change      9/27/2014
bash32-055      CVE-2014-7186/CVE-2014-7187             10/1/2014
bash32-056      CVE-2014-6277                           10/2/2014

bash43-025      CVE-2014-6271                           9/24/2014
bash43-026      CVE-2014-7169                           9/26/2014
bash43-027      exported function namespace change      9/27/2014
bash43-028      CVE-2014-7186/CVE-2014-7187             10/1/2014
bash43-029      CVE-2014-6277                           10/2/2014


I am still in the process of validating the before and after behavior of 
bash using the ptests, I'll let the list know once the tests have been
completed.

Mark Hatle (1):
  bash: Upgrade bash to latest patch level to fix CVEs

 .../bash/bash-3.2.48/cve-2014-6271.patch           |  77 --------------
 .../bash/bash-3.2.48/cve-2014-7169.patch           |  16 ---
 .../recipes-extended/bash/bash/cve-2014-6271.patch | 114 ---------------------
 .../recipes-extended/bash/bash/cve-2014-7169.patch |  16 ---
 meta/recipes-extended/bash/bash_3.2.48.bb          |  38 ++++---
 meta/recipes-extended/bash/bash_4.3.bb             |  90 +++++++++++++++-
 6 files changed, 112 insertions(+), 239 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
 delete mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
 delete mode 100644 meta/recipes-extended/bash/bash/cve-2014-6271.patch
 delete mode 100644 meta/recipes-extended/bash/bash/cve-2014-7169.patch

-- 
1.9.3


