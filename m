Received: from ausxippc101.us.dell.com ([143.166.85.207])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Michael_E_Brown@Dell.com>) id 1TzryG-00060v-GT
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:54:14 +0100
X-LoopCount0: from 10.175.216.250
X-IronPort-AV: E=Sophos;i="4.84,551,1355119200"; d="scan'208";a="63194897"
From: <Michael_E_Brown@Dell.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jan 2013 10:36:37 -0600
Thread-Topic: udev blacklist ineffective
Thread-Index: AQHN/XW+BGeWllJoO026QGgvNBp+nQ==
Message-ID: <DB6E482E89290547898851B8CC9D8110DC3609D8@AUSX7MCPS302.AMER.DELL.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: udev blacklist ineffective
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 16:54:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have two embedded systems that share some devices over an i2c bus. Only o=
ne system may load the device driver at a time, and loading the device driv=
er is already well-controlled by the HA subsystem.

Our new yocto build with udev enabled is auto-loading these device drivers =
with catastrophic results. We must absolutely prohibit such automatic behav=
iour for our list of devices. I have tried:

$ cat etc/modprobe.d/blacklist.conf=20
blacklist seepmtd
... cut ...

And this does *NOT* work. I have tried renaming blacklist.conf to modprobe.=
conf as well as creating modprobe.conf with these blacklist entries.

This is a huge blocking issue and I have been unable to figure out a workar=
ound for it. I would appreciate any suggestions.
--
Michael=


