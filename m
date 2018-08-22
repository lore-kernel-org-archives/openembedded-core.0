Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5FCA7948C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 22:55:11 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id e139-v6so1699815vkf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gKwbgesYZPIObOetjIANTWnFYwGxz3hQMJv2q4joA3U=;
	b=a9VixxMQRX9ByJj04BaXZp0FrqN1blIADnu9+AY3GvUiOPMUBCfWzbtk/V0g+MKLa6
	/0Y9gzYUuIynSMo1HmdCFfuU5F02qGQ/ub9av9CNt56pVYox4GMSZQYb9BaCoyJxHucW
	EHXk06YmFOpuEbHFO1P8adtEGrzmtx2u2l1zLLhebEY/8+zk9OaNBYqRBA1SeAeUkbxt
	S9NTEkT4sVlLZDBlvrElYinNrq/DITOSLFdTPMXOJ+FYW5ns/8Sre9KhWMepw5VqjpTj
	jh0bi6muvRgq7Ap7FsrK+NjpruspiP1lVpk0uT7fV5uwNuMMzbb/X1c9IjkqxA9g0fkH
	F2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gKwbgesYZPIObOetjIANTWnFYwGxz3hQMJv2q4joA3U=;
	b=i/akNko4KMpx8KZ15aBzVWxz9QfT2e8ONgeXDFCj3pZuw8rkItNM6WjBsJ7J+i7V2+
	GxdN/t4IKKdjGjAkob0KyLb/lykFYLTJutSRT6EYC7zYzcblax3qqtUY5jFQ/oYnPYyv
	cdIExw3AuAAMHXTJHftxeHFChcjB1QywrTwpFORJrMcdUmYELXDqsFylOUcW52sz3Slz
	AQum4dMVPXfzbvmwNgHO+bxYzAyP4cDo9FdicEhzmhgi5+jQcetGUagVhUAaXobVHt8/
	lqWdo9VQZvtqAq25d5HjEkrI0GuH8Ekeo+jV2BKx3x7JV1L80a5+mye61Ttrgf0ISGze
	SPLg==
X-Gm-Message-State: AOUpUlEWryOHKBZkPVhdj8jvS8rI0emY704TpZEjB4sY5iTy2KAdJlW7
	/3aH6bx86gzygkB3rEE8FS/tDfRwwmbyKPUFKT4=
X-Google-Smtp-Source: AA+uWPyRSQ/A6Msr7jBmi9fvhUw/ISvPr8klu/iJMOs16JXgm2kLfNKDxr7M/gJp4Q/YXEEsaCJpbkL8k6woXsBbLGo=
X-Received: by 2002:a1f:d844:: with SMTP id
	p65-v6mr38215346vkg.54.1534978512580; 
	Wed, 22 Aug 2018 15:55:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Wed, 22 Aug 2018 15:55:12 -0700 (PDT)
In-Reply-To: <CAD0U-hJ5Ef8+zV6fumw921=67hwS5yyqaDWWJGVm4D4rFyrYHQ@mail.gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
	<CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
	<CAJ86T=UOiE+m=3__e13YpRex22Z9h1ennqyCxQMRDdSWMiFZTw@mail.gmail.com>
	<CAD0U-hJ5Ef8+zV6fumw921=67hwS5yyqaDWWJGVm4D4rFyrYHQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 22 Aug 2018 15:55:12 -0700
Message-ID: <CAJ86T=WjSNkzHpD0a-CxwmV1JfG7ksfezspi+5LvkdvJHdTcFw@mail.gmail.com>
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Wed, 22 Aug 2018 22:55:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin <ryan.harkin@linaro.org> wrote:
> On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com> wrote:
>> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin <ryan.harkin@linaro.org>
>> wrote:
>> > On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com> wrote:
>> >>
>> >> Your 1st parameter is wrong, compare again with the example I gave you
>> >> (don't include "brcm/" path in 1st param, because you want the symlink
>> >> to
>> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in the version
>> >> after cd).
>> >
>> > That doesn't work either. I tried it with the same result, but didn't
>> > send a
>> > log of it. That works for you?
>>
>> Martin's example is correct so maybe check your tests again for typos.
>> It it still doesn't work then please do send a log.
>>
>> The link will point to whatever you define via the first parameter, so
>> if you changed the first parameter it shouldn't be possible to get
>> "the same result".
>>
>>   $ mkdir foo
>>   $ ln -sf test_target foo/test1
>>   $ ln -sf brcm/test_target foo/test2
>>   $ ls -l foo
>>
>>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
>>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -> brcm/test_target
>
> Yes, that's essentially the same as what I'm getting.
>
> Now try "cat foo/test1" and what happens?
>
> There is no file called test_target in the foo directory. And neither is
> there a file called brcm/test_target in the foo directory.

Correct. The above was just an example to show that you can * create
symlinks * in the foo directory without cd'ing into the foo directory
first.

If you'd like the symlinks in the example to point to valid targets
then you need to create the targets too, e.g.

  $ mkdir -p foo/brcm
  $ echo hello > foo/test_target
  $ echo hello2 > foo/brcm/test_target

But note that the process of creating a symlink is always the same,
regardless of whether the symlink points to a valid target or not (so
you can run these extra commands to create the targets before or after
you create the symlinks).

