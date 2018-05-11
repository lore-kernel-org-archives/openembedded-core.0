Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8290B7540D;
	Fri, 11 May 2018 00:56:04 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id p9-v6so1685665pgc.9;
	Thu, 10 May 2018 17:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o1MVnUvflWQrl5mTOJEMbU4xJ+wEYCFu0C3ONjBG5/c=;
	b=utHFvT/OYBMggP7A2yzkvXHD5ZbApcfb+z57G3Spfu2ZcUQCDX2iVSG96CJ9ScfJeU
	fwbLOc2UMmV8a2tzZCIB7d8eANJEQj7e8Z6tVes36DMta3/pBXeCF5j+d4ZpFBZNjyEJ
	TYNf8tuTuGap0llxH5t8giCE6SWvxcdAZId5Ns2dxg2j0JlvDepMRRx6OtfuZYASxN7M
	Z0p9vrY+NcrlMM0YqE3WgRFr/HhKVOpdVYXsXjhxjQJ2OvMg9M+Bw6o1YlEXOSjI2PD/
	s4wtRqtKM1OfInn1isTFFxeCp/mO5iMq1xMzPNewJj/XS5jb5MZadGDwFallkBAKacaF
	j1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o1MVnUvflWQrl5mTOJEMbU4xJ+wEYCFu0C3ONjBG5/c=;
	b=AUa1kaYVLHRjrhQ/UWXts91eCmq1J00LudVzWqYM2fL0xnOFH9xOtQASEHDn7l90uv
	aQbzI7PPdRR8x5OiryNu/EK/krUjASd/HW+wv79mPwWrchAOkkwxkuzPzixjCEBslBiK
	sV/aFHsD/9JtPKuz6Ul7h5dx6x8s6qIXIOc7Mcbn17m3IsH/VdL8e1LKaLr+0Pkpj/kp
	rgBaxAjHkuXlfe7gmy4gWTvS8/fh+3P0zuSuRsEM3wp25+UEtpKDkFdkpRCIU05YayN4
	UlxOMJo7XaFqpgJA+QDD2Coai4NEKCCZ9uw+8bUqt+rCWzGZDYFQ2PJ18I3ZNwf9Tqsc
	/Wig==
X-Gm-Message-State: ALKqPwfY6/3Lf7f4s8Q2slF8u93SRVImNZsRM7j5H5oCrONkOogWdzl0
	8Vq622Gw7GL1smtvsPa2mTkz2lpOIhK61YtgwRw=
X-Google-Smtp-Source: AB8JxZpdfqFzypmV/yt2MbKSmVZ3aE6qT3OzgIFiXlOxNxJhOAODvs141Ca/8rSvdmoXnImsqRXDF8N96nns7wuhQ4A=
X-Received: by 2002:a62:7f91:: with SMTP id
	a139-v6mr3359839pfd.25.1526000165357; 
	Thu, 10 May 2018 17:56:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.139.145 with HTTP; Thu, 10 May 2018 17:55:34 -0700 (PDT)
In-Reply-To: <CAJ86T=UfXtgtaWQyJbrhW40MJFW9YAArB3CshMxy5e5f9Cg_=Q@mail.gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
	<CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
	<20180510214325.GC1954@jama> <20180510220735.GD1954@jama>
	<CAJ86T=UpZ0+HTqre2Z4eAPM9LY_eH1EUO=e1v0sz7FPe4+8aRw@mail.gmail.com>
	<CA+chaQcTPwJy+dL6GvBKJTcZuiVUiztVqEDXmSwZ==b53m_mcQ@mail.gmail.com>
	<CAJ86T=XkBkKhK6mwqxnFA1CkaV5swjGKsdNv_7E9fgFa=qhdCw@mail.gmail.com>
	<20180510225017.GE1954@jama>
	<CAJ86T=UfXtgtaWQyJbrhW40MJFW9YAArB3CshMxy5e5f9Cg_=Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2018 17:55:34 -0700
Message-ID: <CAMKF1soAQYfL+gwsEmt6bZv_42pO_F5Gsb0CxUrdWueaja50hg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Fri, 11 May 2018 00:56:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 4:11 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, May 10, 2018 at 3:50 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Thu, May 10, 2018 at 03:40:53PM -0700, Andre McCurdy wrote:
>>> On Thu, May 10, 2018 at 3:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> > see
>>> > http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150654.html
>>>
>>> Removing -fno-omit-frame-pointer isn't the same as adding
>>> -fomit-frame-pointer. Frame pointers may get enabled depending on the
>>> optimisation level etc (ie not only by -fno-omit-frame-pointer).
>>
>> Should I send v2 adding -fomit-frame-pointer instead of removing
>> -fno-omit-frame-pointer?
>>
>> The v1 fixes the issue for me with default config + DEBUG_BUILD.
>
> The v1 patch isn't wrong, it's just incomplete (the problem could come
> back if someone changes optimisation level or switches gcc to clang,
> etc).
>
> My choice would be a v2 patch which adds -fomit-frame-pointer to
> CFLAGS unconditionally for all ARM builds when Thumb is enabled. That
> should fix the problem for all optimisation levels etc and avoids
> building the main strace binary differently depending on whether or
> not ptest is enabled.

explicitly adding this option is a poor choice especially for debug
builds where we should
let the -On level decide and not explicitly ask for either
enable/disable frame-pointers
that will also make it compiler proof.

