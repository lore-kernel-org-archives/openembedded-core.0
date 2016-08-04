Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2810B762B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:00:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so45343344wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Li+nkIxglOfRCkErgHt0MNzaMM6NslrY0t83mN96QzQ=;
	b=Fd7qpg9rWditSq9Tf9BJlszc/cDFrvloR/eMf0oTzg9NRio4/LIUaNfa55BIekIBLu
	t0n7YGzEx6pCzL9MC3RmS9PZlsSJ94SA+dREIMbypZbgDYxnVUbC3u+dx1NeJ2ZIiqXn
	dnxiq0CaP2367E01CrZU9fsbCOvIXBRY4Mm4EKPKUbcgYgaGVWwBe8wRej+p2xwNAIBT
	tyRps99w3fkwKxnZeh/BiqVGei+phiMHmeDBEejvnlUroAMwUcD1ZIIhE8bfTlBhSm49
	R3fFncn4tuziTxuJdI1pPVMndwa4ehOk9hLghAXFksATxCASm0/HG7J4JmA3c39aqklV
	JXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Li+nkIxglOfRCkErgHt0MNzaMM6NslrY0t83mN96QzQ=;
	b=gJxeRmsZyGXgOWZ91rWZGgOaQmi8ibMchGAvHuiHD2SCT0oEzv82J5r3SsiOU4qzaV
	gf+yasDrlKlITZ9ynoqfo5JGlSmRJV7jtunfWRIY33S1dM0VeRTuqzMQge8U/XAUsYQH
	Hj+zF0gJC8cLcItaLYHzFF4frS0j118YxCB0QggSPVSIjuFtU8w9zSQEXSYKjM0Vwr8J
	uIcIt+SvFi6iPi9hOGUUPejUoUakbBnq43wEvluyvmbqSxsfDJmH7Bz7uBtkB5yURb1J
	67GEGgSkhmMUtwrnRgHCH6b1JyPXVHBYn4C9/1bn6oIOho633ET6TROwZZj97Vt3qkO5
	8VMQ==
X-Gm-Message-State: AEkoous4Dz+Gp12JiSzhsxRz7coSLfqNtM1Jlfhwxv6+ap7U0/xdrbeZgV8WKC/wdfWszQ==
X-Received: by 10.28.191.14 with SMTP id p14mr29049340wmf.39.1470322825819;
	Thu, 04 Aug 2016 08:00:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a2sm13232256wjg.46.2016.08.04.08.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Aug 2016 08:00:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Aug 2016 17:00:32 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160804150032.ml77q3vedosk6cqt@jama>
References: <20160801104924.10815.18743@opal.openembedded.org>
	<20160801104927.C930350170@opal.openembedded.org>
	<20160804143423.a6fyiopqmt6abcq7@jama>
	<CAJTo0LbC0CObxR+5WVOAHqZf0Hd4jztBUcdNZP_tOjX9zctpHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbC0CObxR+5WVOAHqZf0Hd4jztBUcdNZP_tOjX9zctpHQ@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 11/43: libtasn1: upgrade to 4.9
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
X-List-Received-Date: Thu, 04 Aug 2016 15:00:27 -0000
X-Groupsio-MsgNum: 85317
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="52fn55yjfclmknut"
Content-Disposition: inline

--52fn55yjfclmknut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2016 at 03:39:28PM +0100, Burton, Ross wrote:
> On 4 August 2016 at 15:34, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > | In file included from ../../libtasn1-4.9/lib/structure.c:32:0:
> > | ../../libtasn1-4.9/lib/parser_aux.h:97:1: error: inlining failed in
> > call to '_asn1_set_down': call is unlikely and code size would grow
> > [-Werror=3Dinline]
> > |  _asn1_set_down (asn1_node node, asn1_node down)
> > |  ^~~~~~~~~~~~~~
> >
>=20
> Works for me and the AB.  What sort of compiler flags do you have?

Might be caused by -Os.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--52fn55yjfclmknut
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlejWI8ACgkQN1Ujt2V2gBwP8gCffqb+stJtKMFsACZp1NZbpAsz
noEAljEpVKgclqBwPGoOoOo3ZNMS3uA=
=a5Gv
-----END PGP SIGNATURE-----

--52fn55yjfclmknut--
