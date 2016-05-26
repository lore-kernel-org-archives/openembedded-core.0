Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6D365CBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:31:01 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id w184so114667104oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 05:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8UMJf00RDzSKUa9Bt/4yCkojB5UFeo5ka+6exJsi2n0=;
	b=koxsnCHMwDMvvAaSDOnTPLh9HiMuAIBdAzZF64b8Ck9XoGSX/Hb5XVX2t2/eAels3t
	WFwGgeF38nHONy0wA7kuZzZrubcN2TexRc0tLsoCDrRAWIJIyxruP9zMf/6Ds2mT1rMT
	rJehOPSMKYcNE8suUl3qOzNgXLMapkzKgyt9+SbO4eLd4qm5hbHdfq7ziAs2cegWFq91
	TUOefd6c4fnfwqeEOk/0q6lBQ7nMZTm0iDbmKraAe9UTWKI6sXxms40n2veG7m+UcLak
	zf4OoCOqL5Y+TBgQgVhu5Bf27XU1k7qWr8+kyaYmRsXP3BSMEUfKNnqPl/CUeD59Rsnz
	uVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8UMJf00RDzSKUa9Bt/4yCkojB5UFeo5ka+6exJsi2n0=;
	b=LyFBeEjzeWBQlEr1o7QL3mYjmzekfrkhJPqcfBhQDnUoQ/5bYhAad6Fn3hzAFKGede
	JOG378r2ravzn7kXnnsYfDhpzL1foYD0wweDkWkDbmOoOXzufAl2aJuJNANRHe699pvy
	K9TfxL4+npkpMT0sUOHqWM+K//HCDJbhBqq4lLSt5sBr68zO1++o6+WbL65zi0vrQEJV
	HL7LLYXtCQ3AF15xIw9WyaPafDFBjGgI3r9HO7f0Aabrtse58agdvHsc0c6NsncJBK33
	Hua5TA89yqN1BSmSR62+nIxJsa5Fd8dBJEIqb1oLuYbhUk0RX1SIVefvMSrUjixTU0/j
	1AjQ==
X-Gm-Message-State: ALyK8tLaw+JJ4d8s/95rnIuFD/w9qZiGBT9jDMr2grQ+aLXYOlMbpZSqyrVhZKOtiiJmbUr2l2cLdvOYBVgBEChu
X-Received: by 10.202.197.204 with SMTP id v195mr5026911oif.63.1464265862061; 
	Thu, 26 May 2016 05:31:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Thu, 26 May 2016 05:30:32 -0700 (PDT)
In-Reply-To: <62087.10.252.8.31.1464256589.squirrel@linux.intel.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
	<285302afb2b9fb0a868aeda0cbfa3ea956702793.1464176988.git.jussi.kukkonen@intel.com>
	<52090.10.252.8.31.1464187330.squirrel@linux.intel.com>
	<CAHiDW_G9jEcP6MSB4+zGh_PPTBc87+C+5HBcGbEhFEoBNqVnoQ@mail.gmail.com>
	<61959.10.252.8.31.1464255292.squirrel@linux.intel.com>
	<62087.10.252.8.31.1464256589.squirrel@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 26 May 2016 15:30:32 +0300
Message-ID: <CAHiDW_EZGkPgCdbF7ECh=VduF9yvqX8LJf-_dd4j-u0OoU-0fA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] gnupg.org-hosted recipes: Change SRC_URI to https site
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
X-List-Received-Date: Thu, 26 May 2016 12:31:02 -0000
Content-Type: text/plain; charset=UTF-8

On 26 May 2016 at 12:56,  <alexander.kanavin@linux.intel.com> wrote:
>> How can you be sure that other index.html files aren't similarly out of
>> date? We should stick to the ftp directory listings for upstream checks
>> until the upstream sorts this. I'm not sure if the patch should be held
>> off altogether, or fixed so that the upstream check uri explicitly points
>> to ftp for each affected recipe.
>
>
> Right, here's another out of date index.html, so they simply cannot be
> relied on:
> https://www.gnupg.org/ftp/gcrypt/pinentry/
>
> I think we can solve this, if for everything except gnutls, upstream check
> uri is set to
> https://www.gnupg.org/download/index.html
> (perhaps via a class).

Thanks, that looks like a good option. I'll just add
UPSTREAM_CHECK_URI in each recipe.

> For gnutls, it should still be set to the ftp:
> ftp://ftp.gnutls.org/gcrypt/gnutls/

I'll leave gnutls changes out of V2: let's revisit that if they ever
fix the webserver.

Jussi

