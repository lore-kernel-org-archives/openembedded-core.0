Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA44601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:25:28 +0000 (UTC)
Received: by labbd9 with SMTP id bd9so79870375lab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cJE9NbQNDOZCUTJoSWM0QlrIZD7/kmooz6qOSw++Q/k=;
	b=jVvpMYAbve0qEeMPsvmXD5d7X6thKH2NlhQxRlKh0DQqgGR/3YBrI6bijb6583xCqZ
	IhRCpRD+OBvTVUQw/gdV9mqoi+fVYlozMw9code7VxqDDKEL22/tVruF9z2ya8bqbs0t
	XR1MTj6XGflP51nCap+ZXcblAjKYDGOphLr3rNESliesMNVF9P5IIOZ6GJ9i1BqlDkTe
	MmNYStSFv4qVflv1qMEdOXR5Eimvn5roDcsPUox+iZvuPzKbf4bvZi1j+4LMhYSqNBeX
	4bWMWxCbKu2cyp6fUNzOepBwMETsC+9bOxKipUCBb7Y15B4qZkOtQGBHjlS8Zftw1KBY
	vZQA==
MIME-Version: 1.0
X-Received: by 10.152.22.4 with SMTP id z4mr12325331lae.14.1432135528489; Wed,
	20 May 2015 08:25:28 -0700 (PDT)
Received: by 10.152.90.230 with HTTP; Wed, 20 May 2015 08:25:28 -0700 (PDT)
In-Reply-To: <CAOMwXhNO_NQLCdNGU3SSvoeV_C4+m5w3=9hydiMQhq-=W_kt5A@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
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
Date: Wed, 20 May 2015 17:25:28 +0200
Message-ID: <CAC1BbcRo+NBR-b-bpc0kEx77HVTCj-TkjNpyB_r1fXpRvuLtgQ@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
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
X-List-Received-Date: Wed, 20 May 2015 15:25:28 -0000
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 17:20, Laszlo Papp <lpapp@kde.org> wrote:
> On Wed, May 20, 2015 at 4:17 PM, Bernhard Reutner-Fischer
> <rep.dot.nop@gmail.com> wrote:
>> On 20 May 2015 at 17:09, Laszlo Papp <lpapp@kde.org> wrote:
>>> On Wed, May 20, 2015 at 4:07 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>>
>>>> On 20 May 2015 at 16:02, Laszlo Papp <lpapp@kde.org> wrote:
>>>>>
>>>>> On a second thought: is even worse now than that, our code has to
>>>>> handle _three_ different scenarios:
>>>>>
>>>>> 1) Desktop.
>>>>> 2) Embedded without Yocto or embedded with old Yocto.
>>>>> 3) Embedded with new Yocto.
>>>>>
>>>>> I do not get excited about this.
>>>>
>>>>
>>>> Do as the documentation says in your distro and you have one scenario.
>>>
>>> That means compromising security. I am now looking for the ideal case
>>> in the future. What is wrong about dropping the privileges in busybox
>>> for undedicated processes without creating this separation?
>>>
>>> That would combine the convenience with security, wouldn't it?
>>
>> We already do that. Since June 2002. version 0.60.4
>
> Then I cannot understand the incompatible change. If the privilege is
> dropped early and the code is well-understood, then what exactly was
> being solved in here for the price of incompatibility and more complex
> environments across projects?
>
> But in any case, if BUSYBOX_SPLIT_SUID=0 helps me with being
> compatible while it still drops the privileges properly as intended by
> busybox upstream, I guess I can go for that. I am yet to understand
> the "certain users do not follow it" part. What exactly?

Certain users don't want to risk bugs in the code before privs are dropped.
The only way to make them happy is to split the binary into two, a suid
one a a nosuid one.

