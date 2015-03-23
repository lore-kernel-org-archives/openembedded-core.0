Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C1D906AC33;
	Mon, 23 Mar 2015 22:21:00 +0000 (UTC)
Received: by wibdy8 with SMTP id dy8so59815847wib.0;
	Mon, 23 Mar 2015 15:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LYU5NSB8zEQztnbtMKJEqUtYEX45Ml8/py92u2wOFZw=;
	b=KmbKbhppjBGNCwRcEo9o6MiVYgXX+N/JFbL3x7SzsAQImOEwS4M6IZMvOUbvdO0VEH
	05YJkN4yrpxvxrrXH0Glv1D2Jj6x2OH9bXVOWTr7wfY7tggybkyukUeFwylFyFuttJwM
	yrzU0QiK7vrC7H0/fmhubhgth+I9xEtFMmb37obVKicq62O6VKwysg05yXe7CYdTG0K5
	Fn8U8eUaJEoGhA3RFet2xuRrVSL8FNdALfqnzD2Uq6GFophxnpgGibCwTOHn7OEixdDd
	eXnL3nqiUDXM4IK/504VKXG7nkh5PPv5xoFjFjWXQ/n4zIaB0PXD4sS39HNpKVQDQoSk
	xIGA==
X-Received: by 10.194.175.202 with SMTP id cc10mr2194446wjc.27.1427149261113; 
	Mon, 23 Mar 2015 15:21:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	md2sm13128639wic.19.2015.03.23.15.20.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2015 15:21:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Mar 2015 23:21:13 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150323222113.GD3904@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama>
MIME-Version: 1.0
In-Reply-To: <20150321145504.GG4738@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Mon, 23 Mar 2015 22:21:01 -0000
X-Groupsio-MsgNum: 63632
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline

--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2015 at 03:55:04PM +0100, Martin Jansa wrote:
> On Sat, Mar 21, 2015 at 09:29:07AM +0000, Richard Purdie wrote:
> > On Sat, 2015-03-21 at 03:11 +0100, Martin Jansa wrote:
> > > On Mon, Mar 16, 2015 at 05:42:36PM +0000, git@git.openembedded.org wr=
ote:
> > > > Module: openembedded-core.git
> > > > Branch: master
> > > > Commit: f0e3db4eaacc32423934ce09b91bc619dc5dbd21
> > > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3D=
commit;h=3Df0e3db4eaacc32423934ce09b91bc619dc5dbd21
> > > >=20
> > > > Author: Jonathan Liu <net147@gmail.com>
> > > > Date:   Mon Mar  9 12:13:56 2015 +1100
> > > >=20
> > > > fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
> > > >=20
> > > > Appending to PACKAGEFUNCS results in the font packages missing the
> > > > postinst/postrm scripts and the fontconfig cache not being generated
> > > > in /var/cache/fontconfig when creating images or installing font
> > > > packages. This is because the package data has already been emitted
> > > > by emit_pkgdata in PACKAGEFUNCS. Prepend to PACKAGEFUNCS to ensure
> > > > add_fontcache_postinsts is executed before emit_pkgdata.
> > >=20
> > > It's not caused by this change, but fixing this issue revealed that
> > > fc-cache doesn't really work here.
> > >=20
> > > Every time the intercept_scripts/update_font_cache executes qemu it g=
ets
> > > "stuck" eating a lot of cpu and memory until it dies. Is anyone alse
> > > seeing this behavior?
> > >=20
> > > WARNING: The postinstall intercept hook 'update_font_cache' failed (e=
xit code: 137)! See log for details!
> > > WARNING: The postinstalls for the following packages will be postpone=
d for first boot: liberation-fonts
> > > ERROR: The following packages could not be configured offline and roo=
tfs is read-only: ['liberation-fonts']
> > > ERROR: Function failed: do_rootfs
> > >=20
> > > bitbake  32618 98.8 67.1 11031512 10983420 pts/3 R+ 03:00   4:53
> > > qemu-i386 -r 2.6.32 -L /OE/rootfs -E uD_LIBRARY_PATH=3D/OE/rootfs//us=
r/lib:/OE/rootfs//lib /OE/rootfs/usr/bin/fc-cache --sysroot=3D/OE/rootfs
> >=20
> > There are a couple of bugs in the bugzilla around this. One seemed to be
> > related to circular symlinks in udev's ptest package which was
> > supposedly fixed. The other claims to have been resolved by upgrading
> > fontconfig to a version which doesn't have issues with circular paths.
> >=20
> > There is general confusion about how to reproduce the issue and what the
> > real problem is though.
> >=20
> > Does your system have any recursive directory structures?
>=20
> I've tried to build a bit smaller image after sending the report and in
> that do_rootfs it finished successfully. I'll try to re-execute this to
> see if I get consistent results.
>=20
> The bigger image has only few more packages in it, so if this is the
> case and smaller always works while bigger always fails I should be able
> to quickly find out which package/file is causing this.
>=20
> I'll check the circular symlinks, I know there are some ptest packages
> in the bigger one.

