Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLX1Z-0004I2-W6
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 10:22:22 +0100
Received: by faas16 with SMTP id s16so201335faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DwJ5qMwRkEOUF7DuUwhNd0AK59BSLi3WF6WaebbNxvU=;
	b=RKsAMLpvcMvC+Dejy1oHpCNrxLjBWl0jEC2k4FAuQ4PsQUVLUnpD71XMyywbUfbp3y
	6GCdj3qfr8oXQnqupnGAlrHaYd7u+NRL+lSzYoGZzhOEXQA/nxHQlj41guVqVWYWpyMr
	VwB6wrMl9OUPiSRk6F2q1shXc7NbVHj3I5vis=
Received: by 10.223.94.143 with SMTP id z15mr3028280fam.32.1320225374779;
	Wed, 02 Nov 2011 02:16:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm4305471fab.6.2011.11.02.02.16.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 02:16:12 -0700 (PDT)
Date: Wed, 2 Nov 2011 10:16:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111102091605.GD9949@jama.jama.net>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
	<4E94AB7A.6050603@intel.com>
	<CAEsOVNfOgHFMzMcvXt+DhBY0xtwNWhi--vNNDeKXC=aRsLKtdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNfOgHFMzMcvXt+DhBY0xtwNWhi--vNNDeKXC=aRsLKtdw@mail.gmail.com>
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
X-List-Received-Date: Wed, 02 Nov 2011 09:22:22 -0000
X-Groupsio-MsgNum: 11812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline

--P+33d92oIH25kiaB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 08:57:47PM +0000, McClintock Matthew-B29882 wrote:
> On Tue, Oct 11, 2011 at 3:47 PM, Saul Wold <saul.wold@intel.com> wrote:
> > On 09/30/2011 10:21 AM, Matthew McClintock wrote:
> >>
> >> From: Tom Rini<tom_rini@mentor.com>
> >>
> >> At issue is that route/pktloc.c (not generated) depends on
> >> route/pktloc_syntax.h (generated).
> >>
> >> Signed-off-by: Tom Rini<tom_rini@mentor.com>
> >> Signed-off-by: Matthew McClintock<msm@freescale.com>
> >> ---
> >> =A0.../libnl/fix-pktloc_syntax_h-race.patch =A0 =A0 =A0 =A0 =A0 | =A0 =
26
> >> ++++++++++++++++++++
> >
> > I just noticed that this patch get put in the libnl directory, not the
> > libnl-2.0 directory.
> >
> > Can you pull all the libnl changes together and resbumit this, also is =
there
> > a reason you can not just update this to the latest libnl 3.2.1?
>=20
> Are you referring to this: http://patches.openembedded.org/patch/12749/

This pach is moving fix-makefile.patch from libnl-2.0 to libnl dir as Saul =
mentioned=20
and patch wasn't even formated with -M to make it easier to review such mov=
e, please
move it back to libnl-2.0 and send it again.

=2E../libnl/libnl-2.0/fix-makefile.patch             |   32 ---------------=
-----
 .../recipes-support/libnl/libnl/fix-makefile.patch |   32 ++++++++++++++++=
++++

Cheers,

>=20
> > Cab you test that against the wpa-supplicant which seems to be libnl's =
sole
> > dependee.
>=20
> I can't - don't have a board with wireless - dont't have a wireless netwo=
rk...
>=20
> -M
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6xClUACgkQN1Ujt2V2gBxU9ACfW4UyrFPn68PkEG67t6z/n5QP
da8AoJgFIOHSGDSrKJT0Hwojmr5afYvv
=hhTr
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
