Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 999187713C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 18:35:59 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id 5so20024635igt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Q3r6qL/p2tYAh3JGSawYnHkspeOqEGsqb7/baDWbBVw=;
	b=sDrfK2LeRyi1YaMY2hTAi6L4r+unokf/yrEayRkhEY5ImEspkqRzaCmnofobWbDs6v
	j6RAAt8MDIacrOjfsjZd+Tc2S+FwoqovyAbSYJo9t6ssjUbLrtfxcCfP41Z7jz2Gr6pv
	spF3HRCrohMtcwxoSSbC+9Nle5CMwr5Uvho0copIHxQFr9G2ltGvGz6B4CAQ6d1Gi1qr
	Iu0KGDGZ6wycOZqKBuW9oYL5MRp6qyvrFjWJv1Ol2nPezTW4RkV+6TNaxggfK0fKZ8S4
	O/CuvTrDw6znRafKepCfduu57KRpPH86RUlthjC7ewppmeV6NcfbE67XaJIpFle8yvyd
	HOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Q3r6qL/p2tYAh3JGSawYnHkspeOqEGsqb7/baDWbBVw=;
	b=gmw3sSmSnTGdEdpxuouSlJ8Ea5k/cN+V2sMuRCuzg3JF2LmWMx6MzwH93bfRzAIVJz
	sONfNAoA9gToO8MITXpyxefBIiW5lp1Wsv/ece5YAQjJHq3BjuED5WcipgydCtRuSyFP
	afheg2H05Nyj4nnT02AkItO0y+0NMn6751kKZymZ66svKhT8nIWipCcidnCXk55C1Ulx
	cU3ULlK45/EFylS8APdcJR0+1CLifWbrUCUzM0es9SYAp31ZYVYFhDAX2hJ1JysXUZ4X
	2KJ9LQmOkQhmr8CLIKxi6yZASRG1s2xEaDlOKKezyGrhvNkov/+ts38Xxuv6vtBp34An
	zz6w==
X-Gm-Message-State: AG10YORQQasfRSM+ndSbs70dEJ54d6qSYkUiDSmJhwLmRGwU9haT+syvNPcoBJIGX/n8W+fdJt6QkWmcc3hxgA==
X-Received: by 10.50.79.196 with SMTP id l4mr17426066igx.11.1454697360061;
	Fri, 05 Feb 2016 10:36:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Fri, 5 Feb 2016 10:35:30 -0800 (PST)
In-Reply-To: <1454697094.27087.280.camel@linuxfoundation.org>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202210411.GA20640@mcrowe.com>
	<1454452885.27087.127.camel@linuxfoundation.org>
	<20160205173256.GA7728@mcrowe.com>
	<CAMKF1srahWOS2zu2G6JEXZiwcX9sgqXQ9LOb4z6n0te73H=RDg@mail.gmail.com>
	<1454697094.27087.280.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Feb 2016 10:35:30 -0800
Message-ID: <CAMKF1soP1rkYv311PydyAhh7oK7rSbZpKQa2t2XBbT-efT9YZg@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Feb 2016 18:35:59 -0000
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
>
> Obviously I can merge the above into OE-Core and then there is just the
> final bitbake.conf patch. How long do we need to wait for other layers
> to sort this out though?

hard problem, it just makes it longer for adopting a release thats the effect.
the only solution is to fix the issues. Or phase in with backward compatibility
these kind of stuff can be treated like ABI of OE-Core IMO

>
> I'm facing this dilemma with a few patches atm...
>
> Cheers,
>
> Richard
>

