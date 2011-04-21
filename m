Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCoxL-00083t-Un
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 10:09:44 +0200
Received: by wwb17 with SMTP id 17so1477938wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 01:07:20 -0700 (PDT)
Received: by 10.216.155.17 with SMTP id i17mr1228845wek.71.1303373238880;
	Thu, 21 Apr 2011 01:07:18 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d59sm814993wed.45.2011.04.21.01.07.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 01:07:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303342638.5518.325.camel@rex>
Date: Thu, 21 Apr 2011 10:07:16 +0200
Message-Id: <D7FBAE99-F5F4-4293-8DC5-BC356F7CF903@dominion.thruhere.net>
References: <1303342638.5518.325.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: poky <poky@lists.yoctoproject.org>
Subject: Re: OE-Core Rebranding Phase 1
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
X-List-Received-Date: Thu, 21 Apr 2011 08:09:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 apr 2011, om 01:37 heeft Richard Purdie het volgende geschreven:

> Hi,
>=20
> At the face to face OE TSC meeting we talked over the "branding" =
issues
> on OE-Core and what we were going to do about removing many of the =
poky
> references.
>=20
> This email represents a turning point for OE-Core as it marks the =
first
> pass of rebranding and is based on decisions the TSC made at that
> meeting. I'm not going to claim its 100% complete yet but it does give
> us a good start at it. =46rom this point on, I'll be taking patches =
from
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

Thanks for taking the time to do this. I did a quick check and meta-oe, =
meta-efl, meta-angstrom, meta-texasinstruments and meta-shr seem to be =
up to date with those changes now.

regards,

Koen=


