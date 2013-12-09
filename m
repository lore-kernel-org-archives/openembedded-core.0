Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id D675B6E247
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 23:11:49 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id tp5so7388966ieb.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 15:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4zM8R1byfsx7irM3IFa2aR0s0r6uvLlCD/K5vtsAHTI=;
	b=d/lWVSaOQFk5rqvTUbOX9u0LSJSMp3wdgy7B04CW+zbM5K7+YY3+TyGW68qRwRfl7q
	IuEm4lJs1fn06YTGY7ewtw9NEyNB7hEewCxDKI0ZJCXLPD6G6s7J/eTB/Sf2n2aO/F2m
	KU8PVirpciepF4EuQlISd+0+G3FUtwpWrZbTrClq0pJ1hChIlcBu1QHfICcGCTAsx9Xi
	Rwmt1QnwmhAtqjt4i7TVs4QFzRZ5R7pT9nsXtHXy3BrER7J5hiOCVV8zgTVcIYHOgAsT
	E68S7FYJjo2fyw+oRxa7jIJ76yOe33SvZLLo4Mr6BgEO7w5sBOs7YyaSTrz+vMY5rz6i
	DGTw==
X-Received: by 10.50.79.138 with SMTP id j10mr17973553igx.2.1386630708877;
	Mon, 09 Dec 2013 15:11:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Mon, 9 Dec 2013 15:11:18 -0800 (PST)
In-Reply-To: <1386625884.25847.100.camel@ted>
References: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
	<1386589722.25847.79.camel@ted>
	<CAMKF1sokZrHWRn_2RGT3pKN_RZMy1MnvXCUXn-gDdm4p-1iHvQ@mail.gmail.com>
	<1386625884.25847.100.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Dec 2013 15:11:18 -0800
Message-ID: <CAMKF1sqhu=WJb-OvKsoPO+0R-aB7=yMQFk4JD+iD0VnHMbnQFg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Mon, 09 Dec 2013 23:11:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 9, 2013 at 1:51 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-12-09 at 09:34 -0800, Khem Raj wrote:
>> On Mon, Dec 9, 2013 at 3:48 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > To illustrate why I'm struggling to follow this, "bitbake boost -e |
>> > grep BOOST_LIBS" on OE-Core does not show python in the list...
>> >
>>
>>
>> I can see it. Its on debian python is 2.7.3
>>
>> kraj@builder:~$ cat /etc/os-release
>> PRETTY_NAME="Debian GNU/Linux 7 (wheezy)"
>> NAME="Debian GNU/Linux"
>> VERSION_ID="7"
>> VERSION="7 (wheezy)"
>> ID=debian
>> ANSI_COLOR="1;31"
>> HOME_URL="http://www.debian.org/"
>> SUPPORT_URL="http://www.debian.org/support/"
>> BUG_REPORT_URL="http://bugs.debian.org/"
>
> I doubt its host OS that is causing this, more likely something to do
> with the configuration you have (I'm using python 2.7.5+ on Ubuntu
> 13.10). Which DISTRO is this? Which layers are enabled? Which version of
> bitbake?
>

all is latest from yesterday config wise I am building angstrom. now I did both
with angstrom and with OE-Core only and you are right it appears to
work with OE-Core alone

see

http://paste.ubuntu.com/6548349/

for angstrom version see

http://paste.ubuntu.com/6548360/


I will dig more into it a bit and see how PACKAGECONFIG can be bad in
angstrom's case

> What does the history of PACKAGECONFIG show in bitbake boost -e?
>
> Cheers,
>
> Richard
>
>
>

