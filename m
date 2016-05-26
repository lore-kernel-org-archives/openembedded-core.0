Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 65FD1731BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 17:23:37 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n129so108293628wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZshJK24INwiXd8uHe8rxciBqWRQ/KKckF6iW7xpPxs8=;
	b=Pe/ImE74QSQtASJtA3es4g2YJQqE/MEZUnmXPY/H5sljK1DWdfIkd0Ef5HIHZDLp3X
	YspaeDkDj2wJEQEM++A1mSVBuIZgGXA+8pjha1yP5dxr9YvaKPGwuCaXPboBJQKLX2iw
	WF8ZW/cv4qqVVqMPWVYM6qqWz6p5+CsKT4pKHUBlfOPrszs+DrkNWhrpqm8/dfAI2LbM
	zGBti2GKPYyMvPsLHLEGqkOzBcljTh4ZdGo156oJki43Ocr6AUSmdBJXnyPBGI6Awdoq
	V4iXZNUx/x7BJO1XSuOZxnC7qobc2dYtQhIN2Yreuzm4ZvoUylWqk9Y9gT7rPkz+vcqX
	IAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZshJK24INwiXd8uHe8rxciBqWRQ/KKckF6iW7xpPxs8=;
	b=PxyI5PpYmBKN3FLvldzQgL1JAaP11SA5XOogHnZ5URNjD2os5wpeb5VZDfhvNS39i7
	Dhl7e7RXjU6HzDVSuH8rplhdJTPaqEUbEWwDdV8v/YhrnkXJdzwBns7JbUQ/pzRDVcui
	YDKT6D5J/XsfnN/a3cWxqBkDCDZ3iUmtQLxFCrhSkdGUr9MgLb8d20Tko880GJKUdr10
	T/A4rfZCvTV3pMbz0KJEXd/1KnJlJy7MsuFw7Fm+eTk3d03q1y08BPiwyibN++w6Mh/R
	sA8NSorkIc1fIe1NL0MN6PazG9qat3esDCTJsUy1rsulHLpPk+z5x1Eln4irdVwc82OL
	YoQA==
X-Gm-Message-State: ALyK8tIKd16NTM9hrSr/5OrfA5cg9VeSZf+7R/22gY9z8NHRDm22eN3ufMOLrhRglRg5/Q==
X-Received: by 10.194.72.103 with SMTP id c7mr11564370wjv.65.1464283418298;
	Thu, 26 May 2016 10:23:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n66sm4494924wmf.6.2016.05.26.10.23.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 May 2016 10:23:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 26 May 2016 19:23:57 +0200
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20160526172357.GB2575@jama>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Thu, 26 May 2016 17:23:40 -0000
X-Groupsio-MsgNum: 82743
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2016 at 05:15:13PM -0300, Otavio Salvador wrote:
> On Thu, May 12, 2016 at 4:20 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
> > Support for multiple new protocols, many new features:
> > https://lists.freedesktop.org/archives/wayland-devel/2016-February/0270=
39.html
> >
> > Weston now depends on wayland-protocols (which is protocol
> > collection split off from weston).
> >
> > Remove upstreamed patches, add a patch to fix the wayland-protocols
> > path used during build.
> >
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>=20
> I am working on rework the weston recipes and it seems Weston 1.11 is
> close of release. I think instead of adding 1.10 we could use 1.10.91
> and upgrade it to 1.11.0 when it is out (end of May). This avoids
> another cycle of rebase of patches during 2.2 development cycle.
>=20
> What do you think?

This wayland upgrade breaks libsdl2

http://errors.yoctoproject.org/Errors/Details/68336/

libsdl2 needs fix from here:
https://hg.libsdl.org/SDL/rev/330f500d5815

>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldHMPwACgkQN1Ujt2V2gBxO5ACgjPvZzqHcHEr1PnxTppoqGngY
XXYAoIxPcNdlfb6C1vMn/hX2gf61IWxl
=wCV5
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
