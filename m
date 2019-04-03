Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 806467D368
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:10:09 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a184so8270109wma.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ob07btbUYjcGbqomASrDZgBjHoxEXZ5tFx4r6ide/Q0=;
	b=ERMHPdxeUXWYTCZ6gWM8wFfZQdK6GLq/4G+5yMcdZ57sGc8thyBk2UfdMSEfI4/BdO
	ELxMSDDJOKljoZaWqeCvOsf+Nv5b0YW4pgVEoKZ88GatB+4UeWdYUKNOut2VsIGfVZcV
	PRiJ/QzlbiwLCIZzERS4Yt1kxNqtKxmZbOjTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ob07btbUYjcGbqomASrDZgBjHoxEXZ5tFx4r6ide/Q0=;
	b=DqE2EdsYPm9Z4lV6jBo+MS3TjglOO6JKvGrtvOHBLjnUQLLaG+zAK4qRTzLQJsJ4a/
	WVf4l1FreaIWYZ5PQr77DJGh+o0tf+Knx4UsHUyQra++/MgpShKx3XG7EdMKlfIdDqVU
	2LMyvETEbDtk+vnCuN6R01GFb72A5yW/INy1A1F7S/ZiOAdF9OwTM2kXUlixzgVKln6z
	x0p5h3M6l+rRgQzjNwyMmyXsRXAwVHVjcD6SUUO5AX4vGw0nsMONZ1on8Ojz9cmWehlR
	47lPE4Q3t75wYIRCOLTlzSka1HQ7Jd7XdZF9wv3psHKbprZjMUAM2yEGOCHG3VTFIaPU
	ZILQ==
X-Gm-Message-State: APjAAAV6Zplj9HlI7/2NSwT2kSmbW4YbG/bEhWu9KRg8X3EbZurAIJos
	yyr7bTL1kUW2eGPsk/MUq3BzriLmfPWZWg==
X-Google-Smtp-Source: APXvYqyNNy7YVQ/7QqRo8abhM+A2BGLINjmdOxrA4TR/lD6DmlHed750f9Kl/yd7RDup18YeRS8Fbg==
X-Received: by 2002:a1c:cc15:: with SMTP id h21mr702039wmb.85.1554311410217;
	Wed, 03 Apr 2019 10:10:10 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c10sm21922459wru.83.2019.04.03.10.10.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Apr 2019 10:10:09 -0700 (PDT)
Message-ID: <cf7e013e8ca40525e6738bf318e85f299535f2d8.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jens Rehsack <sno@netbsd.org>
Date: Wed, 03 Apr 2019 18:10:07 +0100
In-Reply-To: <CCFDEF2A-61E0-493B-AF4B-8A8EA5D6A551@netbsd.org>
References: <20190403131822.19503-1-sno@netbsd.org>
	<089f9da0ec7f175fcf327994f31e0728f75313a0.camel@linuxfoundation.org>
	<CCFDEF2A-61E0-493B-AF4B-8A8EA5D6A551@netbsd.org>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] support CONFIG_MODULE_COMPRESS=y
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
X-List-Received-Date: Wed, 03 Apr 2019 17:10:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-03 at 19:05 +0200, Jens Rehsack wrote:
> 
> 
> > Am 03.04.2019 um 15:58 schrieb Richard Purdie <
> > richard.purdie@linuxfoundation.org>:
> > 
> > On Wed, 2019-04-03 at 15:18 +0200, Jens Rehsack wrote:
> > > In case, kernel config enables compressed modules, support of
> > > splitting via split_kernel_module_packages won't find any module.
> > > So, first expand module pattern regex to recognize compressed
> > > modules and then objcopy on temporary extacted to extract module
> > > information.
> > > 
> > > Signed-off-by: Jens Rehsack <sno@netbsd.org>
> > > ---
> > > meta/classes/kernel-module-split.bbclass | 36 +++++++++++++++++
> > > -----
> > > --
> > > 1 file changed, 26 insertions(+), 10 deletions(-)
> > 
> > There is a lot of whitespace noise in this, could you clean that up
> > and
> > resend please?
> 
> It's because of <tab>s were replaced with spaces - which is
> reasonable when python code is mixed in.
> Sure that you want keep the tab's?

Rightly or wrongly, the style convention for OE-Core is tabs in shell,
spaces in python (I'd prefer not to open that can of worms again right
now).

Whitespace changes need to be in a separate patch to code changes
regardless.

Cheers,

Richard


