Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QeW05-0007Zj-FJ
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 19:35:01 +0200
Received: from STOEXMBXC03.domain01.net
	([fe80:0000:0000:0000:99c4:3913:164.170.217.90]) by
	STOEXHUB01.domain01.net
	([10.12.10.1]) with mapi; Wed, 6 Jul 2011 19:31:10 +0200
From: Anders Darander <anders@chargestorm.se>
To: Darren Hart <dvhart@linux.intel.com>
Date: Wed, 6 Jul 2011 19:31:43 +0200
Thread-Topic: [OE-core] [PATCH 1/1] kernel.bbclass: make external module
	compile
Thread-Index: Acw8An7h0XQtpdS5TrebxvrCiLDzmQ==
Message-ID: <CADF341D-7B4B-416D-BAEE-38A5FC373788@chargestorm.se>
References: <cover.1309867242.git.anders@chargestorm.se>
	<406427a001cfa7c1859f54147b678f0ef647a922.1309867242.git.anders@chargestorm.se>
	<1309869846.2410.3.camel@phil-desktop>
	<201107051454.04409.anders@chargestorm.se>
	<1309871340.20015.700.camel@rex>
	<ECF13383-E711-4CE2-8E50-222852DC392D@chargestorm.se>
	<4E148F5C.4020902@linux.intel.com>
In-Reply-To: <4E148F5C.4020902@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel.bbclass: make external module compile
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
X-List-Received-Date: Wed, 06 Jul 2011 17:35:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Darren,

On 6 jul 2011, at 18:37, "Darren Hart" <dvhart@linux.intel.com> wrote:
> Please see the following commit log:
>=20
> commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58
> Author: Darren Hart <dvhart@linux.intel.com>
> Date:   Tue Mar 8 17:09:10 2011 -0800
>=20
>    kernel/bbclass: rework kernel and module classes to allow for building=
 out-of-tree modul
>=20
>=20
> In particular, the following:
>=20
>    Care is also taken to clean the hostprogs in scripts, and the modules =
are
>    responsible for building them as needed. Although it is unclear to me =
if this is
>    really necessary, especially considering that modules put these bits b=
ack as
>    soon as they compile. If we are not generating an sstate package, I su=
spect we
>    can ignore these.
>=20
> The scripts are recreated during the build of module.bbclass derived reci=
pes.
> Are you trying to build modules independently of this method? Richard exp=
ressed
> concerns about not including host specific binaries in the sstate, which =
was
> part of the reason this approach was taken.

Thanks for pointing out this, especially the first sentence in this paragra=
ph. No matter how many times I've looked at both the recipes in question, a=
s well as the meta/classes directory, I haven't noticed that the old, inher=
ited recipes were not using module.bbclass, but rather inherited module-bas=
e.bbclass directly. I'll assume that once I change that, and fix the recipe=
s properly all my issues will go away.

Once more, thanks for pointing me to the real problem.

Cheers,
Anders=


