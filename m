Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACA67871D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 14:05:04 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id x34-v6so9934651qtk.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kHgJDGCulInFsNUHbgfX+rdhPh9DhwZK8zRUeGZa4N0=;
	b=dZVW/rEDwIFqU1vQE4wnMmZIc9lroehuKuKkpNN8k+KpZPoLBi62FxsG6GhII0ifcw
	x1ZDFZrPpIrGQHIX7ow33kLZCGQtv1wrOWh6pYYoKcNZioVYcQMtwZTV2sKEDgxSaYGE
	q3mqv2gnfH21hHssBUUT4UIAqlHZ7vOEPA0EeiPJD8y+kdeUyP9uNxi7WFJLL4QmHxQ0
	4/r4qVRwbliGadd7Tjxk1rsJgaL7gVjoXv1J0MrkCa14QNKZ9wW8zdQZQt4DxpqdCyZy
	GpLjhbiFnc40ITeO1Z/oKJqDtG8Y8eUGz2mPP01gzXQ2jZ/NvjXfzMlzUhSjt/9ZbsIG
	PW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kHgJDGCulInFsNUHbgfX+rdhPh9DhwZK8zRUeGZa4N0=;
	b=UiRCNPZHxsJunlT2iL4YKm/opKqMzqsqcbNAi7B6O+p1XGpXkjuJ8K15X0EjesKxSw
	5ayeCIWAbIJ3GcvF4woCxjrXELQ6HbEfMqVH58GyWB30DcFxxTfTEK/yAKzcYXbdFc6H
	rl2MKqj3O1xZfbXzd+FLPlzUBVTkT/mYOnx2x++wFXCtJ6V3qsGQ8SDqB3duNYJ1Yy1k
	OLDPbqXI5zMUiYrbbyHIaY4XElTC6koSGm7fpLbv8RGJQ6kZ21pG47GQ7N6xiIktK71K
	jrCZipuYsntMj5Yx7m7/8NE2vmWCT+zMNYYqrdjo8xeYnyspE6Zet+gVrdx2wza0WQKj
	yxQw==
X-Gm-Message-State: APt69E1jX30s1/un3gxE4iA8uj/nGBh8nXQ/VSplQAjUaulTUWcMGsCN
	6jnp2DbPyfZ2kwR4PO7cBXzEfuByoudH0lh0/Co=
X-Google-Smtp-Source: ADUXVKJk4TzpcaVpDJTIlIWWKIV0zJpBMbO7e0oIorcW86Zgpq0UccS3/BdYt0BTcGRmMnsc4Mmeseb1ADKB3pXVl10=
X-Received: by 2002:a0c:f806:: with SMTP id
	r6-v6mr1781809qvn.214.1528380304916; 
	Thu, 07 Jun 2018 07:05:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 07:04:34 -0700 (PDT)
In-Reply-To: <CAJ86T=U12bdRd=GtseZc8DSKOyEm=OdM=JJZB_6Uu4c0e5__1w@mail.gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
	<635c8757bf852c8a4248009f241c19146431cacd.1528320772.git.raj.khem@gmail.com>
	<CAJ86T=U5WPudMu_VBL_Y00DQrOjRb91=x+6+21V0ZQKhCQ7ThA@mail.gmail.com>
	<CAMKF1so4AMMhXS4VRNV2CPjvPRbzkPWEW3f=iTNio2jNC1Fgxw@mail.gmail.com>
	<CAJ86T=VCqqt_7OXT__NLtH_uayoSX_rFS=vXEyOZY3BQz3+FKQ@mail.gmail.com>
	<5c57a121-c4cd-e548-cd26-182076deb917@gmail.com>
	<CAJ86T=U12bdRd=GtseZc8DSKOyEm=OdM=JJZB_6Uu4c0e5__1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jun 2018 07:04:34 -0700
Message-ID: <CAMKF1srdYY8MXiFWjk7Khh2TsDQ0faTPV4gn5tRfUwrXEUYpUA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] tune/arm: Set -mtune instead of -mcpu
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
X-List-Received-Date: Thu, 07 Jun 2018 14:05:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 7, 2018 at 12:14 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Jun 6, 2018 at 10:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 6/6/18 4:42 PM, Andre McCurdy wrote:
>>> On Wed, Jun 6, 2018 at 3:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> The -mcpu, -march and -mtune options are not new and gcc 6 and 7 catch
>>> the same conflicts. It doesn't make sense that gcc8 is just catching
>>> more issues.
>>
>> It does make sense. the option parsing for these specific options on arm
>> have been revamped after gcc7, see
>>
>> https://github.com/kraj/gcc/compare/a99ae290af49793cd3db7a74f3dbc59e64d356a1...68b54adbd7b10c66d968d74b96fba552bd46ebb7
>
> Thanks. These commits seem to be related to handling of options like
> "-mcpu=cortexa9+nosimd". Was that the error you saw in testing?
>
> If you can provide the command line that caused the error then it
> should be quick to establish whether it's gcc8 being more picky.
>
> Or perhaps there's always been a warning and -Werror has been added to
> a gcc8 Makefile where it wasn't before?
>
>>> If we are trying to build something which is reusable across multiple
>>> machines with the same architecture then it's a bug to be passing
>>> machine specific CFLAGS. Making the machine specific CFLAGS more
>>> generic is not the right solution.
>>
>> being reusable is a side-effect and a good one. Real problem is we are not
>> matching to what we say in package arches, Probably you are confusing tunes
>> to be meant for static code generation for a given CPU.
>
> Sorry, I don't really follow what you mean?
>
>> I am interested to
>> hear more ideas to what would be right solution if this is not it.
>
> I'd like to understand what the problem is first before trying to
> propose any solutions.
>
> ie what specifically has changed with gcc8 to cause the error which
> wasn't seen before?


I would suggest take this gcc8 patch series and revert this one then build
gcc-runtime for rpi3

>
>>> Anyway, I suspect the real issue here is that when we build gcc to run
>>> on the target we currently configure using "--with-arch=armv7-a" for
>>> both armv7a and armv7ve. It was done that way deliberately to try to
>>> avoid rebuilds when switching between armv7a and armv7ve machines,
>>> although thinking about that now I'm not sure it makes so much sense.
>>> Does your original problem go away if you simply change:
>>>
>>>    EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
>>>
>>> to
>>>
>>>    EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve"
>>>
>>> in gcc-target.inc ?
>>
>> No, this is not the problem I am talking about gcc-runtime which is
>> configured during cross build but built for target later on.
>
> OK, good to rule that out. It's nothing to do with gcc8 and I've sent
> a separate patch to fix it.

