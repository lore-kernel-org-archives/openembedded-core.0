Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8C76076F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2017 07:12:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0M7CfCa002071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 23:12:42 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 21 Jan 2017 23:12:41 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jan 2017 02:12:39 -0500
Message-ID: <cover.1485068874.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] openssh: upgrade to 7.4p1
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
X-List-Received-Date: Sun, 22 Jan 2017 07:12:44 -0000
Content-Type: text/plain

The following changes since commit a304b94eae99ade6d99800eeaf588c48d01506f6:

  oeqa/selftest/devtool: rewrite modify testcase (2017-01-19 22:47:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/openssh-upgrade-to-7.4p1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/openssh-upgrade-to-7.4p1

Dengke Du (1):
  openssh: upgrade to 7.4p1

 .../openssh/openssh/fix-CVE-2016-8858.patch        | 39 ----------------------
 ...h-7.1p1-conditional-compile-des-in-cipher.patch | 39 +++++++++++-----------
 ...h-7.1p1-conditional-compile-des-in-pkcs11.patch | 12 +++----
 .../openssh/{openssh_7.3p1.bb => openssh_7.4p1.bb} |  5 ++-
 4 files changed, 28 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
 rename meta/recipes-connectivity/openssh/{openssh_7.3p1.bb => openssh_7.4p1.bb} (97%)

-- 
2.8.1


