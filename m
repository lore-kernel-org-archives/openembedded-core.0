Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id CA54065CDB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 15:56:41 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so1935895wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 07:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EzA4bPqbdhRMdKUPBZCbqXzCi0JEyPK8LhWFLOPAKGs=;
	b=ViweTjN0UuZVy5tWUcHhZu17oOZJF+n2HcKUL0j+oHddwgYRmCugLgAxlSK88ADsBZ
	NPUPgIFn+VPvrm08zeE3RgRwJTMkfJnon+WKjG6Hf3/I4YgOBy6PomKlBzsj0+hO3Xo9
	f16LbDG/swwAOZT9izNYsT2SCzkfY31DJRtXEceeRngcVBQrh5BfCilE76qh2QnOTRmr
	6JQk4AYxOIWMzTDmHRMIDB2E2CGWjPWYE0un0Qb8YOfpUmKxvzsI18GYZBJXRfrG9aS/
	Q2gvCu+0NNf+9UHESEk+oD81ese/dVptBMc5jcGHwPGbxvs2sk4hX1sTLPKkvITt+/ci
	4NSw==
X-Received: by 10.194.7.103 with SMTP id i7mr7518795wja.53.1420646201978;
	Wed, 07 Jan 2015 07:56:41 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eu15sm3024948wid.18.2015.01.07.07.56.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 07:56:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 16:56:44 +0100
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20150107155644.GB3972@jama>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
	<54AB8B59.7080702@topic.nl> <20150106085731.GC19402@jama>
	<CAJTo0LaW2JLjqHCDEMggAb2QLM+Ns14qQWGq=BG5jLFu4HVRow@mail.gmail.com>
	<20150107100735.GF29986@jama>
	<CADkTA4OkKSYa02+xfpaURYDv74F9+ck+oREU3ShZf8Yk0JNbrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OkKSYa02+xfpaURYDv74F9+ck+oREU3ShZf8Yk0JNbrA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
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
X-List-Received-Date: Wed, 07 Jan 2015 15:56:45 -0000
X-Groupsio-MsgNum: 61121
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 10:48:50AM -0500, Bruce Ashfield wrote:
> On Wed, Jan 7, 2015 at 5:07 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Tue, Jan 06, 2015 at 11:08:53AM +0000, Burton, Ross wrote:
> >> On 6 January 2015 at 08:57, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >>
> >> > 2) do_configure failing:
> >> >
> >> > ERROR: Function failed: do_configure (log file is located at
> >> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/m=
ako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/=
log.do_configure.17498)
> >> > ERROR: Logfile of failure stored in:
> >> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/m=
ako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/=
log.do_configure.17498
> >> > Log data follows:
> >> > | DEBUG: Executing python function sysroot_cleansstate
> >> > | DEBUG: Python function sysroot_cleansstate finished
> >> > | DEBUG: Executing shell function do_configure
> >> > | NOTE: make oldconfig
> >> > | make: *** No rule to make target `oldconfig'.  Stop.
> >> > | ERROR: oe_runmake failed
> >> > | WARNING: exit code 1 from a shell command.
> >> > | ERROR: Function failed: do_configure (log file is located at
> >> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/m=
ako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/=
log.do_configure.17498)
> >> > NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task
> >> > do_configure: Failed
> >> > ERROR: Task 491
> >> > (/home/jenkins/workspace/luneos-unstable/webos-ports/meta-smartphone=
/meta-lg/recipes-kernel/linux/
> >> > linux-lg-mako_git.bb, do_configure) failed with exit code '1'
> >> >
> >>
> >> I'll Me Too here, often hitting this on rebuilds:
> >>
> >> DEBUG: Executing shell function do_configure
> >> NOTE: make -C /data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel
> >> O=3D/data/poky-master/tmp/work/qemuarm64-poky-linux/linux-yocto/3.14.2=
4+gitAUTOINC+a227f20eff_902f34d361-r0/linux-qemuarm64-standard-build
> >> oldnoconfig
> >> make: Entering directory
> >> `/data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel'
> >> make: *** No rule to make target `oldnoconfig'.  Stop.
> >> make: Leaving directory
> >> `/data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel' ERROR: Task =
77
> >> (/home/ross/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.14.bb,
> >> do_configure) failed with exit code '1'
> >
> > last world build revealed new kind of error:
> >
> > both qemux86 and qemux86-64 failed like this
> >
> > ERROR: Function failed: do_kernel_configme (log file is located at /hom=
e/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/=
3.17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0/temp/log.do_kernel_configme.6974)
> > ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tm=
p-glibc/work/qemux86_64-oe-linux/linux-yocto/3.17.6+gitAUTOINC+b81030f9ec_5=
ff54d8fbf-r0/temp/log.do_kernel_configme.6974
> > Log data follows:
> > | DEBUG: Executing shell function do_kernel_configme
> > | NOTE: kernel configme
> > | [INFO] Configuring target/machine combo: "standard/qemux86-64"
> > | [INFO] collecting configs in .meta/meta-series
> > | ERROR: could not sanitize configuration fragments
> > |    errors are logged in /home/jenkins/oe/world/shr-core/tmp-glibc/sys=
roots/qemux86-64/usr/src/kernel/.meta/cfg/standard/common-pc-64/config.log
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_kernel_configme (log file is located at /h=
ome/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/3.17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0/temp/log.do_kernel_configme.69=
74)
> > NOTE: recipe linux-yocto-3.17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0: ta=
sk do_kernel_configme: Failed
>=20
> I spoke to soon before. Where can I find the config that triggered this ?=
 I just
> built the latest master and my fragments/patches were all properly applie=
d in
> the default build:

It's random, the same oe-core revision first built it fine, then it
failed, then it again built fine, see:
http://www.openembedded.org/wiki/Bitbake_World_Status
the successful build isn't there yet, but rebuilding from the same
sstate finished kernel fine

> -------------------------
>=20
> DEBUG: Executing shell function do_kernel_configme
> NOTE: kernel configme
> [INFO] Configuring target/machine combo: "standard/qemux86-64"
> [INFO] collecting configs in .meta/meta-series
> [INFO] Pre-processed cfg file qemux86-64-standard-config-3.17.6 created.
> [INFO] processing of raw cfg data completed.
>=20
> *************************************************************************=
*******
>   Configuration stored in
> /home/bruce/oe/build/tmp/work/qemux86_64-poky-linux/linux-yocto/3.17.6+gi=
tAUTOINC+b81030f9ec_5ff54d8fbf-r0/linux-qemux86_64-standard-build/.config
> *************************************************************************=
*******
>=20
>   To build with this kernel configuration, ensure a suitable toolchain
>   is in your path for x86_64, note its common command prefix, and do:
>=20
>    make O=3D/home/bruce/oe/build/tmp/work/qemux86_64-poky-linux/linux-yoc=
to/3.17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0/linux-qemux86_64-standard-bui=
ld
> ARCH=3Dx86_64 \
>         CROSS_COMPILE=3D<cross-compile-prefix>
>=20
> DEBUG: Shell function do_kernel_configme finished
>=20
> -------------------------
>=20
> Bruce
>=20
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlStVzwACgkQN1Ujt2V2gByYDgCeJAbPGkG0g20YDr/0na4jS2AC
8zsAoJ4dRiyk2Sj0zeHgU265NmDoVt+f
=ISuK
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
