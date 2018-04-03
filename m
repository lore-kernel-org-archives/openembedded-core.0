Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A60C36004D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 18:39:10 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r191so4886655wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 11:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d1MxE0nK/V1MbxuJQQzZ1acdb0nsymdcBQWxjNC7kx4=;
	b=ZbiVDPoSQ5RMYYVF6wXyLoBWGZ5n8f7ksGq6rnWFBPBvvPEFy5QAUV7STY0m52ob6Z
	CEaWlthNqPY2usDV9459YZMwzrd8x7Tjr1fvAi/ifgWzro7V1RLFRLThWYpMFskfft95
	Nn7bfyVkHT3A3HwKiLP7czIzLxWMy8YtBulXdJD6P9wV3s7NH+cPQc41j1Auf+8fFPGJ
	ZsIGSFfeq8TA8T5FHIn3vUro10epTg9gFgkh6M4dD69AMaNLaWEjc9Dtg1oWPPBBEyZ+
	xY6WOpxE/fuY9klEAdayk3uP2n1VjoVrKNDL5194GLr421vo3FIGiwEVc//G2CKddPEH
	y9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d1MxE0nK/V1MbxuJQQzZ1acdb0nsymdcBQWxjNC7kx4=;
	b=JIMZNL1iChUdXiOq8HkUhxI+fUSCSQ+Tcyycj4go2xzDIVP0XAbQ0lzeyqW7zT92Tx
	fxyfMyyu7ukR9gZlqFsFK/Z3B8rHBjkyDsRH0Jc5mvnnZw+Hm0TNreExXqDqfn/Ejfiw
	LJ5VoS/HIYM2ipc6odQLjE75wRKC83WfqLM/BYGu2KfIll4V/J+cIR8XGY2kcbAcOAsY
	75llCHvsAKv0qHhYAxp6MXFghw7K2vZufuIELQ4MzU0PnNTJwFlTtcdo+itTD4tYK8X4
	oH0FH9/3N0+oMYODf3jzLPuq1Ltrxf7sV7gUPlIGLS0WsaUjqTd4mDIXh12utuCsaSkm
	9PQA==
X-Gm-Message-State: ALQs6tCqs9AN4f0+Pxa44iF9HWuCxcwXX1XjSw8ukOyji6y94Dw6ZCLs
	9+4mQrS83V8mCXsBrxW+XZ1cA4QHsSu2yWWG2XIYvA==
X-Google-Smtp-Source: AIpwx49InMhosr6CXrEwU+WFLA5Wq37ySIZSs33T4CvSjj8CGu3G59Wzpoh6ZNJZW+XwbCDSVseT+v4YH1PnXcUBwmo=
X-Received: by 10.28.170.205 with SMTP id t196mr5303482wme.42.1522780751245;
	Tue, 03 Apr 2018 11:39:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Tue, 3 Apr 2018 11:39:10 -0700 (PDT)
In-Reply-To: <1522401185.11431.117.camel@linuxfoundation.org>
References: <1512524120-16006-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=WiHB_6J8Rj0YXv7MTqu7xBgLFt9+09W+UsEjKd-PoyAA@mail.gmail.com>
	<CAJ86T=Ur=A8XQH=UJu9NmxE7KmPgYmWN0bLL8X1akvV0vLNA7w@mail.gmail.com>
	<CAJ86T=U+mP5KPJBUL+18i3g21nCiMX_JNi0_Ad2mj5iGNqFvog@mail.gmail.com>
	<CAJ86T=XqUjHH-1_pBKfozk588wWBmqHTOhOBfT15iEmx8qC7rw@mail.gmail.com>
	<1522401185.11431.117.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 3 Apr 2018 11:39:10 -0700
Message-ID: <CAJ86T=VCw8oqECKQHYv0t5k1tjROrhP1gzq5WPksUM_tAW-4_g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Tue, 03 Apr 2018 18:39:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 2:13 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2018-03-28 at 15:55 -0700, Andre McCurdy wrote:
>> On Fri, Mar 9, 2018 at 8:15 PM, Andre McCurdy <armccurdy@gmail.com>
>> wrote:
>> >
>> > On Wed, Feb 21, 2018 at 1:40 PM, Andre McCurdy <armccurdy@gmail.com
>> > > wrote:
>> > >
>> > > On Tue, Jan 23, 2018 at 12:16 PM, Andre McCurdy <armccurdy@gmail.
>> > > com> wrote:
>> > > >
>> > > > On Tue, Dec 5, 2017 at 5:35 PM, Andre McCurdy <armccurdy@gmail.
>> > > > com> wrote:
>> > > > >
>> > > > > From: Ming Liu <liu.ming50@gmail.com>
>> > > > >
>> > > > > A flaw was found on my Ubuntu 14.04.5 LTS, on which that
>> > > > > gnome-terminal is
>> > > > > the default terminal, when I run any of the tasks:
>> > > > > bitbake busybox -c menuconfig/devshell/devpyshell
>> > > > > bitbake virtual/kernel -c menuconfig/devshell/devpyshell
>> > > > >
>> > > > > I got a error as follows:
>> > > > > "Failed to execute child process "oe-gnome-terminal-
>> > > > > phonehome" (No such file or directory)"
>> > > > >
>> > > > > Seems the environment of the process calling Popen is not
>> > > > > passed to the
>> > > > > child process, this behaviour is a known issue in Python bug
>> > > > > tracker:
>> > > > > http://bugs.python.org/issue8557
>> > > > >
>> > > > > It could be fixed by using an absolute path instead per test.
>> > > > Ping.
>> > > Ping again.
>> > And again...
>> >
>> > It looks like this (and a couple of other patches) made it as far
>> > as:
>> >
>> >   http://git.openembedded.org/openembedded-core-contrib/log/?h=stab
>> > le/morty-next
>> >
>> > but then got stuck or forgotten?
>> Ping number four.
>>
>> As an interesting data point, it's now over 20 months since the bug
>> was introduced and first reported on the mailing list:
>>
>>   http://lists.openembedded.org/pipermail/openembedded-core/2016-July
>> /124215.html
>
> Sorry, I think the problem is my mail archives don't seem to have this
> original patch. Each time there is a ping, I go and try and find it,
> get confused and then get distracted. I have no idea why this isn't
> there.

A bit of a mystery. It looks like Armin may have had a similar problem
taking the patch from the mailing list as the version he checked in
has a spurious whitespace change which wasn't there in the original:

  http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145305.html
  http://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/morty-next&id=4c36c5110b822eeac06b2b336917ba4d8b54a247

> I've queued it in morty-next which should give some hope to this
> getting sorted, assuming we can fix the other morty breakage and get
> clean builds.

Thanks.

