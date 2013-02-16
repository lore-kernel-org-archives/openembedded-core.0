Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1U6ozB-0001mg-Vu
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 22:07:54 +0100
Received: from NAEMCASHT02.na.leapfrog.com (unknown [10.12.2.36])
	by mx4.leapfrog.com (Postfix) with ESMTP id C2C025EA9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 12:20:56 -0800 (PST)
Received: from naemmail03.na.leapfrog.com ([fe80::491e:453:9918:658c]) by
	NAEMCASHT02.na.leapfrog.com ([::1]) with mapi id 14.01.0379.000;
	Sat, 16 Feb 2013 12:20:56 -0800
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: make the init manager an image feature (again)
Thread-Index: Ac4MgnR6Y7Ole/wtSXqYWY6D3GrDHQ==
Date: Sat, 16 Feb 2013 20:20:55 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0FE6C79B47@NAEMMAIL03.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sat, 16 Feb 2013 21:07:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry I didn't pipe up earlier but we are still working from denzil so I ha=
dn't noticed the steady move away from supporting both sysvinit and systemd=
 in a single distro. We have a similar use case to Otavio where we are hopi=
ng to move to systemd this year, but we'll need to use sysvinit for our res=
cue images since they operate out of a ramfs where space is precious. These=
 images are all built out of the same distro and it seems like it would be =
a nightmare to try and support 2 distros just so we could have our rescue i=
mages.

Daniel Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com


