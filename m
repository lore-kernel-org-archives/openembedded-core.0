Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.163])
	by mail.openembedded.org (Postfix) with ESMTP id C03C162135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 04:30:15 +0000 (UTC)
Received: from nbhjo (111-250-199-179.dynamic.hinet.net [111.250.199.179])
	by msfrf2606.sfr.fr (SMTP Server) with ESMTP id 3F1251C000430
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 06:30:14 +0200 (CEST)
Received: from nbhjo (111-250-199-179.dynamic.hinet.net
	[111.250.199.179])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2606.sfr.fr (SMTP Server) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 06:30:10 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
References: <1464681309-34628-1-git-send-email-herve.jourdain@neuf.fr>
In-Reply-To: <1464681309-34628-1-git-send-email-herve.jourdain@neuf.fr>
Date: Thu, 16 Jun 2016 06:30:06 +0200
Message-ID: <021a01d1c787$c4ff40b0$4efdc210$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJ+nbadoJeL2J+HypR5EDgUxXo5/56R1Afw
X-sfr-mailing: LEGIT
Subject: Re: [PATCH v3] Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Thu, 16 Jun 2016 04:30:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Ping...

-----Original Message-----
From: Herve Jourdain [mailto:herve.jourdain@neuf.fr] 
Sent: mardi 31 mai 2016 09:55
To: openembedded-core@lists.openembedded.org
Cc: Herve Jourdain <herve.jourdain@neuf.fr>
Subject: [OE-core][PATCH v3] Support for .dtbo files for dtb overlays

Sorry, sent to the wrong list initially, then with wrong header, so updating
header...

v3: rebased

Recent kernels tend to use .dtbo files for device tree overlays, instead of
.dtb before.
.dtb are still used, but only for the "real" device trees (not the
overlays).

On some platforms (meta-raspberrypi for instance), recent firmware only
loads .dtbo files for overlays.

This patch tries to address this issue, while not breaking support for .dtb
overlays.
It allows the installation/deployment of both .dtb and .dtbo files, for
device trees and overlays.

This is in line with the behavior of kernels 4.4.6+

Herve Jourdain (1):
  linux-dtb.inc: Support for .dtbo files for dtb overlays

 meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.7.4