In my case it's reproducible by adding udev-ptest to image, more specifical=
ly
having these 2 directories in rootfs:
usr/lib/udev/ptest/test/sys/devices
usr/lib/udev/ptest/test/sys/bus

deleting them and re-triggering the qemu works.
I can also confirm that it's not just lack of memory on the build machine.
It triggers OOM killer after using 64GB as well as on machine with just 8GB.

fc-bug/rootfs-broken$ time ../../../../sysroots/x86_64-linux/usr/bin/qemu-i=
386 -r 2.6.32 -L . -E LD_LIBRARY_PATH=3Dusr/lib:lib usr/bin/fc-cache --sysr=
oot=3D.
=2E.. OOM killer in an hour or 2 ... (this time I didn't get a log, because=
 it killed almost everything else except qemu-i386 :)
fc-bug/rootfs-broken$ cd ..
fc-bug$ cp -ra rootfs-broken rootfs-broken-without-udev-ptest-bus-devices
fc-bug$ cd rootfs-broken-without-udev-ptest-bus-devices
fc-bug/rootfs-broken-without-udev-ptest-bus-devices$ rm -rf usr/lib/udev/pt=
est/test/sys/devices/ usr/lib/udev/ptest/test/sys/bus/
fc-bug/rootfs-broken-without-udev-ptest-bus-devices$ time ../../../../sysro=
ots/x86_64-linux/usr/bin/qemu-i386 -r 2.6.32 -L . -E LD_LIBRARY_PATH=3Dusr/=
lib:lib usr/bin/fc-cache --sysroot=3D.

real    0m30.424s
user    0m29.714s
sys     0m0.548s

Comparing strace shows the broken one to cycle a lot in directories like th=
is:
< getdents(51, /* 8 entries */, 32768)    =3D 248
< openat(AT_FDCWD, "//home/jenkins/anaconda/build-starfish-dizzy/build/BUIL=
D/work/qemux86-starfish-linux/fc-bug/rootfs-broken/./usr/lib/udev/ptest/tes=
t/sys/dev/block/8:1/subsystem/loop2/bdi/subsystem/0:16/subsystem/0:16/subsy=
stem/0:16/subsystem/0:16/subsystem/0:16/subsystem/0:16/subsystem/0:16/subsy=
stem/0:16/subsystem/0:16/subsystem/0:16/subsystem/0:16/subsystem/0:16/subsy=
stem/0:16/subsystem/0:16/subsystem/0:16/subsystem/0:16/subsystem/8:16/subsy=
stem/8:0/power", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) =3D 52

This issue forced me to finally set ulimit in my builds so that I can kill =
the
right process a bit sooner (instead of waiting for it to eat e.g. 128GB)

I'll try to create smaller reproducer and check newer fontconfig.

>=20
> Thanks
>=20
> > I'd like to get to the bottom of the issue and fix it once and for all
> > but we likely need more info.
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUQkdkACgkQN1Ujt2V2gBxiYwCgt3a1Zzt79BK2HvS49eT1HywD
I6AAoKWtMghoVPasUcDLx2yfB1rV1O1d
=DOX+
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
