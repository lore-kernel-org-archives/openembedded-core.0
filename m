Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S20jM-00018n-Rw
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 14:35:08 +0100
Received: by wgbds1 with SMTP id ds1so1314714wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 05:26:42 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.82.141 as permitted sender)
	client-ip=10.216.82.141; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.82.141 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.82.141])
	by 10.216.82.141 with SMTP id o13mr3814188wee.2.1330349202711 (num_hops
	= 1); Mon, 27 Feb 2012 05:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7sJWrflGosUOmnph2IVeD98zt8vqutojIGuAFsZC8mg=;
	b=FEqo29tSNT359gSvm4zYi72MHmkhdqwsZPMe2ggWJy5CHgSkqe5XAvtGsheytW7+c1
	Bd0bLKMq1E6FrOqrHazI/wcyfSaXE1gCOrRkKtWcL3IhDe+16wRYsNLW4JF/4UYwwr46
	HjfSRsHPOo1iCCtnyhQ5rsXEfy+bRh8CsCHNI=
Received: by 10.216.82.141 with SMTP id o13mr3000611wee.2.1330349202574;
	Mon, 27 Feb 2012 05:26:42 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm55148397wib.4.2012.02.27.05.26.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:26:41 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330344828.4593.14.camel@ted>
Date: Mon, 27 Feb 2012 14:26:44 +0100
Message-Id: <4FDB63C3-5AB6-45B2-8662-D302D8936B2A@dominion.thruhere.net>
References: <20120222221309.69BFD10336@opal>
	<20120227103306.GG3859@jama.jama.net>
	<06A495EB-6F73-4325-A055-EEEBC01D93A4@dominion.thruhere.net>
	<1330344828.4593.14.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlt/VOSRUAXLZPE6+vn/Td+c4io3whiMphrFJp+qk2zjLwzDUQC6vgkNjyjua4KyKgjfInS
Subject: Re: [oe-commits] Joshua Lock : netbase: remove redundant assignments
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
X-List-Received-Date: Mon, 27 Feb 2012 13:35:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 feb. 2012, om 13:13 heeft Richard Purdie het volgende geschreven:

> On Mon, 2012-02-27 at 12:31 +0100, Koen Kooi wrote:
>> Op 27 feb. 2012, om 11:33 heeft Martin Jansa het volgende geschreven:
>>=20
>>> On Wed, Feb 22, 2012 at 10:13:09PM +0000, git@git.openembedded.org =
wrote:
>>>> Module: openembedded-core.git
>>>> Branch: master
>>>> Commit: c3d5800d2850a186f91b5a0db642aa5d1c20156b
>>>> URL:    =
http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3Dc3d5=
800d2850a186f91b5a0db642aa5d1c20156b
>>>>=20
>>>> Author: Joshua Lock <josh@linux.intel.com>
>>>> Date:   Tue Feb 21 17:46:44 2012 -0800
>>>>=20
>>>> netbase: remove redundant assignments
>>>>=20
>>>> There's no need to explicitly set PACKAGE_ARCH =3D MACHINE_ARCH, =
base.bbclass
>>>> takes care of setting this value for us based on the interfaces for =
those
>>>> machines being an OVERRIDE.
>>>=20
>>> do_install () {
>>> ...
>>>       # Disable network manager on machines that commonly do NFS =
booting
>>>       case "${MACHINE}" in
>>>               "qemuarm" | "qemux86" | "qemux86-64" | "qemumips" | =
"qemuppc" )
>>>=20
>>> This causes do_install hash to depend on MACHINE variable for all =
MACHINEs,=20
>>> so making whole recipe MACHINE_ARCH would be more effective then =
rebuilding=20
>>> TARGET_ARCH package after every MACHINE switch.
>>=20
>> That whole bit needs to go into the specific nfs image recipe, not
>> into the recipe. Unless we decide nfs is the one and only way to boot
>> qemu machines.
>=20
> Clearly the qemu machines boot on non-nfs setups just fine and the
> comment is just a bit stale here.
>=20
> For qemu we expect the IP address to be stable and consistent so we =
know
> where to find it and we don't expect it to disappear. The problem was
> that if network manager starts poking around the main ethernet
> interface, anything can go wrong (e.g. random QA test failures if
> networkmanager decided to change the interface at the wrong moment). =
We
> therefore really do know better than network manager when it comes to
> ethernet connectivity into our qemu images.
>=20
> There are a few options here:
>=20
> a) Whitelist the MACHINE variable in hashes apart from the qemu =
machines
>=20
> b) Change the code to a do_install_append_qemu* which would mean the
> hashes become stable.

Both are hacks for the nfs use case.

> c) Shove the information into a qemu specific package.=20
>=20
> The trouble with c) before everyone decides its the best is how/when =
do
> you include that package. It really needs to be present whenever =
network
> manager is present. I don't want to end up with someone installing it
> from feeds and getting different behaviour as it would be a nightmare =
to
> debug.

If you put it in a seperate package it's becomes something people can =
opt-in to. If someone opts-in and it breaks because of that, that person =
gets to keep both pieces.

> d) We could also decide we don't care about network manager any more =
and
> just delete this I guess since we default to connman now.

You can load the networkmanager plugin =
(http://wiki.debian.org/NetworkManager#Wired_Networks_are_Unmanaged) =
that makes it ignore entries in /etc/network/interfaces to accomplish =
the same. Right now both connman and networkmanager ignore =
/etc/network/interfaces which leads to mass confusion. I discussed this =
with Josh at ELC but forgot to send an email about this. I think we =
should split netbase into:

1) a package with /etc/rpc, /etc/hosts, /etc/protocols and /etc/services
2) a package with /etc/network/interfaces
3) a package with the initscript (probably move that into the ifupdown =
package)

That way we can support the following without having unused config files =
in the filesystem:

* simple ifupdown style networking using /etc/network/interfaces
* networkmanager honouring devices managed by /etc/network/interfaces
* networkmanager handling everything
* connman handling everything
* no networking in userspace, boot with ip=3Ddhcp

regards,

Koen



