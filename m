Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C52C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 17:21:44 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.10259.1666804899739446949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 10:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29QHKYS7021079;
	Wed, 26 Oct 2022 12:20:34 -0500
Message-ID: <4070adb4-bfb0-9d96-2193-c8f8386383e9@kernel.crashing.org>
Date: Wed, 26 Oct 2022 12:20:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, Khem Raj <raj.khem@gmail.com>,
        Kai Kang <kai.kang@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20221018230820.2385167-1-raj.khem@gmail.com>
 <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
 <171F65F5948858B5.6129@lists.openembedded.org>
 <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
 <78322791-72e6-75fd-f870-1f2eb7d8e4f6@kernel.crashing.org>
 <CANNYZj_KT77PhQtPd3gTT4J9RWZNnY0UgvH_PmOZXNs+yewM6Q@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CANNYZj_KT77PhQtPd3gTT4J9RWZNnY0UgvH_PmOZXNs+yewM6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 17:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172165



On 10/26/22 11:03 AM, Alexander Kanavin wrote:
> On Wed, 26 Oct 2022 at 16:35, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>> (I just saw this, so a little late on the reply, but..)
>>
>> mesa-gl is ABSOLUTELY still being used.  It's needed for libmali usage.  Not
>> everyone wants to use lima support for graphics.
>>
>> It was broken into two separate packages so that is was VERY clear if you were
>> using mesa for 'everything' (mesa), or mesa JUST for 'gl' (not gles).
> 
> Okay, I'm not going to propose this, but can you clarify, what is the
> current use for 'gl'? Is it just opengl 3d in standalone x server
> based systems (which is slowly dying), or is there something else to
> it?

Anything that needs "OpenGL", i.e. Wayland/Weston, X11, Chromium, etc etc etc. 
These all end up linking to a combination of libmali and mesa-gl.

Pretty much anything that depends on 'virtual/gl' (vs virtual/libgles1,2,3). 
libmali provides virtual/libgles1 and virtual/libgles2 and a few other things 
that meta-gl doesn't.

libmali also doesn't include the DRM/DRI parts.  This comes from mesa-gl.

--Mark

> Alex

