Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 353FE75408;
	Thu, 10 May 2018 23:41:29 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id b25-v6so2471984uak.3;
	Thu, 10 May 2018 16:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nb4FoL4/jw2K9vkkMxyFaAosx2MH0Ltid0MRQl5KcLg=;
	b=fDZjQhQka9M38Snu1ZyyfyDcPcZ9wXPADeXD1aV3pUaZztFoGjzG8zwrBTod5dnBMl
	Rbchs8ALLrWxpHsgyp6mTvPsjGbMNbdkI1FVhEogW2Q1OCgN+xhFgAgPeO+N6wesCBzr
	6ZGAC/OBi7RLT/tkIiQKiieR0iZ7ryF58nL2BvF4RHDs5LwIJw1JrogB1Sj9uLePji1E
	SPRcP+P0Vs85aMxk3nJ9qCdebjLLwfHasTIeIEkHNo0aPun5pl//oa+JwF8X7wI+rdwo
	IZg8KMjtlCWFk1vaOMZBS2WwvDrdsXZ3M6RVxbJNoivQb7nt1usgqYbndAJVQZwEOW4s
	gKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nb4FoL4/jw2K9vkkMxyFaAosx2MH0Ltid0MRQl5KcLg=;
	b=GAuvh9kNsHSmpff4JGhHoNeElBoS6z7JBatlYDxjVb/2t8XMwcJgqW9tPTTgbJt3JC
	cQO5x+s0I1oHDwralZP3gZmM2dYwAORebVC79kmynRxzeVMdopGZsxF93SazjfAj1Aeh
	SThbtN4Iy3I/9781IxhRuEhRhphhpKSw0BV49DU0T+YC7iVzqFM/gWbgkJ9aEgSLjugt
	+yQRzTweQvFzaeNrs7ftyn7xJQmcZg1zlL44F+B2iSQKPy8x64jaqDford/9qwKG9NJ8
	L0E7fUg3kiROVWGFG09+uZD+VRz7bxhXrkSKMc2QSBFbzYQw6ijvnIpRLH1JXfg6mKrI
	HThQ==
X-Gm-Message-State: ALKqPwfgfS9hR1ibTxBjfNYlWP23aWJYEwbDNyr8V3WSq1A60Rzn4uCf
	H3gMp+Fl+HmUqiGyUjM3Ewnp/93rWEGExuw/qAk=
X-Google-Smtp-Source: AB8JxZpuwpGA3LwK+i614PWiLnHmmZ9Ip6qcn5doE80EcU3ua6ng9uz2d6WW2s0sYVFUFUHte62C4jRwREe53a2SNAY=
X-Received: by 2002:ab0:1567:: with SMTP id
	p36-v6mr2601359uae.81.1525995690735; 
	Thu, 10 May 2018 16:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Thu, 10 May 2018 16:41:30 -0700 (PDT)
In-Reply-To: <20180510233233.GF1954@jama>
References: <8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
	<CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
	<20180510214325.GC1954@jama> <20180510220735.GD1954@jama>
	<CAJ86T=UpZ0+HTqre2Z4eAPM9LY_eH1EUO=e1v0sz7FPe4+8aRw@mail.gmail.com>
	<CA+chaQcTPwJy+dL6GvBKJTcZuiVUiztVqEDXmSwZ==b53m_mcQ@mail.gmail.com>
	<CAJ86T=XkBkKhK6mwqxnFA1CkaV5swjGKsdNv_7E9fgFa=qhdCw@mail.gmail.com>
	<20180510225017.GE1954@jama>
	<CAJ86T=UfXtgtaWQyJbrhW40MJFW9YAArB3CshMxy5e5f9Cg_=Q@mail.gmail.com>
	<20180510233233.GF1954@jama>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 10 May 2018 16:41:30 -0700
Message-ID: <CAJ86T=XZtFDDO7BdfjwsSsh+jXi4pHAQwDS05A-+ypjCLogRdg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Thu, 10 May 2018 23:41:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 4:32 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, May 10, 2018 at 04:11:00PM -0700, Andre McCurdy wrote:
>> On Thu, May 10, 2018 at 3:50 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Thu, May 10, 2018 at 03:40:53PM -0700, Andre McCurdy wrote:
>> >> On Thu, May 10, 2018 at 3:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >> > see
>> >> > http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150654.html
>> >>
>> >> Removing -fno-omit-frame-pointer isn't the same as adding
>> >> -fomit-frame-pointer. Frame pointers may get enabled depending on the
>> >> optimisation level etc (ie not only by -fno-omit-frame-pointer).
>> >
>> > Should I send v2 adding -fomit-frame-pointer instead of removing
>> > -fno-omit-frame-pointer?
>> >
>> > The v1 fixes the issue for me with default config + DEBUG_BUILD.
>>
>> The v1 patch isn't wrong, it's just incomplete (the problem could come
>> back if someone changes optimisation level or switches gcc to clang,
>> etc).
>>
>> My choice would be a v2 patch which adds -fomit-frame-pointer to
>> CFLAGS unconditionally for all ARM builds when Thumb is enabled. That
>> should fix the problem for all optimisation levels etc and avoids
>> building the main strace binary differently depending on whether or
>> not ptest is enabled.
>
> Only for thumb? makes me a bit sad that thumb override was dropped by
> you in
> 351443d71eb246a946b41f12b54d57b36fe1574e

No need for a thumb over-ride. You can copy and paste from the musl recipe:

CFLAGS_append_arm = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb',
'-fomit-frame-pointer', '', d)}"

