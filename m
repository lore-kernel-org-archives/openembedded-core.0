Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id EB5C47201A;
	Tue,  6 Jan 2015 11:04:13 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id z12so11324534wgg.27;
	Tue, 06 Jan 2015 03:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=biY7gbbgbELF8z1vfK8nTvfQFJ6VXNAshh3PimRaqSM=;
	b=T4JL04QfbTWE1Eur9OYDdszPPU6FCT0hkr8MxZXlIk9avjEKln6Kr4g2SMoGXHe6TU
	g0hYU/n6NZ7+8Ed9McdKse+E9RDs72ID6c7RUxJ1svd/vsGV1VNtxX/JxhTqXtXzSzqw
	gvMcIMluxDyj782ndFpz0NlkbXd+xdb7qU3v1isCW6C+LzR2xhoc9IfQK2qFz4MtYzVC
	RIPztxCtHrORNV0RsXmcxSKKeyNkM9nJPwkhVZrAD/itg8SKCocKsgogDrsSNAlcjAIP
	QsEuKxci0knBwlM+alRKj/vLJpEZ0yyuEHb+hT6B++6dymWBXJbkQ/4+BxZefPiHLsne
	6rgQ==
X-Received: by 10.180.94.37 with SMTP id cz5mr5529169wib.61.1420542244489;
	Tue, 06 Jan 2015 03:04:04 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	c10sm78999715wjy.4.2015.01.06.03.04.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 03:04:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 12:04:06 +0100
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20150106110406.GD19402@jama>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
	<54AB8B59.7080702@topic.nl> <20150106085731.GC19402@jama>
MIME-Version: 1.0
In-Reply-To: <20150106085731.GC19402@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Tue, 06 Jan 2015 11:04:16 -0000
X-Groupsio-MsgNum: 61031
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sgneBHv3152wZ8jf"
Content-Disposition: inline

--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 09:57:31AM +0100, Martin Jansa wrote:
> FWIW: I'm also seeing various kernel failures since the changes.
>=20
> Most my kernel are also using linux.inc from meta-oe which wasn't updated=
 yet
> (I plan to look into it soon, unless someone else beats me to it)
>=20
> The worst part is that some of these issues are random (the race-conditio=
n showing
> more often than before).
>=20
> 1) do_unpack failing:
>=20
> ERROR: Error executing a python function in /home/jenkins/workspace/luneo=
s-unstable/webos-ports/meta-smartphone/meta-samsung/recipes-kernel/linux/li=
nux-samsung-tuna_git.bb:
> File: 'base_do_unpack', lineno: 21, function: base_do_unpack
>      0017:        bb.utils.mkdirhier(kernsrc)
>      0018:        bb.utils.remove(kernsrc, recurse=3DTrue)
>      0019:        import subprocess
>      0020:        subprocess.call(d.expand("mv /home/jenkins/workspace/lu=
neos-unstable/webos-ports/tmp-glibc/work/maguro-webos-linux-gnueabi/linux-s=
amsung-tuna/3_3.0.72+gitrAUTOINC+f8ed73f94a-r12/git/ /home/jenkins/workspac=
e/luneos-unstable/webos-ports/tmp-glibc/sysroots/maguro/usr/src/kernel"), s=
hell=3DTrue)
>  *** 0021:        os.symlink(kernsrc, s)
>      0022:
>      0023:
>      0024:base_do_unpack(d)
>      0025:
> Exception: OSError: [Errno 2] No such file or directory

This fails when S ends with slash, fix in
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/master

> 2) do_configure failing:
>=20
> ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnu=
eabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17=
498)
> ERROR: Logfile of failure stored in: /home/jenkins/workspace/luneos-unsta=
ble/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0=
+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function do_configure
> | NOTE: make oldconfig
> | make: *** No rule to make target `oldconfig'.  Stop.
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at /home/jenk=
ins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-g=
nueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.=
17498)
> NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task do_confi=
gure: Failed
> ERROR: Task 491 (/home/jenkins/workspace/luneos-unstable/webos-ports/meta=
-smartphone/meta-lg/recipes-kernel/linux/linux-lg-mako_git.bb, do_configure=
) failed with exit code '1'

This was caused by linux.inc, fixed in:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099=
687.html

> 3) do_patch failing when S assignment is dropped

This isn't relevant, S assignment is still needed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSrwSYACgkQN1Ujt2V2gByS2ACfSscnOuHVttZ/8ibguW9s8Fgh
cIMAnjOhAGrZGFHzQwcx/49HC2hyj8bS
=7Mrc
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--
