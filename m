Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9hCt-00083R-0K
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:49:07 +0200
Received: by bke11 with SMTP id 11so2029092bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZGo7UIluIr0cD78vtydrnouNLjQ9lv01gtAY5kHcGPU=;
	b=ge56+x6dls6VfD5kTIrM5msOeqthdP89d5U1eE6EQ6vfSgzho4CUjEviM8n5AAc6I9
	v6+Qm3kiStcKahK/84JWIhU/3jg3LhSHYEh1Dj7i8mgcW0RRYMmnqgUyWzWXXG5YMAVC
	2MtiNCVSZqlJrF0IQVqxfUdgkQVwA5NAPtO7M=
Received: by 10.204.156.23 with SMTP id u23mr6177588bkw.49.1317404617786;
	Fri, 30 Sep 2011 10:43:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t13sm92024fae.0.2011.09.30.10.43.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 10:43:36 -0700 (PDT)
Date: Fri, 30 Sep 2011 19:43:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930174330.GF7364@jama.jama.net>
References: <1317372422-7943-1-git-send-email-Martin.Jansa@gmail.com>
	<4E85FD5E.7060305@intel.com>
MIME-Version: 1.0
In-Reply-To: <4E85FD5E.7060305@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] atk: add patch to replace G_CONST_RETURN with const
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
X-List-Received-Date: Fri, 30 Sep 2011 17:49:07 -0000
X-Groupsio-MsgNum: 10339
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cpvLTH7QU4gwfq3S"
Content-Disposition: inline

--cpvLTH7QU4gwfq3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 10:33:18AM -0700, Saul Wold wrote:
> On 09/30/2011 01:47 AM, Martin Jansa wrote:
> > * otherwise build fails when glib is 2.30.0 or newer (and G_DISABLE_DEP=
RECATED is enabled - like in atk)
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   .../atk/atk-1.32.0/remove.G_CONST_RETURN.patch     |  628 +++++++++++=
+++++++++
> >   meta/recipes-support/atk/atk_1.32.0.bb             |    5 +-
> >   2 files changed, 632 insertions(+), 1 deletions(-)
> >   create mode 100644 meta/recipes-support/atk/atk-1.32.0/remove.G_CONST=
_RETURN.patch
> >
> > diff --git a/meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.=
patch b/meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.patch
> > new file mode 100644
> > index 0000000..0cdf041
> > --- /dev/null
> > +++ b/meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.patch
> > @@ -0,0 +1,628 @@
> > +Upstream-Status: Accepted
> > +
> > +Similar patch is already included in 2.0.1 and newer
> > +http://ftp.gnome.org/pub/gnome/sources/atk/2.0/atk-2.0.1.news
> > +
>=20
> No Signed-off-by: in the patch header.
>=20
> If the newer version of atk is available, why not update atk in oe-core=
=20
> to that version and not add this patch?
>=20
> Is there a reason we can't update to 2.0.1 at this time?

I'm not atk expert so to minimize influence of such build fix I didn't
want to upgrade to new major version. But if the 2.0 API is compatible
feel free to update to 2.0.1.

Btw: I've included this patch to "Glib related change" pull request
later when I had more changes to send them as separate patches..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cpvLTH7QU4gwfq3S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6F/8IACgkQN1Ujt2V2gBw+KwCfaM+bmruBxwvEYyReOYT4WNW3
0SoAn29zb+qQ5yHNPwsn6bLe+1L+ziaY
=nsc9
-----END PGP SIGNATURE-----

--cpvLTH7QU4gwfq3S--
