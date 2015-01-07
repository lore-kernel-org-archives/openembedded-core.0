Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6500D728AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:07:33 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so859547wgh.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 02:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IpDRoZqcbjX94Jg++iOk2s0LkS/DuTqynZvwwzXYUgY=;
	b=TOT35MtKAnHpBVK5S6Bd90iZFAv1tXB5l82qC64qo9ebK0Snk74wJJjLlTuT4ehSYk
	Wa5C9DH8ajdKFVLuFTgugusj9f/2BLilqxgP3b3Nvmzq8w2XXr45VrJX5jDXU9Xx/IEy
	GxzuWElj7mcR3/IKz/TdN+F3ZimslmGMaKmkWP1fvDqvB/wpZ7CS2kvv7Q4nGL+CfwJM
	jx1LlLt+SW9S3ic1RGCzKhSlwQOmUpMXW9mZjAftmT6zaKA4f4uwRVguQEXehROWU7GQ
	nbSlNMXrNVEOyoUbQ1RXXCMY8f5KJJ/Mtb+JjCwG4rob+NyXHs687w3Msd1tMWfJ+7d3
	Hlqw==
X-Received: by 10.180.76.239 with SMTP id n15mr46782954wiw.66.1420625253227;
	Wed, 07 Jan 2015 02:07:33 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cg8sm1534750wjc.1.2015.01.07.02.07.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 02:07:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 11:07:35 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150107100735.GF29986@jama>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
	<54AB8B59.7080702@topic.nl> <20150106085731.GC19402@jama>
	<CAJTo0LaW2JLjqHCDEMggAb2QLM+Ns14qQWGq=BG5jLFu4HVRow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaW2JLjqHCDEMggAb2QLM+Ns14qQWGq=BG5jLFu4HVRow@mail.gmail.com>
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
X-List-Received-Date: Wed, 07 Jan 2015 10:07:39 -0000
X-Groupsio-MsgNum: 61092
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline

--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 11:08:53AM +0000, Burton, Ross wrote:
> On 6 January 2015 at 08:57, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > 2) do_configure failing:
> >
> > ERROR: Function failed: do_configure (log file is located at
> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako=
-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log=
=2Edo_configure.17498)
> > ERROR: Logfile of failure stored in:
> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako=
-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log=
=2Edo_configure.17498
> > Log data follows:
> > | DEBUG: Executing python function sysroot_cleansstate
> > | DEBUG: Python function sysroot_cleansstate finished
> > | DEBUG: Executing shell function do_configure
> > | NOTE: make oldconfig
> > | make: *** No rule to make target `oldconfig'.  Stop.
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_configure (log file is located at
> > /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako=
-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log=
=2Edo_configure.17498)
> > NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task
> > do_configure: Failed
> > ERROR: Task 491
> > (/home/jenkins/workspace/luneos-unstable/webos-ports/meta-smartphone/me=
ta-lg/recipes-kernel/linux/
> > linux-lg-mako_git.bb, do_configure) failed with exit code '1'
> >
>=20
> I'll Me Too here, often hitting this on rebuilds:
>=20
> DEBUG: Executing shell function do_configure
> NOTE: make -C /data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel
> O=3D/data/poky-master/tmp/work/qemuarm64-poky-linux/linux-yocto/3.14.24+g=
itAUTOINC+a227f20eff_902f34d361-r0/linux-qemuarm64-standard-build
> oldnoconfig
> make: Entering directory
> `/data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel'
> make: *** No rule to make target `oldnoconfig'.  Stop.
> make: Leaving directory
> `/data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel' ERROR: Task 77
> (/home/ross/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.14.bb,
> do_configure) failed with exit code '1'

last world build revealed new kind of error:

both qemux86 and qemux86-64 failed like this

ERROR: Function failed: do_kernel_configme (log file is located at /home/je=
nkins/oe/world/shr-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/3.17=
=2E6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0/temp/log.do_kernel_configme.6974)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/qemux86_64-oe-linux/linux-yocto/3.17.6+gitAUTOINC+b81030f9ec_5ff54=
d8fbf-r0/temp/log.do_kernel_configme.6974
Log data follows:
| DEBUG: Executing shell function do_kernel_configme
| NOTE: kernel configme
| [INFO] Configuring target/machine combo: "standard/qemux86-64"
| [INFO] collecting configs in .meta/meta-series
| ERROR: could not sanitize configuration fragments
|    errors are logged in /home/jenkins/oe/world/shr-core/tmp-glibc/sysroot=
s/qemux86-64/usr/src/kernel/.meta/cfg/standard/common-pc-64/config.log
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_kernel_configme (log file is located at /home/=
jenkins/oe/world/shr-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/3.=
17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0/temp/log.do_kernel_configme.6974)
NOTE: recipe linux-yocto-3.17.6+gitAUTOINC+b81030f9ec_5ff54d8fbf-r0: task d=
o_kernel_configme: Failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlStBWcACgkQN1Ujt2V2gBykQQCbBNgeYqq5ouBI2Gc0dN+j5qX5
xTYAmwWGRmMi1p0BBY50cn/iongnHdPU
=oA0E
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--
