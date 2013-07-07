Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 82CA36AF25;
	Sun,  7 Jul 2013 10:52:25 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id db10so2746931veb.26
	for <multiple recipients>; Sun, 07 Jul 2013 03:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=n2DqozGi7nHvUIfBbMhtNtUFzMXQ3g6mvGgGfS2Nyh4=;
	b=x+W18qlat9f5QyrtjAQA4CM9zmTaH+bzR7sT8be++qhzfNpbsqEOS8eo+FFLCixJrt
	B+1mqBNepQutibDBAn5GJjHO/sUod7dGF7eI7W0n+iyA9aY4qWIAHe/ITUVKewlFGNBZ
	OSPWLj1GA2YpM3xuAwvWDA4BD5qbN9kySlJ9cXTW+wvQdsrqf2SbagIWz8IuI1Zj037a
	tDYucUcP807hYUiGPXnTwHjYTh7DaOjqup6mXxo30Rh9P11qhQ1/RZoXpZlvP+mXX51u
	MVj6CgfSRqE54sXhiiHxFWDIpN5iTdKcEVgoK7Vd5AKARbQbZuRcQH/2FHilIIqGdDsL
	5+EQ==
X-Received: by 10.220.162.200 with SMTP id w8mr11482824vcx.90.1373194345976;
	Sun, 07 Jul 2013 03:52:25 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Sun, 7 Jul 2013 03:51:45 -0700 (PDT)
In-Reply-To: <CANyK_8eXUptxF52CmcJftYZD+oht4gfkDfRsbY3gOnmTRwyzaQ@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
	<CANyK_8fMj+=hDVMV+q7CJi7_G5HvztE+n_wcHDn0kTUB7dxFhA@mail.gmail.com>
	<FB95243C-761D-4268-96A1-B0893DA616AF@gmail.com>
	<CANyK_8eXUptxF52CmcJftYZD+oht4gfkDfRsbY3gOnmTRwyzaQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sun, 7 Jul 2013 11:51:45 +0100
X-Google-Sender-Auth: rU0mg2L4AWc7JoulfucJiC9ZNEw
Message-ID: <CANyK_8eXMAzspaXLDBQ=KwDDuOwhqFr4gPQ1LH1guzu9fYBYiQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Sun, 07 Jul 2013 10:52:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 June 2013 10:39, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 20 June 2013 03:28, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> luajit is rather a strange error, HOST_CC can't find <sys/types.h> or
>>> some other common headers.
>>
>> hmmm luajit does not fail here for beaglebone/qemuarm so not much I can help.
>>
>
> I'll throw a qemuarm build on today and see whether this is an issue
> with my build host or not.
>

Finally got round to solving this.

It uses HOST_CC="gcc -m32" as it needs pointer sizes to match between
host and target. On Ubuntu Server 12.04 I needed to run "sudo apt-get
install gcc-multilib libc6-i386 libc6-dev-i386" to get the correct
headers in place for the 32-bit host compile to work. So not an
OpenEmbedded bug.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

