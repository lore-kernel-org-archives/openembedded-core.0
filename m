Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 07014609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 11:55:56 +0000 (UTC)
Received: by padbw4 with SMTP id bw4so149319264pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=2Jtg/9/Gm6WIEpuXviuQt9RwS0OTOxNI0rk9Pr4d9fk=;
	b=qiZYyMLmiXSY68+a2Qi9mOUvs4fHjFfsrA0tQQI5Jhjb8Y7UeO8FG4TjvW6yDC07BS
	onXQw9mrHatnB/3uJsgWG67F88vYL3HbVQTEmoMECH05a5poQagC4/u02wqOic5Wh9sW
	jHIYrSE5Kb8FChi+TiVOTGPRH3ylF0GxsIHbtAIDhCQCVY9ybAHooB3GwcWxzJcaDtYM
	RCslPpEQU/ouzr+ldcyzfnDiQbgYQX5xS2n3axYw8MoLnhXibZ7YmZqUfvTs/CsE+cbZ
	V/OOfzWJknWPydrqCiRekf6EmVpGVxNmjqKvxtac2Bwk2BRSSVNpU6et8tmI+DipUjZ1
	RGjA==
MIME-Version: 1.0
X-Received: by 10.66.165.67 with SMTP id yw3mr43430438pab.95.1431950158095;
	Mon, 18 May 2015 04:55:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Mon, 18 May 2015 04:55:58 -0700 (PDT)
In-Reply-To: <CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
Date: Mon, 18 May 2015 08:55:58 -0300
X-Google-Sender-Auth: hB3D79kBkwAz_lLZ8xFqvRBsGdw
Message-ID: <CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
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
X-List-Received-Date: Mon, 18 May 2015 11:55:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2015 at 6:00 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, May 18, 2015 at 10:01 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> On Mon, May 18, 2015 at 09:46:03AM +0200, Andreas M=C3=BCller wrote:
>>> Hi,
>>
>> Hi,
>>
>>> have seen that a while ago but had no time to take care.
>>>
>>> Since oe-core commit
>>>
>>> commit 3e760031f91fb87c3e2f62b77a117eb41164f259
>>> Author: Martin Jansa <martin.jansa@gmail.com>
>>> Date:   Wed Feb 18 15:40:35 2015 +0100
>>>
>>>     feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thum=
b suffix
>>>
>>> I get
>>>
>>> ERROR:  OE-core's config sanity checker detected a potential misconfigu=
ration.
>>>     Either fix the cause of this error or at your own risk disable the
>>> checker (see sanity.conf).
>>>     Following is the list of potential problems / advisories:
>>>
>>>     Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
>>> (cortexa9t2hf-vfp-neon).
>>>
>>> I don't understand this fully but it seems that
>>> fsl-dynamic-packagearch.bbclass would add this pkg arch but this never
>>> happens because sanity.bbclass is executed first and interrupts
>>> parsing. What I don't understand: Am I the only one having this issue
>>>o
>> I'm not using meta-fsl*, butdo you have this patch in your setup?
>> http://patches.openembedded.org/patch/90989/
>> it was discussed off-list a while ago and this change looks like result
>> of that discussion.
>>
> Have meta-fsl-arm current master in my layers. This contains a similar pa=
tch:
>
> commit bfe01a0ebde407086f4a7710ea165c6beff310d7
> Author: Max Krummenacher <max.oss.09@gmail.com>
> Date:   Mon Mar 30 23:49:32 2015 +0200
>
>     fsl-dynamic-packagearch: add all MACHINE_SOCARCH feeds
>
> Have rebased the mentionioned patch -> same result.
>
> My problem seems to be that sanity.bbclass bails out before code in
> fsl-dynamic-packagearch.bbclass is executed (and would fix). Playing
> around with layer priorities / order of layers nothing changed
> situation.

What board are you using?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

