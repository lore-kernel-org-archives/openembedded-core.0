Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id AFC3F78546
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 05:56:54 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id y129so57514513pgy.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 22:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TKG5HCPTStnxZi3QUlf0ZgiqptOzqWtK9Bi0LzmuRVo=;
	b=jk0daKO5G4LO7k8uFHvPU4hXfkplEy2KO1h/TB+y4MVsCzZq5GVAKP/wDcTChfmcZF
	StwDRDPkdFVngbpFMbKMeeOZZtDQr/dhe1QHFmtyohCbgiJmUFFb6yuxMWB9padBvuFW
	lJ/ghvB5KdImyzFyOWhUKR1AA4KZSqBTZrlB2+MwbJHEV06u9drjl5F+nvQTfhRaOjwk
	QTFdhYPwdHqUNaoS7tE6dOLuruBbkX0dYKHF3J29j/A4q5semMiE/u3YMkwogQ5WmKmt
	YggP0eWE1ySMYF37JJR1oIukkwko2Qh8+5iZHd7ALOPL3pT+ZMl0UEo9CO+RUevk+5fn
	aI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TKG5HCPTStnxZi3QUlf0ZgiqptOzqWtK9Bi0LzmuRVo=;
	b=gdYhirJMN5uFE7Muad2L29G3WX+eXJT/1cQj/xmcpdlLeoD/M3kH2JW/iHatr55qYb
	uzg1IRHpF3fTVfytIYxI0yPwTnSSDWQ4civUbG4X/8umbRE+uhVhdNWO8us6aI5Tqio+
	lrYv57dQvuYW5Lmltk3+aIITDOiZQ8svuW+BpOl8df1TQUm532lR/1GIzDprhxyngqIp
	7Wyj4oarP1r41lq6uLNFA1jOAoY4KD+RHaLLaxZW2cTwoGmHTuylt0ADNwOWDERj4QdE
	TVOXYdTK9x8IIKrxmj7Q0f5c0s9s+GfdJ8Tb+LZBK83Xk4s4zDgIyAc6SDizt1plhEq0
	C1pw==
X-Gm-Message-State: AHYfb5hbqyyvJI/pK3OJU1qAiYxk+PoTmPfb2E3I3HDMLNjhTIhc04CT
	lP5lgmd8RwvsRd/H5ESbhujLKGjJYg==
X-Received: by 10.84.149.139 with SMTP id m11mr8314068pla.376.1503035815770;
	Thu, 17 Aug 2017 22:56:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Thu, 17 Aug 2017 22:56:25 -0700 (PDT)
In-Reply-To: <d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2017 22:56:25 -0700
Message-ID: <CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Fri, 18 Aug 2017 05:56:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 17, 2017 at 4:54 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 08/17/2017 02:46 PM, Martin Jansa wrote:
>>
>> I meant "real-world" as builds for any products on the market (which are
>> likely using one of the failing recipes) - e.g. in LGE we have many more
>> failures over all internal components, so I'll just undo this openssl switch
>> (renaming openssl_1.1 as openssl11 and openssl11_1.0 back as openssl_1.0
>> with PROVIDES openssl11). We won't be able to use openssl-1.1 for long time
>> anyway, because there are some 3rd party component which are difficult (or
>> expensive) to get rebuilt against new openssl ABI, but we might be
>> interested in some other improvements in oe-core/master.
>
>
> Yes, this will work for you as a quick fix, but it is merely postponing
> dealing with the issue properly to a later date. Make a plan for it and keep
> in mind that openssl 1.0 goes out of upstream support at the end of 2019.
> Given its history of major security vulnerabilities, it will be removed from
> oe-core well before that time, so that it won't linger in supported YP
> releases.
>

I was trying nodejs and it seems its also broken by this openssl
upgrade. Meta-oe alone has amost 50 recipes that are broken. there are
hundreds of other layers.
Many large packages in external layers are now broken, and the fact
that openssl10
is almost useless since some package will pull in openssl11 and cause
conflicts. This
is not a a good solution at least it seems to early for release. It
might take a bit for packages to get working with openssl11, We should
have carefully thought and considered postponing using it as default
until next release ( april 2018). Its fine to keep it in if needed but
keep openssl 1.0 as default preferred version, I don't think whole
ecosystem is ready for it and we don't have man power to fix
everything. This alone has a potential to make
October release quite weak as far as external layers are concerned

If we want to keep openssl 1.1 in Oe-Core as default its fine, then
lets provide a way to downgrade it instead of openssl10 recipe which
is sub-optimal since OE does build from
source and not binary packages where such a solution might work.

