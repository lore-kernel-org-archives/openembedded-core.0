Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB3R2-0000hg-Qn
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:17:36 +0100
Received: by wibhm17 with SMTP id hm17so1633168wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=urjhGFNZxHbiQczZwMRg5THdfABnhvm+KAztP2pvY3g=;
	b=sfc7IAxOV2MovWL2nfkutcLbfE5SJKJH284mB7XM4sVe7zqx64Af/PI6s48whRiIq/
	ikn+eRiRMkk+eWYe87rMPkZ4qlZiVsxso5GxHfmrZ/V39TSWqvaNFM8jIBpV7BqzFA4s
	+7gZL2jJgKbkROZ8U3ujWWQLFHvFS1ZVSFG6o5U78u2iYEAOU/puS+87HW0RvB4hUkOu
	RoF62DbJA/arS7G+urY3AjSnhkvOmAWmdW5Amd2NjnbTEqRtcyOtqVNgFhAhsTBvCVU2
	rq7UAGehnsybE7p9EDHQy5KeS/QtjLPvBTpWJZUi8AqzXuQkwrckP/1OEBPDd6iP5U7N
	NPJw==
Received: by 10.216.135.103 with SMTP id t81mr6879841wei.113.1332504520757;
	Fri, 23 Mar 2012 05:08:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm13324002wia.11.2012.03.23.05.08.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:08:40 -0700 (PDT)
Date: Fri, 23 Mar 2012 13:08:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323120841.GD3879@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332471418-31459-2-git-send-email-raj.khem@gmail.com>
	<1332504268.9740.394.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332504268.9740.394.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] pixman: disable iwmmxt
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
X-List-Received-Date: Fri, 23 Mar 2012 12:17:36 -0000
X-Groupsio-MsgNum: 19526
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Content-Disposition: inline

--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 12:04:28PM +0000, Richard Purdie wrote:
> On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
> > Pixman build system is borked and always wants iwmmxt intrinsics
> > it errors like below
> >=20
> > | ../pixman/.libs/libpixman-1.so: error: undefined reference to
> > '__builtin_arm_wand'
> > | ../pixman/.libs/libpixman-1.so: error: undefined reference to
> > '__builtin_arm_wsrlhi'
> > | ../pixman/.libs/libpixman-1.so: error: undefined reference to
> > '__builtin_arm_walign'
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb |    6 +++++-
> >  1 files changed, 5 insertions(+), 1 deletions(-)
>=20
> Merged to master, thanks!

khem, will you send patch for meta-oe .bbaappend so we don't have it
twice in OECONF?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9sZ8kACgkQN1Ujt2V2gBwIqACgmQW3d3S2zBHghl8lfXwHirId
NioAn29Vhthwu4jLOtGQyJBokute6jMf
=7sGA
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--
