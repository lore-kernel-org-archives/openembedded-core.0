Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RcVXh-00072k-41
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 06:13:41 +0100
Received: by lami14 with SMTP id i14so2018928lam.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 21:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=oWFqMD03L9x+wpIqd0LUMSTOjuxINBtNS1v4DkjHaPY=;
	b=RdKlTXfVEjEqciL1x4JDJpuv1VwynRLFASWDrdCpSplxxfSOBYWk0OEsj82KKli7LU
	y7EmTsIew/oPnsbI1QjPidWDePDBzz406ekO+++RLy0reOnnsyyRxBq6PS7DWVe72RvL
	lwY98+NVONQKHj8JVPHK6v4PQB4aBpeTkDOow=
Received: by 10.152.111.136 with SMTP id ii8mr15102834lab.20.1324271195381;
	Sun, 18 Dec 2011 21:06:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.36.198 with HTTP; Sun, 18 Dec 2011 21:06:04 -0800 (PST)
In-Reply-To: <CADkTA4Nx9Z_3iFzd6FbkbwiYANUL6B4BXsW7_4LngeqcED7DRQ@mail.gmail.com>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
	<CADkTA4OLwUcM86JbCXDOPXUOb1hH+vvKfShjaAsXP3e9Ek0f=A@mail.gmail.com>
	<FB6AAD0F-5F91-48D3-8D02-FCBEC19A4B9E@dominion.thruhere.net>
	<CADkTA4Nx9Z_3iFzd6FbkbwiYANUL6B4BXsW7_4LngeqcED7DRQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Dec 2011 21:06:04 -0800
Message-ID: <CAMKF1spq-m3dYd2nNhAH8CrZsvjmQrcoWa8Na8g1zng=DBJTgw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Mon, 19 Dec 2011 05:13:41 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 18, 2011 at 5:39 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Sun, Dec 18, 2011 at 4:19 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>
>> Op 18 dec. 2011, om 21:27 heeft Bruce Ashfield het volgende geschreven:
>>
>>> On Sun, Dec 18, 2011 at 3:13 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>>
>>>> Op 18 dec. 2011, om 20:47 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>>>>
>>>>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
>>>>> separate task from do_deploy. This way the do_install task can also
>>>>> benefit from generated uImage.
>>>>>
>>>>> The only major feature of oe-core's version (not to recreate uImage
>>>>> if it exists) is retained in this patch.
>>>>
>>>> I still don't agree with that behaviour. The in-kernel uImage code is just like the in-kernel defconfigs: useless for people who aren't kernel developers.
>>>
>>> In that case, shouldn't people doing u-boot development (or other
>>> non-kernel developers),
>>> be building a uImage via something that isn't in kernel.bbclass ?
>>

i think we have UBOOT_ENTRYPOINT, UBOOT_ENTRYSYMBOL and
UBOOT_LOADADDRESS which are then used to generate the uImage
and sometimes defaults from kernel build system may not be usable as
it might be generating the image using some other values and we are not
able to control the image generation. Now is that fixable in kernel I guess
it could be but why not have flexibility of generating the image.

>> I use the kernel.bbclass in meta-oe, that does what I need.
>


