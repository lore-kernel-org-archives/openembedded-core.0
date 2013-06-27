Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 311C6618B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 14:44:52 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id t10so450751eei.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=A9v7hJNpUOxczzXmXjOwqN4oqECbDnv05Exm+DPzCv0=;
	b=WiWSNaVhmJpjMgvG8EQqsZIMJcejAzcwdOHTRWEUY/i/y5YXkVqR35wMglbBMzdubp
	7vAJA9tmOMAJsajsRwJrgjpcRwvhLibhhEhUuWo8mZDgP0XakXg1wMvU/3aTW3nKTEaz
	WyhPBsslOdoicn0OEOSYyzt9+CxX8CavvHW/JMgV01qtV++DjljQOE2dc9LliZhc1IRG
	GvBRvTrh8PWeuuJlVa0nl0r4hZfh/R+U0GbVXZVU9x+KGHjEtLg5d31+Bcnntetnd9HN
	Of+t+SFqu540HkJ12JFlCp/qnqYRJDW2dVCXnJyGgiL29p0wIyIjRx2h2GFl1+hiCdvK
	mrCQ==
X-Received: by 10.14.115.9 with SMTP id d9mr9395087eeh.87.1372344292140;
	Thu, 27 Jun 2013 07:44:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id n5sm4262550eed.9.2013.06.27.07.44.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 07:44:51 -0700 (PDT)
Date: Thu, 27 Jun 2013 16:45:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130627144529.GG3261@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: [dylan] 2 backports from master
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
X-List-Received-Date: Thu, 27 Jun 2013 14:44:52 -0000
X-Groupsio-MsgNum: 41036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PGNNI9BzQDUtgA2J"
Content-Disposition: inline

--PGNNI9BzQDUtgA2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

we talked about this one on IRC already, now I've also discussed them
with RP and he confirmed that the issue was there earlier, using it in
more places just made it more visible.

in this order:
http://git.openembedded.org/openembedded-core/commit?id=3D5853e0f482b22258c=
909268fe71673a29e31989b
http://git.openembedded.org/openembedded-core/commit?id=3D2f954a9a6932f1e6c=
564e7e7aacaac628a75eed7

I did couple of clean builds with them and haven't found any issue.
And with them backported I wasn't able to reproduce following issue anymore.

We're seeing it with Dylan release on host with very fast IO, so that's
probably why we're reporting it first.

If you want to backport only 2nd patch without 1st one, let me know and I'll
prepare and test such commit.

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function do_populate_sysroot
DEBUG: Executing shell function sysroot_stage_all
DEBUG: Shell function sysroot_stage_all finished
DEBUG: Python function do_populate_sysroot finished
DEBUG: Executing python function do_qa_staging
NOTE: QA checking staging
DEBUG: Python function do_qa_staging finished
DEBUG: Executing python function sstate_task_postfunc
DEBUG: Staging files from /OE//work/armv7a-vfp-neon-oe-linux-gnueabi/sysvin=
it/2.88dsf-r11/sysroot-destdir to /OE//sysroots/MACHINE
DEBUG: Preparing tree /OE//work/armv7a-vfp-neon-oe-linux-gnueabi/sysvinit/2=
=2E88dsf-r11/sysroot-destdir for packaging at /OE//work/armv7a-vfp-neon-oe-=
linux-gnueabi/sysvinit/2.88dsf-r11/sstate-build-populate-sysroot/sysroot-de=
stdir
ERROR: Error executing a python function in /OE//oe-core/meta/recipes-core/=
sysvinit/sysvinit_2.88dsf.bb:
CalledProcessError: Command 'cp -al /OE//work/armv7a-vfp-neon-oe-linux-gnue=
abi/sysvinit/2.88dsf-r11/sysroot-destdir/* /OE//work/armv7a-vfp-neon-oe-lin=
ux-gnueabi/sysvinit/2.88dsf-r11/sstate-build-populate-sysroot/sysroot-destd=
ir' returned non-zero exit status 1 with output cp: cannot create directory=
 `/OE//work/armv7a-vfp-neon-oe-linux-gnueabi/sysvinit/2.88dsf-r11/sstate-bu=
ild-populate-sysroot/sysroot-destdir/usr/share': File exists
cp: cannot create directory `/OE//work/armv7a-vfp-neon-oe-linux-gnueabi/sys=
vinit/2.88dsf-r11/sstate-build-populate-sysroot/sysroot-destdir/usr/include=
': File exists
=20
=20
ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "sstate_task_postfunc", line 10, in <module>
ERROR:
ERROR:   File "sstate_task_postfunc", line 7, in sstate_task_postfunc
ERROR:
ERROR:   File "sstate.bbclass", line 45, in sstate_package
ERROR:
ERROR:   File "/OE//oe-core/meta/lib/oe/path.py", line 94, in copyhardlinkt=
ree
ERROR:     check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
ERROR:
ERROR:   File "/OE//oe-core/meta/lib/oe/path.py", line 155, in check_output
ERROR:     raise CalledProcessError(retcode, cmd, output=3Doutput)
ERROR:
ERROR: The code that was being executed was:
ERROR:      0006:        bb.build.exec_func(intercept, d)
ERROR:      0007:    sstate_package(shared_state, d)
ERROR:      0008:
ERROR:      0009:
ERROR:  *** 0010:sstate_task_postfunc(d)
ERROR:      0011:
ERROR: [From file: 'sstate_task_postfunc', lineno: 10, function: <module>]
ERROR:      0003:    shared_state =3D sstate_state_fromvars(d)
ERROR:      0004:    sstate_install(shared_state, d)
ERROR:      0005:    for intercept in shared_state['interceptfuncs']:
ERROR:      0006:        bb.build.exec_func(intercept, d)
ERROR:  *** 0007:    sstate_package(shared_state, d)
ERROR:      0008:
ERROR:      0009:
ERROR:      0010:sstate_task_postfunc(d)
ERROR:      0011:
ERROR: [From file: 'sstate_task_postfunc', lineno: 7, function: sstate_task=
_postfunc]
ERROR:      0041:                srcpath =3D os.path.join(walkroot, dir)
ERROR:      0042:                dstpath =3D srcpath.replace(state[1], ssta=
tebuild + state[0])
ERROR:      0043:                make_relative_symlink(srcpath, dstpath, d)
ERROR:      0044:        bb.debug(2, "Preparing tree %s for packaging at %s=
" % (state[1], sstatebuild + state[0]))
ERROR:  *** 0045:        oe.path.copyhardlinktree(state[1], sstatebuild + s=
tate[0])
ERROR:      0046:
ERROR:      0047:    workdir =3D d.getVar('WORKDIR', True)
ERROR:      0048:    for plain in ss['plaindirs']:
ERROR:      0049:        pdir =3D plain.replace(workdir, sstatebuild)
ERROR: [From file: 'sstate.bbclass', lineno: 45, function: sstate_package]
DEBUG: Python function sstate_task_postfunc finished
ERROR: Function failed: sstate_task_postfunc

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PGNNI9BzQDUtgA2J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHMUAkACgkQN1Ujt2V2gBx39wCfVwqakU/kZ94GOZ8snnGWJPCO
lTQAn1kFbDJJCfSDYnuJjMt8OfLkvD6q
=wTts
-----END PGP SIGNATURE-----

--PGNNI9BzQDUtgA2J--
