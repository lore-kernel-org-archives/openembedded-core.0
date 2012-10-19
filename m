Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TPAyH-00034l-Uf
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 13:42:34 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so169133wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 04:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cYROl9T7k81MAlJNzUJy1e29Me3HhYhJBh4xXLtl5G0=;
	b=A4giWZ7AuvqhwJ0s5v42B7C2/rlRI62uc2z1Us5AmXdT0vnZWzPsenChFCzFLdOt6J
	LzU9CC8XX+ZRCGtH6Jo9m3oIiQ5eGmxqZtcWIjyjIo5MXwOfZnF77RgeNbavNGOhyrEY
	0movhBJW+y6SkSbKa3FGsBZ6/KOnEfYY2dJiBn5CR+jZAXvmtxz/2bHHltPolYOOiHIg
	igzSFxe50UAQUpLCHn+Zt/Ske3d/cNOzlOuLRAN3FiTtX/e9K8baB88sHVd5+1dPOyIL
	8wqB5t9i1VkwL53TWYTTUfkPDyXIQNWUWBP7Ch304tzbpffZZgwgrG4XvM0nd7cEtV7a
	/C3A==
Received: by 10.216.210.11 with SMTP id t11mr653143weo.92.1350646153403;
	Fri, 19 Oct 2012 04:29:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm34406998wib.10.2012.10.19.04.29.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 04:29:10 -0700 (PDT)
Date: Fri, 19 Oct 2012 13:29:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121019112920.GK3087@jama.jama.net>
References: <1350588305-16854-1-git-send-email-sgw@linux.intel.com>
	<20121019105559.GJ3087@jama.jama.net>
	<1350644825.2520.19.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1350644825.2520.19.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: add manifest info for shared file matches
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
X-List-Received-Date: Fri, 19 Oct 2012 11:42:34 -0000
X-Groupsio-MsgNum: 30730
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdEQJo40s7ofW8iR"
Content-Disposition: inline

--sdEQJo40s7ofW8iR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 12:07:05PM +0100, Richard Purdie wrote:
> On Fri, 2012-10-19 at 12:55 +0200, Martin Jansa wrote:
> > On Thu, Oct 18, 2012 at 12:25:05PM -0700, Saul Wold wrote:
> > > Present the manifest file that contains the matches for
> > > files being installed to a location that already contains
> > > that file. This will help to determine which is the correct
> > > recipe to fix when this occurs.
> > >=20
> > > [YOCTO #3191]
> >=20
> > Can we do the same when removing files from sysroot?
> >=20
> > To catch errors like this:
> > http://git.openembedded.org/openembedded-core/commit/?id=3D6b12d4cd39ba=
cb087654b59e25f5052a4e839b26
> >=20
> > 12:40:15 < JaMa> it depends on order of tasks
> > 12:41:27 < JaMa> gettext-native depends on gettext-minimal-native, so g=
ettext-minimal-native installs own config.rpath to sysroot (when gettext-na=
tive "owns"
> >                  it too)
> > 12:41:55 < JaMa> then gettext-native is built and before populting sysr=
oot it removes own files there (including config.rpath)
> > 12:43:45 < JaMa> and because sstate assumes that every file in sysroot =
is provided by exactly one recipe, gettext-minimal-native looses his config=
=2Erpath
> > 12:44:49 < JaMa> now there is at least warning when 2 recipes are insta=
lling the same file to sysroot, but that doesn't resolve this issues when s=
ome file is
> >                  "moved" between recipes
> > 12:47:30 < JaMa> because gettext-minimal-native is only recipe installi=
ng it
> > 12:47:39 < JaMa> and gettext-native is only removing it
> >=20
> > If we check manifests from other recipes before removing files we can s=
how warning that
> > gettext-native is trying to remove config.rpath now provided by gettext=
-minimal-native
> > and keep config.rpath in sysroot.
>=20
> The plan is to make it a hard error if something installs a file that
> already exists. This issue will be resolved when that happens and I want
> to get there sooner than later.

For new recipes yes, but that does not resolve this case when one file
is moved from one recipe to another.
=20
> Running the check at sysroot clean time is therefore going to complicate
> the code a lot and damage performance with no real end need...
>=20
> > Now everybody doing incremental builds needs to call
> > bitbake -c cleansstate gettext-minimal-native
>=20
> -c clean should be sufficient. I wish people would use appropriately
> sized hammers and this is why I never wanted cleansstate in the first
> place :(.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sdEQJo40s7ofW8iR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCBOZAACgkQN1Ujt2V2gBxzLgCffv8XdyuHOq8kSJa+aW0tBhEm
vwMAoK4mAudnlznqqfNewgqAnZ3HIUrh
=Pq2H
-----END PGP SIGNATURE-----

--sdEQJo40s7ofW8iR--
