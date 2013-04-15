Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1URlG2-0007R9-P8; Mon, 15 Apr 2013 17:23:55 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so2311951eae.16
	for <multiple recipients>; Mon, 15 Apr 2013 08:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6CgeLgKieRXGpNWbdfynBD6mtcPRLiZ+s5Nz8WuGfto=;
	b=QsGd+P0Uffcu8ydvYHfWCZ+ptoxaYjJx1MgoZEwd52OHZZMq+sj7Clk3D8PQpqULQ1
	PXvfXyL3LQAH9EP5B2rt4h6y1TSk5JFMSNMZ49KrEc4vmCKllpY/byeNgSPY3ahbs5kn
	oNF3MfRC+261lndDUEUKYEdFODYGzQ9ti+UUekCmMzXABVmA4c09J1vvVpUf9nPMLh8U
	dScsOvUem1eG3a7hoz11lkOAKrGLS/MMI5QwwmhNdtuWgwPWOIS+JYBdFczTfWUzmvz8
	duafrhdo2xT7809+nufX+9/diQR4MBfQ700L3JrSEggVsh7Q7iZU7c4jVR1gbyedjebb
	11AA==
X-Received: by 10.15.31.197 with SMTP id y45mr62806648eeu.18.1366038381765;
	Mon, 15 Apr 2013 08:06:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 8sm10622628eeg.15.2013.04.15.08.06.20
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 08:06:21 -0700 (PDT)
Date: Mon, 15 Apr 2013 17:06:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130415150627.GG10628@jama.dyndns-home.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<kkh3q2$gl0$1@ger.gmane.org>
	<CAJTo0LY7XoYcC9F0N2qCPzQRF6-VPkR+MZUDvfMP=NNUp9a6LA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY7XoYcC9F0N2qCPzQRF6-VPkR+MZUDvfMP=NNUp9a6LA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Mon, 15 Apr 2013 15:24:05 -0000
X-Groupsio-MsgNum: 37955
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Content-Disposition: inline

--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 03:52:24PM +0100, Burton, Ross wrote:
> On 15 April 2013 15:45, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Speaking of GNOME, I noticed that I have to manually (re)run postinst f=
or
> > gconf schemas after first boot to get the apps to work. Is anyone seein=
g the
> > same?
>=20
> Urgh.  No.  There was recent changes (breakage/fixage) to the postinst
> stuff, are you totally up to date?

I had 2 gnome related postinst issues when upgrading from very old
image.

1) gconf calling dbus which was complaining about /etc/machine-id and
recommending to use dbus-uuidgen

2) *cache*update (sorry don't remember the name) being killed by OOM
killer spitz is quite memory limited (iirc not fatal for postinst,=20
so it marked such recipes as configured).

gnome unrelated is that opkg upgrade was often ending with disk out=20
of space, all recipes PR bumped by PR service introduction and opkg
needed more free space then what current root-fs was using in order to
upgrade *everything* in one go.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFsF3MACgkQN1Ujt2V2gBwaowCfa0hMeD4/iPl9zBHBru28TfjM
D8kAn0FPsFEIZHY3ObTTqMoX4RaDit3H
=npGl
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
