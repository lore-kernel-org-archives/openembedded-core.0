Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWbOS-0003z8-US
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:43:28 +0200
Received: by wwb17 with SMTP id 17so5315976wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=n9/Noom6qRZh3xrVXy4k5/ShFyzG5fK968IU8WqgOe4=;
	b=k8/YFEd5Z7qfZRtK/uI/YnLYBz86XexSj0QHUDegmj6XCvV+UIXz9fHWse+yITezr6
	htnLTq/nEVIFRDOVAQw6l2f1yzK4MZQk02kmRMpjljOsJRpaoWPMyVMipDPJubOQmP0o
	hwcVDNchkko0ZFz/HW6lpIuQgqiWkYYRfNgKc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=NyDTwSPZoFrZCY/bAi+5SCjiigBQxiM0i7Sc/6Uozl8Uj3qCOzRZmEMRq3ANOBdzKe
	uGfv7On3Sw/2cuVfGAPHxBv1p9pgYCZ8Z1mlEUocDQXBKkounjzF83WQA1RXypMMKWph
	B9FGB8NPG8KaQwevL+i3JoOiCH/gZiNQuNH7U=
Received: by 10.216.53.203 with SMTP id g53mr6999044wec.13.1308087603201; Tue,
	14 Jun 2011 14:40:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.37.197 with HTTP; Tue, 14 Jun 2011 14:39:33 -0700 (PDT)
In-Reply-To: <BAF9DAD6-B3A3-4256-AB14-162020A3AC51@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<BANLkTindy9m5Vd7B8ccC9RnkhaC9KbscQA@mail.gmail.com>
	<BAF9DAD6-B3A3-4256-AB14-162020A3AC51@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 14:39:33 -0700
Message-ID: <BANLkTikB5jamUMMrL3jw1cqj-_sARORaTQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Tue, 14 Jun 2011 21:43:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2011 at 2:33 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 14 jun 2011, om 23:32 heeft Khem Raj het volgende geschreven:
>
>> On Tue, Jun 14, 2011 at 2:24 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> =C2=A0meta/classes/allarch.bbclass | =C2=A0 =C2=A05 +++--
>>>> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbcla=
ss
>>>> index e3ac392..b9ba28b 100644
>>>> --- a/meta/classes/allarch.bbclass
>>>> +++ b/meta/classes/allarch.bbclass
>>>> @@ -2,9 +2,10 @@
>>>> =C2=A0# This class is used for architecture independent recipes/data f=
iles (usally scripts)
>>>> =C2=A0#
>>>>
>>>> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
>>>> +# before we reset it
>>>> +FEED_ARCH :=3D ${BASE_PACKAGE_ARCH}
>>>> =C2=A0BASE_PACKAGE_ARCH =3D "all"
>>>> -PACKAGE_ARCH =3D "all"
>>>> -
>>>> =C2=A0# No need for virtual/libc or a cross compiler
>>>> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
>>>
>>> This is a *really* bad idea. An "all" package should have no need to se=
t
>>> architecture specific values into FEED_ARCH.
>>>
>>> Just for those not following IRC, the problem is Angstrom adds FEED_ARC=
H
>>> to OVERRIDES. Adding "all" to overrides turns out to do nasty things to
>>> classes like rm_work with "_all" in the function names.
>>>
>>> I'd suggest that various machines should start adding things like armv7=
a
>>> to ${MACHINEOVERRIDES} which has a much more clearly defined scope and
>>> that FEED_ARCH should quietly die ;-).
>>
>> Would it make sense to add TARGET_SUBARCH variable ?
>
> and have it mean the same as BASE_PACKAGE_ARCH?

May be in some cases, but it wont be associated with packaging

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


