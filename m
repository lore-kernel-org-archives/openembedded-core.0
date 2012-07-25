Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Su6FI-0007Fv-GS
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 20:23:40 +0200
Received: by wgbdr1 with SMTP id dr1so925077wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=dYBJIFaSgEjOHoBGXsam0PpwV3hNstPBirLYj6Q6Ovs=;
	b=k3tsWyyEu6NEyBy+bQSQ7R1jMRjCadeTsOm0sXOpinHzYO7Nui3THrJojnfsGQcJBR
	ycGGouiCuuKc6a7gljxRuYtGvUx6Bjsi0sK4WxuJ4j+5/vbmviQb4HnG5OqlQT8LxWby
	nqaUnCWsYnbHCrg+FomKj6Qfc8tL4toK2udFqdEEWbqnTmTYoNleG93SWfn1nOqAKe+3
	/32l25afUmtIxBCTM7yPU5RRehd9+OfWy6678mc75B49oKUjs/2A5DVdDOGKReQBlJ3P
	30UKs3YMjWhD08NPvSb1eilBodc8ljBvsqGnvEsJTJA23Tft2eSBmFJoVEOH3gS2MEVy
	s4kA==
Received: by 10.180.90.207 with SMTP id by15mr6641689wib.22.1343239930777;
	Wed, 25 Jul 2012 11:12:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm3748139wiy.3.2012.07.25.11.12.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 11:12:10 -0700 (PDT)
Date: Wed, 25 Jul 2012 20:12:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120725181215.GA16245@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: AttributeError: 'CoreRecipeInfo' object has no attribute 'task_deps'
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
X-List-Received-Date: Wed, 25 Jul 2012 18:23:40 -0000
X-Groupsio-MsgNum: 26165
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This error is shown when someone tries to bitbake -b foo.bb with MACHINE
set to something incompatible with foo.bb:COMPATIBLE_MACHINE

OE om-gta04@shr ~/shr-core $ grep COMPATIBLE /OE/shr-core/meta-smartphone/m=
eta-openmoko/recipes-kernel/linux/linux-gta04_git.bb
COMPATIBLE_MACHINE =3D "om-gta04"

OE om-gta04@shr ~/shr-core $ export MACHINE=3Dom-gta02
OE om-gta02@shr ~/shr-core $ bitbake -b meta-smartphone/meta-openmoko/recip=
es-kernel/linux/linux-gta04_git.bb -c cleansstate
WARNING: Buildfile specified, dependencies will not be handled. If this is =
not what you want, do not use -b / --buildfile.
ERROR: Command execution failed: Traceback (most recent call last):
  File "/usr/lib64/python2.7/site-packages/bb/command.py", line 87, in runA=
syncCommand
    commandmethod(self.cmds_async, self, options)
  File "/usr/lib64/python2.7/site-packages/bb/command.py", line 203, in bui=
ldFile
    command.cooker.buildFile(bfile, task)
  File "/usr/lib64/python2.7/site-packages/bb/cooker.py", line 1060, in bui=
ldFile
    self.status.add_from_recipeinfo(fn, info_array)
  File "/usr/lib64/python2.7/site-packages/bb/cache.py", line 712, in add_f=
rom_recipeinfo
    info.add_cacheData(self, fn)
  File "/usr/lib64/python2.7/site-packages/bb/cache.py", line 186, in add_c=
acheData
    cachedata.task_deps[fn] =3D self.task_deps
AttributeError: 'CoreRecipeInfo' object has no attribute 'task_deps'


Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Better error message would be nice.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAQNv8ACgkQN1Ujt2V2gBxd/ACfZtlwGP8T92l84tDbCVIAOZgG
lEoAoKWHAl5Pr6DE1leX1BAocp6wm3Kf
=/efL
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
