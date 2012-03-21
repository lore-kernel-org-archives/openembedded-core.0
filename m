Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SASoz-0001pZ-6j
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:11:53 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 9E493A60E8;
	Wed, 21 Mar 2012 22:02:55 +0100 (CET)
Date: Wed, 21 Mar 2012 22:02:53 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Message-ID: <20120321220253.00c4f254@eb-e6520>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Wed, 21 Mar 2012 21:11:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Wed, 21 Mar 2012 20:48:23 +0000,
"Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
>   I removed the meta-yocto layer, which removed poky distro from the conf=
ig. And I am still seeing same issue.
>=20
> [nitin@nbuild0 /]$ cd /usr/local/oecore-x86_64/
> [nitin@nbuild0 oecore-x86_64]$ ls
> environment-setup-x86_64-oe-linux  site-config-x86_64-oe-linux  sysroots =
 version-x86_64-oe-linux
> [nitin@nbuild0 oecore-x86_64]$ . environment-setup-x86_64-oe-linux
>  [nitin@nbuild0 oecore-x86_64]$ sysroots/x86_64-oesdk-linux/usr/bin/x86_6=
4-oe-linux/x86_64-oe-linux-gdb
> *** glibc detected *** sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-linu=
x/x86_64-oe-linux-gdb: double free or corruption (out): 0x00007f3221852030 =
***
> Aborted (core dumped)
>=20
may you please provide details on :
- log reported by bitbake when you launch it to know a little bit more
  your configuration,
- host distribution and arch of your build host

Thanks
Eric


