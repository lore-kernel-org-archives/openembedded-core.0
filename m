Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYed5-0000PX-P1
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 15:35:03 +0200
Received: by wwg12 with SMTP id 12so2085704wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 06:31:31 -0700 (PDT)
Received: by 10.227.29.27 with SMTP id o27mr5144991wbc.16.1308576691621;
	Mon, 20 Jun 2011 06:31:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm3186882wbh.38.2011.06.20.06.31.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2011 06:31:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308576583.25285.12093.camel@phil-desktop>
Date: Mon, 20 Jun 2011 15:31:25 +0200
Message-Id: <90AD0E19-73AB-4443-AAC5-D1069E260D2C@dominion.thruhere.net>
References: <AE69955E-732E-4002-90F9-FF833BC78D8A@dominion.thruhere.net>
	<4DFF49B8.9050908@windriver.com>
	<1308576583.25285.12093.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Architecture mismatch QA check not fatal?
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
X-List-Received-Date: Mon, 20 Jun 2011 13:35:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 jun 2011, om 15:29 heeft Phil Blundell het volgende geschreven:

> On Mon, 2011-06-20 at 08:23 -0500, Mark Hatle wrote:
>> (The minor cases are primarily firmware loaded into off-board cards =
in PCI
>> chasis and such.. occasionally these firmware are ELF and of an =
architecture not
>> the same as the host..  it's rare, but I have seen it before.)
>=20
> Shouldn't those firmware images just go in a separate package?

If we do that we can use INSANE_SKIP_firmwarepackage =3D True, which =
seems like a good solution.

regards,

Koen=


