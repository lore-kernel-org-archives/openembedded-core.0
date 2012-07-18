Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrIfu-00073F-0w
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 03:03:35 +0200
Received: by wgbdr1 with SMTP id dr1so806883wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 17:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7CvXl1psddVdn9L0dxdc4pnlFAB0P8gLUwq/ndcuMbg=;
	b=rmShX2VCZFNM51z0nkMHOkb7LpBkBC2QFj+ZfSR+d+xisFXtgPcBZcSRie6NbRjzuO
	OUiU5NXFv44+zzGbhCTzDk7UkGx9W0qhpbFAVN4Fdd6ClZtrplEhIkbRjXN0SoqDjvML
	8A4KtM6++PITr6qV2pjvGl+9kG0GCZFqWE3X8Lv50hFkXjJS9cszX3nEOSmniU9506Kx
	ZqCifIrPHzszm5JsBM9bU2cnUGuZyuDV2KbWVYCkdG7znfwOclmxZYXyRrptVVp8S8SI
	sPhP7JFH8s2+XF2Sxqy+VhZ/PTaTpFgqC0qvv9tLNhq3bAiURqmg1Yo3Z7bqP0HKUZxu
	3jRA==
Received: by 10.216.236.24 with SMTP id v24mr524782weq.18.1342572734072;
	Tue, 17 Jul 2012 17:52:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id de10sm63045wib.7.2012.07.17.17.52.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 17:52:12 -0700 (PDT)
Date: Wed, 18 Jul 2012 02:52:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120718005221.GG22569@jama.jama.net>
References: <5005DFF1.3050304@linux.intel.com>
	<500602C8.6090805@linux.intel.com>
	<20120718003850.GF22569@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120718003850.GF22569@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"yocto-builds@yoctoproject.org" <yocto-builds@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Glib-2.0 cross-compile issue Was: Master Failures
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
X-List-Received-Date: Wed, 18 Jul 2012 01:03:35 -0000
X-Groupsio-MsgNum: 25577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jaoouwwPWoQSJZYp"
Content-Disposition: inline

--jaoouwwPWoQSJZYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 02:38:50AM +0200, Martin Jansa wrote:
> On Tue, Jul 17, 2012 at 05:26:48PM -0700, Saul Wold wrote:
> > On 07/17/2012 02:58 PM, Saul Wold wrote:
> > >
> > > Folks,
> > >
> > > I am seeing a crop of failures on Master, this is not any failure I h=
ave
> > > seen recently on any of my MUT builds. It appears to be 2 failures,
> > > possibly related.
> >=20
> > Not related, I just confirmed this.
> >=20
> > The "ls: cannot access" are coming from license.bbclass, seems to be a=
=20
> > timing issue related to the last patch here, not sure what triggered it=
=20
> > here (I am not seeing it on other builds!)
> >=20
> > Paul's Change:
> >=20
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgw%2Fst=
age&qt=3Dgrep&q=3Dlicense
> >=20
> > >
> > > First seems to be missing pkgdata/runtime files, followed by a failed
> > > dependency by libglib-2.0-utils on the native python (from the native
> > > sysroot).
> > >
> > This seems to be related to the glib update and package split out of th=
e=20
> > gdbus-codegen, looks like an auto tools substitution is happening for=
=20
> > @PYTHON@ in the script and getting the native sysroot python.
>=20
> gdbus-codegen was in separate package before I've just moved package
> definition from .bb to .inc.
>=20
> And buildhistory diff doesn't show anything weird:
> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D0=
0de88a123842b159de1d206e3d0d5775ed90a1e#patch2
>=20
> I don't see it here, but I'm not using RPM packaging with this check..
>=20
> Will try more tomorrow..

It's probably caused by this
http://permalink.gmane.org/gmane.comp.gnome.svn/604029

which isn't very cross-compile friendly.. maybe we can just add patch
reverting this change in 2.32.4?

Cheers,

