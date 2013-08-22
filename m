Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 130196B90C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:39:15 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so2175379pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=YmKaxFkm76x9T6dj96i3v68NdBOUIVRPC19hIeCYfoA=;
	b=xZFyKm38LEp9ss3Evjn5lI7DE2F4XxFaKg9BcaZf72ShgamzK2DEX30wuWNbAepF38
	13hto/PH3xbO9pPSdPgjKScSixwnwT8StdrJq39msfAOQCgGjpRK0xIqnMatQM/0XoFq
	zZKDekHp3UAKqCp+WfbBDww+Curx84XfLkgmb9YTgNWFawpwjOqdMTBJPZgpDc5R0pWl
	gNigrRnJecFv60QU4/au8Jk999OWB5s0qko33dCpw0+tz+rzPCGES6UrjVMwgLnW++Hr
	ogcUvdm1/25ayPowz7rMbKb3XJuRRVW06YD/FCg3A3yWfTCzTlLX7P74Z45+JP7U+Rcs
	lWAQ==
X-Received: by 10.66.182.229 with SMTP id eh5mr6682788pac.139.1377193155830;
	Thu, 22 Aug 2013 10:39:15 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id 7sm18033372paf.22.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 10:39:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6560539.TdGG90GaLI@helios>
Date: Thu, 22 Aug 2013 10:39:14 -0700
Message-Id: <D9424990-4FA8-49FA-A180-DA7B259D8541@gmail.com>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<6560539.TdGG90GaLI@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 17:39:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 22, 2013, at 2:07 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Wednesday 21 August 2013 22:58:55 Saul Wold wrote:
>> Paul, Ross:
>>=20
>> Please review this set.
>>=20
>> It has a number of large changes that I want more EYES on!
>>=20
>> Particularly, the python3 patch set, which I may remove before
>> this is final due to the world build issue.
>>=20
>> There is also a few patches on poky from Beth and myself which
>> need a look at and ACK
>> The following changes since commit =
d98f08a7ad95d0b17846276b028a6614f16b6846:
>>=20
>>  genext2fs: fix memory corruption on powerpc (2013-08-20 07:11:44 =
-0700)
>>=20
>> are available in the git repository at:
>>=20
>>  git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>=20
>> =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Ds=
gw/
>> stage
>>=20
>> Cristian Iorga (4):
>>  packagegroup-self-hosted: pcmanfm integration
>>  builder: register directories with pcmanfm
>>  build-appliance-image: changing the icon theme to sato
>>  default-providers: Set the preferred provider for bluez
>=20
> I thought we were going to fix the libasound-module-bluez multiple =
provider=20
> issue by renaming the package?
>=20
>> Jonathan Liu (3):
>>  xf86-video-intel: remove duplicate xf86driproto from DEPENDS
>>  xf86-video-vesa: remove duplicate xf86driproto from DEPENDS
>>  mesa: enable additional drivers for gallium-llvm x86/x86-64
>>=20
>> Kai Kang (3):
>>  bc: fix segmentation fault
>>  libx11: upgrade to 1.6.1
>>  libx11-diet: upgrade to 1.6.1
>=20
> "Deleted keysymdef_include patch" - why? Presumably because it was =
merged=20
> upstream, but that needs to be stated.
>=20
>> Khem Raj (27):
>>  generate-manifest-3.3.py: Add script to generate python 3.3 =
manifests
>>  python-3.3-manifest: Add python3 manifest file
>>  python3native.bbclass: Add python3 abstraction class
>>  package_rpm.bbclass:Make the regexp less greedy
>>  classes/distutils: Introduce PYTHON_PN
>>  classes: Add distutils for python3
>=20
> I hadn't noticed earlier, but this set of changes introduces a =
shedload more=20
> bbclasses. Are these really all necessary?

If you look at it the classes are to let python3 live along and share =
the common code with python2

>=20
>>  setuptools.bbclass: Use python-distribute instead of =
python-setuptools
>>  distutils3.bbclass: Port the distutils class fix to handle filenames
>>    with spaces
>>  setuptools3.bbclass: Remove useless multiline comment
>=20
> These incremental changes to files added in earlier commits need to be =
squashed=20
> into those commits.

I have kept them for history, except the last one other two are =
worthwhile to have separate
commits

