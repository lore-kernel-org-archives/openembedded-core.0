Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3E4346AD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 14:15:40 +0000 (UTC)
Received: from SESTOEX09.enea.se ([fe80::94d8:372f:210c:b4da]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0224.002; Thu, 14 May 2015 16:15:37 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] opkg and gpg signed ipk packages
Thread-Index: AQHQiQF1GoctQW/hYkC8XY65YpEcWJ1xw3SQgABfj4CAAdOP8IAHG78AgABqdyA=
Date: Thu, 14 May 2015 14:15:35 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48258F21ED@sestoex09.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48258ED362@sestoex09.enea.se>
	<20150508162311.GA20977@bang.betafive.co.uk>
	<3230301C09DEF9499B442BBE162C5E48258F1A57@sestoex09.enea.se>
	<2514335.muUPAEFR2j@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2514335.muUPAEFR2j@peggleto-mobl.ger.corp.intel.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: opkg and gpg signed ipk packages
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
X-List-Received-Date: Thu, 14 May 2015 14:15:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> I'm guessing you would want something like this in your custom distro con=
fig
> (or local.conf if you must):
>=20
> PACKAGECONFIG_append_pn-opkg =3D " sha256"
> PACKAGECONFIG_append_pn-opkg-native =3D " sha256"

Thanks Paul, it looks like this should be the configuration but I have trie=
d this and didn't help. =20

I try to find out some info about "Packages" file, how it is generated, whe=
re this checksum is computed, etc ... =20

I see in the opkg.py how the content of the "Packages" file is generated bu=
t I don't understand how this file is generated.
=20
./build-p2020/tmp/sysroots/x86_64-linux/usr/bin/opkg.py

  if self.md5: out =3D out + "MD5Sum: %s\n" % (self.md5)


//Sona

hashval =3D bb.utils.md5_file(f)

