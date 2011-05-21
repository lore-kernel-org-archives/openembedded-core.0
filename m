Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QNrjL-0001YA-7g
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 21:20:55 +0200
Received: by wwb17 with SMTP id 17so4115559wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 12:17:57 -0700 (PDT)
Received: by 10.216.233.224 with SMTP id p74mr815546weq.4.1306005474640;
	Sat, 21 May 2011 12:17:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f30sm2449113wef.7.2011.05.21.12.17.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 May 2011 12:17:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <51ED17D8-BCDC-4A28-B537-5EBDAE71772B@gmail.com>
Date: Sat, 21 May 2011 21:17:52 +0200
Message-Id: <2A972D3F-1633-4B54-8E59-87D815DECDAD@dominion.thruhere.net>
References: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
	<1305959660.18415.252.camel@lenovo.internal.reciva.com>
	<51ED17D8-BCDC-4A28-B537-5EBDAE71772B@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Sat, 21 May 2011 19:20:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 mei 2011, om 09:19 heeft Khem Raj het volgende geschreven:

>=20
>=20
> -Khem
>=20
> On May 20, 2011, at 11:34 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
>> On Fri, 2011-05-20 at 16:19 -0700, Khem Raj wrote:
>>> -DEPENDS =3D "avahi gtk+"
>>> +DEPENDS =3D "avahi ${GTKDEP}"
>>> +GTKDEP-libc-uclibc =3D ""
>>> +GTKDEP =3D "gtk+"
>>=20
>> Does that really work?  Surely it should be "GTKDEP_libc-uclibc".
>>=20
>=20
> No it does not RP pointed it out earlier and I have since fixed it
>=20
>>> -EXTRA_OECONF =3D " --with-gtk "
>>> -
>>> +EXTRA_OECONF_libc-glibc =3D " --with-gtk "
>>> +EXTRA_OECONF_libc-uclibc =3D " --without-gtk --without-gnome "
>>=20
>> Can you make this use the same logic as above?
>>=20
>=20
> Is there a problem with this logic ?
>=20
>>> +DESKTOPINSTALL =3D ""
>>> +DESKTOPINSTALL_libc-glibc () {
>>> +    install -d ${D}${datadir}/distcc/
>>>   install -m 0644 ${WORKDIR}/distccmon-gnome.desktop =
${D}${datadir}/distcc/
>>> }
>>=20
>> Likewise, or find some way to eliminate it entirely.
>>=20
>>> -
>>> -PACKAGES +=3D "distcc-distmon-gnome"
>>> +PACKAGES_append_libc-glibc =3D " distcc-distmon-gnome"
>>=20
>> Is that needed?
>>=20
>=20
> May be not it will just be empty in uclibc case

since ALLOW_EMPTY is not set, this change is unneeded.=


