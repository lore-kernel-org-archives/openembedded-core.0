Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPuXJ-0000Li-5E
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 13:49:29 +0200
Received: by wgbdr1 with SMTP id dr1so1419477wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 04:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=aciFO7C8yok5usgKhaHvAI9/lxTZgOvedcOAUtog4OI=;
	b=ai9GZaLvfMrKyJ8j4thWa6FjGrx+Lno1UkY5q9K4XvyXUOz4lDPp19/Cw4BpTJzvPL
	LESfQdx7m4nhtWj49cirFCMrUzvffTB5DB98uNBXO1EUu2rg2RXVgIfmGYc7lXBWDq/t
	6GaSK7VsUm85tEFwfB9j7tMn+sBLqSQoKRaOZpu6yV/uRAjeURzWnPo1wuRCZq491j5n
	Vh7OEHnFfAYPC7uYa4NIEt071qr0eGhYMbscLH80r4WHEx+5uAkSYe1YsV/VsllZpQ8q
	JuvhZeI69XLiJDfC5OMr9WjXyck3eBfLXV/ZoBbKBuWjz7b9w53KlTFa9fT9NTf6QAw5
	sDaA==
Received: by 10.216.212.78 with SMTP id x56mr1211846weo.36.1336045183616;
	Thu, 03 May 2012 04:39:43 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w10sm2665676wiy.3.2012.05.03.04.39.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 04:39:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336044241.30113.73.camel@ted>
Date: Thu, 3 May 2012 13:39:42 +0200
Message-Id: <481C530F-A851-4861-B261-9CBE17258D4B@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
	<9295EE6F-5FFA-4FB4-B266-D8F45AAB2351@dominion.thruhere.net>
	<1336034822.30113.47.camel@ted>
	<D8900CA0-6986-4242-8AF1-7A65CC86FDDA@dominion.thruhere.net>
	<1336044241.30113.73.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnz0ineHau5Qv4OHap4qIJKYjq3NqI29/Q9NKKc26ffKyDS5sbCQxVBoI82JdI6BY5AHsHL
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Thu, 03 May 2012 11:49:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 13:24 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-05-03 at 12:39 +0200, Koen Kooi wrote:
>> Op 3 mei 2012, om 10:47 heeft Richard Purdie het volgende geschreven:
>>=20
>>> On Thu, 2012-05-03 at 09:43 +0200, Koen Kooi wrote:
>>>> Op 3 mei 2012, om 09:32 heeft Khem Raj het volgende geschreven:
>>>>=20
>>>>> On Wed, May 2, 2012 at 7:23 AM, Jason Wessel =
<jason.wessel@windriver.com> wrote:
>>>>>> The user mode NFS server does not get built by default when you =
are
>>>>>> using a purely command line driven development environment =
without SDK
>>>>>> tools.  In order to accommodate simple test configurations and =
have
>>>>>> all the tools built for the minimal validation with qemu-native,
>>>>>> simply add the dependency to unfs-server-native.
>>>>>>=20
>>>>>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>>>>>> ---
>>>>>> meta/conf/machine/include/qemu.inc |    2 +-
>>>>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>>>>=20
>>>>>> diff --git a/meta/conf/machine/include/qemu.inc =
b/meta/conf/machine/include/qemu.inc
>>>>>> index 421a149..742b629 100644
>>>>>> --- a/meta/conf/machine/include/qemu.inc
>>>>>> +++ b/meta/conf/machine/include/qemu.inc
>>>>>> @@ -14,4 +14,4 @@ RDEPENDS_kernel-base =3D ""
>>>>>> # Use a common kernel recipe for all QEMU machines
>>>>>> PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>>>>>>=20
>>>>>> -EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native"
>>>>>> +EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native =
unfs-server-native"
>>>>>> --
>>>>>=20
>>>>> how about replacing  EXTRA_IMAGEDEPENDS with
>>>>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS here ?
>>>>=20
>>>> RDEPENDS end up in the image, IMAGEDEPENDS are needed to build the
>>>> image. Do I need qemu-native, helper-native and unfs to build the
>>>> image? No I don't. Would I need it if I decide to run the runqemu
>>>> scripts, yes. Do these extra dependencies cause pain? Yes, since it
>>>> requires installing tons of extra things on a headless buildserver
>>>> (mesa, sdl) to just build an image.
>>>>=20
>>>> If I wanted to be an ass I would suggest moving qemu-native,
>>>> qemu-helper-native and unfs-server-native to the HOB, but I won't =
do
>>>> that.
>>>>=20
>>>> So I'll stick with my original suggestion: move those dependencies =
to
>>>> the images you want to run on nfs for qemu, don't pollute the =
global
>>>> EXTRA_IMAGEDEPENDS with it.
>>>=20
>>> If I wanted to be an ass here I'd just add them to the image class
>>> conditional on qemu. This would be a little pointless and needlessly
>>> complicate things though.
>>>=20
>>> The point of these is to trigger them to build whenever a qemu image =
is
>>> built. This makes a lot of sense in some use cases, it also does not
>>> make sense in some other cases and it is not possible for the system =
to
>>> mind read and tell the difference.
>>=20
>> What about having the runqemu* scripts call bitbake to build the
>> -native helpers when they are missing?=20
>=20
> The whole point with the qemu emulated machines is that you build them
> and they work for new users easily and efficiently. I don't think
> calling bitbake to build them and force the user into another wait is =
a
> good usability model to be promoting.

OE-core should set the right example and teaching people that a global =
IMAGE_DEPENDS is OK is not the right example. Especially when it =
actually causes breakage, see below.
If people insist that IMAGE_DEPENDS is the one and only way to provide =
the runqemu experience then at least put a big comment in the file =
saying why it's done and why people shouldn't be copy/pasting it into =
their layers.
And an indiciation where the line is drawn would be nice as well, I can =
imagine that someone wants to add amazon EC2 support to runqemu and =
sends a patch to add the EC2 tools to IMAGE_DEPENDS.

> I'm also slightly bemused that in previous discussions you've implied
> build time is less relevant then functionality yet here you're taking
> the opposite stance :).

I get build *failures* for the qemu machines because I don't have mesa =
and sdl installed on the autobuilder. But you are right, I do think =
build time is less relevant than functionality.=


