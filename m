Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1RCHx1-00049e-GF
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 23:27:32 +0200
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 5ED935EA9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 14:21:24 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id 3E6755EA3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 14:21:24 -0700 (PDT)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Fri, 7 Oct 2011 14:21:24 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0289.001;
	Fri, 7 Oct 2011 14:21:23 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Use for filedeps/rpmdeps data?
Thread-Index: AcyFNw/Q9MUX6qkKRL+TrHTid+xZ5g==
Date: Fri, 7 Oct 2011 21:21:22 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F0177E5@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Use for filedeps/rpmdeps data?
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
X-List-Received-Date: Fri, 07 Oct 2011 21:27:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey everyone,

I noticed today that one of our recipes takes a very long time to get throu=
gh the do_package task. The recipe has a couple of binaries and a whole lot=
 of assets (thousands of audio files). It takes over 20 minutes for the do_=
package task to complete on my local desktop. I finally tracked it down to =
the package_do_filedeps function which appears to be running an rpmdeps pro=
cess for each file in each package. As far as I can tell, it just then dump=
s that data to text files in pkgdata and only seems concerned with the bina=
ries. Can anyone shed some light on what this info is used for? Should it o=
nly be concerned with executables and libraries (there is currently no filt=
er on it)? Do I even need that data if we are using ipkg instead of rpm?

Thanks,

Dan Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com



