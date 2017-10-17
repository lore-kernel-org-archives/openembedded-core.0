Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 046E8782F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:29:42 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id m18so1815549pgd.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hcykj7/sOJ4a4KK1eHf6OCzDRbLP8AivLbTZg+mVKQs=;
	b=mOqyKXC+CK8dD2xi6qk+eEme+LFHAMnoEfbhB6OYSEpQEzysoMkfKXcK0672dgZa9r
	9WOjgO8c5zTWNKc/Ry5IJuGbPgWe9M9dQH7jx/u3o2yZnLWZ++AI8xX+HTwwm725YBhR
	+vFVtb2EOmUJXmd9BjwcVxhucgCx6P5akInNPSWihzMyo1TqAHo4qJUa9HoIQ9ZFw/3R
	TYUNrNhN0w/D9SbP3D7ktp+UaUWVB7kjyix7n7MngIlWeCYIa5ceMvmTigBqNc0u8Weq
	P7zHUQMtd5y58xWXkXDUzECZEoZ2mGYiN6RDFa0SEAmFNRrolbWqWYrDov1IC/SYH0NZ
	Kskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hcykj7/sOJ4a4KK1eHf6OCzDRbLP8AivLbTZg+mVKQs=;
	b=Aa5ckArQC6yfwRvlDV7vPkgvqKV7ogt/4IcZdNtt5cCAbuiQv6ubDDyj7svqrDOY/k
	e+cMFa/6GENNBizzwjYKONW9iWhyAem4/+57fzbKeVHPeEY+Bggbhn3t/BDOR8KEo4lS
	aHPoy0g8NFCcyo5qr8OKN1GcXXtzBW/7n8oEPGvxMcfJwTfNYncuwgYVDzCao8tw4dzT
	2uIyjalLBbz1dgKKydX6ZnwsMsWj21H3Cex5ZlFu1EX0SFUEoShO4nF0ZQobP9uk5/ix
	kdSDpc3Pjk4AJ6panRUczXBdxLh6PbSkfTpDyOSwVuhdXUBOqnQg8J3T+yMMYpipaksF
	sHQw==
X-Gm-Message-State: AMCzsaVyo4VdND9nskhLn5jBbOxVkNYgHCGp8DCeG7CEG7AQxTcQDnKQ
	zHuk7jCI+QXCrNUvdBRDSuvndiT/k7ICNdhDwm8=
X-Google-Smtp-Source: ABhQp+Rvjb4gOtn1GIeQaFlv770DvYET9on6oadsH14VJVbbMVcdSlkZl/cQW1JLjpOVyPGXfwJerbD1Aid5GOG5l2E=
X-Received: by 10.84.175.3 with SMTP id s3mr9697743plb.440.1508257784357; Tue,
	17 Oct 2017 09:29:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 09:29:13 -0700 (PDT)
In-Reply-To: <CAJTo0Lb81WDPU5mFKi+5SJkuqXDgxFEwnD2LLCMk+T24_M7nWg@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-4-raj.khem@gmail.com>
	<CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
	<CAMKF1sov3p8viw9h1SjNF9Hyz0X5LuMqbJ4JnyFw-7HHxnKTLA@mail.gmail.com>
	<CAJTo0Lb81WDPU5mFKi+5SJkuqXDgxFEwnD2LLCMk+T24_M7nWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 09:29:13 -0700
Message-ID: <CAMKF1soaVRfyvgYcZy2TSfjgOT+Er4eB0kCKtWd0_wqbZwH17w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Tue, 17 Oct 2017 16:29:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 9:25 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 October 2017 at 17:24, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Oct 17, 2017 at 5:41 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > Curious how you hit this with master.  For me:
>> >
>> > checking for check >= 0.9.9... no
>> > configure: WARNING: check not found - skipping building unit tests
>> >
>> > The configure script uses pkg-config so shouldn't be picking up host
>> > binaries.  Can you dig a little?
>>
>> do you have ptests on
>
>
> Yes but libevdev doesn't have any.

and I am using new pkgconf

>
> Ross

