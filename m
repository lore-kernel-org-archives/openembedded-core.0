Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SyHcz-0006XF-9n; Mon, 06 Aug 2012 09:21:25 +0200
Received: by wibhq4 with SMTP id hq4so1241473wib.6
	for <multiple recipients>; Mon, 06 Aug 2012 00:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yiLkQW5bc6G7Z3o/BhFI2jluAvn8TFFV+HZsJfet6Pg=;
	b=EZkHH3grY9/pfImfN7yHdhQ/qrn/kF786P8UpNrGKhxwgUlsPaJF8dH/6/Or/5O8HP
	TgUFAndbhMoVhGCSQAipy7rfPAcISU2Yc62W8bZM6x/81OPaGekxXwO+i32pJmiR6dfM
	jYODF36Kyo8MVFpi231r6UxaM3B8ZtVMjsLcXIUwvdhK5Ce8IMLKIlAJpv4LsPQ8w10p
	vxa0kDr4PwMgz58u/tTQio5dvPcUgiFHDbSptOa4tkUe4PwMaIw79QMEYLZSsSEPTR7R
	6u0sJyg6n0lOuj1n9Bg+/WInc5IijCK/JOMQ1e8DwxvgA9eht2xrOWFURl4X3IXXufhG
	qjKA==
Received: by 10.180.91.1 with SMTP id ca1mr15931866wib.8.1344236981153;
	Mon, 06 Aug 2012 00:09:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm20803883wix.6.2012.08.06.00.09.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 00:09:39 -0700 (PDT)
Date: Mon, 6 Aug 2012 09:09:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120806070934.GE3267@jama.jama.net>
References: <1343250562.29991.0.camel@ted>
	<20120802135335.GQ16306@jama.jama.net>
	<20120802141450.GS16306@jama.jama.net>
	<1343922792.9756.81.camel@ted>
	<20120802194051.GA16306@jama.jama.net>
	<1343937470.9756.95.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343937470.9756.95.camel@ted>
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
X-List-Received-Date: Mon, 06 Aug 2012 07:21:25 -0000
X-Groupsio-MsgNum: 27001
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline

--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 08:57:50PM +0100, Richard Purdie wrote:
> On Thu, 2012-08-02 at 21:40 +0200, Martin Jansa wrote:
> > On Thu, Aug 02, 2012 at 04:53:12PM +0100, Richard Purdie wrote:
> > > On Thu, 2012-08-02 at 16:14 +0200, Martin Jansa wrote:
> > > > On Thu, Aug 02, 2012 at 03:53:35PM +0200, Martin Jansa wrote:
> > > > > On Wed, Jul 25, 2012 at 10:09:22PM +0100, Richard Purdie wrote:
> > > > > > Currently all sstate files are placed into one directory. This =
does not scale and
> > > > > > causes a variety of filesystem issues. This patch adds a two ch=
aracter subdirectory
> > > > > > to the layout (based on the first two characters of the hash) s=
o that files
> > > > > > can be split into several directories.
> > > > > >=20
> > > > > > This should help performance of sstate in most cases by avoding=
 creating directories with=20
> > > > > > huge numbers of files.
> > > > > >=20
> > > > > > The SSTATE_MIRRORS syntax needs updating to account for the ext=
ra path element by
> > > > > > the addition of a PATH item, for example:
> > > > > >=20
> > > > > > SSTATE_MIRRORS =3D "file://.* file:///some/path/to/sstate-cache=
/PATH"
> > > > > > SSTATE_MIRRORS =3D "file://.* http://192.168.1.23/sstate-cache/=
PATH"
> > > > > >=20
> > > > > > This change also sets the scene for using things like lsb-relea=
se in
> > > > > > the=20
> > > > >=20
> > > > > Is it possible to create 2nd level cache with this?
> > > > >=20
> > > > > I have some server with slow upload but fully populated sstate-ca=
che.
> > > > >=20
> > > > > So on server with faster upload which could be used as offical
> > > > > SSTATE_MIRROR for SHR distro I would like to add
> > > > >=20
> > > > > SSTATE_MIRRORS ?=3D "file://.* http://slow-server/sstate-cache/PA=
TH"
> > > > >=20
> > > > > And then sync my sstate-cache directory to public accessible web =
root (with rsync).
> > > > >=20
> > > > > Problem is that now sstate-cache has all files in slightly differ=
ent=20
> > > > > layout then original sstate-cache on slow server. From what I see=
 I guess=20
