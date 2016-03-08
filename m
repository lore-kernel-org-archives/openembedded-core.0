Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1C06FEE0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 10:01:48 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id e6so10715483vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 02:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=6DL0+wUWsHXCLEBNVrap5g4Q+ZY+EDHP0W2bdX1ps58=;
	b=vSoDccrCz6gQqB3tF+XmoMhtfESIEeD1pn5hjecnC0DhVIWYh0OlxEsOurcidVsL3O
	ULeBoX2MFK7ZicA1zNVA5VcCrnmooWAjjQssWd3v0qAj4cbLGq+xNHIVxkc1l8f7do2H
	3MhlFbIPI4wtWZ6cnjPbYP1J+jOTtSj+XhT5CVjIwC5xgTRoubn27mDxpwXyQAwFVEKj
	KlO6+Cva0WAMg1Z8ADjlXO7ztqkHCwBXMTnrSqRaSBbqkrBq2YjDhz4fC/+ySERUeNfa
	lzR46CR6QLP1+w1MH00PgJ3f+x991hlP8YYoQxTXMgqbKW1aI52uWk+HkxeR6OTHTX3o
	YCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=6DL0+wUWsHXCLEBNVrap5g4Q+ZY+EDHP0W2bdX1ps58=;
	b=Xtpb6mIZWcMqdyLLDtqMgpgsO3izoc5hMe+tAG4ZNe2khiRn/Cuc4PFpuhynWcTWhW
	Ts/bOo1WkRcS4haRrjQXvbtLd1pQqBrwx1sV7QqG+4y41Z+EJLfdDvbZmQevPaXQ0NZ7
	YwHFLLkcGDJkk4vaX4CepBGAUy62BxbmW9qWHGL/qXjP7L1UZEouX6QcM7ICwOPvhda9
	rVz34qAyXXXxLD3bNIyukUr5KzeSn+fXz35QO6wEooXDgUM9maMcIoMspHiHuko6pDSr
	ZcePshj/Avuf64/mZzWMw88lhdfJrC1mlMbRMnIHkIXl+777Foh3QTmd0TMevn/VM2t4
	BHqw==
X-Gm-Message-State: AD7BkJL5HMBXbw5Jo/sz4tP2OzyG+bJyvaL32BlScsSjafZALN2+bM3Ruj64EY9bhnUw3R7yWEXD0upjA5SLHQ==
MIME-Version: 1.0
X-Received: by 10.31.54.194 with SMTP id d185mr21443932vka.130.1457431309245; 
	Tue, 08 Mar 2016 02:01:49 -0800 (PST)
Received: by 10.159.55.167 with HTTP; Tue, 8 Mar 2016 02:01:49 -0800 (PST)
In-Reply-To: <1457090416.2804.19.camel@linuxfoundation.org>
References: <56CC6832.90506@siemens.com>
	<1457090416.2804.19.camel@linuxfoundation.org>
Date: Tue, 8 Mar 2016 11:01:49 +0100
Message-ID: <CALbNGRQbfu45fM=kijvTnx4sY2SzjiVSCtGXhyt0xM+akP1sSQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Debugging using sysroots and GDB
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
X-List-Received-Date: Tue, 08 Mar 2016 10:01:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 4, 2016 at 12:20 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-02-23 at 15:09 +0100, Pascal Bach wrote:
>> Currently debugging using sysroots seems to work as long as the work
>> folder containing the original source is available.

I am using sysroot for debugging too. I have no

* INHERIT += "rm_work"

and added

INHIBIT_SYSROOT_STRIP = "1"

to my local.conf

I use this approach for very long time now and from my point of view
it has one BIG advantage: I can use these settings for productive
images and start remote debug within seconds without further
rebuilding.
OK - default compiler optimization sometimes causes headaches but it
works for solving >80% of my cases. In case I want to debug software
that I have developed setting optimization recipe wise helps or I
debug that on PC or target itself.

How much time is really saved by stripping sysroot?

Andreas

