Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 56D946093B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:10:39 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id m2-v6so24060943oim.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=acAZshh+8OG92H1h1or63Aee/Bd6OBXX5euv/nlmRGU=;
	b=oRrKVSdPm01S/UKaZEsbq//ujkGOSqsUhYkSeTkza5iWNtIxJBrySku2sK3GA0rnli
	MFN/bhfKuCNx04iNl2US4jElua3XxyYo4BKOXljcZOMt7B9xjm83Qz5HBv0tNhUu6OoI
	pghmelyBlfHwK6nay5+/akwxJYrbU/lHlLhIJHr1fDdJAeG8xUZsL8ieiOyXpudR/Aa8
	GbYzsumpJgERCbkEYo8tIlkXxgeWJmhXG3Nv5kHt2a8hYIiEnxxnqDTvBR8EkX7oq1h4
	/w/5K/b9n0nzZGtMUSqiKAFqnCLF5OR0dcAxJK1RR/ciSyfQBij2OUKfHBF6LBL+UkQa
	+KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=acAZshh+8OG92H1h1or63Aee/Bd6OBXX5euv/nlmRGU=;
	b=GepNHdNRaUpSWoCO0IE6UhwMQGBD/M2v73cjY7EeV65HnhYmblVMkwbfV/MnPiP7z1
	1For+bQciMAC78gSKFWG3RjZJ/kfhen6YLTzRD55bhx4rjRjNFNrwT3BxLX2gjXqsuzz
	orVuT7uhaM+tEVnwAp+jpZj92LkYqb+GONGj4zGYjf+jWtHt2oanZDKG+3h/hxheuw7C
	OlrNZTURLVourcYKY3IAowOJstfjJtJP12YRgKo/mJnOG3MlsekVe4rAT9ersA011v5L
	6V9QZLHgO8wZhe8+pottBh5C+ABf083+cR2h9dxyyRPIFThhaod5gazP2i0MiM8KDjWs
	pXCA==
X-Gm-Message-State: APt69E21SaYO+Bg/DPDg3YhxKBu1rM2rbVFavTkjHqy+WrcJFV1EjxZ8
	mECGby9X93ZkEn8OJaDZYk+twyx3dM7ZWfCdsLmXEg==
X-Google-Smtp-Source: AAOMgpdsKFfeEKpBfQzwTvcql6lcJrasjM4m6b6YDczVchhxjcu5JBW6eFufLyu0WkA2F29vDbRScvrnfqTvBBYL49c=
X-Received: by 2002:aca:4c8e:: with SMTP id
	z136-v6mr12542209oia.170.1530889840255; 
	Fri, 06 Jul 2018 08:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 08:10:19 -0700 (PDT)
In-Reply-To: <CAJ86T=ULm4BBu2JWmVTDfuVxh4vcd9FVDVJzyC3Qt6tgiTNHZw@mail.gmail.com>
References: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYhD_m-+d8cxiCDEULgYLEe7OSq12O3Q=CYFRiqJMP+5w@mail.gmail.com>
	<CAJ86T=W1kjJgn-6P2POoLqF4oBcovEs2Sekp-saaD9dqTSzi4w@mail.gmail.com>
	<CAJTo0LaUkxKcPhasnQh6KAsh2kv5rEmy-jMW3oXKxttS-kd1mQ@mail.gmail.com>
	<CAJ86T=ULm4BBu2JWmVTDfuVxh4vcd9FVDVJzyC3Qt6tgiTNHZw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jul 2018 16:10:19 +0100
Message-ID: <CAJTo0LZzdbqxQNU2kvz=a=f3gurXbYPJD-7U37wU4LPGHiE0Aw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools.inc: avoid using += with an over-ride
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
X-List-Received-Date: Fri, 06 Jul 2018 15:10:39 -0000
Content-Type: text/plain; charset="UTF-8"

On 6 July 2018 at 01:57, Andre McCurdy <armccurdy@gmail.com> wrote:
> That all sounds plausible, but starts to unravel into a bigger set of
> potential cleanups. For example, digging a little more uncovers this
> from distutils-base.bbclass:

Let's take these cleanups one at a time.  I've just submitted the
distribute->setuptools change as a start.

Ross