>=20
>>  distutils: Introduce PYTHON_ABI variable
>>  distutils3: Do build_ext as separate step during compile
>>  python3: Add recipes
>>  python3: Add native recipe
>>  python_2.7.3.bb: Inherit python-dir
>>  python3-nose: Testing tools for python
>>  zeromq: Add recipe
>>  pyzmq: Add recipes using python3
>=20
> There's inadequate justification given in the commit messages for why =
these=20
> last two need to be added; I already mentioned this in earlier =
feedback on=20
> these changes. What's more, the second commit makes a tweak to the =
commit=20
> before which should be squashed into there instead.

*mq and *nose are needed for ipython, which is a powerful tool commonly =
used but
on a second thought actually I will drop ipython
from OE-Core and put it in some other layer like meta-oe and if there =
are enough
users who then want it, we can make a case of moving it into OE-Core

>=20
>>  ipython: Add recipes for ipython2 and ipython3
>=20
> Again, the commit message needs to mention why we need these.
>=20


see above.


>>  python-distribute: Add recipes for python2 and python3
>>  python3: Upgrade to 3.3.2
>>  distutils3.bbclass: Fix typo and use proper values for target =
sysroot
>>  python3, python3-native: Consider OE staging installation
>>  python3: Fix host include contamination issue
>>  distutils3.bbclass: Use MACHINE for sysroot when not building for
>>    build host
>>  python3: Fix the compiler invocation and linker flags when cross
>>    compiling
>>  python: Add Patch description and status information
>>  eglibc: Update SRC_URI and fix unpackaged empty dir
>=20
> I appreciate the work and testing that has gone into this set of =
changes but=20
> it still needs further cleaning up as discussed above IMO.
>=20
>> Lauren Post (2):
>>  directfb: Upgrade to 1.6.3
>>  directfb: add fusion patch for hangs on exit with
>=20
> The commit messages seem a little bit malformed on these two.
>=20
>> Mark Hatle (11):
>>  image.bbclass: Add basic support for PACKAGE_EXCLUDE
>>  python-smartpm: Add support for excluding package from the install
>>  package_rpm.bbclass:  Add support for PACKAGE_EXCLUDE to RPM =
installs
>>  python-smartpm: Add support to disable installing recommends
>>  package_rpm.bbclass: NO_RECOMMENDATIONS support
>>  package_deb.bbclass: Use the WORKDIR not SYSROOT for temp files
>>  package_deb: Add support for NO_RECOMMENDATIONS and PACKAGE_EXCLUDE
>>  opkg: Add --no-install-recommends option.
>>  package_ipk: Add support for NO_RECOMMENDATIONS
>>  opkg: Add support for excluding packages from the install
>>  package_ipk: Add support for PACKAGE_EXCLUDE
>=20
> As mentioned earlier I'm still unhappy with not persisting these into =
the=20
> rootfs if package-management is enabled, but I'll try to address that =
myself=20
> in a follow-up.
>=20
>> Marko Lindqvist (3):
>>  texinfo: correct dont-depend-on-help2man.patch
>>  SDL2: add recipe
>>  boost: fix build when PARALLEL_MAKE is not set
>>=20
>> Otavio Salvador (1):
>>  distro_features_check.bbclass: Allow checking of =
required/conflicting
>>    features
>=20
> I should have asked this earlier - why does this need to be a separate=20=

> bbclass? The code doesn't do anything if the variables aren't set, so =
it can't=20
> be because it could have an impact on existing setups that don't set =
them.
>=20
>> Paul Eggleton (1):
>>  gst-plugins-good: fix orc enabling via PACKAGECONFIG
>>=20
>> Roy.Li (1):
>>  shadow: backport a patch to make newgrp work
>=20
> The commit message should really have some detail in it for a change =
like=20
> this.
>=20
>> Saul Wold (4):
>>  Add Upstream-Status tags to patches
>>  libsdl: Backport xData32 patch for x11 update
>>  valgrind: Backport patch for eglibc 2.18
>>  gnupg: Update to 2.0.21
>>=20
>> Tyler Hall (1):
>>  cpan-base: Don't use immediate expansion
>=20
> I assume there's no appreciable impact on build performance with this =
change?
>=20
>> Yevhen Kyriukha (1):
>>  connman: fix systemd support for connman-* packages.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


