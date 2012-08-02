Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Sx1Ri-00018x-1z; Thu, 02 Aug 2012 21:52:34 +0200
Received: by wgbdr1 with SMTP id dr1so7440762wgb.24
	for <multiple recipients>; Thu, 02 Aug 2012 12:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zWfWqYju8Fj12NmWfFUESuv1Pl3thXuaj8T5Ymr6Zk0=;
	b=zM/785tsCXDCspibEt5DP0pl+IfOoZ1D6d/qU+VOR/Kt4UDl0MKJKr5UywlZTWmBHT
	hcEjCClMn2g696Z0NRxVhW6N7jCCZvf3pcepFto8Jef/F/x9NeYH4s4DYc/94OZSoWrO
	Sfxj15Yj1uirgEiCm3B+i8ne0ZzC9Gvj9V6vATD3RG5aovWhSXpGoFziX0x+T/sHFrKs
	UFCv455AF2Oi6v3KyH+yzWbUe9YgwUCFZF/YP+IVrMWSdzSeaFfLmYtHgjxz8OKf5DBh
	YMQ8DyTdbmvPhFYkZFImtQDysAuHhS4/nqcBAU2MljjU7dWffhLlybAV+Uyo0zRpcD4S
	L0KQ==
Received: by 10.180.107.2 with SMTP id gy2mr7238819wib.2.1343936454252;
	Thu, 02 Aug 2012 12:40:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm19578423wiz.9.2012.08.02.12.40.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 12:40:53 -0700 (PDT)
Date: Thu, 2 Aug 2012 21:40:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120802194051.GA16306@jama.jama.net>
References: <1343250562.29991.0.camel@ted>
	<20120802135335.GQ16306@jama.jama.net>
	<20120802141450.GS16306@jama.jama.net>
	<1343922792.9756.81.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343922792.9756.81.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] sstate: Add a two character subdirectory to the sstate directory layout
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
X-List-Received-Date: Thu, 02 Aug 2012 19:52:34 -0000
X-Groupsio-MsgNum: 26835
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uWAbeGC4mMoqIxdF"
Content-Disposition: inline

--uWAbeGC4mMoqIxdF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 04:53:12PM +0100, Richard Purdie wrote:
> On Thu, 2012-08-02 at 16:14 +0200, Martin Jansa wrote:
> > On Thu, Aug 02, 2012 at 03:53:35PM +0200, Martin Jansa wrote:
> > > On Wed, Jul 25, 2012 at 10:09:22PM +0100, Richard Purdie wrote:
> > > > Currently all sstate files are placed into one directory. This does=
 not scale and
> > > > causes a variety of filesystem issues. This patch adds a two charac=
ter subdirectory
> > > > to the layout (based on the first two characters of the hash) so th=
at files
> > > > can be split into several directories.
> > > >=20
> > > > This should help performance of sstate in most cases by avoding cre=
ating directories with=20
> > > > huge numbers of files.
> > > >=20
> > > > The SSTATE_MIRRORS syntax needs updating to account for the extra p=
ath element by
> > > > the addition of a PATH item, for example:
> > > >=20
> > > > SSTATE_MIRRORS =3D "file://.* file:///some/path/to/sstate-cache/PAT=
H"
> > > > SSTATE_MIRRORS =3D "file://.* http://192.168.1.23/sstate-cache/PATH"
> > > >=20
> > > > This change also sets the scene for using things like lsb-release in
> > > > the=20
> > >=20
> > > Is it possible to create 2nd level cache with this?
> > >=20
> > > I have some server with slow upload but fully populated sstate-cache.
> > >=20
> > > So on server with faster upload which could be used as offical
> > > SSTATE_MIRROR for SHR distro I would like to add
> > >=20
> > > SSTATE_MIRRORS ?=3D "file://.* http://slow-server/sstate-cache/PATH"
> > >=20
> > > And then sync my sstate-cache directory to public accessible web root=
 (with rsync).
