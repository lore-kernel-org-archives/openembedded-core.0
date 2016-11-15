Return-Path: <matt@madison.systems>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 54E0A6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 18:43:32 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c184so25349211wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 10:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Erpw8M3pzchY/CacgrsGqskM9HkyYDTzkLwsOsBkX7Q=;
	b=tlPF0zZklqDWoqi9PadOk5RadGzzLJa31KVWGhObC7DWgoLeJ/ML75pd7EX1ILkVTt
	5IbfCuo20eHcz+Mqf1Bw+O1jg9AtYmCVflc7f7lPlPwHsOCpcJTIpAtdswCFN5WeVl3h
	u5Jf5wJSvrm5+DNm67YA6zIqd3yRn7lDwtcnJyQ3ZW3q9CoKIo0IcG/NI4yNEoQEojlF
	o3MdWjwaIEGPvuC9SHJu84aYOOFbhg/lhDQbn4E6KrAk4eBLn6V6BCyqxb61x/x42927
	U7wKuPrSpoG0SYKFQmCzFYx90h3VYHZzdzVRn4TiNHjswf3tsR668FAdDF4qgZFnyTKQ
	+Qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Erpw8M3pzchY/CacgrsGqskM9HkyYDTzkLwsOsBkX7Q=;
	b=InCoNTsvYko8l3QWvwxMRr4L6NY/I7AXaJ7EI5IpZ2lOsJWlmhOLLsuEya1/XeSeGR
	y4jnrLk3bu37ubmiXRazxHLoQQUOS4PAHHbTj8gqxt7Kf9v1M2LSNoV0rrQUt8zX+NiQ
	CnD9N0BH1vfwjuImEI0C1SXTNztxsrZ1peA0IQzfMkGY8ezxa8IB3CsgaJtZryuxdKNY
	ceLNTCSU8GNmzeaz2wNE16HIFHHOZA/wp9LYgpTxtaolhrbkGntXIeI3Qfmoenr8xsg1
	AeoE7NxHH71IjntQoS+K4qGH6XZvU5sbfLtNMD0a5KCJ/2ZoyRo4TirsGwdGspaCJH+0
	pSOg==
X-Gm-Message-State: ABUngvcFvkiH+Pi8RCargFEVxjzAiWFg2gOXZqugPzZmmiAtRpVZHOfKf8GXDSfP6CPL8rLyCQLcPrPFTYMICw==
X-Received: by 10.25.44.145 with SMTP id s139mr10785175lfs.176.1479235413602; 
	Tue, 15 Nov 2016 10:43:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.134.7 with HTTP; Tue, 15 Nov 2016 10:43:33 -0800 (PST)
In-Reply-To: <1478887474.23123.233.camel@linuxfoundation.org>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
	<1478887474.23123.233.camel@linuxfoundation.org>
From: Matt Madison <matt@madison.systems>
Date: Tue, 15 Nov 2016 10:43:33 -0800
Message-ID: <CAGgRHJownetFS-d5sAeWXm+HhpdP-sHu-M7WumRKeYqZh2rYKQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Tue, 15 Nov 2016 18:43:33 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 11, 2016 at 10:04 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2016-11-11 at 15:10 +0200, Alexander Kanavin wrote:
>> On 11/10/2016 02:39 AM, Khem Raj wrote:
>> >
>> > This is converging the recipes for go from
>> > meta-virtualization and oe-meta-go
>> Wait a moment, why this should go to oe-core and not to meta-go? Is
>> there something in oe-core itself that requires presence of go
>> compiler?
>
> This was something that came up at OEDEM. There are several layers with
> several attempts at getting this right, most have some issues.
>
> Whilst we've been pulling things out of core, we also need to consider
> things that perhaps should get added. Having this in core would
> certainly address a number of issues (but is also potentially a
> maintenance burden).
>
> We did agree there that we'd consider this. Obviously input from people
> not there is welcome though and this does need discussion. I'm leaning
> moderately in favour of adding it as things stand.

It would certainly help me, as I have a bunch of developers writing Go
packages and apps for embedded targets.  That said, I don't know if Go
is really mature enough.  I've just been working through a pretty
significant bug in the Go 1.7 runtime that makes it unusable when
linked as a shareable library, for instance.

Any reason why more of meta-golang couldn't be integrated into this
patch set, though?   I've been looking over what's in oe-meta-go and
meta-virt, and most of the patches i put into meta-golang to have
already been pulled in there.  And go.bbclass looks like a subset of
meta-golang's golang.bbclass.

Whether it's pulled into OE-core or a common layer hosted at
git.yp.org, it would be helpful to synthesize a common base for Go
support.  I'd be willing to help that.

Thanks,
-Matt

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

