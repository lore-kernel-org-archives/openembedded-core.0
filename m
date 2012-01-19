Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnpuW-0000uo-HE
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 12:12:04 +0100
Received: by wibhr14 with SMTP id hr14so1342225wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 03:04:25 -0800 (PST)
Received: by 10.180.106.165 with SMTP id gv5mr42829515wib.18.1326971065361;
	Thu, 19 Jan 2012 03:04:25 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bu13sm29441492wib.6.2012.01.19.03.04.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jan 2012 03:04:24 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1326970642.2511.58.camel@ted>
Date: Thu, 19 Jan 2012 12:04:21 +0100
Message-Id: <C91C8145-FAFA-480C-8E57-18E697344E38@dominion.thruhere.net>
References: <cover.1326964778.git.sgw@linux.intel.com>
	<07e6db4cffae944800892d934c11be3876eeaa92.1326964778.git.sgw@linux.intel.com>
	<15839BE5-A26D-453B-A13F-08ECB328E829@dominion.thruhere.net>
	<1326970642.2511.58.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 12/33] pkgconfig: Move pkg.m4 from -dev to package
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
X-List-Received-Date: Thu, 19 Jan 2012 11:12:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 jan. 2012, om 11:57 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-01-19 at 11:30 +0100, Koen Kooi wrote:
>> Op 19 jan. 2012, om 10:22 heeft Saul Wold het volgende geschreven:
>>=20
>>> [YOCTO #1908]
>>>=20
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>> meta/recipes-devtools/pkgconfig/pkgconfig.inc     |    2 ++
>>> meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb |    2 +-
>>> 2 files changed, 3 insertions(+), 1 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc =
b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
>>> index 641bfae..00c23d7 100644
>>> --- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
>>> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
>>> @@ -31,3 +31,5 @@ do_configure_prepend () {
>>> }
>>>=20
>>> BBCLASSEXTEND =3D "native nativesdk"
>>> +
>>> +FILES_${PN} +=3D "${datadir}/aclocal/pkg.m4"
>>=20
>> Why is this done exactly? M4 files do belong in the -dev package.
>=20
> Think about the use cases for having pkgconfig installed. In the
> pkgconfig case, the -dev package isn't particularly useful.=20

So put that in the commit message :)

>=20
> You can argue this one both ways though...

I know, just being obnoxious about missing commit messages.=


