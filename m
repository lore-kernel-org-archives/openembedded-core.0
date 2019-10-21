Return-Path: <mfe@pengutronix.de>
X-Greylist: delayed 1002 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Oct 2019 09:58:32 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 5B30F6C0E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 09:58:32 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1iMUCE-0002WF-C5; Mon, 21 Oct 2019 11:41:50 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1iMUCE-0003lS-00; Mon, 21 Oct 2019 11:41:50 +0200
Date: Mon, 21 Oct 2019 11:41:49 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20191021094149.uwvkismntthgd7i3@pengutronix.de>
MIME-Version: 1.0
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:31:55 up 156 days, 15:50, 98 users,  load average: 0.12, 0.12,
	0.07
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: mfe@pengutronix.de, kernel@pengutronix.de
Subject: Why do we still disable mke2fs 64bit support?
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
X-List-Received-Date: Mon, 21 Oct 2019 09:58:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

during a initial system-setup script the mke2fs tools complains about
the missing 64bit support:

8<----------------------------------------------------------------------
mke2fs 1.44.5 (15-Dec-2018)
64-bit filesystem support is not enabled.  The larger fields afforded by
this feature enable full-strength checksumming. Pass -O 64bit to rectify.
8<----------------------------------------------------------------------

Other build tools e.g. PTXdist or Buildroot don't modify the build-in
config. I know in the early days this feature break something but
shouldn't we (re-)think this decision?

Regards,
  Marco

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

