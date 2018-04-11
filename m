Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BCFD3746E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 18:56:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b21so5609624wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 11:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hw7plUL26gvm7Ogk7DGJfVRuZVIwqLD9ouwXK57m5HE=;
	b=RpqtGS1TUThLEuR44inIrgSo2zVaaKBiGcWGI9gGUPA8jDKu/kIw4/HnHpFHJVyGnZ
	ElrBCSUl7U5PWN0EVHc2rX8ONAJzdnVzK5FcRuu2WmiBOW4fYrZFlyk5tsmDOlgr+NVX
	YJcYR2PC+hM3REncRULk8Ylbp+AJV6KXf8dzy9BdVRZQYr12HKXgESo5dRdo1qTKcdLw
	h7iX+Ywyy9YVMPXpav9s7e7Wlb65iv8tW0SvfqL4N6uqofT9ddnn79crqXWto/ZxoPxP
	+anq4hjfLsEBBjLkSimZrPEN8nYFObYkPVmyjlwl+tubcwOXCQ3VduNfl2lKI0qYY0RD
	meDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hw7plUL26gvm7Ogk7DGJfVRuZVIwqLD9ouwXK57m5HE=;
	b=XbBVrKPE8z7BNzMnwAWU61pBjpJ72C8KFP1cLmxTnRWLf7TQXVmbf0oeONxn1bQuzO
	sXzu/7egyXu2gAkh9/SAEX0PMZmvZ/qOqtZiMcD7OaqD3rs0CS1WjO0LjHigmtta/5g+
	U3uWXgPA3EAl/+p+f1A35sKj3A7fAfqsDw77Nftdz9YCON1KhvAU3Z4yVjLAxJm+2GXN
	Eqtl4kfievqfg0dYsEN168Nb15qLlygrGfL3THEWofoJBUOOFFAPsPDEOKoR2U7ShGC0
	WAmefKFCYSxmwUL+mimHiNmH+DBAENhJpTg4Dw8q57y/qswhP7T08O/uPtDp6YQmQj+A
	wBfQ==
X-Gm-Message-State: ALQs6tArUlikTtlELbR506NhUMioAKk+3OUsDCQlCZ45gJIxkmqoLTHv
	VZdNZdwVItHBJdbAck0xQs8uKcKLFsfmmUnug9M=
X-Google-Smtp-Source: AIpwx49OnmWFkCG7vBaNSc+BiVcQRKkX70IhbG5s6R6rA4JGVaaxrxqDe+C1bmlHJuWh6R64H+mkhukMuR5WdIFnA2I=
X-Received: by 10.28.63.148 with SMTP id m142mr3607058wma.153.1523473009715;
	Wed, 11 Apr 2018 11:56:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.99 with HTTP; Wed, 11 Apr 2018 11:56:48 -0700 (PDT)
In-Reply-To: <0de624d1-6617-97a7-244d-5d65b8bceadf@linux.intel.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
	<20180410120747.41814-3-alexander.kanavin@linux.intel.com>
	<CAJ86T=X4cBT=RpXzvyuoOiFVX-fj_8tXO8y6JnAa08R_CBkKeA@mail.gmail.com>
	<0de624d1-6617-97a7-244d-5d65b8bceadf@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 11 Apr 2018 11:56:48 -0700
Message-ID: <CAJ86T=V661XAbNGnR7BDtifWzX+mVxufSf7FuQ8oy-w36AFEgw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 3/5] openssl: update to 1.1.1
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
X-List-Received-Date: Wed, 11 Apr 2018 18:56:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 11, 2018 at 3:09 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 04/11/2018 12:20 AM, Andre McCurdy wrote:
>>>
>>> -#| engines/afalg/e_afalg.c: In function 'eventfd':
>>> -#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared
>>> (first use in this function)
>>> -#|      return syscall(__NR_eventfd, n);
>>> -#|                     ^~~~~~~~~~~~
>>> -EXTRA_OECONF_aarch64 += "no-afalgeng"
>>> +# This prevents openssl from using getrandom() which is not available on
>>> older glibc versions
>>> +# (native versions can be built with newer glibc, but then relocated
>>> onto a system with older glibc)
>>> +EXTRA_OECONF_class-native += "--with-rand-seed=devrandom"
>>> +EXTRA_OECONF_class-nativesdk += "--with-rand-seed=devrandom"
>>
>> Better to avoid += with an over-ride since it doesn't do what most new
>> users etc expect. Better to use _append instead (or just the over-ride
>> on it's own, if over-riding the original value is what you intended to
>> do).
>
> Thanks, I will fix this. The whole += vs. _append is a design shortcoming in
> bitbake I'd say, as it's a regular source of confusion, and can't be
> automatically QA'd.

Yes, fully agree. We would save new users a lot of time and confusion
if the parser just failed with an error on any attempt to use += with
an over-ride. I've seen it cause bugs many times.

