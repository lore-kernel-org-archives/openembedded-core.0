Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 555D660DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 06:11:20 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Thu, 16 Oct 2014 08:11:17 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] OpenSSL: SSLv3 POODLE vulnerability
	(CVE-2014-3566)
Thread-Index: AQHP6QULMxNJS6zi+EqgSJ/p7PGB1ZwyGXmAgAAkJOA=
Date: Thu, 16 Oct 2014 06:11:17 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E482576A413@SESTOEX04.enea.se>
References: <1413438606-4068-1-git-send-email-sona.sarmadi@enea.com>
	<543F5F0B.3030100@linux.intel.com>
In-Reply-To: <543F5F0B.3030100@linux.intel.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.140.6]
MIME-Version: 1.0
Subject: Re: [PATCH] OpenSSL: SSLv3 POODLE vulnerability (CVE-2014-3566)
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
X-List-Received-Date: Thu, 16 Oct 2014 06:11:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>=20
> Sona,
>=20
> Does it make more sense to update to 1.0.1j directly (I know it's late in=
 the
> 1.7 release cycle), but given there are 3 other CVEs fixed in 'j'
> along with some other fixes.  People may look more at the version that is
> part of 1.7 than the back ported fixes.
>=20
> Please review the changes for 1.0.1j it may be a better approach even at =
this
> late stage.
>=20
> Sau!

Hi Saul,

I didn't get any comment on https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D6843 so I don't know what is the best approach for 1.7 .
You guys decide what to do for 1.7 :)  I will re-send the patch for daisy.=
=20
I have patch for the other three CVEs as well, I am running some tests, whe=
n I am finished I will send all 4 patches.

Please ignore this one.

/Sona

