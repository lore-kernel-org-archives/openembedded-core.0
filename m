Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYdp4-0004e1-So
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 15:20:15 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so207602bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 06:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NsUF6brFxTKxoa/1VxEGgC0drqNyF9ol4t9B7+5ggfQ=;
	b=C0y7E3C+owE4fO9jGzyeWDO6iEVhdoIRUKrllnAj7LdhsK1mHJLiEtp/UCZ+GTahKr
	JffUjv60RfajtJvrNBAeCHpWjrTnTu0ZHLGVEah0GkJ3Y6DgHVohBr/d8AQwaLCdgrvZ
	bPZU4sKgxuCmEGl9kjC32riFcsfqQhH9My+sxjqXcmADPTXIlzgctynYpiBZEx64v5JR
	yfcc6bG4rSEyzf/D02XsLrifyA0UIa1SOGYCVKzJ+JBrwkqfyGmTq0cph+eJUndRKpTe
	NclmFkkyB4G5ObpvCpZS4lRqQfbAtIA+lUziuUJb42dDu3p9Ky3KAe54QEAGSeokxf9X
	ugzQ==
Received: by 10.205.121.7 with SMTP id ga7mr8972565bkc.30.1352901975226;
	Wed, 14 Nov 2012 06:06:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gy18sm8076388bkc.4.2012.11.14.06.06.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 06:06:14 -0800 (PST)
Date: Wed, 14 Nov 2012 15:06:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121114140626.GM3928@jama.jama.net>
References: <1352815159.24487.122.camel@ted>
	<20121114123026.GK3928@jama.jama.net>
	<1352899442.13332.2.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1352899442.13332.2.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Add fix for cross compile issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 14:20:15 -0000
X-Groupsio-MsgNum: 31342
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GoZzJvFfKjxI3RhA"
Content-Disposition: inline

--GoZzJvFfKjxI3RhA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 01:24:02PM +0000, Richard Purdie wrote:
> On Wed, 2012-11-14 at 13:30 +0100, Martin Jansa wrote:
> > On Tue, Nov 13, 2012 at 01:59:19PM +0000, Richard Purdie wrote:
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > > diff --git a/meta/recipes-extended/bash/bash-4.2/crossfix.patch b/met=
a/recipes-extended/bash/bash-4.2/crossfix.patch
> > > new file mode 100644
> > > index 0000000..f587c34
> > > --- a/dev/null
> > > +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> > > @@ -0,0 +1,28 @@
> >=20
> > Are you using some special tool to generate git patches or some weird
> > git version?
>=20
> Basically, the data from cgit in the web interface is broken and that is
> causing this.

You're copy pasting cgit output to email when sending patches, or how is
cgit involved in your patch flow?

I'm just curious, because I usually use only git send-email or
create-pull-request script.

Cheers,

> > Patches from you where you add some file usually does not apply here,
> > It's caused by:
> > --- a/dev/null
> > +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
> > which usually looks like
> > --- /dev/null
> > +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
>=20
> Right, there is a bug in cgit. I'm not sure if anyone fancies trying to
> find/fix it?
>=20
> Cheers,
>=20
> Richard
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GoZzJvFfKjxI3RhA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCjpWIACgkQN1Ujt2V2gBxi1wCfVcV0ryxihx3XsIUrypStx1PN
rNAAn3weNwUmmrsQuNE8g+03DYigwicN
=K7sq
-----END PGP SIGNATURE-----

--GoZzJvFfKjxI3RhA--
