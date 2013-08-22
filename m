Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDD56B5D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 18:03:32 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id wz12so2116856pbc.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ivH7E5MnG7/9bQt4PUaAtJ9mA/9Qv/QL1d7pgUL8sbI=;
	b=T+mCoMey6gQqvquCbWanJrHFm6zmMxC3wnW0uWs1MPh6jMEBY7BoarEb9QwDcmsYbF
	RE+a8OwpUem0NYkhWxn+n7Wqx2Kzohy504K4suMANDUKUNv4f20SF9sMnynxfETgLXrg
	ogk7DyJzSkcbGRg6VPhhzEkKz8RUk59Nwvl9sPQB/Hj4+DhJbFgrMRxwgP3Hkqv8zLh2
	7wCkt0nN1hiBC1wOS99GYKRvaVid+hevbjlzb3jXrWjLfaXv1fa5V7PqYN4eYBVZOTzs
	gMVGHopqlpj4btrivg0pT2ZakaVV+qy2iNLuFHerAUzMBWpjdVo8O4aXjXAyBphjzsBi
	YqwA==
X-Received: by 10.66.161.229 with SMTP id xv5mr6897722pab.87.1377194612948;
	Thu, 22 Aug 2013 11:03:32 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ta10sm18171906pab.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 11:03:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6560539.TdGG90GaLI@helios>
Date: Thu, 22 Aug 2013 11:03:31 -0700
Message-Id: <4185DC87-EF1F-4B49-85CF-FA13C50C78DE@gmail.com>
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
X-List-Received-Date: Thu, 22 Aug 2013 18:03:32 -0000
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
>=20
>>  ipython: Add recipes for ipython2 and ipython3
>=20
> Again, the commit message needs to mention why we need these.
>=20
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



Paul and All

I have rehashed the pull tree. =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/python=
3
Squashed the commits
Removed ipython and its deps

Take a look again and let me know if you have more comments.



