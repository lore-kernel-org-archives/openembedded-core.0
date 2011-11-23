Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RT7Pa-0008RH-3N
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 08:38:30 +0100
Received: by wwf25 with SMTP id 25so8399517wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 23:31:55 -0800 (PST)
Received: by 10.227.198.140 with SMTP id eo12mr14179070wbb.20.1322033515028;
	Tue, 22 Nov 2011 23:31:55 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w8sm6853223wiz.4.2011.11.22.23.31.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 23:31:53 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 23 Nov 2011 08:31:51 +0100
In-Reply-To: <cover.1322028165.git.xiaofeng.yan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322028165.git.xiaofeng.yan@windriver.com>
Message-Id: <28E4D413-B6C4-46D4-8622-26CBA7255088@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 0/9] The patches to run gtk over directfb
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
X-List-Received-Date: Wed, 23 Nov 2011 07:38:30 -0000
X-Groupsio-MsgNum: 12793
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5AF50BBC-EAE5-4C17-838D-C5F8EB9809B4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5AF50BBC-EAE5-4C17-838D-C5F8EB9809B4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 nov. 2011, om 07:47 heeft Xiaofeng Yan het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> Hi Richard & all,
>=20
> I fixed some problems found at previous submitting and use =
PACKAGECONFIG to get mutual configuration between directfb and x11. I =
hope this submitting isn't a horrible mess :).
>=20
> One previous problem about what happen when user want to have both =
directfb and x11 in DISTRO_FEATURES?

That was the question I was going to ask

> I think directfb and x11 can't be defined in DISTRO_FEATURES at the =
same time because directfb and x11 are the lowest level library for GUI =
with different mechanism.

I don't understand what the above means, but I've been building both =
directfb and x11 for some years now and they don't clash.

> x11 and directfb should be mutual in DISTRO_FEATURES. User may use =
file "meta-yocto/conf/local.conf.sample.extended" to select the mode =
they want to need.
> but directfb can work in an image with x11. for example, "directfb" =
and "direcrfb-examples" can be added to task-core-x11-sato.bb. you can =
run df_andi, a demo based on directfb, on matchbox term running on =
core-image-sato with x11. So directfb and x11 can exist in the same =
image but not be defined in DISTRO_FEATURES at same time.
>=20
> If you have any suggestion, I will fix them again.

Last time I looked both gtk+ and pango had their backend modularized, so =
you can build both and install the right one in the rootfs. I think that =
would be a better way to go. Just look at debian with their gtk-directfb =
installer, they have gtk-X as well :)

regards,

Koen=

--Apple-Mail=_5AF50BBC-EAE5-4C17-838D-C5F8EB9809B4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7MoWoACgkQMkyGM64RGpF2yACdG6iDCUOk7Wq8NixtUk9/TifV
g4cAniVdzpGVq2+AZg+IAhRhJF031HGQ
=R8Jc
-----END PGP SIGNATURE-----

--Apple-Mail=_5AF50BBC-EAE5-4C17-838D-C5F8EB9809B4--
