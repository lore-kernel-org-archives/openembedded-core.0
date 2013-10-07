Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8BE60F06
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 13:16:15 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so3220762eek.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 06:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B0fDMzfUHLvO6I8SKg6USTp4z4qHFA7r5AePvkh+Ezs=;
	b=TDW3pIYenQ7C56aho3YCcYnpDsL0uG7HQdhrMLo3ojYp7mbwLB2/vEteClbODyJdIl
	R243ujqOcNowJTwuMLcAQ5kOHt7tCAYvjYmwyqJDVi+aTOHQ7piLkU+p0oTKWUjZyltD
	+GFnWqo2Q6YMhhxPu2gAEUgUeEwW3Dmhfnl99h/rEFCcxBxU5nxpXavWhVrcKGe0+lto
	XRojGrnaYeyP357KomB6z58Z7OEhP9Qv5qnYzOdPFHk1UOUhTVvX9VJ2EOg9CVRYGWwi
	EL+ULFjoO/0l9swfMk5eLkdBmfmmh1+jSp56KLoDZdGNqGbrJMaq/nb25GtjXVDM1ZdT
	phcQ==
X-Received: by 10.15.56.72 with SMTP id x48mr2969663eew.62.1381151776272;
	Mon, 07 Oct 2013 06:16:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h45sm63315088eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 06:16:15 -0700 (PDT)
Date: Mon, 7 Oct 2013 15:16:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20131007131624.GS6240@jama>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
	<CAJTo0LZNNheEJUOU83wj-5LEB43YPSDZoW18fNGpjjSsdWetVQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZNNheEJUOU83wj-5LEB43YPSDZoW18fNGpjjSsdWetVQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 00/14] Deterministic dependencies II
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
X-List-Received-Date: Mon, 07 Oct 2013 13:16:16 -0000
X-Groupsio-MsgNum: 45629
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qKhyKP9HH88saeqA"
Content-Disposition: inline

--qKhyKP9HH88saeqA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 10:32:13AM +0100, Burton, Ross wrote:
> On 5 October 2013 13:22, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Martin Jansa (14):
> >   gstreamer1.0-libav: Add PACKAGECONFIG for orc
> >   libunique: Add PACKAGECONFIG for dbus
> >   aspell: Add PACKAGECONFIG for curses
> >   xf86-input-synaptics: Add dependency on libxtst
> >   xdpyinfo: Add dependency on libxcomposite
> >   matchbox-wm: Add dependency on libxfixes and libxcursor
> >   telepathy-mission-control: Add PACKAGECONFIG for upower and
> >     connectivity
> >   tcl: Add dependency on zlib
> >   wget: Add dependency on libpcre
> >   x11vnc: Add PACKAGECONFIG for xinerama
> >   glib-networking: Add PACKAGECONFIG for p11-kit
> >   lame: Add dependency on ncurses
> >   subversion: Add dependency on file for libmagic
> >   systemd: Add PACKAGECONFIG for cryptsetup
>=20
> All looks good to me.  Worth noting that the telepathy-mission-control
> changes will need changing when 5.15.1 onwards is integrated, and it's
> clear that matchbox-wm needs to share a .inc file.

matchbox-wm and telepathy-mission-control weren't merged, should I send
v3 for them?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qKhyKP9HH88saeqA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJStCgACgkQN1Ujt2V2gBz/CgCdEMEC9S8Dr/U/bSTUNhskzHpf
DjcAnRAULZjBYFf0n6OtWDMh9aRBpGpZ
=/+Hh
-----END PGP SIGNATURE-----

--qKhyKP9HH88saeqA--
