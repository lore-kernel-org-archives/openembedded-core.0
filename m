Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0BFAF6FF73
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 22:26:32 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id 2so7052411vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 15:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CssXTf8ytVf3hsWJ3ZnbfwbNzeZ7ggxzFVWBcSEiaiU=;
	b=MFZW9EsGe4hhL4QcgSrdYQDoCInswNrigC2b44b/xuTpTbjFWfXylfi5cQz3YH4TLq
	1SEOQSE7FRH6AWWcjm31iyAl6yCQWaM7AXamnhTYNLHqF78W+Ju7t1lTqjeUSjtSzgn5
	NkMJgh8t5jMs2qnoYenYmbCR6y9HlJPqowWQ8vcGUJPt/BGDxDWwhifstI1z8DKxolxA
	9Gz4x5IuE9jVFNgI+HYm6l9R3aB/Byx8sBtgyMft2mM3zKnB6jP/I8sAdAva3lIX1CYf
	Oc0cmdyOYFNNeiMMKpefVAtG6kYLZizaSOJwPoY7B/Z6J0VJHd/3IV1RoRvyFW919nvP
	5g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CssXTf8ytVf3hsWJ3ZnbfwbNzeZ7ggxzFVWBcSEiaiU=;
	b=lQYJPQvl4Ms85gAc4cpEGaX3VENKfedTSd+SHhhOfSgxs237YIy620gqMYV/ukmePA
	Ok67V5LZ+qBkCT6Vz1tbbth+jaECZOD01Z8XQATB9uwlCwYq+Yev5EuQqgMBN0U+I0cQ
	Z13J53B5+5JFFGiFd33BfIaPjt3b6Iy6Zse8zwPSVx532aNN9/sRrWCijYjlTjLX2iYN
	19pwn5p2chwefhh7QY4KAEusIDLolGPEQz58Eym5j/PR3P2UUS21rYQdS5e2bLBDdM3K
	C9LAZxRZp1KpOco6/J90MzoKSubzUDHKkupmSqv+DYZGrhgIs0j+77suosqRxy4LbZqw
	6wwg==
X-Gm-Message-State: AA6/9RlnkqZxF/KOwDRBvo4sTaT8BJdiUsA/GBTby10JOH9HeatDRfp/1BSlm/Vxfu1u1szxPMjU7GDLQGd4lw==
X-Received: by 10.31.0.67 with SMTP id 64mr14838856vka.173.1476656793713; Sun,
	16 Oct 2016 15:26:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Sun, 16 Oct 2016 15:26:03 -0700 (PDT)
In-Reply-To: <1476651096.3357.16.camel@linuxfoundation.org>
References: <1476622744.3357.12.camel@linuxfoundation.org>
	<4C702885-035D-4AF3-90AD-B5E8733DEFA0@gmail.com>
	<1476651096.3357.16.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Oct 2016 15:26:03 -0700
Message-ID: <CAMKF1srjWx7O5=56PUSgMpF_mbv0j1AFy2XFLVNHXCYVg_xY-A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: uninative, older distros and libstdc++ [2.2 uninative issue]
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
X-List-Received-Date: Sun, 16 Oct 2016 22:26:35 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 16, 2016 at 1:51 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2016-10-16 at 11:15 -0700, Khem Raj wrote:
>> >
>> > On Oct 16, 2016, at 5:59 AM, Richard Purdie <richard.purdie@linuxfo
>> > undation.org> wrote:
>> >
>> > We've had a lot of success with uninative but in the 2.2-rc2 build
>> > which I ran last night on two different autobuilders, we saw two
>> > different failures:
>> >
>> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=10441
>> >
>> > On a system compiling source-highlight-native with gcc 4.9 where
>> > boost-
>> > native was built on a gcc 5 system, we see one error. On a system
>> > compiling source-highlight-native with gcc 4.8 where boost-native
>> > was
>> > built on a gcc 4.9 system, we see a different error.
>> >
>> > The trouble is that libboost_regex.so in these cases wants the
>> > newer
>> > libstdc++ but at link time of executable, it can only see the host
>> > system and hence can't see newer symbols like
>> > std::runtime_error::runtime_error(char const*) or
>> > std::__throw_out_of_range_fmt(char const*, ...).
>> >
>> > I have done a lot of experimentation and the only way I can see of
>> > possibly making this work is to add -Wl,--unresolved-
>> > symbols=ignore-in-
>> > shared-libs to BUILD_LDFLAGS for source-highlight *and* ensure any
>> > native binaries get tweaked to use our own uninative loader before
>> > they're run. The former is horrible and the latter bit is hard.
>> >
>> > Another option would be to have multiple uninative feeds based on
>> > gcc
>> > version rather than a single uninative one.
>> >
>> > This close to release, I'm reluctant to poke this too much. We
>> > don't
>> > have many components that using C++, source-highlight is a
>> > comparatively new one which isn't in our default configuration for
>> > now.
>> > I'm therefore tempted to release note and look at this in 2.3.
>> >
>> > Opinions? Other ideas?
>> I think it could be related to ABI versions, may be while compiling
>> libstdc++ with gcc5 should enable --disable-libstdcxx-dual-abi
>> --with-default-libstdcxx-abi=c++98 for checks and see if it works
>> its also not best solution since thats now the default but it will
>> ensure that this is the problem we are running into. Then second
>> option
>> would be then to use --enable-libstdcxx-dual-abi
>> --with-default-libstdcxx-abi=c++98
>>
>> this combination might be better of the two. of course this would
>> then
>> need testing it with gcc5+ as well.
>
> We're already effectively doing this. The trouble is the libraries are
> not forward compatible. For example, if you build boost-native for
> gcc5, then use it on a machine which has gcc 4.9 to link into source-
> highlight-native, it looks for the gcc5 symbols used by libboost which
> aren't in the host system's libstdc++. If you try and make it link
> against the uninative libstdc++ (for which the dev symlinks are
> missing), you get all kinds of other weird errors since the headers are
> from gcc 4.9 but the lib from gcc5.
>
> I'm not sure there is a way to make it work properly in all cases for
> C++ :(. If there is I've failed to find it so far.
>
> The dual ABI is already enabled and defaulting to something old, but
> that doesn't make it forwards compatible.
>

thats right. Other option would be to see if we can remove dependency
on source-highlight for boost then we can atleast get rid of this particular
issue.

We can also try to build uninative tarballs will oldest compiler and then
require the hosts to install 4.8 or 4.9 ( whatever we choose ) runtimes

> Cheers,
>
> Richard

