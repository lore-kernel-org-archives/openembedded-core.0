Received: from gate.crashing.org ([63.228.1.57])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkAYB-0000en-Kb
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:53:36 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6M7nKs8019355;
	Fri, 22 Jul 2011 02:49:21 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311280985.2344.82.camel@rex>
Date: Fri, 22 Jul 2011 02:49:19 -0500
Message-Id: <BD5C61B9-8EC9-4C55-AE35-71D9B022F532@kernel.crashing.org>
References: <cover.1311234475.git.sgw@linux.intel.com>
	<1311280985.2344.82.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/20] July 21, 2011
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
X-List-Received-Date: Fri, 22 Jul 2011 07:53:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 21, 2011, at 3:43 PM, Richard Purdie wrote:

> On Thu, 2011-07-21 at 00:52 -0700, Saul Wold wrote:
>> Review and tested, the inherit perlnatives are needed.
>>=20
>> The following changes since commit =
0d03800caffc2341b74190d38f7a372223c89f4c:
>>=20
>>  lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib =
(2011-07-20 15:43:43 +0100)
>>=20
>> are available in the git repository at:
>>  git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Ds=
gw/stage
>>=20
>> Martin Jansa (9):
>>  tcmode-default: set preferred version also for (e)glibc-locale
>>  eglibc-package: don't fail without localedef/gconv
>>  python: save Makefile.sysroot in do_compile
>>  python: add patch to fix cross compilation on host with linux-3.0
>>  polkit: inherit perlnative
>>  shared-mime-info: inherit perlnative
>>  xkeyboard-config: inherit perlnative
>>  avahi: inherit perlnative
>>  vte: inherit perlnative
>>=20
>> Matthew McClintock (2):
>>  Add endianess macros used by previous endian-ness_handling.patch
>>  Make intltool use perlnative instead of perl on host
>>=20
>> Saul Wold (2):
>>  clutter-box2d: fix isfinite.patch
>>  gettext: Add depends to gettext to avoid host contamination
>>=20
>> Tom Rini (7):
>>  python-native: Mangle scripts to use /usr/bin/env python, bump PR
>>  gnome-doc-utils: Use /usr/bin/env python in xml2po, bump PR
>>  perl-native: Add a perl-native wrapper in the normal bindir
>>  cpan.bbclass: Perform more mangling for perl path
>>  icon-naming-utils-native: Fix long path to perl in icon-name-mapping
>>  siteinfo.bbclass: Port over oe.dev logic for site files
>>  local.conf.sample: Add a note about ASSUME_PROVIDED for help2man
>=20
> Thanks Saul, I merged this minus the perlnative pieces since I think =
we
> might be able to solve this in a better way and we should at least
> discuss that.
>=20
> Cheers,
>=20
> Richard
>=20

The version of:

clutter-box2d: fix isfinite.patch

in poky.git seems to still be broken

- k=


