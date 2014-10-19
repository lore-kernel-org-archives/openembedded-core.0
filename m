Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id A2D2060601
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 21:26:32 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id z6so2124264yhz.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CuqG+JeotTvYvyG8J6m7IeRrYLC5Oirz88aaypP+qms=;
	b=tDU9VnlJs5d4Orm5w7B9qrStDvFFEtj4PhgmhzbqfODC7Rb+45WdFYWRsMcZ1kgZR9
	q+CJaAeIcka3l9pX4GXjWM9nUK9X3BRuTY3JkG3hjoko5UCvhfI9wIGxk2pXY0mKzoZk
	i3G2Qk54UGV9iIKeYzdqVhHKssQnJzHKDdzGemVgXHmCLdps77VqKGkcodnCRYgQux3g
	ZryLWb8nozWYQhb9w3LTw8H4vubWCNj05joWeldoGGFYfWrY7uourxJJtOYrFdgnyNy9
	UrjC7QrQg0yCUQCuuq1rbW1qAwAaE0PySIZ1BO9Ltk3axa5Nd0q2fNjOmg37rkHk1UpM
	0YUQ==
MIME-Version: 1.0
X-Received: by 10.236.4.70 with SMTP id 46mr31846441yhi.95.1413753992685; Sun,
	19 Oct 2014 14:26:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Sun, 19 Oct 2014 14:26:32 -0700 (PDT)
In-Reply-To: <201410192313.41430.marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-2-git-send-email-marex@denx.de>
	<CAP9ODKqaBcGWTh3e2-TQzqdr7SRFfSRc91R9_ZX=YALOnFhRzw@mail.gmail.com>
	<201410192313.41430.marex@denx.de>
Date: Sun, 19 Oct 2014 19:26:32 -0200
X-Google-Sender-Auth: KgleDjaL4paYCUNtkE3U6GIsnEs
Message-ID: <CAP9ODKqJKR6DUCYw5=+28hZr51OUf3di96g5GbzZDKMHHJwYQw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Marek Vasut <marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Sun, 19 Oct 2014 21:26:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 19, 2014 at 7:13 PM, Marek Vasut <marex@denx.de> wrote:
> On Sunday, October 19, 2014 at 09:25:36 PM, Otavio Salvador wrote:
>> On Sun, Oct 19, 2014 at 5:15 PM, Marek Vasut <marex@denx.de> wrote:
>> > Remove the lambda function setting KERNEL_IMAGETYPE_FOR_MAKE and instead
>> > set it in the anonymous python function. This also allows us to handle
>> > image types which are not supported directly by kernel, but require some
>> > other kernel target to be built. This is the case for example with the
>> > fitImage, which is the uImage successor.
>> >
>> > There is no functional change.
>>
>> This is not really what the code shows; your regexp is more permissive
>> than the previous lambda.
>
> Do you happen to have a suggestion how to improve the patch please ? I'm
> not really a python guru so any help is welcome ...

I like the code, just the commit log needs improvement as you did
change the functionality here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

