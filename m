Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SAP9T-0004qa-8y
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 18:16:47 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 426CDA6248;
	Wed, 21 Mar 2012 18:07:49 +0100 (CET)
Date: Wed, 21 Mar 2012 18:07:48 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: nitin.a.kamble@intel.com
Message-ID: <20120321180748.7cc58e67@eb-e6520>
In-Reply-To: <bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 21 Mar 2012 17:16:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Nitin,

Le Wed, 21 Mar 2012 09:35:16 -0700,
nitin.a.kamble@intel.com a =E9crit :

> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> This reverts commit 1cb4614f1d5e482b88ea372d1841a6c313a49941.
>=20
> and bump PR
>=20
> This fixes this bug:
> [YOCTO #2077] - memory buffer mess up of i586-poky-linux-gdb in meta-tool=
chain
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2077
>=20
this configuration should work as python is enabled in gdb in most
modern distribution, the problem here may be in the libreadline of the
host system.
May you please try to remove --with-system-readline from
EXTRA_OECONF in gdb-common.inc so that gdb doesn't try to use the
libreadline of your old ubuntu system ?

If that solves the problem this would allow us not to loose this python
scripting capability which is quite useful in gdb.

Thanks
Eric
--=20
http://eukrea.com/en/news/104-2012


