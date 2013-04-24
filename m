Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UUthG-0006c7-BC; Wed, 24 Apr 2013 09:00:54 +0200
Received: by mail-pa0-f52.google.com with SMTP id fb1so988919pad.25
	for <multiple recipients>; Tue, 23 Apr 2013 23:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0U2QVI02XXRDkuMSpgeui59UmNcO+dAt62jOEs3F9sQ=;
	b=eZi9C6cRBE7YxwhZ7wnXkRyFe++Ql7JzK8J7HGVaJ8c1GKwIvOnoD3oBIXA2lLHeoU
	Wbspka6XP8f+5cOm7c6LFjx5F8vW2gAnljTYfhOWs6FISf7EdMOFiVHk9li2vjYEvBnJ
	Mw2LUjmN0rRTXTNtVWxrrMlYUaXLDf/JD5rRe9NCi4ALq69x+sPtm/g9zqghSrCJMh5X
	y6Lydu8QqnhucrzfkGtJXJOgT0VzMAn/3pCLIJVdAHymnpbncNpYlzLeAfs3jD5+cOKs
	6C7S0u8GQYNbSiuqxyUHug2oHyjViZ7yZGHYW7lQNyXn0kT/kU0aFJKY6eBiwYyrpIGU
	B6xg==
X-Received: by 10.68.254.225 with SMTP id al1mr46526031pbd.69.1366785791745;
	Tue, 23 Apr 2013 23:43:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	vk7sm1769918pbc.41.2013.04.23.23.43.08 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 23:43:10 -0700 (PDT)
Date: Wed, 24 Apr 2013 08:43:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130424064319.GD3217@jama>
References: <CA+YB3rb6xwk2-rsSa=dQx19qp7jKAVBZiMmQB5DvrGOmLUFG2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+YB3rb6xwk2-rsSa=dQx19qp7jKAVBZiMmQB5DvrGOmLUFG2Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OpenEmbedded TSC 8 April 2013
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
X-List-Received-Date: Wed, 24 Apr 2013 07:01:17 -0000
X-Groupsio-MsgNum: 38277
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline

--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2013 at 02:47:56PM -0700, Jeff Osier-Mixon wrote:
> OpenEmbedded Technical Steering Committee
> 8 April 2013
>=20
> b. document whitespace changes to the shell
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> http://www.openembedded.org/wiki/Styleguide
> https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
> =3D> still need to de-dup these, need a volunteer
> ask for volunteers after 1.4 (jefro)

Someone probably noticed, but all meta-openembedded layers are now using
consistent indentation:
http://git.openembedded.org/meta-openembedded/commit/?id=3Da45830a39bb47a9e=
ab27980d52966226c9504ea4

Can we reevaluate decision to keep styleguide promoting different
indentation for python and shell tasks? Otherwise we should mention
different rules for oe-core and other layers.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF3fwcACgkQN1Ujt2V2gBwiqgCglRZCaALlMIdtBAMkM+Q52A5q
R/IAoJqBluRy8DVOx8xiXi6KpEuF3RIM
=9IIN
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
