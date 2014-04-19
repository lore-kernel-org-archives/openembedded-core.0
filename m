Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 45F8665D65
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 14:24:08 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 19so2158982ykq.39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zwoVuD614nwto+eUYr3Ej8QEOPLeY64OI2N1OBGcerI=;
	b=JJtPMTm2hQod7/agThc4rrCoUElg7s2FKOq3+AXziHaTtMAdn6qrBYAaTmJcC7b8Cl
	Dw32J3snihO/086qplIVbMRSfd5wuF/drqR9bjsX7UgjzzaeP8HTbWjmkH2bPKvblwCa
	rYJYIs8nwvpVEkW5q53jOIifN1FkDiUKbuX8S7kjV9qncnaBi/bAsIOQTZoFzR2/iCNr
	EeYZxzk1omPf4rXzPTN5m15LjHVyDqGwWfss60ZN3DwVHJl58K8zgz8na6gkypBQyoTL
	/OnHrhdZu/77PBfcfq/XraLQYAezWeyioquyeJy5LIdOU/nFkymUoOkAWXIR5sKkohfF
	P0MQ==
MIME-Version: 1.0
X-Received: by 10.236.168.42 with SMTP id j30mr2048261yhl.101.1397917449523;
	Sat, 19 Apr 2014 07:24:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Sat, 19 Apr 2014 07:24:09 -0700 (PDT)
In-Reply-To: <1397915046.15843.207.camel@ted>
References: <1397487085-8924-1-git-send-email-valentin.popa@intel.com>
	<534DF255.9010506@windriver.com>
	<CAP9ODKrJaQTkDeDgcvTBu9=dRLwLJo=d9mVxvOgx+PAw5iSLyw@mail.gmail.com>
	<1397915046.15843.207.camel@ted>
Date: Sat, 19 Apr 2014 11:24:09 -0300
X-Google-Sender-Auth: MsHh5RyaoH1GRDLer-FJ5h6Qk7M
Message-ID: <CAP9ODKoR38dL1rDyJc6MnXhfXBZsK0W349skzXjTMq397aXNQg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH_V3] mesa: double check for eglplatform.h
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
X-List-Received-Date: Sat, 19 Apr 2014 14:24:12 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Sat, Apr 19, 2014 at 10:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2014-04-18 at 20:38 -0300, Otavio Salvador wrote:
>> So WHAT is holding a bugfix for a regression to be merged? I am very
>> disappointed with the maintenance in the Dora branch.
>>
>> 1. a change has been added without testing other layers hosted in YP.
>> 2. it has been merged without being ran in YP AB.
>> 3. I reported the issue in the same day it has been merged
>> 4. it has been 10 days and this has not yet been reverted/fixed.
>>
>> So CAN THIS BE MERGED PLEASE?
>
> WHY HAVE YOU NOT REPLIED TO BUG 6098? I ASKED YOU SOMETHING THERE 9
> WHOLE DAYS AGO? IT IS A HIGH!!!! ITS BEEN OPEN 17 DAYS!!!!

Great! But the difference it is not a regression and happen in a
/very/ specific host setup. I think this is quite different of a
broken build for EVERY meta-fsl-arm user in the STABLE BRANCH!

Sorry but this is not the same thing.

> I happen to know you've been travelling/busy and likely haven't had
> time. Fair enough, it happens.

Yes, I arrived two days ago and been dealing with my backlog.

> I have also been travelling, any spare cycles were directed to the 1.6
> release and the beaglebone problem which was threatening to disrupt it.
> Right now its a 4 day holiday weekend in the UK. I should be out trying
> to relax, instead I'm horribly jetlagged and even better, reading all
> caps emails from you.

Sorry but Robert is the Dora maintainer so this is not an excuse. He
ought, as maintainer, put priority in such a regression.

> This is to say nothing of being a bit distracted after dropping an 80kg
> stone hearth on the end of one of my fingers a couple of weeks ago,
> fracturing it, then reacting badly to some antibiotics to add to the
> fun.

I knew it and I am happy you been better now. However as I said above
Dora is a Robert's maintained branch so I was not expecting you to be
the one fixing it...

> As it happens I merged the fix this morning before I read this, it was
> already in the queue. I'd planned to do so sooner but hadn't got around
> to it. Several of those days were looking into the regression and
> figuring out a way which fixed it, and fixed the other bug report the
> problem was solving.

Thanks.

> In answer to your questions:
>
> Its not policy to test every layer with a change in OE-Core. We do our
> best to make sure things don't break. Not every change gets run through
> the autobuilder. We do run things through the AB before a release
> though. 1.5.2 has not been released yet and this issue will get resolved
> before that happens.
>
> I do wish we've been able to act sooner, equally most of the people
> involved have various pressures on their time. We do our best.

I'd expect all merges in a stable branch would be run in AB. If this
is not the policy, it should be made as one. One of biggest strengths
of Yocto Project is the maintenance and quality of its code so I think
we need to improve our policy to avoid this to happen in future.

Cheers,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

