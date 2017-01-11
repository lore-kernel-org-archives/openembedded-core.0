Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 041CA6093C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 17:34:58 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 96so49559715uaq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 09:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZGL7RnN3k0zZeCnsWPfjI/x4iM9SflfYP7tNRHaeHXo=;
	b=k7VYYuFpAFPaigB7AcgOaTmGUOIWAScwQ2g+gqQBIjIVKG3WvTI0yQ+ljkO4AikS5E
	ILXm5vFyqpx3PJQqZCYW0Si2AXsOxfWTJ2VWfGd2NcuN2i00v9P1SuRhCG+1jEu61K9b
	TOsMJ1LB1061exHwy3K4HGUdYE5xiMLncgNJv3KOl86DdXHjLyZ7Qqvhg3UzejyHPiBv
	BYRwoE5LyrkTMdGc5CeIA1rv0B5j2JLjT1Y+3MRFIDJ8T4hO+hML/LUzTPN0XGrqKthZ
	AU1hkBb3V8OjELYY/eNEIJPLdS2Wial4Vx8dURqjGzgAVuhrthMaXcCYG9biLx9nCnRi
	KCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZGL7RnN3k0zZeCnsWPfjI/x4iM9SflfYP7tNRHaeHXo=;
	b=KZdUpz3AI7qv32eCXs/0Cju4zrfLdbdgpCMh0SaxtxpWGvgnzkoakxS0nMqhQl1x8Z
	qtIOiWPC5KZPMmTAABCaUM32i4v0BbXARZjlCXv98eMPQvv8GMj2ktVSKhOlVpaFw5EJ
	woctQlUbMSno9uFOPzCGSp5Acj2xWiXbfvZdvanV0FKFsn1vFoIQfXMK4wXy6gy8k1IN
	s8Mjc8MghxtUSxh8OxFBU1mROWEj7O2qC4mxaweoUe8077aQ/WDNUu3XlUeORKbD+rK4
	XyEnqnHoN3LwI536pn+hidx9rzQ0XIG1hwyseyo8TiYgeFh954gcPxaYUQOC3BelocMr
	pZKg==
X-Gm-Message-State: AIkVDXJi0FT/1bOhN3HVNiy1xeQVnEYmZla/NiIA9mEHP5HTLJgSbrdaw/Vemq/flSEefC8mMqo3ecbIUBSkwA==
X-Received: by 10.159.32.99 with SMTP id 90mr4375305uam.138.1484156099240;
	Wed, 11 Jan 2017 09:34:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Wed, 11 Jan 2017 09:34:28 -0800 (PST)
In-Reply-To: <CAJTo0LZW4xH4yahk7tDXdPLueKf0B_PZHgUyYmW37_X6rKwpRw@mail.gmail.com>
References: <20170103015528.29635-1-raj.khem@gmail.com>
	<CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
	<CAMKF1sotQbOB9TMCDqa8cNhiD3QsKdgrQmVzHcw=yCbywzeROQ@mail.gmail.com>
	<CAJTo0LYXVGGnC5XtTA-LDE9oRLK0693xvBnE=11ab+KczbE1hw@mail.gmail.com>
	<CAMKF1sp3bgSVF0+1YLMGtOeQNOVs7XxcM=etkckgbN6-kBvNJA@mail.gmail.com>
	<CAJTo0LbXmAGizX72qZ9LqLUeugoUmb_bM-B8zg-SvLvdwqUaLQ@mail.gmail.com>
	<CAHiDW_FbM2goeKn8ZKY+LZO86tdpgESg8mfR1SiHAsBQRJRbCg@mail.gmail.com>
	<CAJTo0LZW4xH4yahk7tDXdPLueKf0B_PZHgUyYmW37_X6rKwpRw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2017 09:34:28 -0800
Message-ID: <CAMKF1spXx4SSGzoDFtDZRV70FYSjZeSJ7hWOqvg_vJTC7mWVOw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to 1.1.16+ on master
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
X-List-Received-Date: Wed, 11 Jan 2017 17:35:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 8:43 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 January 2017 at 16:42, Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
>>
>> I did pretty much the same "fix" inside connman (defined
>> __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0 everywhere the
>> problem shows up) and it works... but should the hack be done somewhere in
>> the toolchain instead?
>
>
> I'm pretty convinced that musl's if.h should be defining it.

kernel does have a file to abstact the libc nuances
uapi/linux/libc-compat.h

sadly, it assumes that only libc linux kernel supports is glibc
and that is what the problem is here.

>
> Ross

