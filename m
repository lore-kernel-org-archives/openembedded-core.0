Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAnxA-0007gL-AL
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 21:13:28 +0200
Received: by eya25 with SMTP id 25so3406849eya.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RzNlKbyEIYMNJgBM0dbyndl9kIjABbtLV+Cmcrd9VjI=;
	b=EEu/8baTRAMVL6YYjAliSqbJBSeIuYD0KJSULr2ZMs+hKOpVJXnKXpRjzGY5aRuauu
	qRYlMn+c90tm9/I2arR8ZMEaYFevQGUFT652YnQzJRZlYTzMsjA2elu4g4rylZXLH8c6
	5Ry+CRcTLGannPMR3ZNKqmit/JLhJ4vqVKW78=
Received: by 10.223.55.136 with SMTP id u8mr363632fag.46.1317668673082;
	Mon, 03 Oct 2011 12:04:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a7sm22302072fam.22.2011.10.03.12.04.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 12:04:31 -0700 (PDT)
Date: Mon, 3 Oct 2011 21:04:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111003190425.GS7364@jama.jama.net>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
	<20110930172628.GE7364@jama.jama.net>
	<CAEsOVNdMVdbMaM-E0X2T4+v-Y_TbpiFMdcV+Lu3s7gX4dHLPHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNdMVdbMaM-E0X2T4+v-Y_TbpiFMdcV+Lu3s7gX4dHLPHA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v3 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Mon, 03 Oct 2011 19:13:28 -0000
X-Groupsio-MsgNum: 10438
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="magLDk5D4XGaUXcd"
Content-Disposition: inline

--magLDk5D4XGaUXcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2011 at 06:39:52PM +0000, McClintock Matthew-B29882 wrote:
> On Fri, Sep 30, 2011 at 12:26 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Fri, Sep 30, 2011 at 12:21:23PM -0500, Matthew McClintock wrote:
> >> From: Tom Rini <tom_rini@mentor.com>
> >>
> >> At issue is that route/pktloc.c (not generated) depends on
> >> route/pktloc_syntax.h (generated).
> >
> > On Fri, Sep 30, 2011 at 9:13 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >
> > and when you're at it, please also add packaging changes from meta-oe,
> > so we can remove libnl from meta-oe and keep only libnl1 there.
>=20
> Sorry, I'm not sure I follow. Are you referring to all the other stuff
> in the old openembedded? I'm not following this package particularly
> closely.

just see diff oe-core/meta/recipes*/libnl* and meta-openembedded/meta-oe/re=
cipes*/libnl*
and it will be clearer

Regards,

> * 9fef5f0 Add 'ucred' structure declaration in netlink headers for the in=
tegrity
> * f9e4241 libnl-1.1: rename to libnl1 and build only static lib
> * 4ccaf2c libnl_git: remove fix-pktloc-dep-race.patch from this version
> * 91e03b2 libnl: add libnl.inc and use INC_PR
> * 4702231 libnl: don't use /usr/include/libnl2 anymore
> * 5ef679a libnl: rename libnl2 to libnl as used in openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--magLDk5D4XGaUXcd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6KBzkACgkQN1Ujt2V2gBy2lQCfQUN7vhOWNgU/haDISITUcfrg
CQ4AoLdXH6Wh+cca6FV+WhP4TpKFdy9G
=Hxts
-----END PGP SIGNATURE-----

--magLDk5D4XGaUXcd--
