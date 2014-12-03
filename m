Return-Path: <dev@codyps.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC8260169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 01:14:06 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id f15so12616480lbj.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 17:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gSNm7xKxnM/M5XUboNrDpFztEdIE+ZcXbuQS7h13qHc=;
	b=Vi8eBRMfX4lVIDyZaQvbEfNncxJXf/3PXj8uudPmMv6I7lGS9U6mEGu8Nd+Jo0kw+k
	PkWxwULS7yJ6qk4z8RpmTWvooZbJ5GsmLGElvGlgPvYJrM4mopUWJ1kFc4XprA7mKeWd
	TY37QsCL+7okWyevndImeY9wRGYWtYnCGvgrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=gSNm7xKxnM/M5XUboNrDpFztEdIE+ZcXbuQS7h13qHc=;
	b=REwOMeeqOkhyMeLll4xk+ai0xcRgh+QnVuxmlqvGF/P0nNt2SXl/042bHI+24UkkNN
	NBt44DVlL4iBToQNToBblRe5BXn4Dz/MFUQZKh2KPcxao5Ltuh+I8WB0mf/Co66h2Jda
	fYkBz0VHFUQuw9Pev+6lPuYiURabInKJSKj9I4S4Rp3SQHBEbchEYL3ejyDkXuMsxLr3
	AIhXV2gIXRt4DtRwAGApCx6ZNEEl0DiQ45sMo6gyhXcdj3Q5TMbf8uqG76yEUotuqSvu
	Fq5V9Wgbnl298v7OsD2TDLrj4gA546dJi/I008Yv6xVKkbQugwBqpyQ8cbebnt9onXV4
	GVWw==
X-Gm-Message-State: ALoCoQklEoIVNyJtWmmnRZAAKoLYhHGs/pSjp5uUzmSmuOifJ1Pl1uVWnUo1alDGm2nHqNG+Cj4H
MIME-Version: 1.0
X-Received: by 10.112.130.65 with SMTP id oc1mr1878005lbb.7.1417569246493;
	Tue, 02 Dec 2014 17:14:06 -0800 (PST)
Received: by 10.112.150.2 with HTTP; Tue, 2 Dec 2014 17:14:06 -0800 (PST)
X-Originating-IP: [2601:6:6b00:f9::a66]
In-Reply-To: <CAJTo0LaP0B2G7zFYqpaqyQOHVfoX2FWGxzSRLuG4zmuDZWjtTg@mail.gmail.com>
References: <1415755840-4750-1-git-send-email-dev@codyps.com>
	<CAJTo0LaP0B2G7zFYqpaqyQOHVfoX2FWGxzSRLuG4zmuDZWjtTg@mail.gmail.com>
Date: Tue, 2 Dec 2014 20:14:06 -0500
Message-ID: <CAPoQQ-2ru=bxkD3vsQV01YtUvWfY-S4tAqt+4nb54UQKxB+eug@mail.gmail.com>
From: Cody P Schafer <dev@codyps.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: supply CMAKE_AR in toolchain file
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
X-List-Received-Date: Wed, 03 Dec 2014 01:14:15 -0000
Content-Type: text/plain; charset=UTF-8

I tried the bare set(CMAKE_AR ...) first, but found it was being
ignored. A bit of googling found:
http://www.cmake.org/Bug/view.php?id=13038 Which contains the solution
I've used here.

On Wed, Nov 12, 2014 at 11:08 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 12 November 2014 01:30, Cody P Schafer <dev@codyps.com> wrote:
>>
>> +set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
>
>
> Curious - why does this line have CACHE FILEPATH "Archiver" when e.g.
> CMAKE_C_COMPILER doesn't?  Should one or other other be fixed?
>
> Ross

