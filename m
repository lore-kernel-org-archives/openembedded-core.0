Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 757377255D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 13:06:24 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Tue, 16 Dec 2014 14:06:24 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 'Saul Wold'
	<sgw@linux.intel.com>
Thread-Topic: python: Building without SSLv3 support ,
Thread-Index: AdAZLqtY0jR0amPSSFi0VN0VguRhfg==
Date: Tue, 16 Dec 2014 13:06:23 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48257EA829@SESTOEX04.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: Maxin John <Maxin.John@enea.com>,
	'OE-core' <openembedded-core@lists.openembedded.org>
Subject: python: Building without SSLv3 support ,
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
X-List-Received-Date: Tue, 16 Dec 2014 13:06:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

> > I think we should consider (start looking at upgrading to python 2.7.9
> > in master), to address this issue. I feel uncomfortable with this
> > Debian patch. It seems that  we need to do more manual changes in
> > order to make this work. I will soon update the bug 7015 with my test
> results.
>=20
> We definitely do need to do this upgrade, yes; but we'd also like to have=
 a fix
> for older versions too. FWIW I've just entered an enhancement bug to cove=
r
> this for master; at the moment I'm not sure who will end up doing it but =
I
> thought we should have something to track it since it's not a trivial pie=
ce of
> work:
>=20

I did some more investigation, run some tests and updated bug 7015.

I created bug 7085 - openssl: compile openSSL with OPENSSL_NO_SSL3 flag, th=
is was needed for bug 7015. I am not sure if this should only be documented=
 or should we add this flag to the default config. Disabling SSLv3 in pytho=
n relies on defining this flag in OpenSSL.

If we upgrade Python to 2.7.9 (bug 7059) this issue will be solved in maste=
r, but we still need to handle this in dizzy & daisy.=20

Python.org has bakported the entirety of Python 3.4's ssl module to Python =
2.7.9. I will download the source code of 2.7.9 and see if we can backport =
the changes to our version (python 2.7.3). This will however take time for =
me. If this is urgent, please assign this to someone else. (I will soon go =
for a long vacation :))

Cheers
Sona


