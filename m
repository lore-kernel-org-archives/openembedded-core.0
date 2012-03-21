Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SARPo-0007vi-2N
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 20:41:48 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id CA211A62A3;
	Wed, 21 Mar 2012 20:32:50 +0100 (CET)
Date: Wed, 21 Mar 2012 20:32:49 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Message-ID: <20120321203249.54411613@eb-e6520>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 21 Mar 2012 19:41:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Nitin,

Le Wed, 21 Mar 2012 18:07:50 +0000,
"Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> > From: Eric B=E9nard [mailto:eric@eukrea.com]
> > I'm launching a build and will keep you informed of the result. If that
> > only fails for x86 or x86_64 targets, we can use overrides to disable
> > python support only for these targets.
> >=20
> > Eric
>=20
> I also starting test for sdk gdb for qemuarm target. Will keep you posted=
. Any solution that gives a working sdk gdb for all arches will be good.
>=20
that works fine here at least for target qemux86 :
[ebenard@eb-e6520 ~]$ cat /etc/fedora-release=20
Fedora release 16 (Verne)

[ebenard@eb-e6520 ~]$ uname -a
Linux eb-e6520 3.2.9-2.fc16.x86_64 #1 SMP Mon Mar 5 20:55:39 UTC 2012
x86_64 x86_64 x86_64 GNU/Linux

[ebenard@eb-e6520 ~]$
source /usr/local/oecore-x86_64/environment-setup-i586-oe-linux=20

[ebenard@eb-e6520 ~]$ which i586-oe-linux-gdb
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/i586-oe-linux/=
i586-oe-linux-gdb

[ebenard@eb-e6520 ~]$ i586-oe-linux-gdb
GNU gdb (GDB) 7.4
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html> This is free software: you are free
to change and redistribute it. There is NO WARRANTY, to the extent
permitted by law.  Type "show copying" and "show warranty" for details.
This GDB was configured as "--host=3Dx86_64-oesdk-linux
--target=3Di586-oe-linux". For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
(gdb) python import sys
(gdb) python sys.stdout.write("hello, world\n")
hello, world
(gdb)=20

Eric


