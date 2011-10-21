Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHHwg-0000w9-Ph
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 18:27:48 +0200
Received: by bkat8 with SMTP id t8so5314355bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RVJAt6sgB09Lmcu5Jds51H7yZsGSyqxXknshRsOjwNE=;
	b=duUGSAEy/RoZFrunJMr7OoTFBGj1dJ1VCSyRWMu6Q0LlmIesriXbaGNcvuA9Uw9KsX
	dQYz4d0MDSZl05Nkb4b+bAUjC/Ilkz4NYeJv+ZdNE0F7yKPfg5Ir9p3x+az1QuGwiH6O
	mQTURHVarGGkoyHFvFovSdbUVbIThP+MXveeY=
Received: by 10.204.146.73 with SMTP id g9mr2065199bkv.57.1319214113069;
	Fri, 21 Oct 2011 09:21:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm14028970bkn.7.2011.10.21.09.21.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 09:21:52 -0700 (PDT)
Date: Fri, 21 Oct 2011 18:21:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111021162146.GT3522@jama.jama.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<22ed6acc0a44d9bc0d6f7a2e800c039d77d75477.1319184832.git.Martin.Jansa@gmail.com>
	<20111021084346.GA20103@mi.fu-berlin.de>
	<20111021084840.GP3522@jama.jama.net>
	<CAMKF1soEYSZvnDKPTT+63r759mKV753wgXY2PuYU2rtii8KZLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soEYSZvnDKPTT+63r759mKV753wgXY2PuYU2rtii8KZLg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/8] libatomics-ops: force ARM mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 16:27:48 -0000
X-Groupsio-MsgNum: 11445
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jPC/Tkukgh9ZDT79"
Content-Disposition: inline

--jPC/Tkukgh9ZDT79
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 09:06:34AM -0700, Khem Raj wrote:
> On Fri, Oct 21, 2011 at 1:48 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, Oct 21, 2011 at 10:43:46AM +0200, Henning Heinold wrote:
> >> Hi,
> >>
> >> hm we should think of reworking this recipe now. Because since gcc 4.5
> >> pulseaudio for arm can use the gcc internal atomicstuff and in oe-core
> >> and meta-oe we have 4.5 or 4.6 only. The lib is
> >> only needed for mips and it is still the old release, on cvs
> >> is a much better version, which supports thumb too, if
> >> remember correctly.
> >
> > Agreed, I've added this only because pulseaudio is now needed for
> > gst-plugins and I wasn't able to build any armv[45]t images.
> >
> > But because I don't know much about pulseaudio or libatomics-ops I was
> > hoping that someone who maintains them will fix it properly and this
> > work around will be needed only temporary.
>=20
> Would you have cycles to create a git recipe for it the git tree is here
> https://github.com/ivmai/libatomic_ops/

Sorry, I'm not going to spend more of my free time on stuff I've never=20
used on my phones at least as long as we have broken stuff which we're
using almost daily.

But I can keep this work around or .bbappend dropping whole pulseaudio
in SHR until someone fixes it properly or until I fix all other issues
we have.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jPC/Tkukgh9ZDT79
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6hnBoACgkQN1Ujt2V2gBx5KwCgp8rsGULGS2+p2indzSraRAjh
Ex0An0QdPWhJ4rIWrbKTlkYkE/1xahqc
=bQDw
-----END PGP SIGNATURE-----

--jPC/Tkukgh9ZDT79--
