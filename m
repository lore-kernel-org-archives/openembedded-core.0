Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id D4FDD65E58
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jun 2014 21:24:21 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id p10so344860wes.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jun 2014 14:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xgvJBaI4hp1Ptmfj2/TZzgkkqWSRH4TWf77quGMEtIY=;
	b=N38rmDFYVa/N8fFxQhrJpIZr/UWLQIia5HrpY2nH0S+peij8cMFtVxY/KR6EB8XFoW
	DHhoomu10/XpGMSH0vgEhjEbuxZQX71k20+eFMcORKBpFiooApK+2x2GmaA+Rsll9ux0
	7SZNz0SfeQhDkhgEgQ2U6ehRQtJEkYIiMcbY0VQfdHzaabUnKJHgQ6NpOaRXz1Kc249t
	syWCnDVjRhJvUNyMy+21xB6vpr4t0pL7EvSrlq26657Xl0xsccxoMPDTCfHsB6FmWXGm
	jcNRgCbb5b6vxDXXnARyFVqHd5Zv4GS9t/Z8CWSz/YHi+eCTnjslyNTp7hxQK3o7fFCI
	bk7Q==
X-Received: by 10.180.221.229 with SMTP id qh5mr460534wic.33.1402521862321;
	Wed, 11 Jun 2014 14:24:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id f3sm109396eep.40.2014.06.11.14.24.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jun 2014 14:24:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Jun 2014 23:24:41 +0200
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20140611212441.GC2428@jama>
References: <1402082874-12187-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANnJG8eMJu__kPstQXajFzHDVkBrRSVLfCqPfOEj5omeKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnJG8eMJu__kPstQXajFzHDVkBrRSVLfCqPfOEj5omeKw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildstats-summary.bbclass: Import useful bbclass from meta-mentor
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
X-List-Received-Date: Wed, 11 Jun 2014 21:24:25 -0000
X-Groupsio-MsgNum: 54030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline

--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2014 at 01:54:38PM -0700, Christopher Larson wrote:
> On Fri, Jun 6, 2014 at 12:27 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/buildstats-summary.bbclass | 43
> > +++++++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 meta/classes/buildstats-summary.bbclass
> >
> > diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/
> > buildstats-summary.bbclass
> > new file mode 100644
> > index 0000000..3c02724
> > --- /dev/null
> > +++ b/meta/classes/buildstats-summary.bbclass
> > @@ -0,0 +1,43 @@
> > +# Imported from meta-mentor
> > +# http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/log/classes/
> > buildstats-summary.bbclass
> > +# with following modifications
> > +# 1) when both setscene and normal tasks were executed, count it as
> > no_sstate
> > +# 2) count do_populate_sysroot and do_packagedata tasks, because often=
 we
> > invalidate only runtime deps
> >
>=20
> Looks like useful improvements, nicely done. Have you thought about not
> hardcoding the task list, if we're going to display it this way? See
> https://gist.github.com/kergoth/2519927f59712282e9e8 for a version which
> obeys SSTATETASKS.

I'm fine with your version showing all SSTATETASKS, would you mind
sending PATCHv2 with your modification or should I?

I've hardcoded packagedata only because it was typical case when I was
wondering why the build took so long even with populate_sysroot reused
=66rom sstate (e.g. after some package.bbclass change), but showing all
doesn't hurt.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOYyRkACgkQN1Ujt2V2gBy5NgCePsV/pnsurRfDOsU489iO2dWU
HYoAoLcHxcZB3/eneKaoPwgJTwNp7hBq
=gV+i
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
