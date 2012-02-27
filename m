Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1uMO-0007MH-MT
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 07:47:00 +0100
Received: by eekc1 with SMTP id c1so304701eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 22:38:35 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.8.69 as permitted sender) client-ip=10.213.8.69; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.8.69 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.8.69])
	by 10.213.8.69 with SMTP id g5mr3610119ebg.55.1330324715026 (num_hops =
	1); Sun, 26 Feb 2012 22:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/i9eDCCb1w0ICpK+66bvIy8zhydxqBQxF3kh6YnqsM4=;
	b=FDqtM4LyzYFotTFjCdnMUVfJGPFqV1JfEGxERmocCG+CI8E5+3bBwOIik3sUQYvq1Y
	rQ6XCW5xirh6U7fQnPw2izEPE1niF53Lu9FuOSD4tZO8XE7zsFvabHDtJHa8U22o1A8v
	CiYco7e71qfQYH1SkM6Wtsmro7gFXGIWzj4ic=
Received: by 10.213.8.69 with SMTP id g5mr2721608ebg.55.1330324714768;
	Sun, 26 Feb 2012 22:38:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r5sm42161636eef.6.2012.02.26.22.38.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 22:38:34 -0800 (PST)
Date: Mon, 27 Feb 2012 07:38:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120227063832.GC3859@jama.jama.net>
References: <CAGDS+nk2zxHM05n1rKzW8q-sgOmiMCVdwRP_LvWJ-B+1_8hH5Q@mail.gmail.com>
	<1330298698.31855.27.camel@ted>
	<CAGDS+nn_wO7eZD1pHL1bY=NR5KaZsopTKRH5XDvDVwXycirTug@mail.gmail.com>
	<CAGDS+n==y3SuLQ8cEBxerAjVyo4d9kf6qgBcQpfAd0n3iL82ew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGDS+n==y3SuLQ8cEBxerAjVyo4d9kf6qgBcQpfAd0n3iL82ew@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: elfutils - missing dependency on bzip2?
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
X-List-Received-Date: Mon, 27 Feb 2012 06:47:00 -0000
X-Groupsio-MsgNum: 18012
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline

--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 26, 2012 at 10:30:04PM -0800, Steve Sakoman wrote:
> On Sun, Feb 26, 2012 at 4:34 PM, Steve Sakoman <sakoman@gmail.com> wrote:
> > On Sun, Feb 26, 2012 at 3:24 PM, Richard Purdie <rpurdie@rpsys.net> wro=
te:
> >> On Sun, 2012-02-26 at 09:25 -0800, Steve Sakoman wrote:
> >>> After a pull this morning the rebuild if elfutils fails with:
> >>>
> >>> | /usr/bin/ld: cannot find -lbz2
> >>> | collect2: ld returned 1 exit status
> >>> | make[3]: *** [libdw.so] Error 1
> >>> | make[3]: Leaving directory
> >>> `/media/Work/yocto/tmp/work/i686-linux/elfutils-native-0.148-r5/elfut=
ils-0.148/libdw'
> >>>
> >>> If I build bzip2-native and then rebuild elfutils-native all is well
> >>> and the build continues until the next failure (mesa-dri-glsl-native,
> >>> fwiw, haven't investigated that one yet).
> >>
> >> This sounds like there might be a floating dependency in elfutils on
> >> bzip2, if its present. We probably need to lock that down one way or
> >> another.
> >>
> >>> Anyone else see this, or is it just another case of my build machines
> >>> being in a strange state?
> >>
> >> I've seen mesa-dri-glsl-native myself and if its the same issue, this =
is
> >> something the signature changes have highlighted. It was there before,
> >> that change just exposed it.
> >>
> >> Basically, the problem is compile running twice. You could do it before
> >> with something like:
> >>
> >> bitbake mesa-dri-glsl-native
> >> bitbake mesa-dri-glsl-native -c compile -f
> >>
> >> We either need to fix these makefile issues or run "make clean" against
> >> them before rerunning make.
> >
> > FWIW, I also had build failures on docbook-utils-native and libzypp.
> > In all cases a -c cleansstate and rebuild got me back to being
> > productive. =A0I'm on a bit of a deadline so I didn't have time to
> > research a proper fix for each.
> >
> > The docbook-utils errors (and there were many) started with:
> >
> > | jade:../../doc/docbook-utils.sgml:9:0:E: reference to entity "BOOK"
> > for which no system identifier could be generated
> > | jade:../../doc/docbook-utils.sgml:1:0: entity was defined here
> > | jade:../../doc/docbook-utils.sgml:9:0:E: reference to entity "BOOK"
> > for which no system identifier could be generated
> > | jade:../../doc/docbook-utils.sgml:1:0: entity was defined here
> > | jade:../../doc/docbook-utils.sgml:9:0:E: reference to entity "BOOK"
> > for which no system identifier could be generated
> > | jade:../../doc/docbook-utils.sgml:1:0: entity was defined here
> >
> > And the libzypp error:
> >
> > | /media/Work/yocto/tmp/sysroots/i686-linux/usr/bin/cmake -E
> > cmake_progress_report
> > /media/Work/yocto/tmp/work/omap3_multi-poky-linux-gnueabi/libzypp-0.0-g=
it1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r18/git/CMakeFiles
> > | make[2]: *** No rule to make target
> > `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libcrypto.so',
> > needed by `zypp/libzypp.so.810.1.0'. =A0Stop.
> >
> > Sorry I don't have time to dig into the issues at the moment . . .
>=20
> Yet another FWIW - with another more "beefy" image the following
> failures occurred (both fixed with -c cleansstate and rebuild):
>=20
> font-util:
>=20
> | cp: cannot stat
> `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/share/aclocal/./audiofile=
=2Em4':
> No such file or directory
> NOTE: package font-util-1.2.0-r2.2: task do_configure: Failed
> ERROR: Task 3303
> (/home/sakoman/source/yocto/poky/meta/recipes-graphics/xorg-font/font-uti=
l_1.2.0.bb,
> do_configure) failed with exit code '1'
>=20
> gcc:
>=20
> ERROR: This autoconf log indicates errors, it looked at host include
> and/or library paths while determining system capabilities.
> Rerun configure task after fixing this. The path was
> '/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/gcc-4.6.2+=
svnr181430-r27/gcc-4_6-branch/build.arm-poky-linux-gnueabi.arm-poky-linux-g=
nueabi/gcc'
> ERROR: Function failed: do_qa_configure
> ERROR: Logfile of failure stored in:
> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/gcc-4.6.2+s=
vnr181430-r27/temp/log.do_configure.27718
> NOTE: package gcc-4.6.2+svnr181430-r27: task do_configure: Failed

Can you check config.log if it also has warning:=20
"library search path "/usr/lib/cmplrs/cc2.11" is unsafe for cross-compilati=
on"

like in mine:
http://paste.pocoo.org/show/541085/

?

I see this only when doing multimachine builds and removing sstate
helps.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEUEARECAAYFAk9LJOgACgkQN1Ujt2V2gBwc1ACYjF3p3Wj6HA7wsgSfJ9PASlXg
3QCgojfH0a0z+8jPJaHtabId5ZEg6iU=
=bEOg
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
