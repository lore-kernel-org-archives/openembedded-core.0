Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBo1x-0007FQ-BP
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:35:05 +0200
Received: by eaad12 with SMTP id d12so781949eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bXZHFJoS+MPAJa1fN8n33O22QSTZWgMr18TlkRGpWhw=;
	b=REM6vSnsRe9Gg4F6QQgREmwPtzeVrStAB2K7WFxpQDWj5xUb6HxhkSm0gkHAIlBI+g
	ACzBpKt5iVGWBslYWhj+NExtysWK43lFCKzCB31IHn2oi7ZFXvxUvVcUhqt1lL7Dimn1
	SCbRbPkQIMBuN/0lOoT5imtb4efoo/zj+VDX8w2tvtW/090VJ43gaAPZDlv3oVfbInTO
	b4WTjob7heTIrINShflLMW6F1CLwBlq/Us6CclK2DStlRYwg2w3gkl4IxwGLeKQKlB0O
	ia4OoiL4ACQlI6DtDKRF0gH9EwYwQ7GO31OHb1Q6Fme8GfrrKWt7qHWJVXp1/T7WGnk0
	cJfQ==
Received: by 10.204.152.136 with SMTP id g8mr5950468bkw.44.1347459752987;
	Wed, 12 Sep 2012 07:22:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm12135308bkc.5.2012.09.12.07.22.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 07:22:31 -0700 (PDT)
Date: Wed, 12 Sep 2012 16:22:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Message-ID: <20120912142232.GA3162@jama.jama.net>
References: <1347455995-24565-1-git-send-email-schnitzeltony@googlemail.com>
	<1347456710.11710.11.camel@ted>
	<CADkTA4P-THBeYwVkRvnyy3TxH6OTs9qcYUE-cBwXLWjJou7zrA@mail.gmail.com>
	<CAGiJk9dn+rD5c=r958rWA8YcH_F88z_EWP5sEN+jDmknWQ-59A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9dn+rD5c=r958rWA8YcH_F88z_EWP5sEN+jDmknWQ-59A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cml1.bbclass: fix kernel menuconfig
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
X-List-Received-Date: Wed, 12 Sep 2012 14:35:05 -0000
X-Groupsio-MsgNum: 29173
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2012 at 04:21:15PM +0200, Samuel Stirtzel wrote:
> 2012/9/12 Bruce Ashfield <bruce.ashfield@gmail.com>:
> > On Wed, Sep 12, 2012 at 9:31 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> FWIW I've been unable to reproduce this locally :(.
> >
> > I've also tried to reproduce this periodically and have never seen it w=
here
> > I can debug it properly.
> >
> > I'm also not disputing that this is an issue .. just one I can't get at=
 yet
> > either.
>=20
> It seems like this issue is only triggered on Fedora machines..
> (At least there were 2 reports of this issue on Fedora)

and Gentoo

> So far I've got no problems with (K)Ubuntu machines.
> But I've seen this on a Fedora 17 one too.
>=20
> >
> > Cheers,
> >
> > Bruce
> >
>=20
> --=20
> Regards
> Samuel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBQmqgACgkQN1Ujt2V2gBy4eQCfQB11vWnDNme3OsiO8fl8/OMJ
qu8An1iRrLMM8dVyxo76MJNJOTWX18cT
=IWtz
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
