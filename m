Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1T3bzV-0002T6-LQ
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 02:06:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7KNsZTA014601
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Aug 2012 16:54:35 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.2.189]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0309.002;
	Mon, 20 Aug 2012 16:54:35 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Elvis Dowson <elvis.dowson@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] can't login??
Thread-Index: AQHNfruZviWpq+K4k0mgczQNuixMKJdi9pEAgABWNYCAABOxYA==
Date: Mon, 20 Aug 2012 23:54:35 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF842006ED39@ALA-MBB.corp.ad.wrs.com>
References: <50320C3E.8030009@nedap.com> <1450996.gKDeWNK0nL@helios>
	<E8F2C9F0-E7CE-44CC-9FBE-1B058F1CE6B7@gmail.com>
In-Reply-To: <E8F2C9F0-E7CE-44CC-9FBE-1B058F1CE6B7@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: can't login??
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
X-List-Received-Date: Tue, 21 Aug 2012 00:06:42 -0000
X-Groupsio-MsgNum: 27933
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_007BD92917A2324FA403BCF9A464CF842006ED39ALAMBBcorpadwrs_"

--_002_007BD92917A2324FA403BCF9A464CF842006ED39ALAMBBcorpadwrs_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I don't know your issue, but the attached recipe should work.  You could
try it and then starting ripping things out.

Joe


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Elvis Dowson
> Sent: Monday, August 20, 2012 8:43 AM
> To: Paul Eggleton
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] can't login??
>=20
> Hi,
>=20
> On Aug 20, 2012, at 2:34 PM, Paul Eggleton wrote:
>=20
>=20
> 	Is "debug-tweaks" in IMAGE_FEATURES?
>=20
>=20
>=20
>=20
> I too have the same problem, I've got debug-tweaks in IMAGE_FEATURES, but=
 it doesn't allow
> me to login.  If I type root as the username, it does nothing and brings =
up the login
> prompt again.
>=20
> Starting syslogd/klogd:
> Yocto (Built by Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0
>=20
>=20
> (none) login: root
>=20
>=20
> Yocto (Built by Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0
>=20
>=20
> (none) login:
> Yocto (Built by Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0
>=20
>=20
> (none) login:
> Yocto (Built by Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0
>=20
>=20
> (none) login:
>=20
>=20
> Elvis Dowson

--_002_007BD92917A2324FA403BCF9A464CF842006ED39ALAMBBcorpadwrs_
Content-Type: application/octet-stream; name="small.bb"
Content-Description: small.bb
Content-Disposition: attachment; filename="small.bb"; size=227;
	creation-date="Mon, 20 Aug 2012 23:54:08 GMT";
	modification-date="Mon, 20 Aug 2012 23:06:04 GMT"
Content-Transfer-Encoding: base64

ClBSID0gInIwIgoKaW5oZXJpdCBjb3JlLWltYWdlCgojIGFsbG93cyByb290IGxvZ2luIHdpdGhv
dXQgYSBwYXNzd29yZAojCklNQUdFX0ZFQVRVUkVTICs9ICJkZWJ1Zy10d2Vha3MiCgojIFdlIG92
ZXJyaWRlIHdoYXQgZ2V0cyBzZXQgaW4gY29yZS1pbWFnZS5iYmNsYXNzCiMKSU1BR0VfSU5TVEFM
TCA9ICJcCiAgICB0YXNrLWNvcmUtYm9vdCBcCiAgICBrZXJuZWwtbW9kdWxlcyBcCiAgICAiCgo=

--_002_007BD92917A2324FA403BCF9A464CF842006ED39ALAMBBcorpadwrs_--
