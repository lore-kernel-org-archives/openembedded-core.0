Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id C181E748EE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 14:03:56 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id 126-v6so7699687oig.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LPb5XISDmPqyTdghSh9iGSq3fmballIkqImMSp5H6II=;
	b=w9PAeWSzFsKsN6r4sEZ4LrYaVMFzDnE6qx1rI38MBcaMcCeDEpwGxTtKxnyH4cBpp2
	uwrPmxU8ESHKAopNX7u7s7Z+LOaUEAs7AGMBZvRjBdR0gMtLmpk2I/pMuemfhjL/8tDt
	91NJZpbawXAwDsKvnWGwUA2AsBk3V2RSt4Pq0Pu9rpJEciF2KrNRxYzD7M7hHNhkaTUD
	NqxDFZXSxJXPWwOr+259QOLT6i8uBihZsyGFHL8XEb7IG/W5W+Hp6QGm0YPpBqS+iYIi
	15u4hJnKtAnIHt+TaLnIRqEuVwa5OAw5UTu0epgxGWBvaSglSUVJvCzoGBqpCAX2EThx
	D/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LPb5XISDmPqyTdghSh9iGSq3fmballIkqImMSp5H6II=;
	b=QVmAM0zVYEA9lWuwhZOoEq/82lny3ytK70Oh4wyxZ3sqgD7qEjxerGYvMoxGHAhxKC
	kONSwegBwOAGwwDqzAntzFbTBwjEVBAj2KdRiO+MNuHfzAa91Vjku7NzCDMtyPZ0GYL5
	bHR0I3J25UeSPfv0Y3WvZUNot6Ay2AB4EL8H85E/0yazguHFuQycfxTViuU8H4p1X7Xl
	gQYnE39EuWDDRUkjQz1/kAH7C16lXPKAj6p5dxGBY5i98RxATA4b3Rs5CREYorDCIO6q
	ILrmgk6k6NardRc2aMf0nfXAhPZiTP9qG+D3cH4jF/sf5psU3ABMtzcjgBnndLSmUT+J
	J1rg==
X-Gm-Message-State: ALQs6tC6EqFhHTAocaiiIs2Dw6XDXs/7ZFumRgzP+EGgvlSAfHwVOHUn
	PqPOXSDWBluxafFNRbbQKE4k7AO6b8rplFsN6E8K5A==
X-Google-Smtp-Source: AIpwx484pmnCYnctBBLsG+/SYr3YkLgHlbEupzoaTL2Pic7kaTj4Kt6wRQO8BL9jBLY4qJXEjugoRDrK3SI3x1Yt17g=
X-Received: by 2002:aca:d09:: with SMTP id 9-v6mr6302798oin.170.1523282637205; 
	Mon, 09 Apr 2018 07:03:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Mon, 9 Apr 2018 07:03:36 -0700 (PDT)
In-Reply-To: <CAJTo0LbnJaUaG4BVX9u9jEiFm4zCP0mqgUOPpUsP0E2jSj8wAw@mail.gmail.com>
References: <1522869935-31522-1-git-send-email-tom.hochstein@nxp.com>
	<1522936553.11431.425.camel@linuxfoundation.org>
	<AM5PR0402MB28170F53C366ED380DB78674E2B90@AM5PR0402MB2817.eurprd04.prod.outlook.com>
	<CAJTo0LbnJaUaG4BVX9u9jEiFm4zCP0mqgUOPpUsP0E2jSj8wAw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Apr 2018 15:03:36 +0100
Message-ID: <CAJTo0Lazigp4EBPgski7uPRTE9FTFAR=pKGBRyP1AUqi1ZZLzQ@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Add recommended modules to nativesdk install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2018 14:03:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Carried on thinking after sending this and I now think that in a SDK
we probably want to enforce all-or-nothing and this is the easiest
way.

Can you expand the commit message so the rationale doesn't get lost?

Ross

On 9 April 2018 at 14:54, Burton, Ross <ross.burton@intel.com> wrote:
> That's definitely a hack.  If SDKs should contain Python then install
> python3 (which will install -core and -modules), if not then don't
> install it.  The corner-case is a SDK which though dependencies
> installs half a Python, in which case I'd say you should just
> explicitly add all of Python.
>
> Ross
>
>
>
> On 7 April 2018 at 16:37, Tom Hochstein <tom.hochstein@nxp.com> wrote:
>> A colleague pointed out that what we installed in the SDK for python 3 w=
as not functional, and that a minimal set of modules was required.  I'm not=
 an expert, but I found a similar line in the python 2 recipe and thought i=
t might be what was needed here.
>>
>> Tom
>>
>> -----Original Message-----
>> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
>> Sent: Thursday, April 5, 2018 8:56 AM
>> To: Tom Hochstein <tom.hochstein@nxp.com>; openembedded-core@lists.opene=
mbedded.org
>> Subject: Re: [OE-core] [PATCH] python3: Add recommended modules to nativ=
esdk install
>>
>> On Wed, 2018-04-04 at 14:25 -0500, Tom Hochstein wrote:
>>> The python3 installation in the SDK did not include the minimum set of
>>> modules.
>>>
>>> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>>> ---
>>>  meta/recipes-devtools/python/python3_3.5.5.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb
>>> b/meta/recipes-devtools/python/python3_3.5.5.bb
>>> index d458d32..f893b84 100644
>>> --- a/meta/recipes-devtools/python/python3_3.5.5.bb
>>> +++ b/meta/recipes-devtools/python/python3_3.5.5.bb
>>> @@ -211,6 +211,7 @@ py_package_preprocess () {
>>>
>>>  # manual dependency additions
>>>  RPROVIDES_${PN}-modules =3D "${PN}"
>>> +RRECOMMENDS_${PN}-core_append_class-nativesdk =3D " nativesdk-python3-
>>> modules"
>>>  RRECOMMENDS_${PN}-crypt =3D "openssl"
>>>  RRECOMMENDS_${PN}-crypt_class-nativesdk =3D "nativesdk-openssl"
>>
>> This doesn't look correct, if you want the SDK to contain all python mod=
ules, surely you'd just add nativesdk-python3-modules rather than forcing t=
his everywhere?
>>
>> Cheers,
>>
>> Richard
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

