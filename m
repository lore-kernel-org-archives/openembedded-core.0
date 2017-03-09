Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1737E775D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 23:24:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u132so13224616wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 15:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AFSTGV719LvZHkgGIppmBp83JCvGcs8iErN8yeY3EsI=;
	b=hceoFjXYrRCht/I3cqBW6GQB9OdqSQgZ5EkwGTdKR32gJk5XLMps9Wv37pPTLtjX6u
	aexPoSCVpg/oxjGBnuG5k+cgvNBPAQeydmq8XA3WcfcqTEFXnKVjdj5ItfG1ZI3P3eGZ
	jXFNgNlAJApdUZqiL7DB8jqjvUsdqQD7VjAmN941XrrknVVcri2QcRBjw1CEjfQCOAO/
	En6U0TH3ySkVUzq4569gsN+CxcmZ7GFkEy34Z9LNnVPM42Q0OvFdADqUJz2KS7pPVorI
	dZ+qtgeniOJnPCcSAdszT9VIeCClrqiM1XtEWJueeXrjlxBYbiXuR89hkU27UFgNfMJv
	ayVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AFSTGV719LvZHkgGIppmBp83JCvGcs8iErN8yeY3EsI=;
	b=uZ8ibDF1Co2qLpRmzQbP08FdlNGRd1iSPzfYL0Fe3jcGP+judsD76nCxr0kwfiHgqx
	dHw4ajcA0gCCd0lMn6MvoXi5vA6xni+45dPQ5DF1y/uxEVD6hkYltMToQ3ubs7VOMafn
	kzgUlANBD4vpAMzdJCG2F+HReOrkYgihwlR0cn5PNlvPHZ+aRlqVWctaDizrEuk1CJBY
	c9aKwjNPc44kRWlCjIGmzzF5KV1go48AJnhVoIYwSB8g41j9NC9v0UUy0/dMzO+HYk/f
	/ZYyipb6NdHa/S4pmDW7kPwI/RoZdN8aJTYKSiCDD3MBbB6LjZ4rDmxIJNQw7ivENSr3
	qkBA==
X-Gm-Message-State: AMke39lgdWquUysTdZ/xdvLVkqaJzuCLZHP6853JD4Jd4LHAcmr/M+SZBQRaXFrYqRUqwCNnU/A/BBBVMFHepQ==
X-Received: by 10.28.224.11 with SMTP id x11mr12959712wmg.98.1489101899542;
	Thu, 09 Mar 2017 15:24:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Thu, 9 Mar 2017 15:24:59 -0800 (PST)
In-Reply-To: <20170309230940.GA3273@jama>
References: <1488836862-18218-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sr2GWjjXYBJvx+eb3Fks-PxHvFgbYf6umXM9PV+rmv5Bw@mail.gmail.com>
	<CAJ86T=VgZMNyXwd6O9UR4wmF-8afc5HMKY2=c8QxeSajsxMa7A@mail.gmail.com>
	<CAMKF1sp+Q6VX4zUWkH_JrV1THWV5oYo+LmEivz7uUiOC0Q48pQ@mail.gmail.com>
	<CA+chaQdhW4w9Uf5sgQPY8DaBMr4nT9qt4gUXkF5L-PZCc+wVFQ@mail.gmail.com>
	<CAJ86T=WueHo4NqqsWMFay4wiwyrQfwNqpVRR88M44hVj0_8vmw@mail.gmail.com>
	<20170309230940.GA3273@jama>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 9 Mar 2017 15:24:59 -0800
Message-ID: <CAJ86T=Wdd_QX6d1p7AawXfQ01L9E0Qy7BYUPwi0L5YfJTURZKQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/machine/include: enable hardfloat by default for ARMv6 and above
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
X-List-Received-Date: Thu, 09 Mar 2017 23:24:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 9, 2017 at 3:09 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Mar 09, 2017 at 12:09:51PM -0800, Andre McCurdy wrote:
>> On Thu, Mar 9, 2017 at 12:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Shouldn't we change default ARM_INSTRUCTION_SET while we're at it as well?
>>
>> Yes, that's the longer term goal. It needs to be done a little
>> carefully though - ie in a way which doesn't ever enable Thumb by
>> default for cores which only support Thumb1.
>
> Why carefully? If we assume that DISTRO maintainers will select
> DEFAULTTUNE correctly then we can assume that they will enable thumb
> only for MACHINEs which support Thumb2. I think it's smaller change for
> OE users than this already merged change of DEFAULTTUNEs.

