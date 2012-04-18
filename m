Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKZo7-0002iN-1p
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 20:40:47 +0200
Received: by wera1 with SMTP id a1so4968379wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 11:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=9pQ3gPp/l2BaXJ1fQXjZ5KFfQGxrVYzS9UtULpeb+zI=;
	b=Yivi/biVohkZ3VsJo4SLK2KzDWErmQ+AXySC0FTkpMAJG+pzqE8ru2++qRvxyOYk5Y
	5iXbRNHaa7XpvxIeqtzhGOEJTq4IyK+vGe+nMOHVA8sQDvoSdIEy/KP2z6dcHAvqWgPs
	JHHbwpBwiGdTLnCQhFrfKB0z+b3yq8I89ox+L2vcoSxR6HnQYuJDs2zYvL8ybfn5Ij9a
	t7jQ4LihQdX04m9Pk4FA30vq/EbP1H1HOyoUeSeZ/xRGXoXgiWBljx3EmjvRiEKZLSzy
	82AKoU/Sfua6c7C2XwqV8qqr/LBMbBPldY0br3qUnfy8LPDSpCuS6Vm59+SgA8Ahmb9d
	nKiA==
Received: by 10.216.137.97 with SMTP id x75mr2176771wei.25.1334773879254;
	Wed, 18 Apr 2012 11:31:19 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n8sm57991765wix.10.2012.04.18.11.31.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 11:31:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F8F03A9.8040908@opendreambox.org>
Date: Wed, 18 Apr 2012 20:31:21 +0200
Message-Id: <7E8E5E21-B01C-46DD-958B-828E6AE65797@dominion.thruhere.net>
References: <4F8C3B19.40400@windriver.com> <4F8EA5CC.6010101@opendreambox.org>
	<1334749226.24091.67.camel@ted> <4F8EA972.1090304@opendreambox.org>
	<20120418115428.GJ3635@jama.jama.net>
	<1334750426.24091.73.camel@ted> <4F8EAEAC.4080605@opendreambox.org>
	<1334753155.24091.84.camel@ted> <4F8ED1BE.8010109@opendreambox.org>
	<4F8EDC02.5040605@windriver.com>
	<20120418154612.GN3635@jama.jama.net>
	<F1EB8D66-C971-4BFF-AECB-62C65E517743@dominion.thruhere.net>
	<4F8F03A9.8040908@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkbdL7DhvrCpkXYjHY1+YAJQZ8HOP/2CUjhlFjasc/DOY26BsOPkod/SvL/UzEUUU8b27fk
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Wed, 18 Apr 2012 18:40:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr. 2012, om 20:10 heeft Andreas Oberritter het volgende =
geschreven:

> On 18.04.2012 19:01, Koen Kooi wrote:
>>=20
>> Op 18 apr. 2012, om 17:46 heeft Martin Jansa het volgende geschreven:
>>=20
>>> On Wed, Apr 18, 2012 at 10:21:38AM -0500, Mark Hatle wrote:
>>>> On 4/18/12 9:37 AM, Andreas Oberritter wrote:
>>>>> On 18.04.2012 14:45, Richard Purdie wrote:
>>>>>> On Wed, 2012-04-18 at 14:08 +0200, Andreas Oberritter wrote:
>>>>>>> On 18.04.2012 14:00, Richard Purdie wrote:
>>>>>>>> On Wed, 2012-04-18 at 13:54 +0200, Martin Jansa wrote:
>>>>>>>>> I had a lot of those (e.g. because armv7a-vfp-neon was =
including 20
>>>>>>>>> arm*feed.conf variants in /etc/opkg most of them empty - =
without
>>>>>>>>> Packages.gz).
>>>>>>>>>=20
>>>>>>>>> So I've added "filter" to distro-feed-configs
>>>>>>>>> =
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D236=
aa553bb0f82f741c6edb793e96f421f24f4fa
>>>>>>>>> to add only feeds I'm generating (and I also don't want armv5* =
packages
>>>>>>>>> installed on armv7a-vfp-neon target unless user explicitly =
adds armv5*
>>>>>>>>> feed).
>>>>>>>>=20
>>>>>>>> This is the better solution. I think we need to get a better =
default
>>>>>>>> feed-config generation mechanism into the core. Distros may =
still need
>>>>>>>> to tweak it but it would be good to share some of the best =
practises...
>>>>>>>=20
>>>>>>> Did you look at the patch? Which default setting of
>>>>>>> SUPPORTED_EXTRA_ARCHS do you suggest?
>>>>>>=20
>>>>>> I did. I didn't say the above patch was a perfect solution.
>>>>>>=20
>>>>>>> Do you think it's feasible to add
>>>>>>> every single downloadable arch to this variable? If a user of my =
distro
>>>>>>> decides to build it for some arm or x86 cpu, should he need to =
know
>>>>>>> which archs to add at this place?
>>>>>>=20
>>>>>> This is a place where the build system meets and interfaces with =
the
>>>>>> distro. No one policy in the build system is going to fit every =
distro's
>>>>>> needs, not should we ever aim to so.
>>>>>=20
>>>>> At least we should have defaults that actually work for someone. =
Now we
>>>>> don't and considering that distro-feed-configs.bb is the only =
place
>>>>> where PACKAGE_EXTRA_ARCHS is actually used, this would be very =
easy to
>>>>> accomplish. Especially because it worked well by default before =
Mark
>>>>> broke it.
>>>>=20
>>>> PACKAGE_EXTRA_ARCHS is also used by Zypper, RPM configuration and =
other places.=20
>>>> In those cases it is a full list of all available (and compatible) =
package=20
>>>> architecture types.
>>>>=20
>>>> Coming from the RPM world, it seems very odd to me that a set of =
"extra_archs"=20
>>>> can not list well, extra compatible archs without causing an error. =
 I have no=20
>>>> idea how to reconcile this behavior, without making a package =
manager=20
>>>> distro-feed specific solution.  (For RPM we absolutely want the =
existing behavior.)
>>>=20
>>> The problem Andreas is seeing is not fatal AFAIK.. just couple (or a
>>> lot) of 404 (Packages files not available) while doing opkg update =
is
>>> not nice for end user.=20
>>>=20
>>> Downloading many existing Packages files without any Package in it
>>> is also suboptimal, but maybe good start.. so we can teach
>>> meta/classes/package_ipk.bbclass:package_update_index_ipk() to =
create
>>> Packages files not only for existing
>>> ipkgarchs=3D"${ALL_MULTILIB_PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
>>> but for all (replace "if [ -e $pkgdir/ ]; then" with something like=20=

>>> "if [ ! -e $pkgdir/ ]; then mkdir -p $pkgdir; fi")
>>=20
>> That implies you're exposing feeds straight from OE, which is a bad, =
bad idea.
>=20
> Can you please elaborate on why this is a bad idea?

The main reason is that packages will get recreated with different MD5 =
sums, upsetting opkg. And worse, they will have different contents =
because PR bumps get left out a lot (but less than they used to). It's =
analogous to using WORKDIR/rootfs for nfsroot. It might work for you, =
but in general it's a bad idea.
What we do in angstrom is disallow duplicate files to get uploaded, so =
foo_1.0-r0.ipk won't get overwritten by a 'newer' foo_1.0-r0.ipk, it =
will only go away if foo_1.0-r1.ipk gets uploaded.

regards,

Koen=


