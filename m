Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5DDBA65D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 06:49:05 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Wed, 15 Oct 2014 08:49:00 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Mark Hatle <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>,
	"Saul Wold (sgw@linux.intel.com)" <sgw@linux.intel.com>, "Burton, Ross
	<ross.burton@intel.com> (ross.burton@intel.com)" <ross.burton@intel.com>
Thread-Topic: Truly scary SSL 3.0 vuln to be revealed soon:
Thread-Index: Ac/oO1a66AZx1WfuSiqPuqDXwzOnfw==
Date: Wed, 15 Oct 2014 06:48:59 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E482576880D@SESTOEX04.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.140.6]
MIME-Version: 1.0
Cc: "'yocto@yoctoproject.org'" <yocto@yoctoproject.org>,
	"'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Truly scary SSL 3.0 vuln to be revealed soon:
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
X-List-Received-Date: Wed, 15 Oct 2014 06:49:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi guys,

Yesterday The Register published this:
http://www.theregister.co.uk/2014/10/14/nasty_ssl_30_vulnerability_to_drop_=
tomorrow/

and today following was published:
https://www.openssl.org/~bodo/ssl-poodle.pdf
http://googleonlinesecurity.blogspot.de/2014/10/this-poodle-bites-exploitin=
g-ssl-30.html

The advice is: Disable SSLv3.

I created https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6843  so we c=
an start to work with this immediately.=20

It would be good to sync the work like we did with the "shellshock" at the =
end :) .

Cheers
Sona


Sona Sarmadi
Security Responsible for Enea Linux
Enea
Jan Stenbecks torg 17,
Box 1033, SE-164 21=A0Kista,=A0Sweden
Direct: +46 8 5071=A0 4475
Mobile: +46 70 971 4475
sona.sarmadi@enea.com
www.enea.com=20

This message, including attachments, is CONFIDENTIAL. It may also be privil=
eged or otherwise protected by law. If you received this email by mistake p=
lease let us know by reply and then delete it from your system; you should =
not copy it or disclose its contents to anyone.

> -----Original Message-----
> From: Sona Sarmadi
> Sent: den 14 oktober 2014 16:39
> To: openembedded-core@lists.openembedded.org
> Cc: yocto@yoctoproject.org
> Subject: FW: [oss-security] Truly scary SSL 3.0 vuln to be revealed soon:
>=20
> Hi all,
>=20
> It seems that another vulnerability is coming soon, the advice is disable
> SSLv3.:
> http://www.theregister.co.uk/2014/10/14/nasty_ssl_30_vulnerability_to_dr
> op_tomorrow/
>=20
>=20
> From Hanno B=F6ck [hanno@hboeck.de]:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Whether it's scary or not I have an advice for you: Disable SSLv3.
>=20
> It causes a lot of headache already. I once had to debug a rather subtle =
issue
> in combination with SNI.
> The problem: Browsers downgrade out of protocol to SSLv3 if they can't
> connect via TLS. They do this in order to support broken server
> implementations. However this downgrade can also be triggered by bad or
> slow internet connections - and then you'll loose SNI. So sometimes your
> visitors will get the wrong certificate presented.
> I solved this for my servers by disabling SSLv3. It was a minor problem w=
hen I
> did this but it is almost no problem today.
>=20
> You will lock out IE6 users on Windows XP. However even people who use
> Windows XP+IE and installed their updates have TLS 1.0 support.
> I also encountered a small number of people who had manually disabled TLS
> 1.0 in firefox for unknown reasons. However this was a few years ago.
> Current Firefox versions make it harder to do this. I assume the reason w=
as
> that they thought "v3 sound newer than v1.0".
>=20
> A number of people already recommend disabling SSLv3, e.g. the Qualys
> configuration guide. Disable it now - no matter if the rumors about a ser=
ious
> vuln are true, you'll be safe.
>=20
> BR - Sona

