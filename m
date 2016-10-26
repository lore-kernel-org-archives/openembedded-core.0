Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 727CA6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:10:44 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1bzIuH-0007zO-2x; Wed, 26 Oct 2016 09:45:53 +0200
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.87)
	(envelope-from <ejo@pengutronix.de>)
	id 1bzIuG-0000lg-Iq; Wed, 26 Oct 2016 09:45:52 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 09:45:39 +0200
Message-Id: <20161026074540.621-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.9.3
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH][krogoth] Python signal module RDEPENDS fix
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
X-List-Received-Date: Wed, 26 Oct 2016 08:10:44 -0000

The attached patch from OE-core master branch
(6306dc8351c19059c4c2a8e75bb5733e64532732) fixes a dependency issue introduces
with OE-Core patch 0575e8c9fb52a7b594025fd20445a2edd06e3c69 "python3: Fixes
several python3 dependency problems".

As the latter patch also made its way into the krogoth branch (as OE-Core rev
8c0f2775bcc25f460d7a0b38031690fa10a0f11d), the attached patch is also required
in the krogoth branch. Otherwise a stable update will break builds that use the
python 'signal' module!

Robert Yang (1):
  python-3.5-manifest.inc: the signal module RDEPENDS on enum

 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.9.3


