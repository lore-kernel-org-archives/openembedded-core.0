Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4156093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:52:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t6-v6so13901923wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FPszzRX/hLNFYEgDjs+NnxYJtgLqsJpwYcNyuyXIMmY=;
	b=LTN3nfu2LqCK2Xy0M3Er1c35a/xsY3LlTR3mTkzAzzdOob4G6X42/jlzdajO/x0NLW
	pLoPsME9QKnWOay+igorSrvbJ6zwI7sugZQVkMTia1qRqPWRG6UytqE0Y/1u409eWmO0
	o60/ImvHwdR6BVRQ5Mmz372dKQwnc9KJfjsmPwkwIJ3pfoti1GFJ+ngIpz8GezPIyXHL
	msfxUj44GXtXX1cWqSeQDzwz51gY7GA9dEhVdoq0tth+VT1I7QJLLk8QiLy9hBfpdKjc
	bV1uudDECYQEmlKgQHk5/VpgjLwZ8cnZhr3DeDpvr+FLDIh9DsxGk8O72W0UsFyoDqWV
	ra2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FPszzRX/hLNFYEgDjs+NnxYJtgLqsJpwYcNyuyXIMmY=;
	b=YZ4bB+884ki2uohmmfaH99ZqhJZbdTYQ3SBRTalZkMCPV/AlmM2GmwX3EKV3eAezPt
	KsvfWi/3umWUWR6WNkp9Nz6s+QX9m479r5tsH2qMkUSIiC9DR/zyfk3SeJKUZP/13mTt
	RGjhBwEsXcCDQdy7WAU25R6L74pt5CB+vFSOJhjsIoHZlNQpA5vqguaN/rXaorRwEuYq
	ltUGtC35szjpqkCkY1+EI6x8dqrASil6peInSFGaEjGtTS1eYK5OBDdlbeBqPnXASH08
	Ye8pY0gFn945+snu/RtsBb1SgGBEqE7cQLWZdwNlPhHafziXl+IKKwBNwSeGAY5V3Php
	oEDg==
X-Gm-Message-State: APt69E0NPDLk3YDyufYScRXFHeeBui9ZqC9ZnT/X+0Cn8kpzypgFbvwJ
	fLvjwwgUJfMfKUsrD3gKHX5zzg==
X-Google-Smtp-Source: AAOMgpeYJOscOFou+SSuJMbW7J14pNiVw0Ti2ygQ+OpF3ePIRt8lX10e7fhjnazS7Gc6pXMXW89iYA==
X-Received: by 2002:adf:fc45:: with SMTP id
	e5-v6mr12097440wrs.157.1531216336419; 
	Tue, 10 Jul 2018 02:52:16 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r17-v6sm13165135wrt.44.2018.07.10.02.52.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Jul 2018 02:52:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Jul 2018 11:52:23 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180710095223.GC1825@jama>
References: <20180710080702.20527-1-Martin.Jansa@gmail.com>
	<CAJTo0LafAv3Qk0EDWnunng1fq4OENz2DhiOjth19hGNJ__Rh-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LafAv3Qk0EDWnunng1fq4OENz2DhiOjth19hGNJ__Rh-Q@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libdrm: Add PACKAGECONFIG support for all meson options
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
X-List-Received-Date: Tue, 10 Jul 2018 09:52:15 -0000
X-Groupsio-MsgNum: 113337
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline

--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2018 at 10:41:10AM +0100, Burton, Ross wrote:
> On 10 July 2018 at 09:07, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * Use the same defaults as meson does, with few modifications based on
> >   previous EXTRA_OEMESON
> > * move libpciaccess dependency to new intel PACKAGECONFIG
> > * add dependency on util-macros which was previously pulled by
> >   libpciaccess, because it's still needed even with intel disabled:
> >   | configure.ac:34: error: must install xorg-macros 1.12 or later
> >     before running autoconf/autogen
>=20
> Why is configure giving you an error message when Meson is being used?

Because this error message is almost a year old from:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/qem=
u&id=3D2eb3926cc54fef8e8cdd39cc20fbdc129aa1e52f
switch to meson just pushed me to send this part upstream instead of
rebasing it forever.

I can update it with meson version of the error if you want.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW0SB1wAKCRA3VSO3ZXaA
HDuJAKC4pm16lOG+noXt2tcZUFfqwhiDOwCgg49JCfLBN5Mc1y0EyYHREXKROpU=
=18l7
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
