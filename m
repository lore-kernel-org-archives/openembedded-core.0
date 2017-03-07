Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A353E777B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 18:54:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v27IsgPW023778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Mar 2017 10:54:43 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 10:54:41 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Mar 2017 12:54:32 -0600
Message-ID: <1488912873-63651-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH v2] Fix gpgme when building for the target
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
X-List-Received-Date: Tue, 07 Mar 2017 18:54:49 -0000
Content-Type: text/plain

V2:

Add swig-native as a dependency when python is called.  Tested after removing
swig-native from my host machine.

Added patch upstream status per patchwork email.

V1:

Fix gpgme when building for the target.  There were multiple problems when
cross compiling gpgme for the target:

* PKG_CONFIG (pkg-config) was not being set
* Auto selecting python would pick up the host version and fail
* calling gpg-error-config would fail

Mark Hatle (1):
  gpgme: Fix issue building for the target

 .../gpgme/gpgme/python-lang-config.patch           | 52 ++++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.8.0.bb          | 28 +++++++++++-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme/python-lang-config.patch

-- 
1.8.3.1


