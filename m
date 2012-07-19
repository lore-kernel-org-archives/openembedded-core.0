Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srskf-0001X1-MG
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 17:34:53 +0200
Received: by wibhm11 with SMTP id hm11so2422626wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XVMqblw3t2Xw4EjcnFOLS9eoNIA3JIbkWitzShiWWlQ=;
	b=dAa8IjAFsaa2ucTVxlrMmuvEbHwiJVDhz5uIStRARGKGcwFmcvdckQsXauUTT6zxln
	tG9PB4l1GvfBVooT5I2LdCcaqxXUd0Ed5uvMupKZdLx5BEPZ4rHf3/gvX0RhAHd8ri4U
	F4HIeh9acq/aoAmjiI7ovyjW0au/YHArNxNsLeGKhaWiEljh4dr4KieNCMiY9Ut4ZrJp
	ZD1ZzXsLDuoW/dlSl1DpQN5sYa3cTqcTze0flQ9Wy0G4VSf70cq8OvMY+mXY3E0a3SXN
	2Hh1VVMqlEuW9lwH9HnwYi53vcWeOzAp9ijjp2mZ6N+AYaQRypwQS0A/33QX0gNAvcJ8
	ZHIQ==
Received: by 10.216.131.22 with SMTP id l22mr1388627wei.96.1342711411375;
	Thu, 19 Jul 2012 08:23:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm6801040wiy.4.2012.07.19.08.23.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 08:23:30 -0700 (PDT)
Date: Thu, 19 Jul 2012 17:23:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: ml@communistcode.co.uk, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120719152341.GL3331@jama.jama.net>
References: <1342606005.30680.17.camel@ted>
	<50081D62.9000204@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <50081D62.9000204@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: PLEASE READ: Major change landing shortly (python whitespace)
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
X-List-Received-Date: Thu, 19 Jul 2012 15:34:53 -0000
X-Groupsio-MsgNum: 25728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8/n5iBOhiUtMkxf"
Content-Disposition: inline

--O8/n5iBOhiUtMkxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2012 at 03:44:50PM +0100, Jack Mitchell wrote:
> On 18/07/12 11:06, Richard Purdie wrote:
> > snip
> >
> > So I am going to:
> >
> > a) Try and flush through as many pending patches as I can.
> > b) Check in a warning into bitbake master and increase its version
> > c) Require that version in OE-Core
> > d) Commit a significant set of whitespace changes to OE-Core, resolving
> > all the warnings for OE-Core.
> >
> > I plan to do this, tomorrow, Thursday.
> >
>=20
> Richard,
>=20
> I think I've hit an issue with the white spaces today:
>=20
>     NOTE: Resolving any missing task queue dependencies
>     NOTE: Preparing runqueue
>     NOTE: Executing RunQueue Tasks
>     NOTE: Running task 1 of 2 (ID: 0,
> virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-dev=
tools/bison/bison_2.5.bb,
>     do_clean)
>     NOTE: package bison-native-2.5-r2: task do_clean: Started
>     ERROR: Error executing a python function in
> /mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bis=
on_2.5.bb:
>     OSError: [Errno 39] Directory not empty:
> '/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/bi=
son-native-2.5-r2/temp'

Do you think that this directory is full of white spaces? :)

I don't think this is related to todays white space changes, because I
see errors like this from time to time..

Cheers,


>=20
>     ERROR: The stack trace of python calls that resulted in this
>     exception/failure was:
>     ERROR:   File "do_clean", line 16, in <module>
>     ERROR:
>     ERROR:   File "do_clean", line 6, in do_clean
>     ERROR:
>     ERROR:   File
> "/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/lib/oe/path.py",
>     line 94, in remove
>     ERROR:     shutil.rmtree(name)
>     ERROR:
>     ERROR:   File "/usr/lib/python2.7/shutil.py", line 245, in rmtree
>     ERROR:     rmtree(fullname, ignore_errors, onerror)
>     ERROR:
>     ERROR:   File "/usr/lib/python2.7/shutil.py", line 254, in rmtree
>     ERROR:     onerror(os.rmdir, path, sys.exc_info())
>     ERROR:
>     ERROR:   File "/usr/lib/python2.7/shutil.py", line 252, in rmtree
>     ERROR:     os.rmdir(path)
>     ERROR:
>     ERROR: The code that was being executed was:
>     ERROR:      0012:    for f in (d.getVar('CLEANFUNCS', True) or
>     '').split():
>     ERROR:      0013:        bb.build.exec_func(f, d)
>     ERROR:      0014:
>     ERROR:      0015:
>     ERROR:  *** 0016:do_clean(d)
>     ERROR:      0017:
>     ERROR: (file: 'do_clean', lineno: 16, function: <module>)
>     ERROR:      0002:def do_clean(d):
>     ERROR:      0003:    """clear the build and temp directories"""
>     ERROR:      0004:    dir =3D
> d.expand("/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64=
-linux/bison-native-2.5-r2")
>     ERROR:      0005:    bb.note("Removing " + dir)
>     ERROR:  *** 0006:    oe.path.remove(dir)
>     ERROR:      0007:
>     ERROR:      0008:    dir =3D "%s.*" %=20
> bb.data.expand(d.getVar('STAMP'), d)
>     ERROR:      0009:    bb.note("Removing " + dir)
>     ERROR:      0010:    oe.path.remove(dir)
>     ERROR: (file: 'do_clean', lineno: 6, function: do_clean)
>     ERROR: Function failed: do_clean
>     NOTE: package bison-native-2.5-r2: task do_clean: Failed
>     ERROR: Task 0
> (virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-de=
vtools/bison/bison_2.5.bb,
>     do_clean) failed with exit code '1'
>     NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
>     rerun and 1 failed.
>=20
>     Summary: 1 task failed:
> virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-dev=
tools/bison/bison_2.5.bb,
>     do_clean
>     Summary: There was 1 WARNING message shown.
>     Summary: There were 37 ERROR messages shown, returning a non-zero
>     exit code.
>=20
>=20
> Cheers,
> Jack.
>=20
> --=20
>=20
>    Jack Mitchell (jack@embed.me.uk)
>    Embedded Systems Engineer
>    http://www.embed.me.uk
>=20
> --
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O8/n5iBOhiUtMkxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAIJn0ACgkQN1Ujt2V2gBxVDQCeKNl5aR8fovlIJ0PdPMTAcEfz
NewAnAxhbdggAocGIHGqbF/PilJkKPyi
=74yJ
-----END PGP SIGNATURE-----

--O8/n5iBOhiUtMkxf--
