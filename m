Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id D40EA65CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 21:35:33 +0000 (UTC)
Received: by pacti10 with SMTP id ti10so63311967pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 14:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=a9NUWDh5xk3dtN/kE1nBDdarKJWenhZSVctJMB5SPS4=;
	b=ryS+TrjyUmBauqQqlCHR+upz+CSyYyGyK7wKwtFNOi2N05od+vkLVn3EQ/PZr/L8ep
	4myWtMYkyUtGXIqAPtWOH5I3OeFywIlgPnuJ1WfzMNd0ZEMVFiNCFddShlJmyDQ9+bf/
	DoAtlirbk75DPNgojEQLRWxH5NWKNvAn5TqEpRk+COIrjEOW6dngstKaLvHI1DPEi8gO
	YW9cJEjQSt6H/oNoBqi2EvNEqDjw1XNa5JUw2BvfAnw9BZZ3V7WiakQaSrTLBn29yF2g
	ahqXq2Na2CdZwX4M4XORAl7uLp6UrOYXfEeAfep1131W5hihmrLM0FNvTzfvRNLRSu6w
	pNhg==
X-Received: by 10.68.68.198 with SMTP id y6mr60803915pbt.30.1440538533699;
	Tue, 25 Aug 2015 14:35:33 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:316a:3272:24e7:4679?
	([2601:646:8601:4580:316a:3272:24e7:4679])
	by smtp.gmail.com with ESMTPSA id
	ob15sm22179116pdb.52.2015.08.25.14.35.32
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Aug 2015 14:35:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440535600.12105.442.camel@linuxfoundation.org>
Date: Tue, 25 Aug 2015 14:35:27 -0700
Message-Id: <AF1C2A75-E58B-4A81-8728-65D0BA7EA137@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
	<9bf77291c7084cfdef86008d204932e7adb1067a.1440446290.git.raj.khem@gmail.com>
	<CAJTo0LZLhzWSo-vN79hKbOdZ-N7U+zD_wECtXCAGgN5y56=Y2A@mail.gmail.com>
	<F48F6534-0553-41E1-84C9-45181AA4FCDC@gmail.com>
	<1440535600.12105.442.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/17] python-distribute, python-setuptools: Migrate to good old python-setuptools
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
X-List-Received-Date: Tue, 25 Aug 2015 21:35:35 -0000
X-Groupsio-MsgNum: 70037
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F248C5B5-3A90-4821-AF60-2FF636040CB9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F248C5B5-3A90-4821-AF60-2FF636040CB9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 25, 2015, at 1:46 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
>>=20
>> I can not reproduce it. I did bitbake nativesdk-python-git
>> from scratch and all worked fine. I used qemux86 but I guess its
>> target independent problem. How do you reproduce it.
>=20
> "bitbake buildtools-tarball" seemed to reproduce issues, as did a
> "bitbake world -c fetch" on the autobuilder so I'd try those.
>=20

both targets worked fine. lib notify issue is already having a fix in =
flight. Are there any checks on it ignoring a recipe if its license did =
not comply ? since I see a warning in OE-Core build

WARNING: python-setuptools-native: No generic license file exists for: =
ZPL in any provider

I have fixed it. and pushed a patch here

=
https://github.com/kraj/openembedded-core/commit/8551755e9f968d4eee8ad58a4=
e33cc04e90db0a4

here are detailed logs

ubuntu@khem-dvm-001:~BUILDDIR/ > MACHINE=3Dqemuarm64 bitbake =
buildtools-tarball
Loading cache: 100% =
|#########################################################################=
##########################################################################=
##########################################################################=
##############| ETA:  00:00:00
Loaded 1306 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.27.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "aarch64-oe-linux"
MACHINE           =3D "qemuarm64"
DISTRO            =3D "nodistro"
DISTRO_VERSION    =3D "nodistro.0"
TUNE_FEATURES     =3D "aarch64"
TARGET_FPU        =3D ""
meta              =3D =
"kraj/master:ae43461eec8e0bbdc4699e99eeb58e3a562b6cd3"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: python-setuptools-native: No generic license file exists for: =
ZPL in any provider
NOTE: Tasks Summary: Attempted 1311 tasks of which 562 didn't need to be =
rerun and all succeeded.

Summary: There was 1 WARNING message shown.
ubuntu@khem-dvm-001:~BUILDDIR/ >
ubuntu@khem-dvm-001:~BUILDDIR/ >
ubuntu@khem-dvm-001:~BUILDDIR/ >
ubuntu@khem-dvm-001:~BUILDDIR/ > MACHINE=3Dqemuarm64 bitbake world -c =
fetch
Loading cache: 100% =
|#########################################################################=
##########################################################################=
##########################################################################=
##############| ETA:  00:00:00
Loaded 1306 entries from dependency cache.
Parsing recipes: 100% =
|#########################################################################=
##########################################################################=
##########################################################################=
############| Time: 00:00:00
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1305 targets, =
61 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.27.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "aarch64-oe-linux"
MACHINE           =3D "qemuarm64"
DISTRO            =3D "nodistro"
DISTRO_VERSION    =3D "nodistro.0"
TUNE_FEATURES     =3D "aarch64"
TARGET_FPU        =3D ""
meta              =3D =
"kraj/master:8551755e9f968d4eee8ad58a4e33cc04e90db0a4"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL =
http://www.apache.org/dist/subversion/subversion-1.8.13.tar.bz2, =
attempting MIRRORS if available
WARNING: Failed to fetch URL =
http://www.directfb.org/downloads/Extras/DirectFB-examples-1.7.0.tar.gz, =
attempting MIRRORS if available
WARNING: Failed to fetch URL =
http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-1.7.7.tar.gz,=
 attempting MIRRORS if available
WARNING: Failed to fetch URL =
http://ftp.gnome.org/pub/GNOME/sources/libnotify/0.6/libnotify-0.6.0.tar.x=
z;name=3Darchive, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
=
http://ftp.gnome.org/pub/GNOME/sources/libnotify/0.6/libnotify-0.6.0.tar.x=
z:
2015-08-25 21:25:26 ERROR 404: Not Found.

ERROR: Function failed: Fetcher failure for URL: =
'http://ftp.gnome.org/pub/GNOME/sources/libnotify/0.6/libnotify-0.6.0.tar.=
xz;name=3Darchive'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: =
/home/ubuntu/work/oe/build/tmp-glibc/work/aarch64-oe-linux/libnotify/0.6.0=
-r1/temp/log.do_fetch.30991
ERROR: Task 349 =
(/home/ubuntu/work/oe/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb, =
do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 475 tasks of which 133 didn't need to be =
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/ubuntu/work/oe/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb, =
do_fetch
Summary: There were 4 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.

--Apple-Mail=_F248C5B5-3A90-4821-AF60-2FF636040CB9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXc36MACgkQuwUzVZGdMxSxugCcCLE/YYsHknjnd6wYfeUab1cY
AvMAniDObxtnjDwslJzGJd95LN67zWse
=Bt/j
-----END PGP SIGNATURE-----

--Apple-Mail=_F248C5B5-3A90-4821-AF60-2FF636040CB9--
