Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBkKC-0000M6-3r
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 12:37:40 +0200
Received: by eaad12 with SMTP id d12so665627eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iGuZIDqvVReVxCckU1xXi5hQ9FFx9kYDw5u30IPXjUg=;
	b=MuT9HtAT3Pd/InKtOwms2hBeEDDGgYS3TVDXEmNOn7KAsMsx4nJW1yTpfumA6mpbH1
	Zh2yVZfK9mTstqRFQeplmIoPvWc735Etf8rRyyCjaFAxRJRnXuclfc41jKHg/sBWoxe1
	13b+Ez3AZzRgIA24O9k+dhmaxIKmh+QMUGS1qcs5VUd3XoZ9lUaljOuOCBVTNl19GPE/
	0b5LYiL1GaExlL7Zx+Hgy6F4AMhclPqXIjAqayFnlFPI9Xr4uwg4uFDrqGWcaVEBRf/P
	CQcJxNpaNwh3OIDoRP2ujIGK/FLaf3R5P3itZP88oDhrkuK4Y8RJLlGcXgUphjqlT8uI
	J61Q==
Received: by 10.204.129.215 with SMTP id p23mr5780902bks.3.1347445508112;
	Wed, 12 Sep 2012 03:25:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 25sm11421503bkx.9.2012.09.12.03.25.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 03:25:07 -0700 (PDT)
Date: Wed, 12 Sep 2012 12:25:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120912102508.GB8268@jama.jama.net>
References: <1347444916.2122.101.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1347444916.2122.101.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Feature Developement vs. Stablisation and Bug fixing
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
X-List-Received-Date: Wed, 12 Sep 2012 10:37:40 -0000
X-Groupsio-MsgNum: 29148
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline

--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2012 at 11:15:16AM +0100, Richard Purdie wrote:
> Hi,
>=20
> I know in the past this has taken some people by surprise. Both OE-Core
> and the Yocto Project are aiming at release points every six months,
> roughly October and April. In order to prepare for those there is a
> period of 6-8 weeks beforehand which is aimed at stabilisation and bug
> fixing.
>=20
> We are now entering that window where we need to heavily taper off new
> features and concentrate on the quality and stability of the release
> which is scheduled for mid October. I'm not saying no new feature
> patches will get taken but I will be asking questions like "why is this
> being worked on?" and "shouldn't this wait until after release?". I'd
> really like to see effort being focused on bugs now, not enhancements.
>=20
> I know there are a couple of things which have been worked on for a
> while and have been slightly delayed which I'd probably lean towards
> taking (some offline postinstall work spring to mind). I was asked
> whether I'd take a binutils update in a couple of weeks and the answer
> is no, I'd very likely not as we're at the point we need to lock in on
> the toolchain now (and major kernel version).
>=20
> Does anyone have any questions?

Is stuff discussed in thread:
ARM-tuning -- was qemuarm: should it really have TUNE_ARCH armv5te?
considered new feature or bug?

In other words: should I try to test and send my proposed changes soon,
or keep that for next cycle and just stop building qemuarm?

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBQYwQACgkQN1Ujt2V2gBwAIACgpkMKZhIhZNEqJsXC4liwz4N4
ldwAnReT3D8ooGlI3t6E8WYnWqv/pu1t
=dqwA
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
