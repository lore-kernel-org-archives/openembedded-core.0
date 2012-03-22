Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAc8S-0001pw-BZ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 08:08:36 +0100
Received: by wgbdr12 with SMTP id dr12so982918wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 23:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k5/vKvkvfvY0Fic8Dp0UvcHQqutNMufTpdmcRdLPDdQ=;
	b=oBnENAapkgKgnlprZXE36BywbAFCMoAFXPKMad0eAfPmNo4r0rwR+IdepxwF/nY7oK
	Oz6mUlgSSm5LMUc/+vih1QZsNwaBsQjwir2w6yGC/T8laryJay3V4rwMnRq6ny18Qh3G
	ioPgjm8pHboNYy8bPce9idGdRwpfW1TMejaK2VzBRULuIdYZK9UuTDaxFjowLiPx8g7q
	I5X4z9FU/FagXwvvXOSjiIoSPwmv6YX/vl8Ufe0DvKcTT/WRU8MfkTtyPkbGY6nSmkuO
	Amh+cB8HgfIIo5g38aKKGhAxxmfc9p5z7b2UD/jTZxyQidC88pBvY8PCliYRu8/mBYWM
	F9vg==
Received: by 10.216.137.30 with SMTP id x30mr3736501wei.34.1332399581672;
	Wed, 21 Mar 2012 23:59:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm5182950wid.2.2012.03.21.23.59.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 23:59:40 -0700 (PDT)
Date: Thu, 22 Mar 2012 07:59:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120322065940.GC4010@jama.jama.net>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<1332361627.9740.180.camel@ted>
	<CAMKF1sqvv+x2tf4eT7Y7yf9MYLh4cf+o__kGoL+hup-xnb9q+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqvv+x2tf4eT7Y7yf9MYLh4cf+o__kGoL+hup-xnb9q+A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 07:08:36 -0000
X-Groupsio-MsgNum: 19391
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 09:47:43PM -0700, Khem Raj wrote:
> On Wed, Mar 21, 2012 at 1:27 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2012-03-21 at 21:14 +0100, Koen Kooi wrote:
> >> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
> >>
> >> > On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
> >> >> * This move will allow the testing of meta-kde for users without me=
ta-openembedded.
> >> >>
> >> > So what other layers are using giflib?
> >> >
> >> > Your suggesting that we need to have it in oe-core so people don't n=
eed to add the meta-openembedded layer when using meta-kde?
> >> >
> >> > I am just trying to get more data before making a decision.
> >>
> >> Let's put everything in oe-core!

And then again and again!

> >
> > Let's try and be constructive ;-).
> >
> > I think to make a good decision about this we need to understand which
> > layers use giflib.
> >
> > Is this really the only component from meta-oe that meta-kde needs? If
> > it is, I think the request is certainly worth thinking about as we do
> > want to try and minimise and untangle the dependency spider web if we
> > can.
> >
>=20
> I think this library could belong to OE-Core since its a library for GIF =
images
> its currently used by EFL libs. Putting it in OE-Core would be a better t=
hing
> IMO since it seems common library

FWIW: meta-efl depends on more stuff from meta-oe so moving giflib won't
remove meta-oe dependency from meta-efl.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9qzdwACgkQN1Ujt2V2gByMwgCgqhsGS02cMoGs0qSToGtoCHEc
wH8An3nn3gsXZ/u9qXqocUiWk0AVs121
=sbnN
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
