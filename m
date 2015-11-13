Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3F933772D0;
	Fri, 13 Nov 2015 11:45:55 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so25457328wmd.0;
	Fri, 13 Nov 2015 03:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zzlQ5x5+kPOeg8vzyLqPNYwa4696y6JuJ+pRR2yhLvw=;
	b=zMvF/QLsJb4TsuVhMogDEI9mnIo9ZnohvKpKTts2a4zwFN6GQyUl+ZFgmv6H7Y1UKP
	x3EnOncTUKmo1mQUtZf9x3YevhV/SH8zfl0edjAnRuNmjF0Yus4CMUzEGRdVOooaQ+7i
	KrDJhF1Xj/3W8GGkeYqLTruyf5Hn6GzrNisclcUS8YjRhLvIJRz2q93qmHpl0UFi/F3F
	G+qGfROdCDV0n0YZu6Dv514iOKbu52XQiQ4vBxYS8YB+2LnQ1JbypBp8PkaxBanjWQvJ
	BVUzgTTJp8K7ej2B9dm6Jdb0WXKemQmNHB603b7t+uw+qlVBFFa0UGn7TFzJ00FIiKT7
	UrpA==
X-Received: by 10.28.174.144 with SMTP id x138mr3426235wme.28.1447415155794;
	Fri, 13 Nov 2015 03:45:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id l1sm8955369wmb.1.2015.11.13.03.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 03:45:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Nov 2015 12:46:17 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151113114617.GB2567@jama>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Fri, 13 Nov 2015 11:45:56 -0000
X-Groupsio-MsgNum: 73399
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline

--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2015 at 09:39:15AM -0200, Otavio Salvador wrote:
> On Thu, Nov 12, 2015 at 5:08 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Thursday 12 November 2015 18:03:27 Andreas M=FCller wrote:
> >> On Thu, Nov 12, 2015 at 5:45 PM,  <alexander.kanavin@linux.intel.com> =
wrote:
> >> > Hello,
> >> >
> >> > now that 2.0 is out, it's time to move the Qt4 recipes out of oe-cor=
e.
> >> > This has been discussed previously here:
> >> > http://lists.openembedded.org/pipermail/openembedded-core/2015-June/=
106355
> >> > .html
> >> >
> >> > I'm not sure where the recipes should land, and want to ask your opi=
nion.
> >> > The options are:
> >> > 1) Make a new layer, meta-qt4, under meta-openembedded tree. Move al=
so
> >> > everything in meta-oe/recipes-qt (and possibly other spots) to that =
layer.
> >> > This is somewhat more disruptive to people's layer configurations, b=
ut
> >> > would clearly separate qt4, and slim down meta-oe.
> >> >
> >> > 2) Simply move the qt4 recipes from oe-core to meta-oe/recipes-qt, s=
o they
> >> > will be next to all the qt4-based software. This is less disruptive,=
 but
> >> > adds bloat to meta-oe.
> >> >
> >> > Preferences?
> >>
> >> 1) or even better in a separate repo
> >
> > To be honest, I had anticipated this being a separate meta-qt4 repo mys=
elf. It
> > would be consistent with what has been done with Qt 5 and much earlier =
with
> > Qt 3.
>=20
> Agreed.

I'm also fine with separate layer.

Even better for me, I'll be less tempted to include it in my world
builds and to fix qt-mobility-* issues.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZFzYgACgkQN1Ujt2V2gBwrIQCfd0RRGAbXQog/KKKQ49osw1lj
8FUAoJp4Hcva1n9O0M91gXEQeNblTXAU
=o9Tk
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
