Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SAh1t-0004Ha-Ji
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 13:22:09 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 0D553A6263;
	Thu, 22 Mar 2012 13:13:11 +0100 (CET)
Date: Thu, 22 Mar 2012 13:13:10 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120322131310.1c6455d1@eb-e6520>
In-Reply-To: <CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Jansa <martin.jansa@gmail.com>, Martin, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Thu, 22 Mar 2012 12:22:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Le Wed, 21 Mar 2012 22:06:41 -0700,
Khem Raj <raj.khem@gmail.com> a =E9crit :
> ok also try setting MALLOC_CHECK_=3D2 in environment and run gdb again
> this should dump the core
> I dont have gdb handy right now its building

$ export  MALLOC_CHECK_=3D2
$  ./arm-oe-linux-gnueabi-gdb=20
Abandon (core dumped)
$ sudo rm ../../lib/libreadline.so.6*
$ ./arm-oe-linux-gnueabi-gdb=20
Abandon (core dumped)
$ sudo rm ../../lib/libpython2.7.so.1.0=20
$ ./arm-oe-linux-gnueabi-gdb=20
GNU gdb (GDB) 7.4
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html> This is free software: you are free
to change and redistribute it. There is NO WARRANTY, to the extent
permitted by law.  Type "show copying" and "show warranty" for details.
This GDB was configured as "--host=3Dx86_64-oesdk-linux
--target=3Darm-oe-linux-gnueabi". For bug reporting instructions, please
see: <http://www.gnu.org/software/gdb/bugs/>.
(gdb)=20

so the problem seems to be in the libpython of the SDK

Eric


