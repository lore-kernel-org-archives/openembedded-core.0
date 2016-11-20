Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5611171979
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 12:10:37 +0000 (UTC)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])
	by msfrf2629.sfr.fr (SMTP Server) with ESMTP id 2344C1C000425;
	Sun, 20 Nov 2016 13:10:38 +0100 (CET)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2629.sfr.fr (SMTP Server) with ESMTPSA;
	Sun, 20 Nov 2016 13:10:36 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2016 20:10:20 +0800
Message-Id: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [PATCH v3 0/3] Add a tune file for cortexa53, valid for 32 bits and 64 bits
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
X-List-Received-Date: Sun, 20 Nov 2016 12:10:40 -0000

Add a tune file for cortexa53, valid for 32 bits and 64 bits
It requires adding options in arch-armv8.inc to support 32 bits options

Herve Jourdain (3):
  arch-arm64.inc: include arch-armv7ve instead of arch-armv7a
  arch-armv8.inc: add support for 32bits armv8 options
  Add a tune file for cortexa53, valid for 32 bits and 64 bits

 meta/conf/machine/include/arm/arch-arm64.inc |  2 +-
 meta/conf/machine/include/arm/arch-armv8.inc | 60 ++++++++++++++++++++++++++++
 meta/conf/machine/include/tune-cortexa53.inc | 43 ++++++++++++++++++++
 3 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc

-- 
2.7.4


