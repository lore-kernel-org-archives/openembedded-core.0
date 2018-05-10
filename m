Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 138EC75340;
	Thu, 10 May 2018 19:27:49 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j7-v6so1882524vkc.9;
	Thu, 10 May 2018 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z/66mg3YppfzYZU15846sDiFkILfA3r6yQMYWwWFWv8=;
	b=Jmi1Q++C8nizpgYDB5sr+JUnXoh1ifgSpSlLPBEQ22nbp5KlcdxS5MhecTZLA6AaNI
	hm6kN10SvfVBkvGUVtsjnKi5i1Szh6EUKgsCyNRz867xwgrgorZEVEgwXqY+i5czNXEm
	BovqQ+PluNQy6XMBjDz73WVt8zH4JtsBOW9lSWRI28q0CA50D4ID46sYJF+Vvl0U9W6I
	uqi1al4ydAI7EEiO8uCxpJ+9xvHcOAkMFx9whGXKd0ctBwu1mI7QaPV03PKjBhyRMABD
	uHPfGegpGZwoQO/ZfJfe4QkGFTwv6qic7XZbu7YDYr9P36S/aTl3AazlPwTm/xbUsyRW
	ADyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z/66mg3YppfzYZU15846sDiFkILfA3r6yQMYWwWFWv8=;
	b=uAq85eGTwOq1UYv7B1U4QKNATHxKCnjMddJx8zhXICi/uprPnZUjhriJhyHvX2Iq28
	qbWtSpIhV/P2ws9Hbb2Ntvgnj0UvGHf0LfU+HS6MH1P7KuhdHJxPeGM28StlA1GoZl+X
	f9RuGdHWj3JiN0Gg5aEINb4X9he6qAbPmhbQn/yA4lBCuvgXpCy+WGUDCmJODMmW99T3
	HIELP0gWST8ROIpRFyp3nt8CzfRdh6W1hjO9+twXVS3Dprxxle/c9lW8b71edcC12wvv
	giAB5FBOEOTHQEZEP1SKvOFFUo4bn4KAwuhjfoADooLECZBszFwUpARq6Gaeja3l2XW5
	0tjA==
X-Gm-Message-State: ALKqPwd5ZAw32lgNEBuKxs2t0G2tmPo5U74aPMRykMClemnYSN23l/sP
	Oolty1imLJb1pE3GfhFqVuIOPrtfq9gsx3Z+sW0=
X-Google-Smtp-Source: AB8JxZomKkFJctTXn1BmNjZMtzEB/3G/JrxM+w43I73lKFvHsRfmPson27/My8o5u1gABFqLGq4vFnSN08dlyL4bvvA=
X-Received: by 2002:a1f:b254:: with SMTP id
	b81-v6mr1920369vkf.20.1525980470656; 
	Thu, 10 May 2018 12:27:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Thu, 10 May 2018 12:27:50 -0700 (PDT)
In-Reply-To: <20180510191145.GA1954@jama>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 10 May 2018 12:27:50 -0700
Message-ID: <CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 10 May 2018 19:27:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 12:11 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, May 10, 2018 at 11:50:02AM -0700, Khem Raj wrote:
>> Hi Martin
>>
>> Thanks for testing and reporting back
>>
>> On 5/9/18 2:38 AM, Martin Jansa wrote:
>> > My initial tests show couple issues, but usually caused by other changes
>> > in that branch, not the gcc-8 itself.
>> >
>> > 1) strace-4.22 from
>> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-8&id=af33a8b721cc9caebd3f5226b4c5903f666ab654
>> > fails to build with ptest enabled (it builds with 4.20 version if I
>> > revert this change)
>> > ../../strace-4.22/tests/inject-nf.c: In function 'main':
>> > ../../strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be used in
>> > asm here
>> >   }
>> >   ^
>>
>> are you targeting thumb1 ? how can I reproduce it ?
>
> I'm trying to find out what's different in the builds where it was
> failing, will provide more info later.

This is probably due to making an inline syscall from Thumb (doesn't a
matter Thumb1 or Thumb2) with frame pointers enabled.

Does adding -fomit-frame-pointer to CFLAGS fix it?

