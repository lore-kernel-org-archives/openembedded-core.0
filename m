Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SoLz7-00051W-1b
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 23:59:13 +0200
Received: by weyr6 with SMTP id r6so4720985wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CjRbfWFpw2cO20Lhp29/Ip2dBirvtkMC1F6FfLW992I=;
	b=iwY4VotxlfTo86uKuyqurd39LZd5V3qclJlI0fb4oNv64LSQjShT2zZK4nCR/Ku5d7
	/971IyKY8xJa/M2R/7vGFDVf38Issf/fiTOsBZ1WlgjGMLkKAgLwgK9zl6oUvnerahmb
	WolNzZXHdqC1NCYvhq0KxHrLZStkeq7wwl/3fQcp7MRU7mHyGbP049N3QhsO4DbaGC0H
	TXjGeCKHJckE/EiBQNZrFhgXXWEN+9/vdaPqg+E4lwlDG7DDSicXyTW3xE+cFv9WIADJ
	WOAYF1o82m1OI+5ZwKQlLgtcWj1jjSuoDif38CSO0iEg2U8GyycVI+f/ivFuEG6lMknx
	io1w==
Received: by 10.216.213.226 with SMTP id a76mr16960645wep.142.1341870483380;
	Mon, 09 Jul 2012 14:48:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm16113754wib.6.2012.07.09.14.48.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jul 2012 14:48:02 -0700 (PDT)
Date: Mon, 9 Jul 2012 23:47:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120709214759.GJ6308@jama.jama.net>
References: <4FFB4F7D.1040009@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4FFB4F7D.1040009@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: build stats error with eglibc 2.16!
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
X-List-Received-Date: Mon, 09 Jul 2012 21:59:13 -0000
X-Groupsio-MsgNum: 25022
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tu8ztk+XgTAiG9Id"
Content-Disposition: inline

--Tu8ztk+XgTAiG9Id
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 09, 2012 at 02:39:09PM -0700, Saul Wold wrote:
>=20
> I have started to build the eglibc 2.16 locally and I am seeing a=20
> strange buildstats failure:
>=20
> > ERROR: Execution of event handler 'run_buildstats' failed
> > Traceback (most recent call last):
> >   File "run_buildstats(e)", line 89, in run_buildstats(e=3D<bb.build.Ta=
skSucceeded object at 0x77ce2d0>)
> >   File "buildstats.bbclass", line 5, in write_task_data(status=3D'passe=
d', logfile=3D'/intel/poky/builds/world/tmp/buildstats/gnupg-qemux86/201207=
091436/eglibc-2.16-r0+svnr19383/do_package_write_ipk', dev=3D'sdb1', e=3D<b=
b.build.TaskSucceeded object at 0x77ce2d0>)
> > IOError: [Errno 2] No such file or directory: '/intel/poky/builds/world=
/tmp/buildstats/gnupg-qemux86/201207091436/eglibc-2.16-r0+svnr19383/do_pack=
age_write_ipk'
> >
> > NOTE: package eglibc-2.16-r0+svnr19383: task do_package_write_ipk: Succ=
eeded
> > NOTE: Running noexec task 1067 of 1073 (ID: 198, /intel/poky/distro/met=
a/recipes-core/eglibc/eglibc_2.15.bb, do_package_write)
>=20
> Ideas?

something messing with EGLIBCVERSION during build (e.g. branch switch in
other term)?

It's building 2.16 but then running eglibc_2.15.bb...

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Tu8ztk+XgTAiG9Id
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/7UY8ACgkQN1Ujt2V2gBymAACeIX5oajfeRdIvgWJ+FjHoDkGk
7PwAniLU+86CM5cEb9AcxIHUsc50NBtF
=cEYT
-----END PGP SIGNATURE-----

--Tu8ztk+XgTAiG9Id--
