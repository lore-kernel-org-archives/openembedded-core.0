Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B3F5773173
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 17:37:50 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l68so285280308wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=JoIwgcxuzR2TqR7kyHn8C94DhSgmuiBTQ7UzZry/ldQ=;
	b=iJj78IuRx+zGPoRPXxUue5FjE4OsL7nbjvTCuSJUH35k2YJcn/cbOHL4auRMGESu5X
	bAp3mtPNMtODeKMnd+eiktuoKy/l9UBNqDZcLnQ4TUTy8YYF7VNg8Q0taDIwrkuJxH8u
	xfes9KsSKKrQYVSeYy9cAr6sdvKtSRtLyyDMMo7KtXLne4n7QOD+cQmNn9+iNyzsGdAf
	4qrmw5ryhiDfPrScg6nGuF+1lTZN8vF2QLrUdppKVYW1a6GUyVgE7uy4Khw/+oRyOAPZ
	BB6BcF2671NoLNJLCVnI5sON+GqjUA+LqNeGGyyd0H0ifFuCNVGGBVfSsEPZrm9iOlg4
	lm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=JoIwgcxuzR2TqR7kyHn8C94DhSgmuiBTQ7UzZry/ldQ=;
	b=CMFH68fIrNpMlknPX5JNUWQ14FwTBxeTUR5+8N1L2zwf8Q5q4USuSe5iaVHM3amWds
	FjQ493/GSGJFmPhYSD98nXLLN7C6D9BDM+/iYFrbltEhdlS1HJ316hpZE7jbQv6Nzkdm
	sV/a5VJK7vUwtNWs9l78cTtnKqLIbNjIRuFgEvAPY4LsoczLQHB/6mLlxZ0CYwLl5EVH
	pmf5CABgr3a3oLwEZBPV3u8cINSzAqrAgRmUN8tKCSt5ARGzFZ3R6Ju5kV8Ehj1YWPH+
	ISlq2zhoxKrHxy9jDQsBn42smx3f3Zz03okcWFhqO8+JhdKoIWf/c2zkKyMXjuSBub+9
	036w==
X-Gm-Message-State: AD7BkJLnxFhjGAewvyMFoSaD9bzyTVCs4EascTenFL0ol4J3PEA6plgR6uDhrYQtm8R/z0MMr/s5/+nO2xlUOQ==
MIME-Version: 1.0
X-Received: by 10.28.158.149 with SMTP id h143mr11623173wme.61.1458841070842; 
	Thu, 24 Mar 2016 10:37:50 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Thu, 24 Mar 2016 10:37:50 -0700 (PDT)
In-Reply-To: <CAMKF1sofsW2HYMNzDOc9WKKs2ADejfX+VcwqaYx5fEof4g6ngQ@mail.gmail.com>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
	<CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
	<CAMKF1sofsW2HYMNzDOc9WKKs2ADejfX+VcwqaYx5fEof4g6ngQ@mail.gmail.com>
Date: Thu, 24 Mar 2016 10:37:50 -0700
Message-ID: <CAJ86T=VjwZD9qKnhyX6-0xHQVRph1e0FSkwR7OWWJPQsvnOnnQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 17:37:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 1:03 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Mar 23, 2016 at 10:16 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Wed, Mar 23, 2016 at 9:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Mar 23, 2016 8:19 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>>>>
>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>> ---
>>>>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>>> b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>>> index f4f76bd..a7b8d63 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>>> @@ -65,6 +65,7 @@ EXTRA_OECONF_append_mips64eln32 = " --with-abi=64
>>>> --with-arch-64=mips64 --with-t
>>>>  EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
>>>>  EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
>>>>  EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
>>>> +EXTRA_OECONF_append_armv8a = " --with-arch=armv7-a"
>>>
>>> Armv8 is different architecture and even gcc backends for armv8 arent shared
>>> with armv7. This change doesn't look right to me. What are you fixing with
>>> this change
>>
>> In the context of oe-core machine specific over-rides, "armv8a"
>> signifies that we're building 32bit code for an ARMv8-A class CPU.
>> See:
>>
>>   http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=823af99d825375485d64fcb82c00fb85004813b8
>>
>> (Maybe it would have been better to use aarch32 as the over-ride in this case?).
>
> ah I did not know this patch has made it in. I had concerns about it.
> Its quite confusing to call armv8a as 32bit since thats wrong
> representation. It should be renamed to aarch32 atleast.
> since thats the execution state of armv8a architecture thats what this
> file is doing. armv8a support aarch64/aarch32/(thumb2 in aarch2 state)
>
> Please submit a rename patch with adjustments before starting to use
> it widely in metadata

Renaming armv8a -> aarch32 is going to affect almost every line in the
patch. We should probably drop the current patch from master-next.

