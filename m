Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA942786D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:40:04 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id w21so9871524plp.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NiWsS+5XL09mSWdB71z8KYlYO6lYB6+yNL1ZgOqvjs8=;
	b=Uq07clXFLUjELzTfyfPJYcSDpI1i8UJCew+CFpzY7qI14m8At1VNtojcEI5g8dUf5I
	r9G2qGgP6Z6o+9R3/951ZG0GZHUnSwYH3AQbuV+BKJ3LtOfm8Q0ZjEBQUiPmETqo8QX6
	UlkV3BDL32gUHyShkJAd55hHrbkpZPMt3NJ4zLBlk3g7vItRR40CChZXOCkmDhY22AwQ
	MhXyZphbbYRfgOyuI9V4vxfMHlkEuYN268ORQ572UQiyiYOZ6cH5t6+f2JbbeQbrX8cp
	ptr4c0XHIx7kaAjZY//PF9cy1Z30X1baaW8g2V52MQW9JforsVW2KCgC8VCZRWxAQAD5
	E+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NiWsS+5XL09mSWdB71z8KYlYO6lYB6+yNL1ZgOqvjs8=;
	b=KSkw6deA6RdXLpdUbchpGH0B0bWkkur1zIJGjh3PGNxHcVQpo93IJjjjB0r4LJk3Yf
	d9oVYz1Ic4C7MQQ5pE5AEGwACd1LYtTzFLDfcl+jXGgsfUbdzaR1jbfFqgNH6kM1pVhD
	DuLpYbe6nNRz1oOKCcf7uQIqgGWJhzV7eaO6JF1cGjLhcmkH0uC2CSHLDwygjfPGfeQy
	jO43N4ZHsKUAJ7ph/0QL9rTw6VpzTunn0S2c3dt6AgeXS6bHcRba+CEZ1ZjpwNEnSGec
	0vsTqd88NqcCS51EX1EtfJAYXxdj1xT4OO0SJ4JWz1xO9Q2SRRuSwU+s//zRhPJpQhIe
	e+Yw==
X-Gm-Message-State: APf1xPDTZhrYolIiEBg9UnRu9HJtPHs3kWvPFL1G6O0V4UZ6sph1GFqP
	z54CTa5HVP2VxUKxPosxOadBIqyONij6/gUz+DI=
X-Google-Smtp-Source: AH8x2259p5hMQMu5EdQtAga2pHejDHwQI0Zy3+xkPW1UqNcIZTE3bVNcrBtpeBQTjl42GFNiktPaV8dXnbMDw00PLF0=
X-Received: by 2002:a17:902:9009:: with SMTP id
	a9-v6mr11402914plp.272.1519674005794; 
	Mon, 26 Feb 2018 11:40:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Mon, 26 Feb 2018 11:39:35 -0800 (PST)
In-Reply-To: <CAJTo0LZbhTc_UWPueQ8hvQbsN3jppG=UnCXVtfF4Z9_phnub9Q@mail.gmail.com>
References: <20180226143813.21159-1-raj.khem@gmail.com>
	<CAJTo0LZbhTc_UWPueQ8hvQbsN3jppG=UnCXVtfF4Z9_phnub9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Feb 2018 11:39:35 -0800
Message-ID: <CAMKF1soJev1+J67XMeqU3JO=L9V+3veZgJ5xUecB2SZzc2oUug@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Mon, 26 Feb 2018 19:40:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 26, 2018 at 6:54 AM, Burton, Ross <ross.burton@intel.com> wrote:
> I know you didn't test this:  :)
>
> On 26 February 2018 at 14:38, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> @@ -40,8 +40,13 @@ SRC_URI =
>> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>>             file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>>
>> file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
>>             file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
>> +<<<<<<< HEAD:meta/recipes-core/glibc/glibc_2.26.bb
>>             file://0027-glibc-reset-dl-load-write-lock-after-forking.patch
>> \
>>             file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
>> +=======
>> +           file://0026-reset-dl_load_write_lock-after-forking.patch \
>> +
>> file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
>> +>>>>>>> 2ce2695790... glibc: Upgrade to 2.27
>> release:meta/recipes-core/glibc/glibc_2.27.bb
>>  "
>
>
> Locally I've got the previous 2.27 upgrade squashed into a revert of the
> 2.26 bump, presumably there are no other changes required?

yeah, should have looked at the local auto build. Please dont revert
the 2.26 bump
since some users might want to cherry-pick it into releases, makes it easier.

I will send a v3 soon.

