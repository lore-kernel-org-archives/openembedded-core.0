Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QVhoI-0000hC-EL
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 12:22:26 +0200
Received: by wwb17 with SMTP id 17so3347267wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2011 03:19:03 -0700 (PDT)
Received: by 10.216.78.212 with SMTP id g62mr3952183wee.22.1307873943376;
	Sun, 12 Jun 2011 03:19:03 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 74sm2291568wem.17.2011.06.12.03.19.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Jun 2011 03:19:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 12 Jun 2011 12:19:00 +0200
Message-Id: <9C732305-B6BD-4AF7-B0C2-D9264E47C70F@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: qemuarm boot problems?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Jun 2011 10:22:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Scott was trying to debug the login.defs problem I reported but couldn't =
boot a test image in qemuarm. I built qemu for OSX and could reproduce =
it. If I use the kernel oe-core builds I can boot older angstrom =
filesystems from .dev and .2011.03-maintenance, but nothing from =
oe-core. The same image targets work fine on the arm targets I test =
(armv7a: beagleboard, pandaboard; armv5te: hawkboard).

regards,

Koen=


