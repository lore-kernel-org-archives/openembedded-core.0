Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qjq5O-00050T-Uq
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 12:02:30 +0200
Received: by wwi18 with SMTP id 18so886324wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 02:58:23 -0700 (PDT)
Received: by 10.227.54.200 with SMTP id r8mr15488wbg.112.1311242303557;
	Thu, 21 Jul 2011 02:58:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gd1sm911411wbb.27.2011.07.21.02.58.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 02:58:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E27F446.6020001@windriver.com>
Date: Thu, 21 Jul 2011 11:58:16 +0200
Message-Id: <13AAAFD4-4F02-4D6B-AC8C-2839B46B93B1@dominion.thruhere.net>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<4E27DDAC.1060707@windriver.com>
	<39A05AC0-9577-4EB1-83F6-DADB53725801@dominion.thruhere.net>
	<4E27F446.6020001@windriver.com>
To: Kang Kai <kai.kang@windriver.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: scott.a.garman@intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] works of adding packages pam support
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
X-List-Received-Date: Thu, 21 Jul 2011 10:02:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yes, that'd be awesome

Op 21 jul. 2011, om 11:41 heeft Kang Kai het volgende geschreven:

> On 2011=E5=B9=B407=E6=9C=8821=E6=97=A5 16:53, Koen Kooi wrote:
>> Op 21 jul. 2011, om 10:05 heeft Kang Kai het volgende geschreven:
>>=20
>>> On 2011=E5=B9=B407=E6=9C=8821=E6=97=A5 16:00, Kang Kai wrote:
>>>> From: Kang Kai<kai.kang@windriver.com>
>>>>=20
>>>>=20
>>>> Hi Scott,
>>>>=20
>>>> This is the current work of adding pam supports.
>>>>=20
>>>> After update libpam to 1.1.4, we enable the packages pam support. =
And if the pacakge
>>>> doesn't have a pam configure file, import from Fedora.
>>>>=20
>>>> The following changes since commit =
fa4bcfdb73167f8159b88e5a4d711c0d37627a70:
>>>>=20
>>>>   bb-matrix: correct BB and PM number canonicalization (2011-07-14 =
22:23:09 +0100)
>>>>=20
>>>> are available in the git repository at:
>>>>   git://git.pokylinux.org/poky-contrib kangkai/distro
>>>>=20
>>>> =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/pam-commit=
s
>>> sorry, the branch info is wrong, should be
>>>=20
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/distro=

>> Is that against oe-core or against poky? If it's against poky please =
rebase it against oe-core since that make it possible to test it.
>=20
> Koen,
>=20
> I rebase against oe-core and push to
>=20
> =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai%2Fpam-reba=
se-oe-core
>=20
> Is that what you want?
>=20
> Regards,
> Kai
>=20



