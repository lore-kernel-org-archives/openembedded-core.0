Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0658A7064F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 19:33:28 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so1719342wes.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 12:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=szJRTYzGqwPqOvi6YrnSQqbimKxQYBPaIFdGDcyjD+E=;
	b=iCSZweAcM9oSxhmqswBWdHTKFiAL04jF067MSaVmhRafXRVdO87oQVXJaODyWjYHPn
	pCYK2Ed2luUf7/PXTE+X9flZYdloWW0Yh9wp3Qk3QrxGJpb8BLMf8iioW5OFMslpP+fO
	iv4JryOyeGpqWW1eUhQxfR6aQoiLbm5+qlKCaU8+WQLzAZEvTnSU/NLLrlDphDA6w4B/
	ZuCUWabP7XYV+XN/fA+zmWrV53ijBN3ZD+oBTdjxdPKikdt9WYkQAB9COBikV2GVFDHf
	XZptBleXPfLgqknnn0b3pRVtal0mG7/sPB+URYx+jjZwbW716OclXtTKBVa0dkq+LDUL
	9QyA==
X-Received: by 10.194.123.105 with SMTP id lz9mr9481225wjb.122.1406748808545; 
	Wed, 30 Jul 2014 12:33:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb8sm58575512wib.15.2014.07.30.12.33.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 12:33:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 21:33:51 +0200
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20140730193351.GU16445@jama>
References: <53D91F3C.3050107@mlbassoc.com>
	<CAMKF1srm+0up4YsN2u6UQrmO948NHqk1YZAwhx_kaX22e-h=zQ@mail.gmail.com>
	<53D93220.4030901@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <53D93220.4030901@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: freetype-config broken?
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
X-List-Received-Date: Wed, 30 Jul 2014 19:33:33 -0000
X-Groupsio-MsgNum: 55779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p609JBPwWeYlfsbE"
Content-Disposition: inline

--p609JBPwWeYlfsbE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 11:57:52AM -0600, Gary Thomas wrote:
> On 2014-07-30 11:32, Khem Raj wrote:
> > On Wed, Jul 30, 2014 at 9:37 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> >> The behaviour of 'freetype-config' (from freetype-native) has
> >> changed since this commit:
> >>    commit 3476a49b10093c58b2f89e3d9a8527224f1bd7f6
> >>    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>    Date:   Thu May 22 10:59:33 2014 +0100
> >>      binconfig-disabled: Add class and use
> >>
> >> This is breaking my build of mplayer which uses freetype-config
> >> to determine how to use the freetype library (in ./configure)
> >>
> >> The comment in the commit indicates that this is an improvement
> >> and the path forward, but I don't see how to change the recipes
> >> (and scripts, etc) that rely on this functionality to work in
> >> this new mode.
> >>
> >> Any suggestions?
> >>
> > add AM_INIT_AUTOMAKE([foreign]) to the configure.in or configure.ac
>=20
> I don't see how your suggestion helps.  This package (mplayer) doesn't
> use autotools - it has a hand coded configure script, so there is
> no configure.{in,ac}
>=20
> I also looked through the logs and didn't see any recipe which uses
> a package that is now marked as binconfig-disabled as to how it
> solves the problem.  A pointer/example would really be appreciated.

meta-oe:
6898dae64e79fa81c3b032cb314e3c2d6f2c6e0d
d7363984b83c938db6f0a16ca8732bed69ca8acb
141aedb403e4bb91dac6ffb109ee74dfaee59f81
18ccf18ee4949b785e240d9f8f8983c6554dd4e9
09566d518a56a413303d7d13d496254b467c635b
6cc47fb2b007504be3e32698ed14b1bebc981526

oe-core:
b550572bdad318aed02230496721430eec89c937
d2457880e7bb08b9c2f8d60e70b1d59ed84e9da9
fe277bf0a61d5d7787dba699ee1ed4d979ba5cff
4a971a90988435902a4a8dd9c721d440cd80c0bd
ffffc627b21a3cf8b407d16a437793b5fddf7127
74d73cf1e4607cb313b5e4c7138b555d5999a46d
f0479e60b660778ab27b946d426daa17a08a28ea
437ad15de308769c9251a37ed41dabed5653fc96
17e5793847601d2aeb497ffe14871df65543abfb
ff573270f7e87296840911189fd2087a1bc597f7

It's really not so hard to search for "-config" in git log.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p609JBPwWeYlfsbE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPZSJ8ACgkQN1Ujt2V2gBxomgCgrg4oFDel/IakqJkhwnpvsiFw
/McAoJiDzCwj36qGw243U+eUOy0lOm3J
=2wM7
-----END PGP SIGNATURE-----

--p609JBPwWeYlfsbE--
