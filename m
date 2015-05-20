Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f51.google.com (mail-vn0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 21EC5601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:58:31 +0000 (UTC)
Received: by vnbg129 with SMTP id g129so3876022vnb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ORpr9LYbDmoOsH1A5ntamVImpeIkkMz3EWpqCOk/3cM=;
	b=ctCmj+6TtC04zEEPvzJ1c31X2wByPIwP9RPi0cbxmlaUXeySpg7d3o4LEjL3ZjIVSz
	vaesqDiYouBSbLy/knIQTZX/ZzdJxH26QDCcnz46c/9m4Bqklm6zptK64KxI9k990Bad
	xxn0XXAI3LKk9/e3MVSFo50R7SLUG8HqlV67PN73BZMOSafLtwnyTRErX6BlpZx7q2Nr
	3nyG8mgmSXljoBlxveA3xcqOuOGtUNZxECQWen7yGm68T4bs6fxMjYk6htkdSbOYeFz7
	HGT/zim1mtjxq4TJgF7WIA8I9becb0R0SXrKbYC1l6biA0XSfPsRnM/LLnkvhNycKj8P
	Kxwg==
X-Gm-Message-State: ALoCoQlgTlIsyiblC+MFJoBE+d0jkYYJ241WKRz41vOPjOo2wd7jR8yIGPDJU44jsdU//1J7AAbN
MIME-Version: 1.0
X-Received: by 10.52.114.42 with SMTP id jd10mr34053942vdb.90.1432137512203;
	Wed, 20 May 2015 08:58:32 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Wed, 20 May 2015 08:58:32 -0700 (PDT)
In-Reply-To: <DB5D6EDE-32C8-43E9-8105-15624243E3E1@gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
	<CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
	<CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
	<CAOMwXhP-fdD2SjRrOFNR-aS7Caa30sxiC-Js_Jr8B5_+Q8uHow@mail.gmail.com>
	<CAJTo0Lb5owzy0iq6xojbr6a20_VKm4JidZO=H48hLdqnSx5Udw@mail.gmail.com>
	<CAOMwXhOG9=fraTJfnuoWUY=e6ZwATRCKHOmUvTerz7m+08T_sg@mail.gmail.com>
	<CAOMwXhMWtUxfdN_+dy-vYOVtQvL8sknTDxyAbfcygML2idYJsA@mail.gmail.com>
	<CAJTo0LbAzuA6m6bvZG5oOhqwGKavxh=enywV4MzoHmONAOYUTA@mail.gmail.com>
	<CAOMwXhNkjpH-jQS=c0RkPyGVQ4D3JCXAyRmrWckr3XcYwf9jgA@mail.gmail.com>
	<CAC1BbcTWajWUmkPAvjOT_WPhR3z1EhU0QKfcc3Y7Z4F7cARc0Q@mail.gmail.com>
	<CAOMwXhNO_NQLCdNGU3SSvoeV_C4+m5w3=9hydiMQhq-=W_kt5A@mail.gmail.com>
	<CAC1BbcRo+NBR-b-bpc0kEx77HVTCj-TkjNpyB_r1fXpRvuLtgQ@mail.gmail.com>
	<CAOMwXhPZCsbfJa1CmiRbuHfXkHBTfEER7zJMxUa2riEevwQjAg@mail.gmail.com>
	<DB5D6EDE-32C8-43E9-8105-15624243E3E1@gmail.com>
Date: Wed, 20 May 2015 16:58:32 +0100
X-Google-Sender-Auth: 7MVdnC3mKd22FpRvaK1ziN1cKA4
Message-ID: <CAOMwXhNugy4yR=P8twATp6oYjr4vr71u_NKrGAnzDq6QoSgVCA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox: passwd: applet not found
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
X-List-Received-Date: Wed, 20 May 2015 15:58:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 20, 2015 at 4:48 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On May 20, 2015 5:36:55 PM GMT+02:00, Laszlo Papp <lpapp@kde.org> wrote:
>>On Wed, May 20, 2015 at 4:25 PM, Bernhard Reutner-Fischer
>><rep.dot.nop@gmail.com> wrote:
>>> On 20 May 2015 at 17:20, Laszlo Papp <lpapp@kde.org> wrote:
>>>> On Wed, May 20, 2015 at 4:17 PM, Bernhard Reutner-Fischer
>>>> <rep.dot.nop@gmail.com> wrote:
>>>>> On 20 May 2015 at 17:09, Laszlo Papp <lpapp@kde.org> wrote:
>>>>>> On Wed, May 20, 2015 at 4:07 PM, Burton, Ross
>><ross.burton@intel.com> wrote:
>>>>>>>
>>>>>>> On 20 May 2015 at 16:02, Laszlo Papp <lpapp@kde.org> wrote:
>>>>>>>>
>>>>>>>> On a second thought: is even worse now than that, our code has
>>to
>>>>>>>> handle _three_ different scenarios:
>>>>>>>>
>>>>>>>> 1) Desktop.
>>>>>>>> 2) Embedded without Yocto or embedded with old Yocto.
>>>>>>>> 3) Embedded with new Yocto.
>>>>>>>>
>>>>>>>> I do not get excited about this.
>>>>>>>
>>>>>>>
>>>>>>> Do as the documentation says in your distro and you have one
>>scenario.
>>>>>>
>>>>>> That means compromising security. I am now looking for the ideal
>>case
>>>>>> in the future. What is wrong about dropping the privileges in
>>busybox
>>>>>> for undedicated processes without creating this separation?
>>>>>>
>>>>>> That would combine the convenience with security, wouldn't it?
>>>>>
>>>>> We already do that. Since June 2002. version 0.60.4
>>>>
>>>> Then I cannot understand the incompatible change. If the privilege
>>is
>>>> dropped early and the code is well-understood, then what exactly was
>>>> being solved in here for the price of incompatibility and more
>>complex
>>>> environments across projects?
>>>>
>>>> But in any case, if BUSYBOX_SPLIT_SUID=0 helps me with being
>>>> compatible while it still drops the privileges properly as intended
>>by
>>>> busybox upstream, I guess I can go for that. I am yet to understand
>>>> the "certain users do not follow it" part. What exactly?
>>>
>>> Certain users don't want to risk bugs in the code before privs are
>>dropped.
>>> The only way to make them happy is to split the binary into two, a
>>suid
>>> one a a nosuid one.
>>
>>OK, well, in that case, the question is: why is it not led by busybox
>>upstream? Currently, busybox downstream projects can call this
>>anything. At least, some standard way would be nice, wouldn't it?
>
> The logic where to split is upstream to attempt to have a stable, maintained interface at least.
> I do not want 2 binaries myself. If there is an attack-vector in the part before dropping privileges then I want to have it fixed.
>
> You can ask Denys if he wants to do the 2 binary nonsense upstream, but I will not commit such a thing, fwiw.

Well, I understand and appreciate that opinions vary, but if busybox
had shipped 3 binaries at the end of the build processes, then their
naming would be "standard" led by busybox upstream. Currently, there
is no way to standardize it if Yocto thinks it should be called
busybox.suid and e.g. (imaginary example) buildroot thinks it should
be called suid.busybox. This would be less than ideal if my software
has to work with both.

Yes, Denys would need to be convinced for this, but for the time
being, I do not have enough time to get it through.

Anyway, thank you for your replies. I deem them helpful and prompt.

