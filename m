Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1RyUEo-0001QG-N4
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 21:17:04 +0100
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 497885E91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 11:50:50 -0800 (PST)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id 314D95E5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 11:50:50 -0800 (PST)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Fri, 17 Feb 2012 11:50:49 -0800
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0355.002;
	Fri, 17 Feb 2012 11:50:49 -0800
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Problems with Pseudo
Thread-Index: AcztrW75y4vYIagQSn6dS9a1MMOLBw==
Date: Fri, 17 Feb 2012 19:50:49 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F04264D83@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Problems with Pseudo
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
X-List-Received-Date: Fri, 17 Feb 2012 20:17:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

A problem just popped up today that I can't seem to fix. When trying to bit=
bake anything, I first get the following message:

ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded: ig=
nored.

Followed by a bunch of debug output, detailing the configuration files bein=
g loaded, then finally I get:

ERROR:  Poky's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the chec=
ker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Pseudo is not functioning correctly, which will cause failures during p=
ackage installation. Please check your configuration.

ERROR: Execution of event handler 'check_sanity_eventhandler' failed

I've never seen this before, but I'm afraid to disable it because I know ho=
w important pseudo is. Strangely enough, if I run pseudo (the one built in =
the i686-linux sysroot) manually from the command line, it works just fine.=
 I tried blowing away my build directory and downloads but nothing seems to=
 work. Has anyone seen this before or might be able to help me track down w=
hat's going on?

Thanks,

Dan Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com