> > > > > it finds URL with correct prefix "sstate-cache/Gentoo-2.1/0d" and=
 downloads it=20
> > > > > directly to sstate-cache dir (and adds .done)
> > > > >=20
> > > > > OE @ ~/oe-core $ ll sstate-cache/sstate-apr-native-x86_64-linux-1=
=2E4.6-r1-x86_64-2-*populate-lic*
> > > > > -rw-r--r-- 1 bitbake bitbake 9257 Jul 30 12:31 sstate-cache/sstat=
e-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e5=
0_populate-lic.tgz
> > > > > -rw-r--r-- 1 bitbake bitbake    0 Aug  2 15:40 sstate-cache/sstat=
e-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e5=
0_populate-lic.tgz.done
> > > > >=20
> > > > > And then creates symlink in right prefix back to absolute path of=
 sstate-cache/file:
> > > > > OE @ ~/oe-core $ ll sstate-cache/Gentoo-2.1/0d/sstate-apr-native-=
x86_64-linux-1.4.6-r1-x86_64-2-*populate-lic*
> > > > > lrwxrwxrwx 1 bitbake bitbake 123 Aug  2 15:40 sstate-cache/Gentoo=
-2.1/0d/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e=
5fe94536596e50_populate-lic.tgz ->=20
> > > > > /OE/oe-core/sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-=
x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_populate-lic.tgz
> > > > >=20
> > > > > But after sstate-cache directory is rsynced somewhere else and oe=
-core/sstate-cache is removed,=20
> > > > > all those symlinks point nowhere and public sstate-cache is unusa=
ble.
> > > > >=20
> > > > > Can we have relative paths used in symlinks or even instruct fetc=
her to download that=20
> > > > > file directly to right prefix?
> > > >=20
> > > > 2 more ideas:
> > > >=20
> > > > 1) would be great to also download file.sigdata if it exists, to be=
 able
> > > >    to compare them when they change even on machine which downloaded
> > > >    older sstate file from remote url
> > > > 2) if the reason for this patch was number of files in shared
> > > >    sstate-cache directory, then fetcher creating .done files makes
> > > >    number double too (would be fine if fetcher stores all 3 files
> > > >    (.tgz, .tgz.sigdata, .tgz.done) in right prefix, or moves them to
> > > >    right prefix instead of symlinks.
> > >=20
> > > I'm aware of the problem. The main issue is that we probably need to
> >=20
> > And what about .sigdata files?

Added
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2898

> > I have sort shell script to replace symlinks with real files in prefixed
> > dirs, would it be worth it integrating to=20
> > openembedded-core/scripts/sstate-cache-management.sh
> > which doesn't work with new layout anyway?

Added
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2897

> > > start enforcing complete paths for all downloads in DL_DIR, including
> > > http:// urls. This would resolve conflicts like:
> > >=20
> > > SRC_URI =3D "http://server1.org/somefile.patch \
> > >            http://server2.org/somefile.patch"
> >=20
> > In two separate recipes right?
> >=20
> > > where the two files are different. The trouble is it will pretty much
> > > break all the source mirrors :(.
> >=20
> > So you would store them in DL_DIR/server1.org/somefile.patch path?
>=20
> I've wondered about:
>=20
> DL_DIR/server1.org/somepath/somefile.patch
>=20
> > That would make oposite scenario where the BIG.tgz is available=20
> > (or even requested by different recipes) from different location less
> > efficient.
>=20
> Not necessarily with the right mirror/premirror configuration.
>=20
> > And not creating .done files for local files fetched from file:// whould
> > also help for:
> >=20
> > foo.bb: SRC_URI =3D "file://somefile.patch"
> > bar.bb: SRC_URI =3D "http://server2.org/somefile.patch"=20
> >=20
> > Which now ignores checksums for samefile.patch downloaded for bar.bb if
> > foo.bb was built before.
>=20
> That is a pain but we've basically always assumed no namespace
> collision. I'm not saying that is a good thing, just the way it is.
>=20
> Not creating done files for local urls causes a variety of problems, not
> least that you then have to special case local urls in the generic
> fetcher code, it also hits performance. I've been trying to get the
> fetcher away from a set of special cases...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAfba4ACgkQN1Ujt2V2gBzeMQCfQ4oS6ToiVEKiy6nWPWj3SSEp
CDgAnRRp5svb0f3oBR7XNVexE14u/NvF
=DLYL
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
