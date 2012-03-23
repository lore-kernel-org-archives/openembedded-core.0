Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4VD-0003Gm-L8
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:25:59 +0100
Received: by wgbdr12 with SMTP id dr12so1865735wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eBIzXI+2OoZr/SQn4m1LBYjTRhAemBN2YN8QuisWsdY=;
	b=Lf4zgU1DsZDIMj295hIGPhwabKYmXZp/LUEeV70iJ9hQ6lxouXlQfjIG6NXy09n9Mv
	xSWa0uU0bsPmIvtrK184XIWV5ySfAx02HDZacwKRtSbl1C/ruL+5+e/Vm42UIaAN1pjG
	53wZxQgCWfuDNn3vnVxbznkzQRTdmeh9VnML8g84ap/xNvDqAuhveIyRycmRu+5+OVoP
	hM1r1TIK3tg+c3YfkOmG2QXQi0Vbwp8k7jJ04VfDu0RLTs5oIiL8/1JhrXZ4Mt1Fmwvg
	uG4QSyR8zR3jczzzbyOZIYWBVLaVQGCGr0LYBtFDxrUkjxUpClB6ljfRLSjv2ZQ/6Y4O
	sgpA==
Received: by 10.180.88.164 with SMTP id bh4mr5833113wib.22.1332508623476;
	Fri, 23 Mar 2012 06:17:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm22973691wid.2.2012.03.23.06.17.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 06:17:02 -0700 (PDT)
Date: Fri, 23 Mar 2012 14:17:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323131701.GF3879@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332504325.9740.395.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332504325.9740.395.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] eglibc-2.15: Update SRCREV
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
X-List-Received-Date: Fri, 23 Mar 2012 13:25:59 -0000
X-Groupsio-MsgNum: 19546
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b8GWCKCLzrXbuNet"
Content-Disposition: inline

--b8GWCKCLzrXbuNet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 12:05:25PM +0000, Richard Purdie wrote:
> On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
> > Get new patches and remove the one that got merged upstream
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch    |  108 ++++++++++++=
++++++++
> >  .../eglibc-2.15/armv4-eabi-compile-fix.patch       |   25 -----
> >  .../eglibc/eglibc-2.15/initgroups_keys.patch       |   20 ++++
> >  meta/recipes-core/eglibc/eglibc_2.15.bb            |    5 +-
> >  4 files changed, 131 insertions(+), 27 deletions(-)
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_debug_=
mask.patch
> >  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-com=
pile-fix.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/initgroups_key=
s.patch
>=20
> Since 2.15 isn't the default I'm tempted to merge this despite the point
> we're at in the release cycle. I'd like to give anyone using this the
> opportunity to comment first though.

I'm testing this on all archs I'm using (armv4t, armv5te, armv7a,
x86-64) and will report tomorrow.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b8GWCKCLzrXbuNet
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9sd8wACgkQN1Ujt2V2gBztDQCgrJz9bb5RrgeLVJceY0m7peCI
woEAoLeA/qOT7otd4PKrWC0qhYId6nxx
=dVZM
-----END PGP SIGNATURE-----

--b8GWCKCLzrXbuNet--