>=20
> Cheers,
>=20
> >=20
> > Martin's 2 changes may need so work:
> >=20
> > http://git.openembedded.org/openembedded-core/commit/?id=3D85a930188300=
152bc9a1bbf640a2441f3177e26f
> >=20
> > and
> > http://git.openembedded.org/openembedded-core/commit/?id=3Db070eb22372a=
d1ef5b21162d832772e560184cf8
> >=20
> > Please look at the autobuild failures and see if they can help you fix=
=20
> > these issues.
> >=20
> > Thanks
> > 	Sau!
> >=20
> > > I am just starting to dig into it, but if anyone has better ideas:
> > >
> > > Thanks
> > >      Sau!
> > >
> > >
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/dbus-1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/kernel-3.4.4-yocto-standard:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libacl1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libaio1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libapm1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libasound2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libassuan0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libatk-1.0-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libatk-1.0-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libattr1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libaugeas0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libavahi-client3:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libavahi-common3:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libavahi-core7:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libavahi-glib1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libavahi-gobject0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libblkid-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libblkid1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-chrono-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-chrono-test:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-chrono1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-date-time1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-filesystem1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-graph1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-iostreams1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-program-options1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-regex1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-signals1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-system1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libboost-thread1.50.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libbz2-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libc6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libc6-dbg:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libc6-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcairo-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcairo-gobject2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcairo-perf-utils:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcairo-script-interpreter2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcairo2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcap2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcheck0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcidn1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libclutter-glx-1.0-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libclutter-glx-1.0-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcom-err2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcrypto1.0.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libcurl5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libdaemon0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libdbus-1-3:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libdbus-glib-1-2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libdbus-glib-1-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libdmx1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libdrm2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libe2p2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libebook-1.2-9:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libecal-1.2-7:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libedata-book-1.2-2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libedata-cal-1.2-7:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libedataserver-1.2-13:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libexpat-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libexpat1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libext2fs2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libfakekey0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libffi5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libflac++6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libflac8:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libfontconfig-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libfontconfig1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libfontenc1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libform5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libformw5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libfreetype-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libfreetype6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgcc-s-dbg:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgcc-s-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgcc1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgcrypt11:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgdbm-compat4:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgdbm-dbg:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgdbm-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgdbm4:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgl1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libglade-2.0-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libglew-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libglew1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libglib-2.0-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libglib-2.0-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libglu1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgmp-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgmp10:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgmpxx4:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgnome-keyring0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgnutls-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgnutls-extra26:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgnutls-openssl27:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgnutls26:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgnutlsxx27:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgpg-error0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstapp-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstaudio-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstcdda-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstfft-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstinterfaces-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstnetbuffer-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstpbutils-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstriff-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstrtp-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstrtsp-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstsdp-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgsttag-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgstvideo-0.10-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libgtk-2.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libice6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libicudata36:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libicui18n36:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libicuio36:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libicule36:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libiculx36:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libicutu36:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libicuuc36:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libjpeg-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libjpeg8:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libjson-glib-1.0-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libjson-glib-1.0-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libjson0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libkmod2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libkms1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libksba8:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libltdl7:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/liblzma5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/liblzo2-2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/liblzo2-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libmb-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libmb1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libmenu-cache-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libmenu-cache1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libmenu5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libmenuw5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libmpc2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libmpfr-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libmpfr4:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libncurses5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libncursesw5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libnewt0.52:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libnfsidmap0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libnl-cli2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libnl-genl2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libnl-nf2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libnl-route2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libnl2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libogg0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libossp-uuid-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libossp-uuid16:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libowl-av0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libowl0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpanel5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpanelw5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpcap1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpci3:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpciaccess0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpcrecpp0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpcreposix0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libperl5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libphonon-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libphonon4:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpixman-1-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpixman-1-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpng12-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpng3:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpopt-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpopt0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpth-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpth20:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpulse-mainloop-glib0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpulse-simple0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpulse0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpyglib-2.0-python0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libpython2.7-1.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqt3support-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtclucene-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtcore-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtdbus-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtdeclarative-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtdesigner-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtdesignercomponents-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtgui-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqthelp-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtmultimedia-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtnetwork-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtopengl-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtscript-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtscripttools-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtsql-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtsvg-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqttest-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtwebkit-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtxml-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libqtxmlpatterns-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libreadline-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libreadline6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/librsvg-2-2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/librsvg-2-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libsdl-1.2-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libsdl-1.2-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libsm6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libsndfile-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libsqlite3-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libss2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libssl1.0.0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libstartup-notification-1-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libstartup-notification-1-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libstdc++6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libsysfs2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libtasn1-3:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libthread-db1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libtic5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libticw5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libtiff-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libtiff5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libtinfo5:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libts-1.0-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libts-1.0-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libudev0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libunique-1.0-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libunique-1.0-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libusb-0.1-4:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libusb-0.1-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libusb-1.0-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libusb-1.0-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libuuid-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libuuid1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libvorbisidec-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libvorbisidec1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libvte9:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libwrap0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libx11-6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libx11-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libx11-xcb1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxau6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcalibrate0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-composite0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-damage0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-dpms0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-dri2-0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-glx0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-randr0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-record0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-render0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-res0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-screensaver0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-shape0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-shm0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-sync0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-util-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-util1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-xevie0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-xf86dri0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-xfixes0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-xinerama0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-xprint0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-xtest0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-xv0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb-xvmc0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcb1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcomposite1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxcursor1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxdamage1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxdmcp6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxext6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxfixes3:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxfont1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxfontcache1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxft2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxi6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxinerama1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxkbfile1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxmu6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxmuu1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxp6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxrandr2:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxrender1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxres1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxsettings-client0:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxt6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxtst6:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxv1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxxf86dga1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxxf86misc1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libxxf86vm1:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libz-dbg:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libz-dev:
> > >> No such file or directory
> > >> | ls: cannot access
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/pkgdata/*/runtime/libz1:
> > >> No such file or directory
> > >> | log_check: Using
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-sdk-1.0-r0/temp/l=
og.do_rootfs.26943
> > >> as logfile
> > >> | log_check: There were error messages in the logfile
> > >> | log_check: Matched keyword: [Fail]
> > >> |
> > >> | Processing task-core-apps-console-dev...
> > >> | Processing task-core-qt-demos-dev...
> > >> | Processing task-core-console-dev...
> > >> | Note: Unable to find package task-core-console-dev
> > >> (task-core-console-dev) -- PACKAGE_INSTALL_ATTEMPTONLY
> > >> | Processing task-core-apps-x11-pimlico-dev...
> > >> | error: Failed dependencies:
> > >> |
> > >> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/=
build/tmp/sysroots/x86_64-linux/usr/bin/python
> > >> is needed by libglib-2.0-utils-2.32.4-r1.armv5te
> > >> | Processing rpm-dev...
> > >> | Processing kernel-dev-dev...
> > >> | Note: Unable to find package kernel-dev-dev (kernel-dev-dev) --
> > >> PACKAGE_INSTALL_ATTEMPTONLY
> > >> | Processing task-core-tools-debug-dev...
> > >> |
> > >
> > >
> > >
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jaoouwwPWoQSJZYp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAGCMUACgkQN1Ujt2V2gByNdACfXGFZpNeLR8UKd2lS8Cb+M465
oZgAn2KmGwF63F7ld7cCSuuBvmgS8ssF
=8GUv
-----END PGP SIGNATURE-----

--jaoouwwPWoQSJZYp--
