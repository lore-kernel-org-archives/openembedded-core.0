Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id ECEF96BB41
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 20:55:38 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id u14so2160038lbd.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=C/utdIkPIYWxDdlAmexJxhRsfzltTcDidBoU9MYnT3A=;
	b=juOlR+u7jiXbTUe0R0N1yusscUWYBovhdIASZbUPMBKKRGtScvhBuqeKodIL59ACkX
	QUEj/nPzi66a9koutLbu2aSBwoBI3z4ogOmrasiAutz+Z46ATqirE97O197rnvrd8Vm3
	NPQLL5W/5hID7DBZfk2iiYZj7OhcKMLSydb+FEY/umkqSjqWhGFpV0n/oaImkp4DWh04
	+xS3yu+cKVNQeBU4LAYoSS035jfqJvO3t6TNrCPMMu6L2uL0p2jhual22a3ob8HesVEW
	Yw5tBNyAzigF1io0R1C7gYWYPQS6hiKQZ0/xPvN/e9CdJW7O58mDVEbpvQ3JfP7iQmkH
	WY8w==
MIME-Version: 1.0
X-Received: by 10.152.218.103 with SMTP id pf7mr2942525lac.40.1394139338366;
	Thu, 06 Mar 2014 12:55:38 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Thu, 6 Mar 2014 12:55:38 -0800 (PST)
In-Reply-To: <CABcZANkBMim2vo9+ijWrrEHC6UbO0Ag=noFzD8z30tv+fvT5mQ@mail.gmail.com>
References: <1394129443-1427-1-git-send-email-kergoth@gmail.com>
	<CADkTA4M96iZh48Hieup38Gwf9DB24PgvKw7Uw0WVtaGLBwByFA@mail.gmail.com>
	<CABcZANkBMim2vo9+ijWrrEHC6UbO0Ag=noFzD8z30tv+fvT5mQ@mail.gmail.com>
Date: Thu, 6 Mar 2014 15:55:38 -0500
Message-ID: <CADkTA4NczUwU8i7cGWvfmsib2ndrt_bVOWN+eTwTEsTiRJedjQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: fix diffconfig/kernel_configme breakage
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
X-List-Received-Date: Thu, 06 Mar 2014 20:55:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 6, 2014 at 1:45 PM, Chris Larson <kergoth@gmail.com> wrote:
>
> On Thu, Mar 6, 2014 at 11:40 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Thu, Mar 6, 2014 at 1:10 PM, Christopher Larson <kergoth@gmail.com>
>> wrote:
>> > +addtask kernel_configme after do_patch
>> > +
>>
>> linux-yocto.inc already has:
>>
>> addtask kernel_configme before do_configure after do_patch
>>
>> So we should be able to avoid adding the task to the class, right ? I
>> suppose the task could move into the class, but it was always a per
>> recipe include in the past, I just don't want any unintended issues to
>> happen from the double task add.
>
>
> It depends on whether there's a need to support the use of the class without
> the .inc. If not, there are probably a number of bits in the .inc that
> belong in the class :) But it's never harmful to have multiple addtask
> lines, it just adds the specified deps to the existing task. I just wanted
> to make sure one couldn't get into a state where do_diffconfig depends on a
> function which isn't a task, as I would expect (though couldn't say with
> 100% certainty) that bitbake would yell about that :)

Works for me. Thanks for the explanation.

Bruce

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

