Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BFAC77EB8F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 09:46:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c27so9301570wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=8KPIYWrkb6KevjIrev7HrmVxvWrhad7n/tg42E8M3iw=;
	b=ielvYt4mHtMtJPgsJuFI4kMbXbjOKeISuewfFr9l6pgZpE8w8AK3uRMLLR8GE9tLUU
	/h9CTh7ZFjA7C7eBH3DLg7V8wS6h0fPIJIN+oTNo9kzCOn8I+LHaCoU8MYEnjwpiJ3/R
	+wOUnE4vOJyBrwNgDOIJglKAl1UNSUhfyhxPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8KPIYWrkb6KevjIrev7HrmVxvWrhad7n/tg42E8M3iw=;
	b=BsWzqcwggGaS3+jFvJ0Ak0BfvjCZ349tjt8WB5BNyz112wisM/gzeiaAKUgrjPxlNC
	PSF2MWOiXKwnolbHtL5AI+yIiVdcuuH83t0+Eb4VHT68jar2DUV5l5EteF8IKL2UWhhP
	VOsWAJIbZjGxvHsIaxPexW0tuV3YBeNY7mOBPuSrdFa3abOn5TGmapGbYpGMqutTzibL
	oQHj0ftGenwCxQegfNwqDGma/BwKu7TuHHmHL4YMB7hco3HDtp3EDcssO1DNnWRkn0Jr
	KqX37hcmmGIlU+enZhIS53igH7vOb0jUoa5WO/DiLK88bwCy0YdzlSXwd443QCRVcW0u
	wh3g==
X-Gm-Message-State: APjAAAV5+4B+vg+YbBFw/tQPAbcRz+CFSmoq4m+3BcHN+EcgjzFYQQa6
	JXtAjG+dHweVtZLt0xPGYo6wRw==
X-Google-Smtp-Source: APXvYqy/P7utsDiNPLeojNdtGSFUFpj9RrwjPOJJnOXopZVNpiwdhTdkkBsH9TxgBBAqbUSMlFdK1A==
X-Received: by 2002:a5d:4d10:: with SMTP id z16mr10145479wrt.112.1562060761464;
	Tue, 02 Jul 2019 02:46:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b9sm7048380wrx.57.2019.07.02.02.45.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 02:46:00 -0700 (PDT)
Message-ID: <0f6f8faee46bbfb79ea9f8dac2da7936acf8bb2b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 02 Jul 2019 10:45:58 +0100
In-Reply-To: <CAJ86T=UXpcAhAQ1WgwKNW69NBSGHRDvFGydU4FRX_4j=SCEZSg@mail.gmail.com>
References: <20190625131625.15658-1-mac@mcrowe.com>
	<ed1f167e12e6cc6f1031c2de0a5c6e439a7b6e49.camel@linuxfoundation.org>
	<CAJ86T=UXpcAhAQ1WgwKNW69NBSGHRDvFGydU4FRX_4j=SCEZSg@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Mike Crowe <mac@mcrowe.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Stop exporting TARGET_ flags variables
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
X-List-Received-Date: Tue, 02 Jul 2019 09:46:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-01 at 12:23 -0700, Andre McCurdy wrote:
> On Sun, Jun 30, 2019 at 3:00 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2019-06-25 at 14:16 +0100, Mike Crowe wrote:
> > > Way back in
> > > http://lists.openembedded.org/pipermail/openembedded-core/2014-April/210138.html
> > > a few of us discussed not exporting TARGET_LDFLAGS. There seemed
> > > to be
> > > support for this idea, and I modified our tree to not do so. I
> > > then seem to
> > > have dropped the ball. :( We've been running like that for over
> > > five years,
> > > and not observed any problems.
> > > 
> > > It seems sensible to stop exporting TARGET_CPPFLAGS,
> > > TARGET_CFLAGS and
> > > TARGET_CXXFLAGS too.
> > > 
> > > I've successfully compile-tested core-image-minimal and core-
> > > image-sato for
> > > x86_64 and qemuarm64 with these changes.
> > 
> > FWIW I'm really happy to see this!
> 
> Yes, good too see this. Does it mean we're also now ready to address
> (e.g. remove or poison?) these variables for -native and -nativesdk
> as well? Or is that still considered too risky?

Initially I thought you meant they were being exported and they're not.

There aren't many references to TARGET_CFLAGS in recipes, it wouldn't
be hard to clean up the remaining references (the cross recipe
references are needed and can stay), then we could look at deleting
them in those classes...

If we don't do it now it may be worth a bug so we remember.

Cheers,

Richard


