Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9XNE-0005Ud-Bm
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:19:08 +0200
Received: by fxi1 with SMTP id 1so2790840fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=75L7oEDiQ2GGdTHMpq5UWMrIK56enAGqkOXjAIYpA8g=;
	b=cRr8rgksFNA4tx47Xfi+yiIVWab5swalpmnSJUN+GCB0lMjAdkSoMEks+9eni1oND+
	8y/UGpDBAJ2Kecd/R+TDg4qxHOtZ9ojQhMudTiXyN2RfdnWhfyyOBIJv85orRMqxU/u4
	JQuVSP5T6A5MubM/grPsziMlko/7VdgyeVz5w=
Received: by 10.223.10.14 with SMTP id n14mr2928826fan.37.1317366820066;
	Fri, 30 Sep 2011 00:13:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u18sm5469373fac.24.2011.09.30.00.13.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:13:39 -0700 (PDT)
Date: Fri, 30 Sep 2011 09:13:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930071333.GB2361@jama.jama.net>
References: <1317323496-1818-1-git-send-email-msm@freescale.com>
	<CAEsOVNdsWvCRj+nixWeE-vubRTGG3yrDkEiUCZCUpFyrUESY3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNdsWvCRj+nixWeE-vubRTGG3yrDkEiUCZCUpFyrUESY3g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Fri, 30 Sep 2011 07:19:08 -0000
X-Groupsio-MsgNum: 10240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline

--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 04:09:37AM +0000, McClintock Matthew-B29882 wrote:
> On Thu, Sep 29, 2011 at 2:11 PM, Matthew McClintock <msm@freescale.com> w=
rote:
> > From: Tom Rini <tom_rini@mentor.com>
> >
> > At issue is that route/pktloc.c (not generated) depends on
> > route/pktloc_syntax.h (generated).
> >
> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
> > Signed-off-by: Matthew McClintock <msm@freescale.com>
>=20
> Please ignore this patch as it does not seem to fix the issue.

Why not use latest version of this patch?
http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/libnl/libnl/=
fix-pktloc-dep-race.patch
or meta-oe
http://git.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes=
-support/libnl/libnl/fix-pktloc-dep-race.patch

seems like you're missing pktloc_grammar.h here..

and when you're at it, please also add packaging changes from meta-oe,
so we can remove libnl from meta-oe and keep only libnl1 there.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6FbBwACgkQN1Ujt2V2gBzLqACguEItdUOe/t6WUl6vciiaq/Vf
2VkAoK6d6jL7a4hLc3DMQjrsSLTGOJ9t
=8AyI
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
