Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9031C71AE6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 12:50:50 +0000 (UTC)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])
	by msfrf2635.sfr.fr (SMTP Server) with ESMTP id 4F0851C00343E;
	Sat, 19 Nov 2016 13:50:51 +0100 (CET)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2635.sfr.fr (SMTP Server) with ESMTPSA;
	Sat, 19 Nov 2016 13:50:49 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Nov 2016 20:50:32 +0800
Message-Id: <1479559833-128256-1-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [PATCH v2 0/1] Add a tune file for cortexa53, valid for 32 bits and 64 bits
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
X-List-Received-Date: Sat, 19 Nov 2016 12:50:50 -0000

Tune file for ARM Cortex-A53, supporting 32 bits and 64 bits configuration

Herve Jourdain (1):
  Add a tune file for cortexa53, valid for 32 bits and 64 bits

 meta/conf/machine/include/tune-cortexa53.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc

-- 
2.7.4


