Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TJi0j-0000hw-KY; Thu, 04 Oct 2012 11:46:29 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so189433wey.6
	for <multiple recipients>; Thu, 04 Oct 2012 02:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4OSsNvPeYaHWxIcObSUxEK/ePMCeK52SvGGkkegXsqU=;
	b=IVbDSCuczpErkAmjcmq5crGwCelBlflwy7k1l8Cnntipqpw1ooS98ReNQG1UAKb+u4
	ttN77/NLrZ5yfHm/i4zmGiqazJy6s04lzdzKONtGgbsUl2x2FNJmAIwoUOFByc/mLhXX
	x05sPuBjFZKF+IlBfhGd4hQzROMrK8S1JrFjSHKQb1HqYfTqaRHmdIkVOLr+Vd90oaeu
	sYjJxW/I0PpJtIbWSwpJmrBgaktVYZvzxvUmlbHe8oVFnVFxnHuQnS2nsTFX83ivx1vQ
	9kJ1gQ0sOChqCE1N2JMyW9eNMITGKi4ym3Y18vqSz3D6+JgdO3JQkFVcmKzjWordexvC
	Vo9Q==
Received: by 10.216.212.66 with SMTP id x44mr2779432weo.123.1349343208881;
	Thu, 04 Oct 2012 02:33:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dm3sm13631712wib.3.2012.10.04.02.33.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 02:33:27 -0700 (PDT)
Date: Thu, 4 Oct 2012 11:33:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121004093329.GD3005@jama.jama.net>
References: <20121002161853.6075610353@opal>
	<20121004091206.GC3005@jama.jama.net>
	<1349342915.18301.70.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1349342915.18301.70.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : bitbake.conf: Add chrpath-native to ASSUME_PROVIDED
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 09:46:29 -0000
X-Groupsio-MsgNum: 30359
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Content-Disposition: inline

--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 04, 2012 at 10:28:35AM +0100, Richard Purdie wrote:
> On Thu, 2012-10-04 at 11:12 +0200, Martin Jansa wrote:
> > On Tue, Oct 02, 2012 at 04:18:50PM +0000, git@git.openembedded.org wrot=
e:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: 97a3ea712003e8d48dc68c282e656591f39d2d1a
> > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D97a3ea712003e8d48dc68c282e656591f39d2d1a
> > >=20
> > > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Date:   Tue Oct  2 14:12:21 2012 +0100
> > >=20
> > > bitbake.conf: Add chrpath-native to ASSUME_PROVIDED
> > >=20
> > > We assume chrpath is provided natively so it should be listed in ASSU=
ME_PROVIDED.
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > This breaks do_install in gpsd:
> >=20
> > | arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mthumb-interwork -mfloat-a=
bi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/var/lib/jenkins/jo=
bs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/nokia900 -o gpsd --sysro=
ot=3D/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/=
nokia900 -pthread -Wl,-rpath=3D/var/lib/jenkins/jobs/shr-core/workspace/shr=
-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/gpsd-3.7=
 -Wl,-rpath=3D/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/=
work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/lib gpsd.o ntps=
hm.o shmexport.o dbusexport.o sd_socket.o -L. -L/var/lib/jenkins/jobs/shr-c=
ore/workspace/shr-core/tmp-eglibc/sysroots/nokia900/var/lib/jenkins/jobs/sh=
r-core/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/=
gpsd-3.7-r9/image/usr/lib -L/var/lib/jenkins/jobs/shr-core/workspace/shr-co=
re/tmp-eglibc/sysroots/nokia900/lib -lrt -lcap -lbluetooth -lgpsd -lusb-1.0=
 -lbluetooth -lgps -lm -lcap
> > | Install file: "gpsd" as "/var/lib/jenkins/jobs/shr-core/workspace/shr=
-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/us=
r/sbin/gpsd"
> > | chrpath -d "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-egl=
ibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd"
> > | `/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/ar=
mv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd' probably is=
n't a 64-bit LSB-first ELF file.
> > | elf_open: Exec format error
> > | scons: *** [/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-egl=
ibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-3.7-r9/image/usr/sbin/gpsd] =
Error 1
> > | scons: building terminated because of errors.
> > | ERROR: scons install execution failed.
> > | ERROR: Function failed: do_install (see /var/lib/jenkins/jobs/shr-cor=
e/workspace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gpsd-=
3.7-r9/temp/log.do_install.8833 for further information)
> > NOTE: recipe gpsd-3.7-r9: task do_install: Failed
> >=20
> > I guess I can add chrpath-replacement-native to DEPENDS, but do you hav=
e any=20
> > idea why chrpath in Ubuntu 14.04.1 does not support arm binaries?
> > $ chrpath --version
> > chrpath version 0.13
>=20
> Er, chrpath should only get used on native/nativesdk/crosssdk/cross
> binaries. Its not expected to work on target binaries and we should
> never be running this there.
>=20
> Is this error coming from something we're putting in do_install or is it
> from gpsd's makefile?
>=20
> I think this might be a problem in the Makefile and not from OE itself.

It's used from gpsd's SConstruct.

I can remove it there, but that results in=20
  WARNING: QA Issue: libgps:
  /work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/usr/=
lib/libgps.so.20.0
  contains probably-redundant RPATH /usr/lib
or
  WARNING: QA Issue: package libgps contains bad RPATH
  /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/ima=
ge/usr/lib
  in file
  /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/pac=
kages-split/libgps/usr/lib/libgps.so.20.0

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBtV+kACgkQN1Ujt2V2gBxZ1wCdGOdAb06SjERwnE5m8O0ueWbS
qWoAn0z6M83OX6EgkjAoQTKxF8CgczMF
=jTzo
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
