Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1R65gX-0007l7-8T
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 21:08:49 +0200
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id EB03D5EA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 12:03:17 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id CFBD35E97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 12:03:17 -0700 (PDT)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Tue, 20 Sep 2011 12:03:17 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0289.001;
	Tue, 20 Sep 2011 12:03:17 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Correct way of having the PN package depend on the other
	packages?
Thread-Index: Acx3x/P83idbyYOqRB+7npzheJAxDw==
Date: Tue, 20 Sep 2011 19:03:16 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F011EC4@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Correct way of having the PN package depend on the other packages?
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
X-List-Received-Date: Tue, 20 Sep 2011 19:08:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I noticed a problem with the alsa-utils package where the alsa-utils packag=
e does not depend on all of the little extra packages it's supposed to pull=
 in. I'm not sure what the best way to fix this is though. Can anyone give =
me a little guidance or point me at a recipe that does this correctly alrea=
dy?

Thanks,

Dan Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com



