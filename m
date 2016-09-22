Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id AC58C60938
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 09:10:55 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l132so315286200wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hDSw5LkyrD+URbQIri20Weq3u9Oz9AKCL6kRC10v2mk=;
	b=J/DA9xDpW34oimNT6YjX/kNjWMT6v3lQcsedXR2+QzQz61Jpudiv+WEIEui7VrfP6H
	Dn+n81e84b3aNdLBbW8nXnArwAuzL/yMsWr88LINq3qMCTIbb1qgoornMBJMyhFe7KT5
	n/eZjKiyVxdbFAoy2WZSvHJFG4lN21qkA6hqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hDSw5LkyrD+URbQIri20Weq3u9Oz9AKCL6kRC10v2mk=;
	b=UObtzU8z5K/0VQEiZEij8IqODRlQ+eksTZZoKkVN/iA3nw3nyi+ViTdnopmbbfgZzC
	MVLuQvD6BXTimhZorzloPpWFzkqbpvKo1vfeRsuMXCu0pyjFv+0D/ZPMnxajxbSYaIvL
	Mr7O6BMepm596wD227dMSEra1iq0hT6Nr+ZaktGn5igpVpqWxzRX1wz7XFJtAmaQluPI
	JdDUhloJ2mM7uP5Rj1726cW6v2TaK73sWl/S2Q4KHzFx2YROFxtsM9BznTDoO7muFIaR
	PqX9rDwiQz8bBPkiQ+wRRW34bIrvMkPFeVi17EVp5zojNnLNFj52OMS5U987muyEoeJ1
	au+w==
X-Gm-Message-State: AE9vXwOCJSxIMyCc/i5ICGho99FtmS7nWYPnrIabMA4SC9IbTf4RqRiobUpzIQ4HeURRWp9MKwHTkdofCIcOqE/E
X-Received: by 10.194.5.202 with SMTP id u10mr1071214wju.149.1474535456394;
	Thu, 22 Sep 2016 02:10:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.129.196 with HTTP; Thu, 22 Sep 2016 02:10:55 -0700 (PDT)
In-Reply-To: <CAGNsrLBPAMwiSzA8X4M8ni+LUMA7x+oKMtTP1TVO0-U7c1vmeA@mail.gmail.com>
References: <1411725589-20460-1-git-send-email-fathi.boudra@linaro.org>
	<57E09AFD.4040006@windriver.com>
	<CAGNsrLDLQ0sJZyec8KwHxwuFGhMhP5mG+nFbFnR3816oD1MS-g@mail.gmail.com>
	<d8e2a387-eae9-8436-e08e-4768785bd545@windriver.com>
	<CAGNsrLBPAMwiSzA8X4M8ni+LUMA7x+oKMtTP1TVO0-U7c1vmeA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 22 Sep 2016 12:10:55 +0300
Message-ID: <CAGNsrLDrN50AG0xgBRcyAsurMAPu0j0rQNDaEC5t5kk+CY-=5Q@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libunwind: add aarch64 support
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
X-List-Received-Date: Thu, 22 Sep 2016 09:10:56 -0000
Content-Type: text/plain; charset=UTF-8

On 22 September 2016 at 11:56, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> On 20 September 2016 at 17:21, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 2016-09-20 07:57 AM, Fathi Boudra wrote:
>>>
>>> Hi,
>>>
>>> On 20 September 2016 at 05:12, ChenQi <Qi.Chen@windriver.com
>>> <mailto:Qi.Chen@windriver.com>> wrote:
>>>>
>>>> On 09/26/2014 05:59 PM, Fathi Boudra wrote:
>>>>>
>>>>>
>>>>> * pass --enable-debug-frame on aarch64 architecture
>>>>
>>>>
>>>>
>>>> Hi Fathi,
>>>>
>>>> I'm now dealing with a problem related to libunwind support on aarch64.
>>>> Could you please tell me why '--enable-debug-frame' is needed for
>>>> aarch64?
>>>
>>>
>>> libunwind needs to be configured with --enable-debug-frame to prevent a
>>> linkage error.
>>> Note: --enable-debug-frame is automatically selected on ARM32, not on
>>> ARM64.
>>>
>
> Admittedly, I haven't checked recently and things may have progressed upstream.
> I'm going to double check with our toolchain guys.

After asking to the TC guys, AArch64 doesn't default to debug-frame usage yet.
But as it is the only unwinding mechanism implemented in it, it would
make sense to make it the default.
They're going to give a deeper look to it, and propose a patch if needed.

>> Thanks.
>> We dropped the configuration flag and don't see any linking/linkage
>> problems yet. Can you be more specific about the problems encountered?
>>
>> Our goal is to make tcmalloc from gperftools work on ARM64.

tcmalloc >= 2.4 has support for arm64. We've upstreamed support a year ago.
If you use latest release (2.5), it should work without issues.

>> ../Randy

