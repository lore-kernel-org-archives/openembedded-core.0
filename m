Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.163])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF5877175
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 07:55:27 +0000 (UTC)
Received: from localhost.localdomain (LFbn-1-3582-159.w90-127.abo.wanadoo.fr
	[90.127.97.159])
	by msfrf2605.sfr.fr (SMTP Server) with ESMTP id AB0C51C007019;
	Tue, 31 May 2016 09:55:27 +0200 (CEST)
Received: from localhost.localdomain (LFbn-1-3582-159.w90-127.abo.wanadoo.fr
	[90.127.97.159])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2605.sfr.fr (SMTP Server) with ESMTPSA;
	Tue, 31 May 2016 09:55:27 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (PLAIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 15:55:08 +0800
Message-Id: <1464681309-34628-1-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [PATCH v3] Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Tue, 31 May 2016 07:55:28 -0000

Sorry, sent to the wrong list initially, then with wrong header, so updating header...

v3: rebased

Recent kernels tend to use .dtbo files for device tree overlays, instead of .dtb before.
.dtb are still used, but only for the "real" device trees (not the overlays).

On some platforms (meta-raspberrypi for instance), recent firmware only loads .dtbo files for overlays.

This patch tries to address this issue, while not breaking support for .dtb overlays.
It allows the installation/deployment of both .dtb and .dtbo files, for device trees and overlays.

This is in line with the behavior of kernels 4.4.6+

Herve Jourdain (1):
  linux-dtb.inc: Support for .dtbo files for dtb overlays

 meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.7.4


