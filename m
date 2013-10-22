Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8662E6D257
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 05:17:59 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id tp5so843866ieb.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 22:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xz6obo7vgL0PSCrjKG5s33vBfJ32tvBhi291UgIQ//w=;
	b=bpYzcojHuDJMu38TlQQ5LYnaTfCaayQai7+j5JPvlO0XfYnCUcJUfuN7B+pPFZopLk
	UScTyyDArci1ege3pymD/oYujDMbmi3k8ovemtV4UdV2ryszF9O7pFgVkRkC8PsJKWR3
	O9kUWZeZhyhhwD1rjd/9Ckce2QzbHgUmGdjgi59UrnEmBtnuqWl1sH1MkHD6ouiaDXjZ
	GJuH3aiZhvzH4O9wjW6T6gWLPGT3DjVh2O3NLAkK9m9p0uwmCm4vDGqlO+KSI8p+D2gb
	21vzKODz7CCXuAtmkdlVRXrjaZa6YpnohioYWdmt99SdFy6mqNQVKQCDAvDMk2NADkJP
	wk2Q==
X-Received: by 10.50.61.179 with SMTP id q19mr11968127igr.33.1382419081224;
	Mon, 21 Oct 2013 22:18:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Mon, 21 Oct 2013 22:17:30 -0700 (PDT)
In-Reply-To: <2023592.phK6gWF0Ci@helios>
References: <526556B1.2010908@emagii.com>
	<CAMKF1sqtist2BpszV5AYEids7kYnWxxfu=becBYiAUaQs=PBpg@mail.gmail.com>
	<2023592.phK6gWF0Ci@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Oct 2013 22:17:30 -0700
Message-ID: <CAMKF1spr2FTV--ONvqYCKh4gspmo25yD1vx120r1-ns89LuV4g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "ulf@emagii.com" <ulf@emagii.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using the correct "xserver-xf86-config_0.1.bbappend
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
X-List-Received-Date: Tue, 22 Oct 2013 05:17:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 21, 2013 at 10:13 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 21 October 2013 13:21:07 Khem Raj wrote:
>> On Mon, Oct 21, 2013 at 9:30 AM, Ulf Samuelsson
>> <openembedded-core@emagii.com> wrote:
>> > Trying to build a systemd-gnome-image raspberrypi under Angstrom, with a
>> > few extra layers.
>> >
>> > This fails on "xserver-xf86-config_0.1.[bb|bbappend]"
>> >
>> > The extra layer has BBPRIORITY = 20.
>> > meta-beagleboard has BBPRIORITY = 8
>> > meta-raspberrypi has BBPRIORITY = 6 (later changed to 120)
>> >
>> > BBLAYERS are in the order meta-<extra layer> meta-beagleboard
>> > meta-raspberrypi
>> >
>> > It looks like bitbake will select the bbappend in the layer with the
>> > highest priority,
>>
>> Not really. All bbappends are selected the order or sequence of them
>> is governed by how the layers line up in BBPATH
>
> All bbappends for a recipe will be applied, in ascending layer priority order;
> BBPATH doesn't come into it.

thanks for correction a hand-brain coordination problem .. dont expect
accuracy when jetlgged :)
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

