Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBxWv-0001Qf-Kk
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Mar 2013 02:16:33 +0100
Received: by mail-ea0-f175.google.com with SMTP id d1so534290eab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2013 16:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=BC06m4Pa0MOV/l6KM9qGksfs3ZhQl2JVW67imBVZBcI=;
	b=qLyOKGG0dY7XbBkx5RC60vGY1GsZDwzx3pRM8qRkWZa45naS9l55a+1T7GbPuPA9P3
	5DskK3rLqnbFn3sshzU/Pb/Z65kCbBwJJiBXW61W5ldDpkzUhT2vgwYxsNwPJSLG8wdU
	sJTAq7blcXRwAyNgCgHY2g2XcloxAISKOakR4RtAaJ8DHjh+gpX1xgHCIo8DDx9tnY0x
	L7UUtcnLeEMByThVGtU6myLELTMy2YFNaYMVqFBGQd+iUFgoHrZV2LNF9JCIQ8n9f2PA
	euWD3vDdijoj2vFRfoyTX3r/Hoe2B0ANX8YSxVttUMxDS3KxIn4gvOOyuHqwGUcA1K7U
	c07A==
X-Received: by 10.14.5.6 with SMTP id 6mr43021832eek.42.1362272371909;
	Sat, 02 Mar 2013 16:59:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a1sm24673441eep.2.2013.03.02.16.59.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 16:59:31 -0800 (PST)
Date: Sun, 3 Mar 2013 01:59:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130303005928.GA3285@jama>
References: <1359971830-17441-1-git-send-email-Martin.Jansa@gmail.com>
	<1359980304.14071.154.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1359980304.14071.154.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu.inc: depend on qemu-native only with runqemu DISTRO_FEATURE
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
X-List-Received-Date: Sun, 03 Mar 2013 01:16:39 -0000
X-Groupsio-MsgNum: 36153
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2013 at 12:18:24PM +0000, Richard Purdie wrote:
> On Mon, 2013-02-04 at 10:57 +0100, Martin Jansa wrote:
> > * qemu images are usefull even without qemu installed on build machine.
> >   Some people are building on one machine, but then downloading images
> >   somewhere else to test them.
> > * use new "runqemu" DISTRO_FEATURE and BACKFILL it so the behavior stays
> >   the same, unless disabled by DISTRO_FEATURES_BACKFILL_CONSIDERED
>=20
> Using DISTRO_FEATURES for this is nasty since if you change this item,
> the sstate cache is invalidated. Its really a build configuration level
> thing, not a distro feature...
>=20
> So whilst I appreciate the reasoning for it, I don't think its the right
> approach and we'll need to find another one.

What about removing this completely and adding check in runqemu script
to say that qemu-native wasn't built?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEyoHAACgkQN1Ujt2V2gBwDFwCaAz9Q6TJxhxXY/IC39PuT388a
pFAAn1UhxxKI4BpTkKivfNd+yjZNSyK7
=1bwM
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
