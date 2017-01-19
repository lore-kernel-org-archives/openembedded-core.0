Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB406FF7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 09:50:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0J9oi86004565
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 01:50:45 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 Jan 2017 01:50:44 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2017 04:50:42 -0500
Message-ID: <cover.1484819263.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] openssh: upgrade to 7.4p1
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
X-List-Received-Date: Thu, 19 Jan 2017 09:50:45 -0000
Content-Type: text/plain

The following changes since commit 81021bc0aa0f64e67535f6a9551e921a64fe4395:

  yocto-project-qs, ref-manual: Added note for "resources temporarily unavailable" error (2017-01-11 17:23:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/openssh-upgrade-to-7.4p1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/openssh-upgrade-to-7.4p1

Dengke Du (1):
  openssh: upgrade to 7.4p1

 .../openssh/add-test-support-for-busybox.patch     | 69 ----------------------
 .../openssh/openssh/fix-CVE-2016-8858.patch        | 39 ------------
 ...ial-signed-overflow-in-pointer-arithmatic.patch | 67 ++++++++++-----------
 ...h-7.1p1-conditional-compile-des-in-cipher.patch | 39 ++++++------
 ...h-7.1p1-conditional-compile-des-in-pkcs11.patch | 12 ++--
 .../openssh/{openssh_7.3p1.bb => openssh_7.4p1.bb} |  6 +-
 6 files changed, 62 insertions(+), 170 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
 rename meta/recipes-connectivity/openssh/{openssh_7.3p1.bb => openssh_7.4p1.bb} (96%)

-- 
2.8.1


