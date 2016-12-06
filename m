Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wj0-f171.google.com (mail-wj0-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9348F71A6A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 16:02:39 +0000 (UTC)
Received: by mail-wj0-f171.google.com with SMTP id tk12so31934905wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 08:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JB7qzveiYfO6nTaAjL85rHoiQVqrmUw1+3HPJbSzrdo=;
	b=pOVXgshMxmfZGKK6j9JF4gjswnlvRK46NYDK+uQBqTxwzg3wpRTRfjTmBuO7YYI4fI
	dr9LfxOBxH9bCbOi3IKcGHe8dHQcrfTYKq3np5v/Z9uqvF0Ke/YeeO1J27dTHoS8Hkw/
	nYbmmkSln0goXwzLLPQ/jX2LH/aGeYrT6H7fIs9XTFRtnTfrpYo3/QNepvdNU4hGsJPo
	wOMXGAy/47TOKrCkP1ln8QYUp2ce9/oy1nOzeAAqpIbb1Arm1n65jzqkss1OkZGXhEPP
	SbbJl6+ks37i3yTlbJ67G7uaDdADdCHe8VC4JTwNBDYW86KA/cBw9SdjcdfLZ3mSznys
	nFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JB7qzveiYfO6nTaAjL85rHoiQVqrmUw1+3HPJbSzrdo=;
	b=Il4GghyfL1MNQmmIRhfxgniwpgQIn8FsuoJ67q9m/d870Nm3GOmHmeJWqvYjGMIA7q
	PfmQFfxsWZrSXdUln4VkJqyRUsfEHNPFL9wqBW+k6esmIqr6msfgG8oaPAtKG0GrtpsD
	HDujfkdh6O7B3XGG6e4WnzO3/j++n7dN0Rm6FSzg+sXwfsozS5UlEKTrS7AokhpCRvh5
	lw5a+4o1sUFWxuB+95HvbmG0arP9EBbX8JAbGfhTGN5cXOcW1G0nTlwrle+LGtWd0CTR
	zpUn08g6YlCww711eFIOkq0qiaaoFQvlhZDqMoXVyuuvMZBFrV1epPX3rZBp6yrvoTEq
	Q0nQ==
X-Gm-Message-State: AKaTC00YHu/Y0xPICS4O6/5HJ/kT7i4o6po7+WMZwsA9xdx97IFsUPNZUgEsWwr/Spwx/2OfCczxPwTH54Pi9Q==
X-Received: by 10.194.41.163 with SMTP id g3mr53991786wjl.162.1481040160300;
	Tue, 06 Dec 2016 08:02:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.10.69 with HTTP; Tue, 6 Dec 2016 08:02:19 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612060948001.9434@ca624034.mitel.com>
References: <alpine.LFD.2.20.1612060948001.9434@ca624034.mitel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 6 Dec 2016 17:02:19 +0100
Message-ID: <CAD4b0_+EACruAvA839=YTu8=FHAjGcuMzFbaLugJZQD6NOjf2Q@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the closest alternative to red hat's ABRT in OE?
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
X-List-Received-Date: Tue, 06 Dec 2016 16:02:39 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 6, 2016 at 3:49 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   as in:
>
> https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/ch-abrt.html
>
> specifically, to manage core files? i would have thought judicious use
> of "ulimit" would be the solution. others?
>

If you're using systemd there is systemd-coredump(8).

-- 
Maciej Borzecki
RnDity

