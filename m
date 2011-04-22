Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.m.rifenbark@intel.com>) id 1QDHDS-0006lB-9v
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 16:20:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 07:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="737047143"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2011 07:16:36 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Fri, 22 Apr 2011 07:16:35 -0700
From: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Apr 2011 07:16:33 -0700
Thread-Topic: [poky] [OE-core] OE-Core Rebranding Phase 1
Thread-Index: Acv/+yoYtNsmbHbRRyGSuvWSnw8lFAA++Clw
Message-ID: <DE8BA75F34A0404282AC5E15F691BC765136F5ED@orsmsx504.amr.corp.intel.com>
References: <1303342638.5518.325.camel@rex>
	<D7FBAE99-F5F4-4293-8DC5-BC356F7CF903@dominion.thruhere.net>
In-Reply-To: <D7FBAE99-F5F4-4293-8DC5-BC356F7CF903@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Apr 2011 16:22:40 +0200
Cc: poky <poky@lists.yoctoproject.org>
Subject: Re: [poky] OE-Core Rebranding Phase 1
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
X-List-Received-Date: Fri, 22 Apr 2011 14:20:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I grep'd all the XML files in the documentation directory and got three hit=
s:

 * 'meta/recipes-sata/tasks/task-poky.bb' appears in the Poky Reference man=
ual
 * '$ bitbake -c clean task-boot task-base task-poky' appears in the Poky R=
eference manual
 * 'local.conf.sample' appears in the Poky Reference manual.

Should these be the following:

 * meta/recipes-sata/tasks/task-core.bb
 * $ bitbake -c clean task-boot task-base task-core

Not sure what to do with the occurrence of 'local.conf.sample'.  Just remov=
e it?

ScottR

-----Original Message-----
From: poky-bounces@yoctoproject.org [mailto:poky-bounces@yoctoproject.org] =
On Behalf Of Koen Kooi
Sent: Thursday, April 21, 2011 1:07 AM
To: Patches and discussions about the oe-core layer
Cc: poky
Subject: Re: [poky] [OE-core] OE-Core Rebranding Phase 1


Op 21 apr 2011, om 01:37 heeft Richard Purdie het volgende geschreven:

> Hi,
>=20
> At the face to face OE TSC meeting we talked over the "branding" issues
> on OE-Core and what we were going to do about removing many of the poky
> references.
>=20
> This email represents a turning point for OE-Core as it marks the first
> pass of rebranding and is based on decisions the TSC made at that
> meeting. I'm not going to claim its 100% complete yet but it does give
> us a good start at it. From this point on, I'll be taking patches from
> people to assist with this. The key changes I've made so far are:
>=20
> * poky-init-build-env -> oe-init-build-env
> * poky-image-* -> core-image-*
> * task-poky-* -> task-core-*
> * git.pokylinux.org -> git.yoctoproject.org
> * POKYBASE -> COREBASE
> * poky-qemu -> runqemu
> * Sanitised local.conf.sample from Poky references
> * POKY_NATIVE_SYSROOT -> OECORE_NATIVE_SYSROOT
> * Renamed scrips/poky-* to scripts/oe-*
> * Renamed the poky-sb override to linuxstdbase
> * POKY_CONF_VERSION -> LOCALCONF_VERSION
> * Made sanity versions weak assignment

Richard,

Thanks for taking the time to do this. I did a quick check and meta-oe, met=
a-efl, meta-angstrom, meta-texasinstruments and meta-shr seem to be up to d=
ate with those changes now.

regards,

Koen
_______________________________________________
poky mailing list
poky@yoctoproject.org
https://lists.yoctoproject.org/listinfo/poky


