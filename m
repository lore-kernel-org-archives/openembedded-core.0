Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPtbA-0007JL-5C
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 12:49:24 +0200
Received: by wibhj13 with SMTP id hj13so194893wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 03:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yyxKSOh5jPBplTqyHdoBnZspME2hnoiJrzniwytScl0=;
	b=mta9h8PS2FYo981gfE/9hL2EARnrA3RJhv2cgd09Mko9JdDCGkQxeP53PVZC1KrFxU
	bNBlrBuhFBWNoZisXJMWfj5z+MaviF7i+jNkB9VDIQfVB9bhOgKgk1b3NA5490U+fvCn
	hWAGCQc45TEu3ckrRxYy2cYqRQU23Ff/kbboBICjsn/D0qvM5oESt/AKtm236HXvr63i
	ThkSa2PC56JirqGYaTFLQhtXUDO5Dvx4oPcvWuqvRAGGH4UMKq2AAzYL7HgoiQxZH1mf
	yt5e0sBPQRYT2PmOCN9XprIRV7ZDtcSY2/aRddYNRaAdkHkx53/4BcSOaNXqY+E2/Puj
	yFfg==
Received: by 10.180.97.228 with SMTP id ed4mr2705306wib.0.1336041578980;
	Thu, 03 May 2012 03:39:38 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n20sm2199685wiw.5.2012.05.03.03.39.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 03:39:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336034822.30113.47.camel@ted>
Date: Thu, 3 May 2012 12:39:38 +0200
Message-Id: <D8900CA0-6986-4242-8AF1-7A65CC86FDDA@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
	<9295EE6F-5FFA-4FB4-B266-D8F45AAB2351@dominion.thruhere.net>
	<1336034822.30113.47.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnfkKPWuNmeWV3CWOne1gQrTxszNtFHim9fNaHS8SUJo5MP4AwjC4SvHW/BCnB0wwiJFsTo
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
X-List-Received-Date: Thu, 03 May 2012 10:49:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 10:47 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-05-03 at 09:43 +0200, Koen Kooi wrote:
>> Op 3 mei 2012, om 09:32 heeft Khem Raj het volgende geschreven:
>>=20
>>> On Wed, May 2, 2012 at 7:23 AM, Jason Wessel =
<jason.wessel@windriver.com> wrote:
>>>> The user mode NFS server does not get built by default when you are
>>>> using a purely command line driven development environment without =
SDK
>>>> tools.  In order to accommodate simple test configurations and have
>>>> all the tools built for the minimal validation with qemu-native,
>>>> simply add the dependency to unfs-server-native.
>>>>=20
>>>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>>>> ---
>>>> meta/conf/machine/include/qemu.inc |    2 +-
>>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>>=20
>>>> diff --git a/meta/conf/machine/include/qemu.inc =
b/meta/conf/machine/include/qemu.inc
>>>> index 421a149..742b629 100644
>>>> --- a/meta/conf/machine/include/qemu.inc
>>>> +++ b/meta/conf/machine/include/qemu.inc
>>>> @@ -14,4 +14,4 @@ RDEPENDS_kernel-base =3D ""
>>>> # Use a common kernel recipe for all QEMU machines
>>>> PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>>>>=20
>>>> -EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native"
>>>> +EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native =
unfs-server-native"
>>>> --
>>>=20
>>> how about replacing  EXTRA_IMAGEDEPENDS with
>>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS here ?
>>=20
>> RDEPENDS end up in the image, IMAGEDEPENDS are needed to build the
>> image. Do I need qemu-native, helper-native and unfs to build the
>> image? No I don't. Would I need it if I decide to run the runqemu
>> scripts, yes. Do these extra dependencies cause pain? Yes, since it
>> requires installing tons of extra things on a headless buildserver
>> (mesa, sdl) to just build an image.
>>=20
>> If I wanted to be an ass I would suggest moving qemu-native,
>> qemu-helper-native and unfs-server-native to the HOB, but I won't do
>> that.
>>=20
>> So I'll stick with my original suggestion: move those dependencies to
>> the images you want to run on nfs for qemu, don't pollute the global
>> EXTRA_IMAGEDEPENDS with it.
>=20
> If I wanted to be an ass here I'd just add them to the image class
> conditional on qemu. This would be a little pointless and needlessly
> complicate things though.
>=20
> The point of these is to trigger them to build whenever a qemu image =
is
> built. This makes a lot of sense in some use cases, it also does not
> make sense in some other cases and it is not possible for the system =
to
> mind read and tell the difference.

What about having the runqemu* scripts call bitbake to build the -native =
helpers when they are missing?=20

regards,

Koen=


