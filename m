Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pvmh5-0006tU-RM
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Mar 2011 09:18:31 +0100
Received: by wwe15 with SMTP id 15so3019358wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Mar 2011 00:17:01 -0800 (PST)
Received: by 10.216.200.82 with SMTP id y60mr1364059wen.31.1299313021155;
	Sat, 05 Mar 2011 00:17:01 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id t11sm119111wes.41.2011.03.05.00.17.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 Mar 2011 00:17:00 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D71ABD3.1080804@gmail.com>
Date: Sat, 5 Mar 2011 09:16:59 +0100
Message-Id: <86B31F99-7DAC-4364-8C77-6B56FAE764F2@dominion.thruhere.net>
References: <1299276952-24941-1-git-send-email-Martin.Jansa@gmail.com>
	<A78CAF16-DD5D-4D87-803C-313D07290422@dominion.thruhere.net>
	<4D71ABD3.1080804@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH] distutils-base: Only RDEPEND python-core on target packages
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
X-List-Received-Date: Sat, 05 Mar 2011 08:18:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mrt 2011, om 04:19 heeft Khem Raj het volgende geschreven:

> On 3/4/2011 2:41 PM, Koen Kooi wrote:
>>=20
>> Op 4 mrt 2011, om 23:15 heeft Martin Jansa het volgende geschreven:
>>=20
>>> * fixes ie setuptools, without this patch it RDEPENDs on =
python-core-native, which is not RPROVIDED by anything
>>> * imported from OE 8377b8ec57f35b9e5b81a74c77f68fd6e02949c8
>>>=20
>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>> ---
>>> meta/classes/distutils-base.bbclass |    2 +-
>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>=20
>>> diff --git a/meta/classes/distutils-base.bbclass =
b/meta/classes/distutils-base.bbclass
>>> index 2e151de..e84b0fc 100644
>>> --- a/meta/classes/distutils-base.bbclass
>>> +++ b/meta/classes/distutils-base.bbclass
>>> @@ -1,5 +1,5 @@
>>> DEPENDS  +=3D "${@["python-native python", =
""][(bb.data.getVar('PACKAGES', d, 1) =3D=3D '')]}"
>>> -RDEPENDS +=3D "python-core"
>>> +RDEPENDS_${PN} +=3D "${@['', 'python-core']['${PN}' =3D=3D =
'${BPN}']}"
>>=20
>> Minor nit: the two check seem to do the same, should we make them the =
same?
>>=20
>=20
> Do you mean checks for DEPENDS and RDEPEND_${PN}

yes

>=20
>> For this patch:
>>=20
>> Acked-by: Koen Kooi<koen@dominion.thruhere.net>
>>=20
>> regards,
>>=20
>> Koen
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



