Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id E76B260168
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:13:59 +0000 (UTC)
Received: by labbd9 with SMTP id bd9so79346798lab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=A0v5NQRAHc2FhxEX3CQNZvPwGm0gOaxnPki+eTBPsT0=;
	b=UyGEvIJB7qxwkYTx/KSGby6r+OHLInfuxQ6xV1Z/stw81JP5dQypuTz5tHFiNHffV+
	/gUUwQkCl0fvxpCVeDbdyobfV/zXkiyGshVCqT1B8OvkwMQ9X0Sxu/XkYykNDlawaJ6e
	OqN4ukVlRCqx+J2ANB5rHkzNK+/uk6JNK/pddTIgiZvMR7awN2DWbDn/rqHvoZEC8DYX
	JXYkAse+6fzRFK6a4JFriWXzHdFF3vOO0CYYRBHed94SOknkw2WkJMCxAU5d50wVZ+ag
	IOl7+SO6HcibY3TIwzoBfktDZBSDXPIaKweeN51wA6HCRIbU4jPRld0URXHaD7CIMSuH
	iqkQ==
MIME-Version: 1.0
X-Received: by 10.112.118.49 with SMTP id kj17mr14804584lbb.62.1432134839795; 
	Wed, 20 May 2015 08:13:59 -0700 (PDT)
Received: by 10.152.90.230 with HTTP; Wed, 20 May 2015 08:13:59 -0700 (PDT)
In-Reply-To: <CAOMwXhMWtUxfdN_+dy-vYOVtQvL8sknTDxyAbfcygML2idYJsA@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
	<CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
	<CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
	<CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
	<CAOMwXhP-fdD2SjRrOFNR-aS7Caa30sxiC-Js_Jr8B5_+Q8uHow@mail.gmail.com>
	<CAJTo0Lb5owzy0iq6xojbr6a20_VKm4JidZO=H48hLdqnSx5Udw@mail.gmail.com>
	<CAOMwXhOG9=fraTJfnuoWUY=e6ZwATRCKHOmUvTerz7m+08T_sg@mail.gmail.com>
	<CAOMwXhMWtUxfdN_+dy-vYOVtQvL8sknTDxyAbfcygML2idYJsA@mail.gmail.com>
Date: Wed, 20 May 2015 17:13:59 +0200
Message-ID: <CAC1BbcTQN4p4OeZ=7gU0wBdakLFPDv1WWcNMC0s47uX0McMaEA@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 May 2015 15:14:02 -0000
Content-Type: text/plain; charset=UTF-8

[Cc'ing Chen who invented it for the most part]

On 20 May 2015 at 17:02, Laszlo Papp <lpapp@kde.org> wrote:
> On Wed, May 20, 2015 at 3:58 PM, Laszlo Papp <lpapp@kde.org> wrote:
>> On Wed, May 20, 2015 at 3:54 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> On 20 May 2015 at 15:50, Laszlo Papp <lpapp@kde.org> wrote:
>>>>
>>>> Currently, I do not see any simple way without #ifdef jungle in the
>>>> code around to it. It is not nice.
>>>
>>>
>>> Looking at the busybox recipe reveals this:
>>>
>>> # Whether to split the suid apps into a seperate binary
>>> BUSYBOX_SPLIT_SUID ?= "1"
>>>
>>> Just remember that the suid apps were being split out for good security
>>> reasons.  There's no need for sed to have suid rights!

The suid rights are dropped before sed_main is entered, so the potential window
is very, very small and the affected code is pretty well understood. But we had
that argument numerous times and certain users don't follow it.

>>
>> I will not argue about security measure improvements as I agree about
>> them with you. However, I will debate the way this security measure is
>> implemented. It is distraction from the desktop world where you can
>> also use busybox and many use. Now, all of a sudden, we have to handle
>> them differently in code and scripts.
>>
>> I think a less intrusive approach to implement this could have been
>> (and probably still not late) is to fix the rights underneath and not

Can you elaborate what you imagine above?

>> by such wrappers. Such wrappers will introduce this disruption which
>> is not strictly needed. Well, you could say that if desktop
>> distributions also implement it like this, then there is no
>> disruption, but I think that is never going to happen if busybox
>> itself does not enforce it.
>>
>> I think this is not a good implementation for security to remain
>> consistent with the rest of the world. Could it be please reconsidered
>> towards another solutions?
>>
>> It is also good if one call tell me how to solve this differentiation
>> between desktop and Yocto without further code.
>
> On a second thought: is even worse now than that, our code has to
> handle _three_ different scenarios:
>
> 1) Desktop.
> 2) Embedded without Yocto or embedded with old Yocto.
> 3) Embedded with new Yocto.
>
> I do not get excited about this.

Just don't set the SPLIT thing and all is well again.

Or set CONFIG_FEATURE_INDIVIDUAL so you get a shared libbusybox with
a gazillion small binaries linked to that. Not a fancy thing to do, granted.

