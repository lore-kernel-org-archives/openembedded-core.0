Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Uakz0-0005SJ-2B
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 12:55:47 +0200
Received: by mail-ee0-f44.google.com with SMTP id b57so52065eek.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mbU0YKUSn/JvrEA88qehIDPjRswz/KbVHspuuSi9w2U=;
	b=FekcO+QXwIXMsaSqeWVzZzQCwgrpkPzIt4V0SSinwJjwoC9qgSwt+7BZI7WqP6F4+c
	vu++FBraf5l4RhgiLYtqH/rithGZK4Uy1EalbWS32BWj48tH30BBLMBqHiGBQlzd9BgK
	vICXBHTGvll0hyK+/MGYPOnaqBp1XRgaSIqdO9UL7sbu7rYrfKfaWY3WJ5usVK3LdSjF
	Jlh5iq9+RQoSD0CvXs/RSnr4SFCkvoM/ho9M8OgQshBN770ZjHOAm0Qixxr1voiq9uGg
	CUjEVV7NRPObnH9miTymAZKQFfVl+WwOR6RBLRE1yAT+gS2SOvKzlJMfah/WAESaZVg9
	StwA==
X-Received: by 10.14.206.129 with SMTP id l1mr39796274eeo.30.1368182241212;
	Fri, 10 May 2013 03:37:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj12sm2728309eeb.8.2013.05.10.03.37.20 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 03:37:20 -0700 (PDT)
Date: Fri, 10 May 2013 12:37:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130510103722.GB12329@jama.dyndns-home.com>
References: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20130510102041.GA12329@jama.dyndns-home.com>
	<1368181932.11129.11.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1368181932.11129.11.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: updated to 2.5.37
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
X-List-Received-Date: Fri, 10 May 2013 10:55:59 -0000
X-Groupsio-MsgNum: 39007
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2013 at 11:32:12AM +0100, Richard Purdie wrote:
> On Fri, 2013-05-10 at 12:20 +0200, Martin Jansa wrote:
> > On Fri, May 10, 2013 at 01:15:10PM +0300, Bogdan Marinescu wrote:
> > > Removed the patches to flex, because they are now applied to the
> > > latest version.
> >=20
> > Can you check if 2.5.37 still reports flex.real when you call
> > flex --version?
> >=20
> > If yes, please integrate
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2013-May/039425.=
html
> > I'll send v2 with added ${S} in a minute
>=20
> I'm really not convinced we should be hacking flex to fix this. Can't
> whatever parsing is being done to extract the version be a little more
> relaxed about the name?

And patch cmake (and possibly other places) instead to work with our flex w=
rapper?

There is also that problem that flex++ behavior is enabled based on '+'
in executable name, so if we ever need wrapper for flex++, we
would need this hack.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGMzeIACgkQN1Ujt2V2gBziwQCgtSLUAXYYUsrqblgMYgEQnTax
MZ8AoJz91SKGutFnedftvVhbjRZpe8DY
=y4s+
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
