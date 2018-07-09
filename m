Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id D0AEF74F78
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 12:57:38 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w69CvctH029822
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2018 14:57:39 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w69CvcHg000354;
	Mon, 9 Jul 2018 14:57:38 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 1938E62539B;
	Mon,  9 Jul 2018 14:57:39 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2018 14:56:54 +0200
Message-Id: <20180709125657.13192-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH resend 0/3] Openssl 1.1 upgrading
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
X-List-Received-Date: Mon, 09 Jul 2018 12:57:39 -0000

Resend patches from http://lists.openembedded.org/pipermail/openembedded-core/2018-June/151699.html thread.

Andrej Valek (3):
  openssl-1.1: fix c_rehash perl errors
  openssl-1.1: rework packaging
  openssl-1.1: /etc/ssl location compatibility

 ...le.pl-only-quote-stuff-that-actually-need.patch | 29 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.1.0h.bb | 27 +++++++++++++++++---
 2 files changed, 52 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch

-- 
2.11.0


