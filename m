Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id A129570746;
	Wed, 30 Jul 2014 14:04:45 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so2343501wiv.9
	for <multiple recipients>; Wed, 30 Jul 2014 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GUeA5r52alU4Ml0SmCrGd3EwMrTf+Un61BPYt9Mkdf0=;
	b=J0RF1wUFmymRabESSpJG3EUShkM5iPdIVih6s4Dc6UonyxOZIASDalSpiBp+zZVHWr
	l9MaykU3MjGkLSRWTZE8nRxcPupizJ73MKlo7hC/d0QkpDX4i7AD+e6svM7pvThZrDl4
	fK5cUGDJ5FnTGc7nA6OjFf2Q0eZRk85NGVSHI2tirJLoBezyFaPzSAlkQxf8mvXSAcXA
	mRaAMbTxxufP/yKAQtGdZJvuiY0VUBC63shCB/x+cClXiVUrQ/sQKHVUrLCT0EUqsSY/
	7/A1Jn3usFSEY2wO9cnQy9sORak3/EYxkcurifRbgdumSUC8KMethoPIU5G0CbhcMzfW
	/uLQ==
X-Received: by 10.180.182.67 with SMTP id ec3mr6444787wic.21.1406729082485;
	Wed, 30 Jul 2014 07:04:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id 19sm5807776wjz.3.2014.07.30.07.04.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 07:04:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 16:05:02 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140730140502.GP16445@jama>
References: <20140703164708.452165036A@opal.openembedded.org>
	<20140718205012.GT2433@jama> <20140730093244.GK16445@jama>
	<1406726908.13346.135.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1406726908.13346.135.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : qemu: fix qemu-native pkg-config paths
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
X-List-Received-Date: Wed, 30 Jul 2014 14:04:49 -0000
X-Groupsio-MsgNum: 55763
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84mZ5ifxO1MoKVCL"
Content-Disposition: inline

--84mZ5ifxO1MoKVCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 02:28:28PM +0100, Richard Purdie wrote:
> On Wed, 2014-07-30 at 11:32 +0200, Martin Jansa wrote:
> > On Fri, Jul 18, 2014 at 10:50:12PM +0200, Martin Jansa wrote:
> > > On Thu, Jul 03, 2014 at 04:47:08PM +0000, git@git.openembedded.org wr=
ote:
> > > > Module: openembedded-core.git
> > > > Branch: master
> > > > Commit: 68a5ed337f8f7ee8e5bf55542ec82d786eb754db
> > > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3D=
commit;h=3D68a5ed337f8f7ee8e5bf55542ec82d786eb754db
> > > >=20
> > > > Author: Cristian Iorga <cristian.iorga@intel.com>
> > > > Date:   Thu Jul  3 15:57:32 2014 +0300
> > > >=20
> > > > qemu: fix qemu-native pkg-config paths
> > > >=20
> > > > For qemu-native, the pkg-config paths do not
> > > > include build host paths.
> > >=20
> > > This breaks qemu-native builds on hosts without pkg-config.
> > >=20
> > > pkg-config isn't in sanity.bbclass's SANITY_REQUIRED_UTILITIES
> > > and this is first recipe which cannot use pkgconfig-native.
> > >=20
> > > Please add test that it exists before forcing recipe to use it.
> >=20
> > PING
> >=20
> > This is broken for almost a month, please at least revert it until it's
> > fixed correctly.
>=20
> Well, if I revert this, I'd then need to revert other things and it
> turns into a dependency chain nightmare. So the reality is this needs to
> get fixed.
>=20
> I'm assuming in your case, you probably either don't have or care about
> SDL at all, or you have sdl-config available?

Correct, it's just build server where I'll never use runqemu to run the
image, but I need to build usable qemu-native to generate read-only
images (e.g. for fontcache.bbclass).

> So what really needs to happen here is that running the command needs to
> become non-fatal as far as I can tell?

Yes, non-fatal and if possible deterministic (AFAIK this whole block could =
be
included in PACKAGECONFIG contains "sdl" conditional and applied only
when /bin/pkg-config or /usr/bin/pkg-config exists)

There was also request to provide libsdl-native
http://patchwork.openembedded.org/patch/63477/

then qemu-native could just build this libsdl-native as dependency for
PACKAGECONFIG sdl instead of assuming that the host system has
undeclared libsdl-native dependency.=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--84mZ5ifxO1MoKVCL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPY+44ACgkQN1Ujt2V2gBwzpwCgqN8gHTx4edOW35oGYVVh5Esi
tt0An2+BFAKvjfXbKSta0tPusujoXeji
=+tGC
-----END PGP SIGNATURE-----

--84mZ5ifxO1MoKVCL--
