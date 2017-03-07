Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9D6271ACF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 16:00:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v27G0SBk006740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 7 Mar 2017 08:00:29 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Mar 2017 08:00:28 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Mar 2017 10:00:23 -0600
Message-ID: <1488902424-9496-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] Fix gpgme when building for the target
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
X-List-Received-Date: Tue, 07 Mar 2017 16:00:36 -0000
Content-Type: text/plain

Fix gpgme when building for the target.  There were multiple problems when
cross compiling gpgme for the target:

* PKG_CONFIG (pkg-config) was not being set
* Auto selecting python would pick up the host version and fail
* calling gpg-error-config would fail

Mark Hatle (1):
  gpgme: Fix issue building for the target

 .../gpgme/gpgme/python-lang-config.patch           | 50 ++++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.8.0.bb          | 28 +++++++++++-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme/python-lang-config.patch

-- 
1.8.3.1


