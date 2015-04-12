Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 325C46ABF7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 09:15:39 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so25989404igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oP2hSeZKV0Fga7Tm1PQUpUFuLQCi93X5c09NBpDHXD0=;
	b=qQNzz2ZRVvADnCzgho6seofTa2bom3NG0XErUtiMMZfGutrGXy+3OA5+efDigZphda
	MgFSzGUjRu1A/DGnMvbEgHz6KJWCZD2GSw60cmlIgpf2RxaDL+RUq8Scsy6vWXoNgL/D
	wpa6DCAO9QxeQ4WAW1ZmUmoLNOIWMjb/Hz0zRU1C1xMjveQoKPw7ePgMZyoOWl4eO7h2
	kckezdDWez41SwUZFt6kqxoaDBJoypu/yk77TryfCGy6Mie9Lwkfv8w5qSy7AEfOBnnr
	zzRtN1P8JVWMI048IVmo/fiJTW7Hp9jR9R4uWpZj3knT3J6n+a/T4uKA09CTNIQqSYd4
	XHIw==
X-Received: by 10.50.93.69 with SMTP id cs5mr9360489igb.4.1428830140673; Sun,
	12 Apr 2015 02:15:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Sun, 12 Apr 2015 02:15:10 -0700 (PDT)
In-Reply-To: <1428828331.6976.14.camel@linuxfoundation.org>
References: <1428828331.6976.14.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Apr 2015 02:15:10 -0700
Message-ID: <CAMKF1sqQTEkuzi_ek+OU84XAaJmQrboXkode0LNpa=_szOvLxQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Performance regression (binutils and gold)
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
X-List-Received-Date: Sun, 12 Apr 2015 09:15:40 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 12, 2015 at 1:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The question is therefore, do we have a better way to fix things? Is
> this performance drop acceptable?

binutils being part of toolchains is hardly rebuilt so often in
practice. it will be reused from sstate so I am less worried, what
will worry me more
is if ld and gold itself have regressed in linking speed.

We can make it so that we only enable gold for cross build but it will
make it more complex to remember whats enabled where

