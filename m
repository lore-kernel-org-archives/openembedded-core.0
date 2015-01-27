Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3059C718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 15:18:30 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w55so10052092wes.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 07:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Da5sk+G4vQrM9OppG9rLAtEdhMYo8s+dktAa4TP3N9Y=;
	b=UJiTk0ayiTtMqn0wofgp6GPF/l5NO9BHr5jGAjZehFzKn6FybDpNuo+8/7lpExXYKf
	Sa5Z2Yz2wHzCXZUFP24zORsdq89IhR6lBHCu73Jg+xMeh1bluXnMNCbJe7uh+0GMdfXb
	rnyq38scfN/tT7rQzX+85AFrinv9rKUOiM8r4wGKCZDhpQ0j5ImPWGCwfH7FOTHA1vA8
	+kTpr53r/EWEm0a0F3AwDsXfcj9Di5HGfil7v7I9GkeSdlDBZW3gDZvhy9tBYjvNAwFm
	2XCE/SmBqvSyKxN2Q5cIg6MHBc6sSTDE6wLHqc22ZrX8JL7ovPCHC+NdW2MW6zLZlzCI
	HTXQ==
X-Received: by 10.194.104.196 with SMTP id gg4mr3633514wjb.31.1422371910868;
	Tue, 27 Jan 2015 07:18:30 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	be2sm2194580wjb.38.2015.01.27.07.18.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jan 2015 07:18:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Jan 2015 16:18:30 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150127151830.GA2477@jama>
References: <54C759CD.1030905@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54C759CD.1030905@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About subversion_1.8.10.bb and subversion_1.6.15.bb
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
X-List-Received-Date: Tue, 27 Jan 2015 15:18:39 -0000
X-Groupsio-MsgNum: 61723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2015 at 05:26:37PM +0800, Robert Yang wrote:
>=20
> We have both subversion_1.8.10.bb and subversion_1.6.15.bb in oe-core
> layer, and their license are the same (Apache-2), does anyone know why
> we need keep subversion_1.6.15.bb, please ? I'd like to remove the old
> one if no objections.

Different checkout format.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTHrEYACgkQN1Ujt2V2gBy3lQCggyoS6CURdPm/ymeoTJ0aLfAu
pYMAnjqX101KcccgBVkQvqM+wUq5tu7f
=7bML
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
