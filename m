Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 42FE96E268;
	Mon, 16 Nov 2015 16:11:45 +0000 (UTC)
Received: by wmww144 with SMTP id w144so126171027wmw.0;
	Mon, 16 Nov 2015 08:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=obKDRFmN821FfOV61D9hG+2godHAPWMJUhyhxxlnlns=;
	b=mhm4nkCMEwVoGNF3eGOBcIW8PSWHa2+xYWrbN5NNeJLq/tPCVqUY2Wda9MDmqJ+hCV
	m6GSMgtnChYI4FtkCXkqlZVI9/yDHuPk7CP0d0myFDgHiQD2VGcEhAEa6TIWqL6/B+vT
	81SqJ3tVYzw+dhsXbEkdLYzvOQaO24qEROEmas7vo6uqSu4m77zvwqZLVIHMs2HEzn7E
	hID+jgeUPLZzLe0AckuXXVGiNPoaesyp2b3/ANikeFCbw5DE1ptchG5IuzyEOVTIBYIt
	M8brzOBq3gaqp8eANyHAZto9FXY4sNtqChYoj8t/kJEekbyaxh0K/UigImd1EK1PC6el
	tO8w==
X-Received: by 10.194.114.1 with SMTP id jc1mr12904422wjb.78.1447690305704;
	Mon, 16 Nov 2015 08:11:45 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	71sm19291786wmm.24.2015.11.16.08.11.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 08:11:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Nov 2015 16:11:59 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151116151159.GA2240@jama>
References: <20151112114311.GD2574@jama>
 <20151114095739.GD2564@jama>
MIME-Version: 1.0
In-Reply-To: <20151114095739.GD2564@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: State of bitbake world, test-dependencies 2015-11-12
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
X-List-Received-Date: Mon, 16 Nov 2015 16:11:46 -0000
X-Groupsio-MsgNum: 73500
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2015 at 10:57:39AM +0100, Martin Jansa wrote:
> On Thu, Nov 12, 2015 at 12:43:11PM +0100, Martin Jansa wrote:
> > Another incremental test, only 26 recipes were tested, but it found eno=
ugh
> > issues in just released Jethro.
> >=20
> > Complete log:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.2015111=
1_112937.log/
> >=20
> > ERROR: 42 issues were found in these recipes: cifs-utils clutter-gst-3.=
0 devicekit-power fbida gammu gst-plugins-good gstreamer1.0-plugins-bad gst=
reamer1.0-plugins-good imsettings libsdl2 pinpoint qt-mobility-embedded qt-=
mobility-x11 samba sox
> >=20
> > I'll send fix for pinpoint, gst* devicekit-power, fbida, gammu before r=
e-triggering the testing for qemuarm.
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151113_=
162451.log/
>=20
> I've added few more recipes to this test run, so the results look worse
> (because of many issues from efl-libunwind, I've already sent patch for
> this), but they are actually better.
>=20
> ERROR: 86 issues were found in these recipes: cifs-utils efl enjoy
> imsettings linux-yocto qt-mobility-embedded qt-mobility-x11 samba sox
> vlc

With the fixes I've sent in last few days we're almost clean again (at
least for the recipes I was testing in this run).

Only issue is samba->libpam and yocto-linux failing to build.

Complete log qemuarm:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151115_17=
4203.log/
Complete log qemux86:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151116_03=
4635.log/

qemuarm:
ERROR: 2 issues were found in these recipes: samba vlc
WARN: vlc: vlc rdepends on libvorbis, but it isn't a build dependency?
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?

I've fixes PATCHv2 for vlc, so qemux86 is even better:
ERROR: 4 issues were found in these recipes: cifs-utils linux-yocto linux-y=
octo-tiny-kexecboot samba
WARN: samba: samba rdepends on libpam, but it isn't a build dependency?

cifs-utils is there only because of linux-yocto

NOTE: Uploading the report /home/jenkins/oe/world/shr-core/tmp-glibc/log/er=
ror-report/error_report_20151116034725.txt to errors.yoctoproject.org:80
NOTE: Your entry can be found here: http://errors.yoctoproject.org:80/Error=
s/Build/9880/
NOTE: Build completion summary:
NOTE:   do_populate_sysroot: 99% sstate reuse (2268 setscene, 19 scratch)
NOTE:   do_package_qa: 99% sstate reuse (2066 setscene, 19 scratch)
NOTE:   do_package: 95% sstate reuse (402 setscene, 18 scratch)
NOTE:   do_packagedata: 99% sstate reuse (2066 setscene, 18 scratch)
NOTE:   do_package_write_ipk: 99% sstate reuse (2061 setscene, 19 scratch)
NOTE:   do_populate_lic: 99% sstate reuse (2327 setscene, 13 scratch)

Summary: 1 task failed:
  /home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/lin=
ux/linux-yocto_4.1.bb, do_compile
Summary: There were 7 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
=3D=3D=3D=3D=3D 2nd build to rebuild each recipe with every possible dep =
=3D=3D=3D=3D=3D
Logs will be stored in test-dependencies/1447645595/2_max directory
Building recipe: cifs-utils (1/13)
ERROR: Task 187 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/rec=
ipes-kernel/linux/linux-yocto_4.1.bb, do_compile) failed with exit code '1'
Building recipe: ctdb (2/13)
Building recipe: imsettings (3/13)
Building recipe: libldb (4/13)
Building recipe: libtdb (5/13)
Building recipe: libtevent (6/13)
Building recipe: linux-yocto (7/13)
Building recipe: qt-mobility-embedded (8/13)
Building recipe: qt-mobility-x11 (9/13)
Building recipe: samba (10/13)
Building recipe: sox (11/13)
Building recipe: talloc (12/13)
Building recipe: vlc (13/13)
Copying buildhistory/packages to test-dependencies/1447645595/2_max
Copying do_package logs to test-dependencies/1447645595/2_max/do_package/
=3D=3D=3D=3D=3D 3rd or 4th build to rebuild each recipe with minimal depend=
encies =3D=3D=3D=3D=3D
Logs will be stored in test-dependencies/1447645595/3_min directory
!!!Removing tmpdir "/home/jenkins/oe/world/shr-core/tmp-glibc"!!!
Building recipe: cifs-utils (1/14)
Building recipe: ctdb (2/14)
Building recipe: imsettings (3/14)
Building recipe: libldb (4/14)
Building recipe: libtdb (5/14)
Building recipe: libtevent (6/14)
Building recipe: linux-yocto (7/14)
Building recipe: linux-yocto-tiny-kexecboot (8/14)
ERROR: Task 221 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/rec=
ipes-kernel/linux/linux-yocto_4.1.bb, do_kernel_metadata) failed with exit =
code '1'
Building recipe: qt-mobility-embedded (9/14)
Building recipe: qt-mobility-x11 (10/14)
Building recipe: samba (11/14)
Building recipe: sox (12/14)
Building recipe: talloc (13/14)
Building recipe: vlc (14/14)

I'll merge pending meta-oe patches soon (tonight) into master as well as je=
thro branches.
Lets hope that pending oe-core patches get merged before next (2.1) release!

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZJ8j4ACgkQN1Ujt2V2gBw0sACglwZLPuZPhXf0v+UL/ZXppIJ/
lrUAnR8wV4wuZBoKJa7m/GK/0iL99zFB
=CM3P
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
