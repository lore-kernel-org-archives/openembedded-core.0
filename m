Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3356057B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 17:44:07 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id b67so4082174qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yszR5Fu3+2r/xJm2YbKGFGCR6GWXiFNJSP+sMg280Ho=;
	b=INZSHfjsXCLPOwb+a4U34DZINvIvHEs7J8kbrGydpUrUStrh/f/WeJaL9WAET5gWUR
	7AYsOxEuRwSdsAaH4gwKnE4QTTOlOjW8AbV/LVVbL21XRAhKXfMrTAI6HEvQiqkinQlU
	SfmZSDw4tuN8lIkn4ii2t+ONBNdyhfHHdUQgvBj1qW1NXAjDj+Hq6GjX+qxxtZiS6DBX
	/ETeRG22LyH7T0NFolsV+0hSw2G9XsFP4riqipG75lLIx+9hEHGyTJFYukQIW9hiNUby
	BkPdFTkdoZDChiAu7x0KnT80wvJ90sLhHBu3Ke67K8ECXj+XqsdRoDaz67K6OpEi6R2v
	VeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yszR5Fu3+2r/xJm2YbKGFGCR6GWXiFNJSP+sMg280Ho=;
	b=k7ZMBUsbZZFnghkoWBC49x/exDeqWM7PRiXPnjFeAstL8eOQY+7d4YVk7+qBjNgbfs
	I3f6Mr4RvOQ+ykuq/uKbZYOqbwNveNEQ8E4zn8V+IqitPqYapgrWdYAKNLEvwvHlyEN/
	i9J6u58b8tdKj5o4pHj3JVprhHEY5rnD9/S56XFIWXUMBAj3FYAAGwzgxh7IH6qMzWKR
	4z6aSUt0Wdxau8Cb8kG9iOYrQius4I3Nz+nizBJ9HR4JAQ/pidLV51Y3R5+Vx/GY8cFR
	BgWhdP8I20IqFGwePiuwoQ2TcvpsaWozhysZ56N5KX2eDjIVlv3HHU16YddzKGPcGZYw
	Fniw==
X-Gm-Message-State: AG10YOTEgFjQ3X2qQQv2x2dQ2DR0fuOPyLrXPvL1XpfKYSvblqvWS8x26P/0AYNBstEYpnLnZKNB9CIEugLPhA==
X-Received: by 10.140.108.181 with SMTP id j50mr22956735qgf.104.1454780647572; 
	Sat, 06 Feb 2016 09:44:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 6 Feb 2016 09:43:38 -0800 (PST)
In-Reply-To: <1454697094.27087.280.camel@linuxfoundation.org>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202210411.GA20640@mcrowe.com>
	<1454452885.27087.127.camel@linuxfoundation.org>
	<20160205173256.GA7728@mcrowe.com>
	<CAMKF1srahWOS2zu2G6JEXZiwcX9sgqXQ9LOb4z6n0te73H=RDg@mail.gmail.com>
	<1454697094.27087.280.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Feb 2016 09:43:38 -0800
Message-ID: <CAMKF1srnmT=tec4VEk+ji3DjOsq0kVhOBh25e9DceiZNbX85Sw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Sat, 06 Feb 2016 17:44:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 10:31 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2016-02-05 at 10:22 -0800, Khem Raj wrote:
>> On Fri, Feb 5, 2016 at 9:32 AM, Mike Crowe <mac@mcrowe.com> wrote:
>> > On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
>> > On Tue, 2016-02-02 at 21:04 +0000, Mike Crowe wrote:
>> > > > I've compile-tested qemux86 and qemuarm for core-image-sato.
>> > > > qemumips
>> > > > is building now.
>> >
>> > Since then I've collected enough patches to make "bitbake world"
>> > build
>> > successfully for qemux86, qemuarm, qemuppc and qemumips. qemux86-64
>> > is
>> > building now. The recipes that needed fixing to explicitly set
>> > EXTRA_OEMAKE = "-e MAKEFLAGS=" were:
>> >
>> >   meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
>> >   meta/recipes-bsp/libacpi/libacpi_0.2.bb
>> >   meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
>> >   meta/recipes-connectivity/openssl/openssl.inc
>> >   meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
>> >   meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
>> >   meta/recipes-devtools/perl/perl-native_5.22.1.bb
>> >   meta/recipes-devtools/perl/perl_5.22.1.bb
>> >   meta/recipes-extended/ed/ed_1.9.bb
>> >   meta/recipes-extended/iputils/iputils_s20151218.bb
>> >   meta/recipes-extended/pigz/pigz.inc
>> >   meta/recipes-extended/stat/stat_3.3.bb
>> >   meta/recipes-extended/sysklogd/sysklogd.inc
>> >   meta/recipes-extended/unzip/unzip_6.0.bb
>> >   meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
>> >   meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
>> >
>> > I will submit patches for these shortly.
>>
>> then there are other layers besides OE-Core where this will be
>> needed.
>> so phase it right so it doesnt cause land slide work for other layers
>
> How do we do that?

announce it to cross lists ahead of time so they can test out the features
ofcourse an argument is to be made that they should already be
watching OE-Core changes, however a heads up can only help.

>
> Obviously I can merge the above into OE-Core and then there is just the
> final bitbake.conf patch. How long do we need to wait for other layers
> to sort this out though?
>
> I'm facing this dilemma with a few patches atm...
>
> Cheers,
>
> Richard
>

