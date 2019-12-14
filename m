Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED8C6BDD2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 00:47:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u2so599606wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 16:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Wz4lpL8zmPr52jtR+HReYG8BRvqWRUTIFZYTYmbyXmc=;
	b=c655y4nzpNpvtCdcVazGk4ClgSzwGC57OOQ9UCo/2oSyWHkw5U7Ft31MEGry1CjhAY
	NBcgewEFnQlM43pTMdY9y0bRnxhvq+I4aekAekjMncH+f8E70JIWCzhKmLi4lO+FCA0R
	8ayFt3jy7zb7Y6GxIa+Xw4IDlnFxbHPvnUyk6i8Tj47XzQRz0wxXOrl0AnSH3LlQR9wD
	9ObR9MboDFB5K1cGoi6ufu53ZZAj8ijzUvNUFvO/rcQ4Oi+dtKR9K8GByOiMZ8UMMgM6
	VD94uDYnlBQdxrULi7AG6plvawwJQVq/NfHLJ2RatNxgSK05n15l+22zAHlzWU1SC1d3
	ODVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Wz4lpL8zmPr52jtR+HReYG8BRvqWRUTIFZYTYmbyXmc=;
	b=VoHN2CKsa/a2rcwyfXW00FZxjJg9IwDAWj2ehGU77WGWSUBOWsMA8SewwY5Qhslyy+
	YAhr25kwOiamOpFKj5Ogo5YSE/QUmOFjQgsYcjgn0Bd0UMsdHRjPXd1TW8D9HmzW96YZ
	iTjaMRxtFM0KKoCRwdALY8S3P3K4OJbg3TXb6d9zIK26EUUUpAt38JxvdOoNioqABvxR
	6Riu2iwlt945dfDtsahKYFwogHWGXv//QDMlZVD6nZ3zXWyGBteapDrSyYRQ7cgakixw
	s+pczz+42XPb1JoM6K3bne9rhvfQcN+EAh54uAcbVEaxnmX6MibkSGpQeucO3LXXxIam
	/Seg==
X-Gm-Message-State: APjAAAXS1GM+jLt0bM9KUh70DUijXqu8COfOrY3125Qv5I5Z8+OCm0kd
	nELwUH1sy6kLkt6iAPxicZD/zfkSMmjPYe6mMUN9oqT8
X-Google-Smtp-Source: APXvYqzL0gjlhzsuHL8y02wGiprcXXAzKAoVSv7BRbBhSH2cHRwEwWiyT/8teaDU6xB4qyNpH+bKnKGxyehsWrFxobw=
X-Received: by 2002:a1c:f001:: with SMTP id a1mr15543597wmb.76.1576284464962; 
	Fri, 13 Dec 2019 16:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
	<20191213231042.GB8776@localhost>
In-Reply-To: <20191213231042.GB8776@localhost>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 13 Dec 2019 18:47:33 -0600
Message-ID: <CAJdd5GY4Ld9t1fo1sC2mK7nXuBCi=T39DwstZ5ZnTNFrEp226A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa72-cortexa53: Add tune
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
X-List-Received-Date: Sat, 14 Dec 2019 00:47:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 13, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Dec 13, 2019 at 04:03:09PM -0600, Joshua Watt wrote:
> > Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.  Rockchip
> > RK3399
> >...
> > +TUNE_FEATURES_tune-cortexa72-cortexa53 = "${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53"
> >...
>
> Looking at the gcc sources cortexa72-cortexa53 defaults to crc enabled,
> so TUNE_FEATURES_tune-cortexa72-cortexa53 must contain crc.

I think that's armv8.1-a, the cortex A72 is only armv8-a (at least
AFAICT), so I think crc would still be an optional feature.

>
> The RK3399 implements the optional crypto extensions,
> it needs a TUNE_FEATURES_tune-cortexa72-cortexa53-crypto.

Ok, I've rewritten the patch to more closely align with the
arch-armv8a.inc tune file, which looks a lot cleaner.

>
> cu
> Adrian

