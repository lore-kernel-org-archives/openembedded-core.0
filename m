Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QjdHn-0000qx-3Y
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:22:27 +0200
Received: by gwb11 with SMTP id 11so677677gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 13:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cM0q7Oan3Q8jIPkxUnIZxuXp2im7V5MfUlwi/3k1bt4=;
	b=MkiiCZ3h6kB9U1r7pOJdPbF6gpHd3upkh1jV+bdG33AEPmBZvLnLa8MIAcUW5Y5KKd
	BNWvQAQRsfE1b29m3Sw2agrFb65lY5/SIAVBb2Dopv89GsIN9lVl1ddFUIsqwVoYTwNd
	MOMWEMqP7dzNX6ND9hI5r45e9O1TO2LZWbnrY=
MIME-Version: 1.0
Received: by 10.91.135.1 with SMTP id m1mr8509465agn.162.1311191267228; Wed,
	20 Jul 2011 12:47:47 -0700 (PDT)
Received: by 10.91.12.2 with HTTP; Wed, 20 Jul 2011 12:47:47 -0700 (PDT)
In-Reply-To: <772ABCD3-A957-469A-A2AB-F2C27A0A5F0C@dominion.thruhere.net>
References: <1310736077.3805.37.camel@phil-desktop>
	<CADkTA4OYB0mch1SRSgidwGfZiWBeBuaWKH1BU1NgF9jPVa1Niw@mail.gmail.com>
	<1310742175.30326.1.camel@phil-desktop>
	<CADkTA4MoCmtKypORoGvShciAgiFsOJFLmSiAQiVdAxLAYKkyHQ@mail.gmail.com>
	<CADkTA4MetjKoZfS7gcKSm9wm3iQZoxaJPqmrJ6KBOWsXF1QVSQ@mail.gmail.com>
	<772ABCD3-A957-469A-A2AB-F2C27A0A5F0C@dominion.thruhere.net>
Date: Wed, 20 Jul 2011 15:47:47 -0400
Message-ID: <CADkTA4Mpg3bQfyq+NmhK2=ySM+9-7eQzj_HueMirrcV4rs2bWA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernels
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
X-List-Received-Date: Wed, 20 Jul 2011 20:22:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2011 at 11:45 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 20 jul 2011, om 17:42 heeft Bruce Ashfield het volgende geschreven:
>
>> On Fri, Jul 15, 2011 at 11:36 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>> On Fri, Jul 15, 2011 at 11:02 AM, Phil Blundell <philb@gnu.org> wrote:
>>>> On Fri, 2011-07-15 at 09:51 -0400, Bruce Ashfield wrote:
>>>>> On Fri, Jul 15, 2011 at 9:21 AM, Phil Blundell <pb@pbcl.net> wrote:
>>>>>> The other day I was working on a BSP layer for a fairly generic i586
>>>>>> system and I was struck by the fact that we don't appear to have any
>>>>>> vanilla kernel recipes in oe-core. =A0I had sort of expected that, t=
o get
>>>>>> a standard bzImage out, I would just need to ship an appropriate
>>>>>> defconfig in my layer and everything else would "just work".
>>>>>
>>>>> Hmm. Perhaps it isn't documented clearly enough as such, but the linu=
x-yocto
>>>>> kernel base can work in this mode, since that was a design goal of
>>>>> 1.0.
>>>>>
>>>>> You pick a branch, throw in a config fragment (or defconfig if you re=
ally
>>>>> want) =A0and build. The base branches in the tree are generic enough =
to
>>>>> sort a range of boards out of the box, and should form a base.
>>>>
>>>> Okay, cool. =A0I'll give it a go and see how I get on.
>>>>
>>>> Is there a description anywhere of what the functional differences are
>>>> between the code in linux-yocto git and the upstream kernel.org tree?
>>>
>>> It varies, and the variables are many, so I can answer this in several =
ways.
>>
>> Following up on my own email. I'm just about to push out the 3.0
>> kernel support / changes, so I'm seeing the light at the end of the tunn=
el
>> and recalled that this is still hanging a bit.
>>
>> Is there anything tangible you wanted me to do here ? =A0Create an examp=
le ?
>> Write a short howto =A0.. or something else ?
>
> A guide to make your own setup that isn't based on linux-yocto but which =
does work with the linux-yocto bbclass?

That's reasonable. Once I get the imminent kernel uprev out the door, I'll
focus on something along these lines.

Bruce

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


