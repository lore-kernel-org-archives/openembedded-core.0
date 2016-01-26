Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id E1E0C762AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 03:27:56 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id mw1so44478876igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 19:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TFFzJD071PDPw13okzYeKSYmkNvjAV4Xr+5/zmY30G4=;
	b=S70qVipi8YhhrJFyz8f214P/JnQYhEsz0A/IWpq7JdsCb6lnqaQ4gSAGpm3mkqJ91+
	oqWz499irhCkHtgVtVnRmPruHVETmVzlfr3W3GPq6yZIhrRmMnIVuPh7WiMceE9q84Ot
	+gbJhcVR9kAY9xaSF3/GJmihWVa+27Y+xO1dEuKeKKgqYKEVvDRGhKhUn9C9y4RZbKdC
	RPJIYXmOfqVonQRoDyANb3mKnjkE1KPn1N+XdxU3bCWzbbB4ikSJGTNTnbVdrz33KtKl
	Qk2NmbDB/37WSewbjdQkQBCvbPcsVcRa9kXmoJp/mqLjeuAWkt6SqlorVCD8kzve35U1
	k0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TFFzJD071PDPw13okzYeKSYmkNvjAV4Xr+5/zmY30G4=;
	b=M4AY5NQsKCMipfEHlRmTFCNfvmN/WtccweUhp2FsLUR8vHxhmbTlzknQqPJPPZ+MPu
	bUrkXIrcTKzYuewBYHiqjagaQHo7ZDbOVFwrkKwzjtbnfFcMKUlc8VKcBLC6/BW94RLL
	i0BKtWdQlx4/8dbY7YdX1woub/9aV0fZn3wxRZmOnmrGBdRZ5Qp450Yx7xCFnBrUdDTS
	YeQO9MuKzGR0O2pE3r+6l/aFjxDcIhhZnSij4f2q1gdHemyk6EnIyTC9h1PuXOeUGlLi
	YaWY9Bsvycx4G94HFTt5SQF7Qoe0wR3Dr1sZxnEKey4VvT3s1n2M2JVzO4rayWUXF3Lj
	h07A==
X-Gm-Message-State: AG10YORZdSWAX5t6dGJBHO8JTGAlRfIMhSFRn97fextSghxq4417PbhXu1+Te1Tlw3KWqxIMKbIY4USMvqeWkw==
X-Received: by 10.50.171.200 with SMTP id aw8mr21995968igc.77.1453778877153;
	Mon, 25 Jan 2016 19:27:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Mon, 25 Jan 2016 19:27:27 -0800 (PST)
In-Reply-To: <3155839.Pu1rtcj5m9@peggleto-mobl.ger.corp.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
	<7904F7D3-27C7-4A18-8A7E-2D201E9F048A@gmail.com>
	<63210057.xvudzCYbSC@peggleto-mobl.ger.corp.intel.com>
	<3155839.Pu1rtcj5m9@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jan 2016 22:27:27 -0500
Message-ID: <CAMKF1sqqU+2DvonXYAk73Bbt_MSkQ4yB5U+_ExTaxod6T63d2g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] devtool: add configure-help subcommand
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
X-List-Received-Date: Tue, 26 Jan 2016 03:27:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 25, 2016 at 10:21 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tue, 26 Jan 2016 16:17:39 Paul Eggleton wrote:
>> Hi Khem,
>>
>> On Mon, 25 Jan 2016 22:14:09 Khem Raj wrote:
>> > > On Jan 25, 2016, at 9:53 PM, Paul Eggleton
>> > > <paul.eggleton@linux.intel.com>
>> > > wrote:
>> > >
>> > > When you need to set EXTRA_OECONF for a recipe, you need to know what
>> > > options the configure script actually supports; the configure script
>> > > however is only accessible from within a devshell and (at least in the
>> > > case of autotooled software fetched from an SCM repository) may not
>> > > actually exist until do_configure has run. Thus, provide a "devtool
>> > > configure-help" subcommand that runs the configure script for a recipe
>> > > with --help and shows you the output through a pager (e.g. less),
>> > > prefaced by a header describing the current options being specified.
>> > >
>> > > There is basic support for autotools, cmake and bare configure scripts.
>> > > The cmake support is a little hacky since cmake doesn't really have a
>> > > concise help option that lists user-defined knobs (without actually
>> > > running through the configure process), however that being a design
>> > > feature of cmake there's not much I can think of to do about that at
>> > > the moment.
>> >
>> > this option is autotools specific. We need to convey this precisely. may
>> > be
>> > involve autotools in the option name or something
>>
>> Whilst not all non-autoconf configure scripts provide a --help option, some
>> do. ffmpeg/libav is one example (and one where you really do need to see
>> the output since there are a lot of options...)
>
> I meant to add, even if configure --help doesn't work (or there is no configure
> script at all) the header this subcommand prints will work with any recipe
> provided that do_configure is actually implemented and contains some actual
> commands as opposed to calls to some other function.

my worry is it being associated to do_configure, and we know that only
a subset ( although a large one) is only using autotools but not all.
So think about avoiding that confusion.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

