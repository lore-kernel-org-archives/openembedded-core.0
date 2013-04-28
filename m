Received: from mx3.leapfrog.com ([63.114.26.253])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1UWGTb-0006hV-Ox
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Apr 2013 03:32:27 +0200
Received: from NAEMCASHT02.na.leapfrog.com (unknown [10.12.2.36])
	by mx3.leapfrog.com (Postfix) with ESMTP id 5530E602B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 18:14:25 -0700 (PDT)
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT02.na.leapfrog.com ([::1]) with mapi id 14.01.0379.000;
	Sat, 27 Apr 2013 18:14:25 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Custom tasks not running when dependency changes version
Thread-Index: Ac5DrIpzedIa/uaVTKO+PfHdmZXrjQ==
Date: Sun, 28 Apr 2013 01:14:23 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0FE6C9AF83@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Custom tasks not running when dependency changes version
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
X-List-Received-Date: Sun, 28 Apr 2013 01:32:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've got a weird issue that I just can't seem to figure out and need some h=
elp on. In our custom layer we have a bbclass that has 2 custom tasks, like=
 so:

addtask complete_metadata after do_package before do_package_write
addtask create_other_package after do_package_write before do_build

Now this is inherited by a recipe B which depends on recipe A. If I build a=
 rootfs image, then change the version (PV) on recipe A, then build the roo=
tfs image again, recipe A rebuilds, then recipe B rebuilds, but it rebuilds=
 without running my custom tasks. There's probably some task flag that I ne=
ed to set to make this work, but I can't figure out what it is. Any help is=
 appreciated, as always.

BTW, I'm all the way back on the denzil branch in case that matters.

Thanks,

Daniel Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com