I don't think you can assume that distro maintainers will set
DEFAULTTUNE or ARM_INSTRUCTION_SET correctly (poky certainly doesn't)
so the defaults in oe-core should be sensible (ie safe but reasonably
up to date).

> And if they decide to use thumb also for qemuarm like I do in bitbake
> world builds, then it should work as well.

Thumb1 is basically dead at this point. Even if it builds, who knows
what runtime issues might show up. Enabling Thumb1 by default in
oe-core is not something we should be doing (in my opinion anyway).

>> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=9213
>> >
>> > On Tue, Mar 7, 2017 at 12:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >>
>> >> On Mon, Mar 6, 2017 at 2:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>> >>>
>> >>> On Mon, Mar 6, 2017 at 2:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>> > On Mon, Mar 6, 2017 at 1:47 PM, Andre McCurdy <armccurdy@gmail.com>
>> >>> > wrote:
>> >>> >> Defaulting to softfp probably isn't the best choice anymore,
>> >>> >> especially as there are now ARM BSP layers which leave DEFAULTTUNE
>> >>> >> entirely up to the distro:
>> >>> >>
>> >>> >>
>> >>> >> https://lists.yoctoproject.org/pipermail/yocto/2017-February/034637.html
>> >>> >>
>> >>> >
>> >>> > I like this patch and want to clarify that it changes the default ISA
>> >>> > to thumb2
>> >>> > which we should use anyway due to size reasons and other distros use it
>> >>> > as
>> >>> > default too.
>> >>>
>> >>> No, it doesn't.
>> >>
>> >>
>> >> That's right I wanted to say to make that default while you are at it
>> >>
>> >>> The choice between ARM and Thumb(2) is made by the
>> >>> ARM_INSTRUCTION_SET variable. Adding 't' to DEFAULTTUNE simply means
>> >>> that the ARM_INSTRUCTION_SET variable will not be ignored (it's really
>> >>> a long standing bug that we ever defined DEFAULTTUNE options for ARMv6
>> >>> and above which ignore ARM_INSTRUCTION_SET, but that's a separate
>> >>> topic).
>> >>>
>> >>> > I am not sure of we should change it for armv6 though. since some armv6
>> >>> > has t1 and some has t2 so lets leave that as it is.
>> >>>
>> >>> I'm not aware of any ARMv6 cores which don't support Thumb2. Do you
>> >>> have a reference?
>> >>>
>> >>> (But again, to be clear, this commit doesn't change the default in
>> >>> terms of instruction set - all builds will still use ARM).
>> >>>
>> >>> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> >>> >> ---
>> >>> >>  meta/conf/machine/include/arm/arch-armv6.inc   | 2 +-
>> >>> >>  meta/conf/machine/include/arm/arch-armv7a.inc  | 2 +-
>> >>> >>  meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-
>> >>> >>  meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
>> >>> >>  meta/conf/machine/include/tune-cortexa15.inc   | 2 +-
>> >>> >>  meta/conf/machine/include/tune-cortexa17.inc   | 2 +-
>> >>> >>  meta/conf/machine/include/tune-cortexa5.inc    | 2 +-
>> >>> >>  meta/conf/machine/include/tune-cortexa7.inc    | 2 +-
>> >>> >>  meta/conf/machine/include/tune-cortexa8.inc    | 2 +-
>> >>> >>  meta/conf/machine/include/tune-cortexa9.inc    | 2 +-
>> >>> >>  10 files changed, 10 insertions(+), 10 deletions(-)
>> >>> >>
>> >>> >> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc
>> >>> >> b/meta/conf/machine/include/arm/arch-armv6.inc
>> >>> >> index 91f0f07..5e1f973 100644
>> >>> >> --- a/meta/conf/machine/include/arm/arch-armv6.inc
>> >>> >> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv6"
>> >>> >> +DEFAULTTUNE ?= "armv6thf"
>> >>> >>
>> >>> >>  TUNEVALID[armv6] = "Enable instructions for ARMv6"
>> >>> >>  TUNECONFLICTS[armv6] = "armv4 armv5"
>> >>> >> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
>> >>> >> b/meta/conf/machine/include/arm/arch-armv7a.inc
>> >>> >> index 5446048..bad1c27 100644
>> >>> >> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> >>> >> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv7a"
>> >>> >> +DEFAULTTUNE ?= "armv7athf"
>> >>> >>
>> >>> >>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
>> >>> >>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
>> >>> >> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >>> >> b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >>> >> index 42d8d04..4d9260f 100644
>> >>> >> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >>> >> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv7ve"
>> >>> >> +DEFAULTTUNE ?= "armv7vethf"
>> >>> >>
>> >>> >>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>> >>> >>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
>> >>> >> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc
>> >>> >> b/meta/conf/machine/include/tune-arm1136jf-s.inc
>> >>> >> index 53994ef..2cadbee 100644
>> >>> >> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
>> >>> >> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv6"
>> >>> >> +DEFAULTTUNE ?= "armv6thf"
>> >>> >>
>> >>> >>  require conf/machine/include/arm/arch-armv6.inc
>> >>> >>
>> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa15.inc
>> >>> >> b/meta/conf/machine/include/tune-cortexa15.inc
>> >>> >> index 03de602..25e99f9 100644
>> >>> >> --- a/meta/conf/machine/include/tune-cortexa15.inc
>> >>> >> +++ b/meta/conf/machine/include/tune-cortexa15.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv7ve-neon"
>> >>> >> +DEFAULTTUNE ?= "armv7vethf-neon"
>> >>> >>
>> >>> >>  require conf/machine/include/arm/arch-armv7ve.inc
>> >>> >>
>> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa17.inc
>> >>> >> b/meta/conf/machine/include/tune-cortexa17.inc
>> >>> >> index f659a62..40392f9 100644
>> >>> >> --- a/meta/conf/machine/include/tune-cortexa17.inc
>> >>> >> +++ b/meta/conf/machine/include/tune-cortexa17.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv7ve-neon"
>> >>> >> +DEFAULTTUNE ?= "armv7vethf-neon"
>> >>> >>
>> >>> >>  require conf/machine/include/arm/arch-armv7ve.inc
>> >>> >>
>> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa5.inc
>> >>> >> b/meta/conf/machine/include/tune-cortexa5.inc
>> >>> >> index 93f9ca4..1f0cda6 100644
>> >>> >> --- a/meta/conf/machine/include/tune-cortexa5.inc
>> >>> >> +++ b/meta/conf/machine/include/tune-cortexa5.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv7a-neon"
>> >>> >> +DEFAULTTUNE ?= "armv7athf-neon"
>> >>> >>
>> >>> >>  require conf/machine/include/arm/arch-armv7a.inc
>> >>> >>
>> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa7.inc
>> >>> >> b/meta/conf/machine/include/tune-cortexa7.inc
>> >>> >> index 52e06b8..52415d9 100644
>> >>> >> --- a/meta/conf/machine/include/tune-cortexa7.inc
>> >>> >> +++ b/meta/conf/machine/include/tune-cortexa7.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv7ve-neon"
>> >>> >> +DEFAULTTUNE ?= "armv7vethf-neon"
>> >>> >>
>> >>> >>  require conf/machine/include/arm/arch-armv7ve.inc
>> >>> >>
>> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa8.inc
>> >>> >> b/meta/conf/machine/include/tune-cortexa8.inc
>> >>> >> index a831bd5..8ee8de9 100644
>> >>> >> --- a/meta/conf/machine/include/tune-cortexa8.inc
>> >>> >> +++ b/meta/conf/machine/include/tune-cortexa8.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv7a-neon"
>> >>> >> +DEFAULTTUNE ?= "armv7athf-neon"
>> >>> >>
>> >>> >>  require conf/machine/include/arm/arch-armv7a.inc
>> >>> >>
>> >>> >> diff --git a/meta/conf/machine/include/tune-cortexa9.inc
>> >>> >> b/meta/conf/machine/include/tune-cortexa9.inc
>> >>> >> index 8b84e60..0cf323c 100644
>> >>> >> --- a/meta/conf/machine/include/tune-cortexa9.inc
>> >>> >> +++ b/meta/conf/machine/include/tune-cortexa9.inc
>> >>> >> @@ -1,4 +1,4 @@
>> >>> >> -DEFAULTTUNE ?= "armv7a-neon"
>> >>> >> +DEFAULTTUNE ?= "armv7athf-neon"
>> >>> >>
>> >>> >>  require conf/machine/include/arm/arch-armv7a.inc
>> >>> >>
>> >>> >> --
>> >>> >> 1.9.1
>> >>> >>
>> >>> >> --
>> >>> >> _______________________________________________
>> >>> >> Openembedded-core mailing list
>> >>> >> Openembedded-core@lists.openembedded.org
>> >>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >>
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >>
>> >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

