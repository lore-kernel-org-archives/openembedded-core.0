Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id EC6246011B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 15:58:22 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n130so21307512qke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ACLLOHssIJWE9AfzlpxQ+5GyjB0yhIYsUu9qIbMnO/Q=;
	b=XecSJ8FWJIsfM3OhN3H8kuSgBidMztLyp/HWPyqafQyABn+4eqGy3NTFqPrX5nEg4o
	OAzszfyYTEmlrnVLJK8vd++EHOMiAxsk8Z+nIyOZpeA+MWAoPO8YFaNnwu5g8S2QW65s
	rDaWfDBAWow/l/rKavp0ecwF1ZF5qSfjNO5B1EoQiZKt6/mSONFZxeDFwctpbcg5vXP2
	AAVuoxWdqyt3CpiF7LKFh9P2HOXRKO5Q4UkaiCglnV/M5Xi7DbWaIF8E4AlcACIBXe13
	zIu/vFNnOAtwatyeVLaqkVe6ZdTnM85jxpHRYqL3hKKcfZGMxenLiZiYhCiiGCRZkeGS
	4F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ACLLOHssIJWE9AfzlpxQ+5GyjB0yhIYsUu9qIbMnO/Q=;
	b=hdlm1mm5R+UC06gzQ5B5a/di8dwSQef37/rIxrDc2lqGqnzyxXCwaqn2tNyaN/EAS5
	/HUEfLfwbrk2TnjmWwSrS/k50awKrJ/8FzDFlUGs8e99rBP18A6XXre2pkWQa6vvfmLA
	f+vBOdENtzEHVV1m2A+4fvb7caxtSgqD+Zj16Lsrqmm+F9RcIM+Dyjm1IdtvKwM1F2VN
	ALzk9z09MqPyX61XR+deePYbZMRc/y9o4yIzmFcmEiL4NPI0mycunXADqxkJXOYZ3Im5
	XHIcltz9qECefuvcn6U8FePSBXuT/5qKzyIhuscj31jz4yHWf56nlJNqk3cOl+b6ttUr
	idAA==
X-Gm-Message-State: AOPr4FUdfLKEiHY/JCOfCWD0/fQ4cpfGWrdyKtvlGjH2+uRIuq0El6IeLnLWcShYR0J8xBpkPM9WBHRtsSCN0w==
X-Received: by 10.55.72.130 with SMTP id v124mr12434398qka.13.1460563103024;
	Wed, 13 Apr 2016 08:58:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 13 Apr 2016 08:57:53 -0700 (PDT)
In-Reply-To: <CAMKF1sq1kqM7iair34+2ZoxZh24=wszYniJ4cyoBc2M9_XzEQw@mail.gmail.com>
References: <1458077979-23303-1-git-send-email-raj.khem@gmail.com>
	<56E91CC8.9060907@dest-unreach.org>
	<CAMKF1sp7C3zCHQBiJ=i5YYsHcXfkBX74qYXgZxYX-tqcwqrD+A@mail.gmail.com>
	<570D631F.5020503@windriver.com>
	<CAMKF1srjaNz1dnZCHFkWn6=PyQ+w6Vb1FoF1rbDVCGaTCe3FrA@mail.gmail.com>
	<CAMKF1srQ5ayOr3ha=YTTGBS-ovX8Ht41ODoNaSEHBGW9EfjFGA@mail.gmail.com>
	<CAMKF1sqBwbkHWQBBzX8jbK0SoZtcMr6MO2ZSZ9dcMJJns6x+eQ@mail.gmail.com>
	<CAMKF1sq1kqM7iair34+2ZoxZh24=wszYniJ4cyoBc2M9_XzEQw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Apr 2016 08:57:53 -0700
Message-ID: <CAMKF1sou4V8jvOLKponmoR5gYsa8nEgXOa=ALF14Yyz23nrbEQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs
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
X-List-Received-Date: Wed, 13 Apr 2016 15:58:25 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 12, 2016 at 3:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I think I see the problem now. The constant should be converted to use Bnn
> values. When calling the baudrate apis. I will send a patch for you to test
> once I am close to computer

I have sent a potential patch.

http://lists.openembedded.org/pipermail/openembedded-core/2016-April/120229.html

 It worked on musl env that I had ready here. Can you test it
with your env and make sure it works for you ?




>
> On Apr 12, 2016 6:20 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> Since you have it reproduced. Can you check which of the api call is
> failing?
>
> On Apr 12, 2016 5:05 PM, "Bruce Ashfield" <bruce.ashfield@windriver.com>
> wrote:
>>
>> On 2016-04-12 1:53 PM, Khem Raj wrote:
>>>
>>> FYI
>>
>>
>> Thanks. I can also confirm that when I dropped the patch, I'm
>> back up and running assertion free.
>>
>> Bruce
>>
>>>
>>> ---------- Forwarded message ----------
>>> From: Gerhard Rieger <gerhard@dest-unreach.org>
>>> Date: Wed, Mar 16, 2016 at 4:43 AM
>>> Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs
>>> To: Khem Raj <raj.khem@gmail.com>
>>>
>>>
>>> Thank you, I will check this patch!
>>> - Gerhard
>>>
>>>
>>> Am 15.03.2016 um 22:39 schrieb Khem Raj:
>>>>
>>>> Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()
>>>> instead of operating on c_ispeed and c_ospeed termios structure
>>>> members directly because they are not guaranteed to exist on all
>>>> libc implementations
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>   xioinitialize.c | 8 ++++----
>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/xioinitialize.c b/xioinitialize.c
>>>> index 9f50155..632ca4c 100644
>>>> --- a/xioinitialize.c
>>>> +++ b/xioinitialize.c
>>>> @@ -65,10 +65,10 @@ int xioinitialize(void) {
>>>>   #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET !=
>>>> -1)
>>>>   #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
>>>>   #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
>>>> -      tdata.termarg.c_ispeed = 0x56789abc;
>>>> -      tdata.termarg.c_ospeed = 0x6789abcd;
>>>> -      assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
>>>> -      assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
>>>> +      cfsetispeed(&tdata.termarg, 0x56789abc);
>>>> +      cfsetospeed(&tdata.termarg, 0x6789abcd);
>>>> +      assert(cfgetispeed(&tdata.termarg) ==
>>>> tdata.speeds[ISPEED_OFFSET]);
>>>> +      assert(cfgetospeed(&tdata.termarg) ==
>>>> tdata.speeds[OSPEED_OFFSET]);
>>>>   #endif
>>>>   #endif
>>>>   #endif
>>>>
>>
>