> > >=20
> > > Problem is that now sstate-cache has all files in slightly different=
=20
> > > layout then original sstate-cache on slow server. From what I see I g=
uess=20
> > > it finds URL with correct prefix "sstate-cache/Gentoo-2.1/0d" and dow=
nloads it=20
> > > directly to sstate-cache dir (and adds .done)
> > >=20
> > > OE @ ~/oe-core $ ll sstate-cache/sstate-apr-native-x86_64-linux-1.4.6=
-r1-x86_64-2-*populate-lic*
> > > -rw-r--r-- 1 bitbake bitbake 9257 Jul 30 12:31 sstate-cache/sstate-ap=
r-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_po=
pulate-lic.tgz
> > > -rw-r--r-- 1 bitbake bitbake    0 Aug  2 15:40 sstate-cache/sstate-ap=
r-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_po=
pulate-lic.tgz.done
> > >=20
> > > And then creates symlink in right prefix back to absolute path of sst=
ate-cache/file:
> > > OE @ ~/oe-core $ ll sstate-cache/Gentoo-2.1/0d/sstate-apr-native-x86_=
64-linux-1.4.6-r1-x86_64-2-*populate-lic*
> > > lrwxrwxrwx 1 bitbake bitbake 123 Aug  2 15:40 sstate-cache/Gentoo-2.1=
/0d/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe9=
4536596e50_populate-lic.tgz ->=20
> > > /OE/oe-core/sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_=
64-2-0d2ed24b90d50bf83e5fe94536596e50_populate-lic.tgz
> > >=20
> > > But after sstate-cache directory is rsynced somewhere else and oe-cor=
e/sstate-cache is removed,=20
> > > all those symlinks point nowhere and public sstate-cache is unusable.
> > >=20
> > > Can we have relative paths used in symlinks or even instruct fetcher =
to download that=20
> > > file directly to right prefix?
> >=20
> > 2 more ideas:
> >=20
> > 1) would be great to also download file.sigdata if it exists, to be able
> >    to compare them when they change even on machine which downloaded
> >    older sstate file from remote url
> > 2) if the reason for this patch was number of files in shared
> >    sstate-cache directory, then fetcher creating .done files makes
> >    number double too (would be fine if fetcher stores all 3 files
> >    (.tgz, .tgz.sigdata, .tgz.done) in right prefix, or moves them to
> >    right prefix instead of symlinks.
>=20
> I'm aware of the problem. The main issue is that we probably need to

And what about .sigdata files?

I have sort shell script to replace symlinks with real files in prefixed
dirs, would it be worth it integrating to=20
openembedded-core/scripts/sstate-cache-management.sh
which doesn't work with new layout anyway?


> start enforcing complete paths for all downloads in DL_DIR, including
> http:// urls. This would resolve conflicts like:
>=20
> SRC_URI =3D "http://server1.org/somefile.patch \
>            http://server2.org/somefile.patch"

In two separate recipes right?

> where the two files are different. The trouble is it will pretty much
> break all the source mirrors :(.

So you would store them in DL_DIR/server1.org/somefile.patch path?=20

That would make oposite scenario where the BIG.tgz is available=20
(or even requested by different recipes) from different location less
efficient.

And not creating .done files for local files fetched from file:// whould
also help for:

foo.bb: SRC_URI =3D "file://somefile.patch"
bar.bb: SRC_URI =3D "http://server2.org/somefile.patch"=20

Which now ignores checksums for samefile.patch downloaded for bar.bb if
foo.bb was built before.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uWAbeGC4mMoqIxdF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAa18MACgkQN1Ujt2V2gBzYnACeJibKU+d9fUybgXT4orPAtTMa
qRIAnA1Q4a7IFFmMEzA+2o40b70o05f5
=UiqI
-----END PGP SIGNATURE-----

--uWAbeGC4mMoqIxdF--
