Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYuPb-0006i0-36
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 07:58:27 +0100
Received: by wgbds11 with SMTP id ds11so4303269wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 22:51:36 -0800 (PST)
Received: by 10.180.81.163 with SMTP id b3mr9440821wiy.20.1323413496471;
	Thu, 08 Dec 2011 22:51:36 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o3sm12047045wiy.14.2011.12.08.22.51.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 22:51:35 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 9 Dec 2011 07:51:33 +0100
In-Reply-To: <1323381564.5309.65.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323327959.git.xiaofeng.yan@windriver.com>
	<67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
	<1323363345.5309.42.camel@ted>
	<1323364334.26081.383.camel@phil-desktop>
	<1323381564.5309.65.camel@ted>
Message-Id: <CB3A9DC8-124F-4314-A7B5-17C34B59E9D0@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Fri, 09 Dec 2011 06:58:27 -0000
X-Groupsio-MsgNum: 13916
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0995D42F-F23D-47D9-BD70-682A7D046272";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0995D42F-F23D-47D9-BD70-682A7D046272
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 8 dec. 2011, om 22:59 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-12-08 at 17:12 +0000, Phil Blundell wrote:
>> On Thu, 2011-12-08 at 16:55 +0000, Richard Purdie wrote:
>>> The question is whether it makes sense to have directfb and X based =
gtk
>>> in the same builds and package feeds or not. I can see that it might =
be
>>> desired and that it likely is possible.
>>=20
>> This is true, though there's nothing to stop a distro that =
particularly
>> wants this from inventing their own stub recipes which just set
>> PACKAGECONFIG appropriately and then require the generic version.  So
>> it's really just a question of what we want to be the default in
>> oe-core.
>>=20
>> Also note that, although you can parallel install multiple versions =
of
>> the gtk+ runtime on the target system, if you want the build system =
to
>> be deterministic then (in the absence of per-recipe sysroot
>> construction) you need some way to decide which one gets to provide =
the
>> gtk+-2.0.pc that other recipes will build against.  (The different
>> targets have different library sonames so you can't just swap them =
out
>> at run time: a given binary will remain coupled to the particular Gtk
>> variant that it was compiled against.)  And if the two variants could
>> conceivably be different versions of GTK then you also need a way to
>> deconflict ${includedir}/gtk-2.0. =20
>>=20
>> So it isn't quite as simple as just having the two recipes, there is =
a
>> bit of extra policy involved as well.  And of course there would be =
all
>> the normal overhead in terms of parse time, memory footprint and
>> maintenance burden associated with having more recipes. =20
>=20
> This is the key detail I was missing. I thought they just might have
> been a drop in replacement.
>=20
> That isn't the case so this makes the choice easier, I think separate
> recipes don't make sense based on this.
>=20
>> So, in light of all the above plus the fact that everything is =
different
>> with Gtk+3 anyway, my preference for supporting directfb on gtk+2 in
>> oe-core would be to use PACKAGECONFIG and not have separate recipe
>> files.
>=20
> Agreed, given the above.

So to be safe and give other directfb implementations a change, can this =
PACKAGECONFIG option be named 'gtk-directfb' in DISTRO_FEATURES?



--Apple-Mail=_0995D42F-F23D-47D9-BD70-682A7D046272
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7hr/cACgkQMkyGM64RGpGt8wCgs3JDK4xENzgiL8F0EXmhSTT7
6rgAoIrIqMI9TfDaEv1HGMGNoEzJBP2t
=UKY7
-----END PGP SIGNATURE-----

--Apple-Mail=_0995D42F-F23D-47D9-BD70-682A7D046272--
