Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RJ9wk-0003LC-7C
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:19:34 +0200
Received: by bkat8 with SMTP id t8so2082908bka.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 13:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dFdanMozsaWxTm4fF0/P4o85uJrpIWkXzsp3fvrzqzE=;
	b=MvYUpmJ917akRWP1TeX7FVWiuebJJxebytZzfNe3M1KOfxi9ErWgV9+HriojqBOiPM
	8IVp3S5nLjDcHubH3MZNus3aOgezUlBM1Gnxr9SDboUSpJxb33dAkczvbbsx43gZ9Wti
	536XRTog00ye7BwcSiUFiQ3y5zNHRNI9WTI4I=
Received: by 10.204.50.132 with SMTP id z4mr12614836bkf.29.1319660014806;
	Wed, 26 Oct 2011 13:13:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm3336746bku.9.2011.10.26.13.13.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Oct 2011 13:13:33 -0700 (PDT)
Date: Wed, 26 Oct 2011 22:13:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <saul.wold@intel.com>
Message-ID: <20111026201328.GA5857@jama.jama.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<4EA8655C.1040206@intel.com>
MIME-Version: 1.0
In-Reply-To: <4EA8655C.1040206@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Subversion-1.7.0 and arm/thumb work arounds
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
X-List-Received-Date: Wed, 26 Oct 2011 20:19:34 -0000
X-Groupsio-MsgNum: 11568
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2011 at 09:54:04PM +0200, Saul Wold wrote:
> On 10/21/2011 10:17 AM, Martin Jansa wrote:
> > Hi,
> >
> > arm mode was forced without PR bump, because if it was failing for some=
one he
> > will notice.
> >
> > Be carefull with using subversion-1.7.0 (read the commit message).
> >
> > Pulseaudio-1.1 was released, so hopefully this work arounds won't be ne=
eded
> > there or they could be resolved better with upgrade.
> >
> > Regards,
> >
> > The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476=
d6b3:
> >
> >    distro-tracking-fields: update fields for tzdata and gst-plugins-goo=
d (2011-10-20 13:07:16 +0100)
> >
> > are available in the git repository at:
> >    git://git.openembedded.org/openembedded-core-contrib jansa/pull2
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/=
?h=3Djansa/pull2
> >
> > Martin Jansa (8):
> >    pulseaudio-0.9.23: inherit perlnative to work around build on host
> >      without XML/Parser.pm
> >    libatomics-ops: force ARM mode
> >    pulseaudio-0.9.23: force ARM mode
> >    webkit-gtk: force arm mode to work around binutils segfault
> >    apr: add native support
> >    neon: add native support
> >    apr-util: add native support
> >    subversion: add 1.7.0 with native support and negative D_P for now
> >
> Of the above patches, the pulse audio and adding native support for apr,=
=20
> neon and apr-util were taken, the other are on hold pending different=20
> solutions.

I've added error log to pulseaudio commit and consolidated all my
pending patches to single jansa/pull branch, but different (better)
solutions are welcome :).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6oaecACgkQN1Ujt2V2gBwjQQCgu8Bi16FH7JP36N9sNhH/Mqa3
XiQAmwX4I4dwPmAlcq7wKgIQvLNkIhBo
=qgxt
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
