Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 851AE7C8A8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 15:44:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t18so2818725wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1/HkFK9o1+aBjKds6cZUrNblTyt37xU0tvdVT0RdPB8=;
	b=KNiss0XHxuz/0TiP3eHNcxUPzlWhJk2wbbAf1C7fWKIZPYHVnQnoItLemLaDO69VDp
	3wfWmewRQLk8X1OCkowzQckwnyPpdopNG0jQnY9S0x7hImfw7V3Us1pjF5j1YnrCzuSS
	g+0NX32OLzipAxK2JbunXIGnGwrb3Fm+rKPfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1/HkFK9o1+aBjKds6cZUrNblTyt37xU0tvdVT0RdPB8=;
	b=U+IWW4X+JnnoLuazCc65nxZeoDaWaI7ELJ6hCZPlC31XEjxZ6qjFJorkDTQ0dCpdXA
	PUrsFZjLk/rV32IhBO4iTkn3jVv8hLM3V9sV4C7j3//gfAqcHi2iwEiNe4vnzBQ1+M71
	cDtor8LMrYuv57fdvl3bVENGHaIm4U0eZZP+d2TvKs/ZTTe8cApFnv8RIcUVzJBHqjtd
	q3b/jLQDlLNKyp4UScw3nmBt+2uUJemjEjJdVsKquYM38+F3Dzs8u3kAsG7KZpfdIhqz
	FMxGthrGDQiz9zfRFQE6IQefTkpXLpUUqjGVa6ImRABLx8Oncd90hhVEzpFPZAYNWCqP
	IcFA==
X-Gm-Message-State: APjAAAXO+IiZl5ai+wL0Sx+tUGdOmBSvPb33IgrF10J/DWd6h/DLuecU
	jzZs9YBJIyX7Ke260dunMhjR8w==
X-Google-Smtp-Source: APXvYqyUucpgCcivvAuOdGqmlTjzEKynw6qnkYuIX22iakpbab6shAQ8KDcDEdlmOt9c5b7vHnFsLg==
X-Received: by 2002:adf:e3ce:: with SMTP id k14mr9792250wrm.179.1551627841237; 
	Sun, 03 Mar 2019 07:44:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f13sm4911715wme.4.2019.03.03.07.44.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 03 Mar 2019 07:44:00 -0800 (PST)
Message-ID: <4872f2698533c6e38e1a15bf99bd64f1d2d4cd7d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Mar 2019 15:43:59 +0000
In-Reply-To: <96553c6e-dfe3-7074-99a0-f5770c72a4f2@gmail.com>
References: <20190303003834.44637-1-raj.khem@gmail.com>
	<96553c6e-dfe3-7074-99a0-f5770c72a4f2@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] grub: Enhance Waddress-of-packed-member patch to cover x86_64 testcase
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
X-List-Received-Date: Sun, 03 Mar 2019 15:44:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-03-02 at 17:57 -0800, akuster808 wrote:
> 
> On 3/2/19 4:38 PM, Khem Raj wrote:
> > This was not compiled last time when testing aarch64
> 
> The subject and body have conflicting archs.
> is it both?


I've tweaked the commit message...

Cheers,

Richard


