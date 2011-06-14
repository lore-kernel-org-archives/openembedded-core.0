Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWcqb-0005sQ-Ps
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 01:16:37 +0200
Received: by wwb17 with SMTP id 17so5359565wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 16:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=ycStmiO1WQ97ve8IEzMkSHr8vx5aV3lFjbIiXC2EUQE=;
	b=CeqOajWJ0WZiI3xWgeruS3ooqHt/MMFwRMDq26gcjDAKzs6f9qLwfhgdPYQ7cTvRip
	ltC7TU+5lO0srZ682gQMlDYEgho1AoUQ7ZoODl5lbxwtO70KZqnJRlarWP/x40KTEpgb
	X4zaJWj5jz2cRUICnvbjtpxEegIL6n623IaRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=nE67sSyNRrhtNUbDPrdGmgScUbuWN2mAUlPhJSi3tGhtFFRcVyzOFjHlTKAibKWejl
	n/wHuk5elaDoJj4NtyghqKdlH4gnjYIC0LD2CuM3Ou3oVvPx7DsRLL2GNISseochXeWH
	Flix+DHzum/mnRrGVq+M+wUjyhQUQp1Zd6gjw=
Received: by 10.216.205.26 with SMTP id i26mr7182502weo.58.1308093192097; Tue,
	14 Jun 2011 16:13:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.37.197 with HTTP; Tue, 14 Jun 2011 16:12:42 -0700 (PDT)
In-Reply-To: <8C2617DC-2693-42A3-810B-C3A516DB7360@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
	<BANLkTi=Kk7J-ZAQuPkC5LNAnxZSAzwtvOg@mail.gmail.com>
	<8C2617DC-2693-42A3-810B-C3A516DB7360@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 16:12:42 -0700
Message-ID: <BANLkTimY-6iNGoKeeZ7Xs0rswKSZUi3xSQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Jun 2011 23:16:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2011 at 2:44 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 14 jun 2011, om 23:40 heeft Khem Raj het volgende geschreven:
>
>> On Tue, Jun 14, 2011 at 2:32 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>
>>> Op 14 jun 2011, om 23:24 heeft Richard Purdie het volgende geschreven:
>>>
>>>> On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>> meta/classes/allarch.bbclass | =C2=A0 =C2=A05 +++--
>>>>> 1 files changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbcl=
ass
>>>>> index e3ac392..b9ba28b 100644
>>>>> --- a/meta/classes/allarch.bbclass
>>>>> +++ b/meta/classes/allarch.bbclass
>>>>> @@ -2,9 +2,10 @@
>>>>> # This class is used for architecture independent recipes/data files =
(usally scripts)
>>>>> #
>>>>>
>>>>> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
>>>>> +# before we reset it
>>>>> +FEED_ARCH :=3D ${BASE_PACKAGE_ARCH}
>>>>> BASE_PACKAGE_ARCH =3D "all"
>>>>> -PACKAGE_ARCH =3D "all"
>>>>> -
>>>>> # No need for virtual/libc or a cross compiler
>>>>> INHIBIT_DEFAULT_DEPS =3D "1"
>>>>
>>>> This is a *really* bad idea. An "all" package should have no need to s=
et
>>>> architecture specific values into FEED_ARCH.
>>>>
>>>> Just for those not following IRC, the problem is Angstrom adds FEED_AR=
CH
>>>> to OVERRIDES. Adding "all" to overrides turns out to do nasty things t=
o
>>>> classes like rm_work with "_all" in the function names.
>>>
>>> So why don't we just set PACKAGE_ARCH =3D all in allarch.bbclass and no=
t touch BASE_PACKAGE_ARCH and FEED_ARCH?
>>>
>>
>> because there are some machines conf files which use BASE_PACKAGE_ARCH e=
.g.
>> tune-xscale.inc
>>
>> BASE_PACKAGE_ARCH =3D "${@['armv5teb',
>> 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D 'le']}"
>>
>> PACKAGE_EXTRA_ARCHS =3D "${@['armeb armv4b armv4tb armv5teb', 'arm armv4
>> armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) =3D=3D 'le']=
}"
>>
>> and this does not get evaluated properly then
>
> But that wouldn't matter in the scope of allarch, though?

SITEINFO_ENDIANESS  =3D "${@siteinfo_get_endianess(d)}"

def siteinfo_get_endianess(d):
       info =3D get_siteinfo_list(d)
       if 'endian-little' in info:
              return "le"
       elif 'endian-big' in info:
              return "be"
       bb.error("Site info could not determine endianess for target")


and
get_siteinfo_list has this

       targetinfo =3D {\
               "allarch-linux":           "",\

hence siteinfo_get_endianess ends up with

bb.error("Site info could not determine endianess for target")

may be we need to differentiate with None return and empty string
return along with 'endian-little' and 'endian-big'
or may be add another option called 'endian-neutral'

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


