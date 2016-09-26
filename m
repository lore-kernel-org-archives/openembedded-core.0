Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6369465CB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 11:01:38 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l132so145337884wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 04:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LU/DrxAzuV9euVGozurYkQqKAKc2qkWs7kO2yY6uJV8=;
	b=mlqy7ozPFIrhE2tek21xj0V2FV5AEfO+SbteL1Am2mQuUSXKkvcZBllVpJZUh9qVRI
	Hj89aXWCwo6V2r9ht1EDtq2SE7ayLxYUxyz+xmjZ+omw16UAbFEAfR4Xowh+jrV+GaNw
	zGewGHs0ybxgVjETpAdWdFLdeHeCWvSa5WA6WjLbhN4wvRR0Qpi2w4HTRvcJnXAFn7x/
	4tMSiJ0CZA3zpJE7Wf3FVhkaPyGOVY1t1Ho5RAPYF3ZcL+I2f5AuzKHsfPpOBDw9ZA2c
	Qakh/opAkgIiImcC0dR7bwVcjuihTdWpV55t4YTJUr42SsIv/d7svqY3tSt0xnX6I08c
	PmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LU/DrxAzuV9euVGozurYkQqKAKc2qkWs7kO2yY6uJV8=;
	b=U9Yj6kDnmZNR/qTF4Z6m1fhk4pVzmdxvEzuU/EBMVM2Uz/pseQLcEUN9dzUhM+KDV9
	vr5WeVyQB7V3qe8yN++yjvUg2K5pQW43+HtB8F4Y32lX+P7E0sJzaAhVC914e6dhnNvL
	ka99vnYD1LxId5gCKEopbN/6gaZZvVhPQYP+fdPAZgMImHv+jhCY4FW2nblc8CvqZG7R
	H/MJZbHholCqiyvg/f+z9thJNEInCRpvi91wr8a0ZA4PUrNTo8axMiuyBiopk2OKqgGY
	L65B2z9Rdh3RZ3E2i2jeNdVWcGKXr5dvqDyFmI3yOfjhIZBYUTBYFiVHM2jeERdv011t
	aR5g==
X-Gm-Message-State: AA6/9RmFNjRi4ebIp3AaJjJgznlNmHCsMxkpfQxonHbw7uw6h32EldDJr2AI6BaZ9cEzFsHQatbXzTIkD3rThA==
X-Received: by 10.28.215.81 with SMTP id o78mr15150760wmg.42.1474887699185;
	Mon, 26 Sep 2016 04:01:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.172.166 with HTTP; Mon, 26 Sep 2016 04:01:18 -0700 (PDT)
In-Reply-To: <9143dac0-3a7c-59a8-13f4-f97340317f70@dresearch-fe.de>
References: <9143dac0-3a7c-59a8-13f4-f97340317f70@dresearch-fe.de>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 26 Sep 2016 13:01:18 +0200
Message-ID: <CAD4b0_+M4chdScOmadG3j8i61SiCuu3Xi37rbVLxMe0VQ37+2A@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: defining default locale (LANG/LC_ALL)
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
X-List-Received-Date: Mon, 26 Sep 2016 11:01:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 26, 2016 at 12:46 PM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> May be this is a FAQ, but I could not find any helpful documentation.
>
> What is the best way to define a system wide default locale setting (LANG and LC_ALL) for OE based Angstrom style images?

Don't know about Angstrom style images, but you can always try adding
appropriate entries to /etc/environment.

Cheers,
-- 
Maciej Borzecki
RnDity

