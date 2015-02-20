Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBCC73626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 14:36:53 +0000 (UTC)
Received: by wesw62 with SMTP id w62so5914550wes.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 06:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W1Iw5+NWwtI0nZ3iHS5KUIVcZd5awa+wrQB+f6bfAns=;
	b=vkTY+iDifoJttdW3NejYGAp6/Jrq0ghSsyVxWMIxkQ/KB95BUJ4PbVhUCq99sLQ4op
	qboLLfjqXvV2d7ejhIN92kuYbaPitIJYUsKLyM9U0QyOxaE+p2XXRXXBkbLDBXmh2lOB
	a3WbkXee7x5rlHaR47Eph3c549NNwkrQLnMkWQp6ChHhHIYfAV938Vp1UvU+KY8XLsLa
	s7GobJl6V/r8ibt+GKO+zEQjrhFhdFRkacSXSPasFX5cPrTnAYKJZjIDJFiJBUwLPJMF
	HrQuCGT33OPlwDxkeO7kmQxhz2mVDpCRY6GX14hkN6C2fKAA0+yTf32stzeQXMoroTSY
	VIwQ==
X-Received: by 10.195.12.71 with SMTP id eo7mr19872959wjd.3.1424443014395;
	Fri, 20 Feb 2015 06:36:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm2649323wix.12.2015.02.20.06.36.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 06:36:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Feb 2015 15:36:57 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150220143657.GI2322@jama>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150128134042.GI2477@jama>
	<87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<3296846.qcxKKmWIPr@peggleto-mobl5.ger.corp.intel.com>
	<87oapbdctd.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<CAJTo0La=KuSp2anpGk3=6GPaq_ksWHY1NmOBi9VQ31K=uVjSVQ@mail.gmail.com>
	<20150220124501.GB2322@jama>
	<1424436603.11836.42.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1424436603.11836.42.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Fri, 20 Feb 2015 14:36:54 -0000
X-Groupsio-MsgNum: 62595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EEx6GiKZGZ1wKUra"
Content-Disposition: inline

--EEx6GiKZGZ1wKUra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2015 at 12:50:03PM +0000, Richard Purdie wrote:
> On Fri, 2015-02-20 at 13:45 +0100, Martin Jansa wrote:
> > On Tue, Feb 03, 2015 at 04:02:36PM +0000, Burton, Ross wrote:
> > > On 3 February 2015 at 01:05, Richard Tollerton <rich.tollerton@ni.com>
> > > wrote:
> > >=20
> > > > Done (and sent), and my apologies, because this exercise has made c=
lear
> > > > that I was wrong in several of the details here: None of the three
> > > > patches were committed; I was confusing one of them with 89a29a3a, =
which
> > > > was from a separate email. The confusion originated in 89a29a3a hav=
ing
> > > > been committed after I had already withdrawn it, which I forgot abo=
ut
> > > > over the holidays.
> > > >
> > >=20
> > > That's probably my fault, sorry.  Thanks for following up and resolvi=
ng
> > > this properly.
> >=20
> > Can you please merge those fixes before 1.8 is closed? Or at least
> > revert the original patch which shouldn't be merged, until your comment
> > for 1/3 is resolved.
> >=20
> > FWIW I haven't noticed v4 to resolve:
> > https://www.mail-archive.com/openembedded-core@lists.openembedded.org/m=
sg61018.html
>=20
> We don't have the "right" patch for this yet. I don't want the fonts in
> the sysroots, I agree we need to resolve the other issues though. I also
> agree this needs fixing for 1.8, thanks for bringing it up.

Can you please revert:
  commit 89a29a3ad0742cd713e739d3d460be7711966679
  Author: Richard Tollerton <rich.tollerton@ni.com>
  Date:   Fri Dec 12 13:34:00 2014 -0600

    font-util: Fix incorrect PKG_CONFIG_PATH

?

It doesn't do anything useful as Richard confirmed by withdrawing it and
all font recipes are broken since it was merged.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EEx6GiKZGZ1wKUra
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTnRokACgkQN1Ujt2V2gBzlEgCfQKoUi/n0mlPI2J+PwwVzWyH2
cxcAn2AQAoPHb/DMA+0S1Wue77E+Ui9D
=IvPS
-----END PGP SIGNATURE-----

--EEx6GiKZGZ1wKUra--
