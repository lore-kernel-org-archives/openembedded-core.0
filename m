Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id CACF5605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 20:34:56 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id g72-v6so9717825vke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0Bz85DFZEOVb2VdV0itsxq0QYK4kJFZ0BpZzVMC1+Y0=;
	b=fUVsNP3YwFgjaKGIXniBslbhivRN2bmx7RLdk6rUOEioK/HiPlw9ZKpVjAN3PsrNJi
	G6hE9SwgEUbMQlGtiFWU4i7mK5xYn9qYdh7DI0G0SvR2ko9sGFG2hd7DnizVgA/uIvNs
	etQyRPp/LA8qeKTM2wxJmMEP8A/jBe84O3KX3Rr02jmSwlcQjAdMqqLJ+JzRWwpxb5db
	qzVDRZR7UfWJmAhpXSisldDDSjO29qwheESw5UAgEU30gbi4IEBTo1bxsuMlhweXAfaM
	EUwdytO+IkkHor/YgIwlSBUZTYIRtGgLQwKs4SfSVbP3aGFGdw6HINOeCUbTjW0dnY2M
	Z2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0Bz85DFZEOVb2VdV0itsxq0QYK4kJFZ0BpZzVMC1+Y0=;
	b=MH/Kdl2r/rJMMPT/LW7uapldUDbco7XohZuGEyHVmA2x0zLouuYd6D3HNi/40oJ4Fw
	nYMbk6WCoDUIKXXr/xljTxizdbF5IM4tTxIIkydGiz+PTXcA+0upOQo0Ajxw+q50Mt7w
	O/1Spo+4XD7LgZkLZO9SW6rhotScYyPmQIJNG0Z9QXxUqimjco+v7Bdxi8aQzPKcyb3j
	z5RXj4+VykPQlFPLLCKcw1a4eERr6gsp1nx8q/eIVfmW4aYjZKIfRQXqH0CjbI6W0vHl
	3W/y83aerM21MXr2cRBSODyV4KnP3n//JYXY37i/soLVpu/iU0zZDSAVFHYvzGeW6/3/
	9stA==
X-Gm-Message-State: ALKqPweVM5Fi8ZmYnQdmLmfNdMw80DfauNILjIEUe0Hc7A1eJrTEW7yq
	8HQn10qpLq4DocgiHfJq3EpPMjF4isQURsoCCrY=
X-Google-Smtp-Source: ADUXVKLL808lKyI6pI9TNGpeo4JummJoxRuVzg2CO7YZ24/xA7GnIeA679dbXOFum1d1fARZjP7f3HshK6TzZMm/l/s=
X-Received: by 2002:a1f:b254:: with SMTP id
	b81-v6mr11120983vkf.20.1527626097357; 
	Tue, 29 May 2018 13:34:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 29 May 2018 13:34:56 -0700 (PDT)
In-Reply-To: <CAMKF1sqSR7chwbVcTVVSqO9Fhg_N=fCqtFK20v=LM1cRe2mO2g@mail.gmail.com>
References: <CAJ86T=VefDA6DSEEj06x5SbBvwDKW2mBfxfivPtFcM0kWPn0dA@mail.gmail.com>
	<CAMKF1sqSR7chwbVcTVVSqO9Fhg_N=fCqtFK20v=LM1cRe2mO2g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 May 2018 13:34:56 -0700
Message-ID: <CAJ86T=WG9cQX8F_-WKQe05zGGap=Ey5hAKXaCaLAn9EbpS3p-w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: gcc-runtime: Remove -mcpu=cortex-a7 when building for -march=armv7ve
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
X-List-Received-Date: Tue, 29 May 2018 20:34:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 12:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 29, 2018 at 11:41 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> This change looks wrong (or at least incomplete and lacking a decent
>> explanation):
>
> why do you think it is wrong ? I would be happy to make the
> explanation more decent
> if you have ideas please share.

I would be happy to try... if I had any idea why you think you need it!

What causes the conflict in flags and why hasn't it been seen before?
Why do you only need to fix Cortex A7 and not when building for other
armv7ve cores?

>>
>>   http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=fbec01f01fdad23d95271db063ee0a4d0ab44568
>>
>> It was never posted to the list but seems to have made it as far as master-next.
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

