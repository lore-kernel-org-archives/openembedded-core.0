Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKYOp-0006cg-Jr
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 19:10:35 +0200
Received: by wera1 with SMTP id a1so4912134wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 10:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=vxYpzT23Hryr/A0fr4eEM4T9AXk4Fefy2J+HcqelQzg=;
	b=W3HhiNBpxgnqWdaX/1coYM6O/ck4UZiwlBWDPFRcVLtR4awkvoNXPiW4IBgsrusDzw
	0k6nBkP/HLD6pdQ2hVUnu9B8IPVp404Uidx9JDNWIY2B2loIXD1vCEDyAY4Vj3bnae8e
	edVtJfre0px7dhZlhwQrVoyn+paetd+Q7qW8RBvX7rkJ8aCmBHDmBxVy08w8iH1Dn9vg
	33iMpHBAp2RM6s2NCEOt5NUXrxWK1uA4uKsqs6zZyCCaa8gg5o4Zqesk1DMQBe1plpMv
	YR82liFNQqMQS8v0w2bM8FET6JMfzi266BWWPWtzHS7MA4OC4cONlFAi8QU+UP4CFLeK
	XTmg==
Received: by 10.180.81.198 with SMTP id c6mr7878921wiy.18.1334768468121;
	Wed, 18 Apr 2012 10:01:08 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b3sm35751557wib.4.2012.04.18.10.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 10:01:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120418154612.GN3635@jama.jama.net>
Date: Wed, 18 Apr 2012 19:01:12 +0200
Message-Id: <F1EB8D66-C971-4BFF-AECB-62C65E517743@dominion.thruhere.net>
References: <4F8C3B19.40400@windriver.com> <4F8EA5CC.6010101@opendreambox.org>
	<1334749226.24091.67.camel@ted> <4F8EA972.1090304@opendreambox.org>
	<20120418115428.GJ3635@jama.jama.net>
	<1334750426.24091.73.camel@ted> <4F8EAEAC.4080605@opendreambox.org>
	<1334753155.24091.84.camel@ted> <4F8ED1BE.8010109@opendreambox.org>
	<4F8EDC02.5040605@windriver.com>
	<20120418154612.GN3635@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmCe8dYVeszS7PWkxjHKcHenuq3QGzbhx7WeHH/ZWoSSyvgaqJTzhbXDK4u+014gLAcKzV7
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
X-List-Received-Date: Wed, 18 Apr 2012 17:10:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr. 2012, om 17:46 heeft Martin Jansa het volgende geschreven:

> On Wed, Apr 18, 2012 at 10:21:38AM -0500, Mark Hatle wrote:
>> On 4/18/12 9:37 AM, Andreas Oberritter wrote:
>>> On 18.04.2012 14:45, Richard Purdie wrote:
>>>> On Wed, 2012-04-18 at 14:08 +0200, Andreas Oberritter wrote:
>>>>> On 18.04.2012 14:00, Richard Purdie wrote:
>>>>>> On Wed, 2012-04-18 at 13:54 +0200, Martin Jansa wrote:
>>>>>>> I had a lot of those (e.g. because armv7a-vfp-neon was including =
20
>>>>>>> arm*feed.conf variants in /etc/opkg most of them empty - without
>>>>>>> Packages.gz).
>>>>>>>=20
>>>>>>> So I've added "filter" to distro-feed-configs
>>>>>>> =
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D236=
aa553bb0f82f741c6edb793e96f421f24f4fa
>>>>>>> to add only feeds I'm generating (and I also don't want armv5* =
packages
>>>>>>> installed on armv7a-vfp-neon target unless user explicitly adds =
armv5*
>>>>>>> feed).
>>>>>>=20
>>>>>> This is the better solution. I think we need to get a better =
default
>>>>>> feed-config generation mechanism into the core. Distros may still =
need
>>>>>> to tweak it but it would be good to share some of the best =
practises...
>>>>>=20
>>>>> Did you look at the patch? Which default setting of
>>>>> SUPPORTED_EXTRA_ARCHS do you suggest?
>>>>=20
>>>> I did. I didn't say the above patch was a perfect solution.
>>>>=20
>>>>>  Do you think it's feasible to add
>>>>> every single downloadable arch to this variable? If a user of my =
distro
>>>>> decides to build it for some arm or x86 cpu, should he need to =
know
>>>>> which archs to add at this place?
>>>>=20
>>>> This is a place where the build system meets and interfaces with =
the
>>>> distro. No one policy in the build system is going to fit every =
distro's
>>>> needs, not should we ever aim to so.
>>>=20
>>> At least we should have defaults that actually work for someone. Now =
we
>>> don't and considering that distro-feed-configs.bb is the only place
>>> where PACKAGE_EXTRA_ARCHS is actually used, this would be very easy =
to
>>> accomplish. Especially because it worked well by default before Mark
>>> broke it.
>>=20
>> PACKAGE_EXTRA_ARCHS is also used by Zypper, RPM configuration and =
other places.=20
>>  In those cases it is a full list of all available (and compatible) =
package=20
>> architecture types.
>>=20
>> Coming from the RPM world, it seems very odd to me that a set of =
"extra_archs"=20
>> can not list well, extra compatible archs without causing an error.  =
I have no=20
>> idea how to reconcile this behavior, without making a package manager=20=

>> distro-feed specific solution.  (For RPM we absolutely want the =
existing behavior.)
>=20
> The problem Andreas is seeing is not fatal AFAIK.. just couple (or a
> lot) of 404 (Packages files not available) while doing opkg update is
> not nice for end user.=20
>=20
> Downloading many existing Packages files without any Package in it
> is also suboptimal, but maybe good start.. so we can teach
> meta/classes/package_ipk.bbclass:package_update_index_ipk() to create
> Packages files not only for existing
> ipkgarchs=3D"${ALL_MULTILIB_PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
> but for all (replace "if [ -e $pkgdir/ ]; then" with something like=20
> "if [ ! -e $pkgdir/ ]; then mkdir -p $pkgdir; fi")

That implies you're exposing feeds straight from OE, which is a bad, bad =
idea.



