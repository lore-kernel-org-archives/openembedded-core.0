Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 12BD8601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:48:50 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so57503113wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=BZUfa65CnWNvXnVGW/Xw1rRa+ny6tVQJjvAMlQ/utAU=;
	b=QWYFss+tnj5neVIplG6b3aU6Tp4xNqR2NXu7aEwjKxJWNaXsR5ac4fQzCyDzDzfls5
	xUo6gZMAVVdonqa7uT5amt8AQ/rhiDMw19vwsjR5b0R+9e8g51/O+1iUfXAtlvyAmfws
	a68wOi6fE+m3DwkYUDQzpkdbpe5LJLnkvOjT75jym1osKGpoTqj1lveqXGqRXI9tAQGU
	xbjrH5pNkBVb8uDhdHPawLZ8gHVFm5lFhltpOV6cn+R0GpxEWlTYJMFEcyyUm9aFTg+x
	8NVD7c/Bl+a2jpP7/eKBh9ktAhxi+1Huhip8NZOYxX1DwUu2lT8y1YZInXW+1lf0fW+O
	IZ3A==
X-Received: by 10.180.8.98 with SMTP id q2mr39232513wia.53.1432136931467;
	Wed, 20 May 2015 08:48:51 -0700 (PDT)
Received: from [10.41.180.150] (089144217150.atnat0026.highway.a1.net.
	[89.144.217.150])
	by mx.google.com with ESMTPSA id bh7sm27467898wjb.8.2015.05.20.08.48.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 May 2015 08:48:50 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAOMwXhPZCsbfJa1CmiRbuHfXkHBTfEER7zJMxUa2riEevwQjAg@mail.gmail.com>
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
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 20 May 2015 17:48:39 +0200
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <DB5D6EDE-32C8-43E9-8105-15624243E3E1@gmail.com>
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
X-List-Received-Date: Wed, 20 May 2015 15:48:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On May 20, 2015 5:36:55 PM GMT+02:00, Laszlo Papp <lpapp@kde.org> wrote:
>On Wed, May 20, 2015 at 4:25 PM, Bernhard Reutner-Fischer
><rep.dot.nop@gmail.com> wrote:
>> On 20 May 2015 at 17:20, Laszlo Papp <lpapp@kde.org> wrote:
>>> On Wed, May 20, 2015 at 4:17 PM, Bernhard Reutner-Fischer
>>> <rep.dot.nop@gmail.com> wrote:
>>>> On 20 May 2015 at 17:09, Laszlo Papp <lpapp@kde.org> wrote:
>>>>> On Wed, May 20, 2015 at 4:07 PM, Burton, Ross
><ross.burton@intel.com> wrote:
>>>>>>
>>>>>> On 20 May 2015 at 16:02, Laszlo Papp <lpapp@kde.org> wrote:
>>>>>>>
>>>>>>> On a second thought: is even worse now than that, our code has
>to
>>>>>>> handle _three_ different scenarios:
>>>>>>>
>>>>>>> 1) Desktop.
>>>>>>> 2) Embedded without Yocto or embedded with old Yocto.
>>>>>>> 3) Embedded with new Yocto.
>>>>>>>
>>>>>>> I do not get excited about this.
>>>>>>
>>>>>>
>>>>>> Do as the documentation says in your distro and you have one
>scenario.
>>>>>
>>>>> That means compromising security. I am now looking for the ideal
>case
>>>>> in the future. What is wrong about dropping the privileges in
>busybox
>>>>> for undedicated processes without creating this separation?
>>>>>
>>>>> That would combine the convenience with security, wouldn't it?
>>>>
>>>> We already do that. Since June 2002. version 0.60.4
>>>
>>> Then I cannot understand the incompatible change. If the privilege
>is
>>> dropped early and the code is well-understood, then what exactly was
>>> being solved in here for the price of incompatibility and more
>complex
>>> environments across projects?
>>>
>>> But in any case, if BUSYBOX_SPLIT_SUID=0 helps me with being
>>> compatible while it still drops the privileges properly as intended
>by
>>> busybox upstream, I guess I can go for that. I am yet to understand
>>> the "certain users do not follow it" part. What exactly?
>>
>> Certain users don't want to risk bugs in the code before privs are
>dropped.
>> The only way to make them happy is to split the binary into two, a
>suid
>> one a a nosuid one.
>
>OK, well, in that case, the question is: why is it not led by busybox
>upstream? Currently, busybox downstream projects can call this
>anything. At least, some standard way would be nice, wouldn't it?

The logic where to split is upstream to attempt to have a stable, maintained interface at least.
I do not want 2 binaries myself. If there is an attack-vector in the part before dropping privileges then I want to have it fixed.

You can ask Denys if he wants to do the 2 binary nonsense upstream, but I will not commit such a thing, fwiw.

Cheers,



