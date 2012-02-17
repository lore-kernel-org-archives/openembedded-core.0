Received: from mx3.leapfrog.com ([63.114.26.253])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1RyUfq-0002D3-5Q
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 21:44:58 +0100
Received: from mx3.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id CE4FF5EAE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 12:17:42 -0800 (PST)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx3.leapfrog.com (Postfix) with ESMTP id A8AC45E1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 12:17:42 -0800 (PST)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Fri, 17 Feb 2012 12:17:42 -0800
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0355.002;
	Fri, 17 Feb 2012 12:17:42 -0800
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Problems with Pseudo
Thread-Index: AcztsTJ2UjGSDol2Q6efFeV7aEC4WQ==
Date: Fri, 17 Feb 2012 20:17:41 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F04264DED@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Re: Problems with Pseudo
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
X-List-Received-Date: Fri, 17 Feb 2012 20:44:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Date: Fri, 17 Feb 2012 20:12:48 +0000
>From: Phil Blundell <philb@gnu.org>
>Subject: Re: [OE-core] Problems with Pseudo
>To: Patches and discussions about the oe-core layer
>	<openembedded-core@lists.openembedded.org>
>Message-ID: <1329509568.2591.119.camel@x121e.pbcl.net>
>Content-Type: text/plain; charset=3D"UTF-8"
>
>On Fri, 2012-02-17 at 19:50 +0000, Daniel Lazzari wrote:
>> A problem just popped up today that I can't seem to fix. When trying to
>bitbake anything, I first get the following message:
>>
>> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
>ignored.
>>
>> Followed by a bunch of debug output, detailing the configuration files b=
eing
>loaded, then finally I get:
>
>Are you trying to run bitbake from inside a devshell or anything like that=
?
>
>p.
>

We normally run bitbake through a wrapper script, but I tried it just from =
my command line and I get the same result.



