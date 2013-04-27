Received: from mail-pd0-f178.google.com ([209.85.192.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UW3h4-0000xb-Rz; Sat, 27 Apr 2013 13:53:40 +0200
Received: by mail-pd0-f178.google.com with SMTP id w11so865362pde.23
	for <multiple recipients>; Sat, 27 Apr 2013 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=tqISHc+HKIvwc8PtC3WAJrARBNbkO9zzIT1MFdzgtA4=;
	b=HFfJDwDDnvMraEN5mjsGWnmmfaYFk3dBvtqbD0IYVLLgEVGXj84WWCbbYzHyxIFoVm
	oGvSDemuu9mhnkeLAWDKbmHVihFbFh1nh8qq9vMejzVw/FtSFZyzIEhLMK9nFBjzKOS6
	XnxOJW4cI8vi0vukIlIYMA5acMSoZGixU7Q7YfeUWMiLkRhLrtxNgIVK7ehCFH5SYwFG
	UMlMyKBEJEzYMhG32yPU1KV5P62DDck/EjlwldeyCbkrge25F2a/kl3ozB6MRXv+xyvo
	/w27zVu7iDlMBPL8mmNA4dv8/RYqBwTGtfoFkAnnmJ5gNEZlVO45b77xL3JbULjXqTg1
	eneQ==
X-Received: by 10.66.145.166 with SMTP id sv6mr39294598pab.1.1367062543722;
	Sat, 27 Apr 2013 04:35:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	hp1sm16937668pac.3.2013.04.27.04.35.40 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 04:35:42 -0700 (PDT)
Date: Sat, 27 Apr 2013 13:35:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130427113554.GC3199@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <1505854.4Uj52mcVBD@helios>
MIME-Version: 1.0
In-Reply-To: <1505854.4Uj52mcVBD@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Sat, 27 Apr 2013 11:54:00 -0000
X-Groupsio-MsgNum: 38492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2013 at 12:23:19PM +0100, Paul Eggleton wrote:
> On Saturday 27 April 2013 12:54:00 Martin Jansa wrote:
> > common (8):
> >   I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to
> > nonworking=20
>=20
> If we have this number of recipes failing, I think we need to do more tha=
n=20
> just move them to nonworking. Could we perhaps try to have an organised e=
ffort=20
> to fix up these broken recipes? I'll be happy to help out.

I was hoping that people who care about them will step up and fix them
to build at least in default configuration - that's why I started to
send "state of bitbake world" emails.=20

Stuff being broken for long time should at least be marked as known to
be nonworking (that's why the git mv), so that new comers won't be
wondering why it is failing for them.

You can see that I've fixed a lot of recipes built by world since
starting this jenkins and a lot more QA issues from world - all of=20
them I never used, stuff which I was normally building for  SHR feeds
was fixed a lot sooner...

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF7uBoACgkQN1Ujt2V2gBzHZgCeIkOK0+pI2raj7xCkbxxn9OkB
1XwAoIzTmBiydcQW71JXqbhnKru42KNZ
=y4B7
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
