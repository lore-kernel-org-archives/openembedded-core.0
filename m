Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE9565CEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 03:38:49 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id s18so3167263lam.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 20:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7T0SF96he/foikxzwbh9qxBx/omfsHkcBRSfkzgIQTg=;
	b=IJmBgrdcdAB0ap/kpzZ4lrTgOn65UFJTQPZ2vMnBpvfkQdOchcMjIPW7K/Hg2MoTuf
	C5vfsBhw6ZeR7WcL+7SyVpaGSLBiAa9Gbp15n/fdytCVlUjZoHqRKLitGlAqy6Nz+UYm
	D8ysfidr/ZoC7B96cDxSnpRYZgPweWX84nQ5bNQz5weGtzggO2ecGryxMBxo/PaNMdWU
	cgsK2YpCDAP3sXQHfzRzgGGNXBJcM/i7MFAlIR0QGv2CRCMUeVSfOQrp2swivfSXrbyg
	WjwEuSLw5N4vTOL1etGNGw2iJv3j5vs+OSJInVnQv60ZHcvd/YY1pgW9SxBg/wF7iOa3
	fdGA==
MIME-Version: 1.0
X-Received: by 10.112.147.199 with SMTP id tm7mr118318lbb.92.1413776328763;
	Sun, 19 Oct 2014 20:38:48 -0700 (PDT)
Received: by 10.112.4.168 with HTTP; Sun, 19 Oct 2014 20:38:48 -0700 (PDT)
In-Reply-To: <201410200029.22491.marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-5-git-send-email-marex@denx.de>
	<CADkTA4PhjW0vDu2tDW+FzBvOSLf7YSO7Zzzr3T2XGaZMs1k5hw@mail.gmail.com>
	<201410200029.22491.marex@denx.de>
Date: Sun, 19 Oct 2014 23:38:48 -0400
Message-ID: <CADkTA4O9rZh6XiG1VoLObBpS-sEBBbhgQy-kAz4CM4yFWWEaqQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] kernel: Pull uImage generation into separate class
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
X-List-Received-Date: Mon, 20 Oct 2014 03:38:51 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 19, 2014 at 6:29 PM, Marek Vasut <marex@denx.de> wrote:
> On Monday, October 20, 2014 at 12:08:57 AM, Bruce Ashfield wrote:
>> On Sun, Oct 19, 2014 at 3:15 PM, Marek Vasut <marex@denx.de> wrote:
>> > Pull the uImage image format generation from kernel.bbclass into
>> > a separate kernel-uimage.bbclass. The recipes which now need to
>> > generate an uImage will have to inherit kernel-uimage instead of
>> > kernel class.
>>
>> The commit log doesn't tell us why. What's the benefit or functionality we
>> gain via the change ?
>
> Ah right. I will be recycling some of those functions later on in the fitImage

Yep. And that's what is missing from the commit log. As a standalone commit,
the reader is left wondering why.

> support. Also, it was suggested to me that there should be a separate class for
> each image type -- that all the image types should not be in kernel.bbclass .

Factoring code and cleanups are great .. but sometimes it is just churn. I've
never had any problems with the image code being in a single class. So if
things are broken out, it would be nice to have a technical reason or
new feature
to go along with the changes.

Bruce

>
> Does that make sense please?
>
> Best regards,
> Marek Vasut



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

