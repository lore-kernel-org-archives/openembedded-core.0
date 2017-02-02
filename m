Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 76B8F71ABF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 06:50:25 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id n124so3462839lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 22:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=GzB/9oN8N5KccgcBCxAJUA/mex87n4W+nEHM/2a5dnc=;
	b=ED8zupL597r/oixssuEKbPJ+YTVHHABk/bPnxNdwqICpgTIvgEjsLdE1v6Tw8dOfBp
	85CB7bC4XMnhO6ARHz44Ec0weOKpxOhsEkK3oQsSZKYesTTY9PDQ66TrmFlu2EzS7b8x
	42GY+UrI18upn1IMheudqNccN1fgZDgPAr2udcN3yyUPDqolh2pgoV/ykIaugWGQbKcV
	mVuRwV58HCD9rEY3X853KZ2CoRoLxstPeaKg32ogaI1UCeXn21riODFRjleD5K1oruD3
	lDYPvI8ceNBHrpBGgvwlGTgfSvRl3HPz7cbaGDBpgnwF0+WMlK9BBn8R6u41AomvEYBp
	UM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=GzB/9oN8N5KccgcBCxAJUA/mex87n4W+nEHM/2a5dnc=;
	b=YRNL82td4FUEnEDyFr4Y5E0j3mc7Z2ipz7GbmLUjRSFH3uK5KKCetTByyCb5+J6FRB
	fb+mikJf1gRU+yxlpGC+BtmMOijISJAlnEktnTlJPO/Ve/q90oIW1WOWu8vj9kG5JUdT
	+R8rOsR1wO7G8NBlmy+DKWKQwUlYlKZu7BT9sxEYpTO3fTHcZ7OKkm3N94kqd0Bg5r5E
	VK+njFETHwLh6goKGmCyGbmK+Ck2TjPhHkDTn/AgATqg08CQ7J0oSbuBRi/x26VgcEFN
	+DoFX4YkEZuLYDZJMtWz1Nu6zuikSmPDndbjB8GJw2Rgau7ogy+VFH2LZNZGrzhaR4aN
	uUvw==
X-Gm-Message-State: AIkVDXJVVX4IvVXDHU+UiXDBWnYKjkiDv0/GAPo+UPRf1iUFvqa2F+srPm4VSeyNdo0b1Q==
X-Received: by 10.25.20.152 with SMTP id 24mr2040488lfu.152.1486018225359;
	Wed, 01 Feb 2017 22:50:25 -0800 (PST)
Received: from ad.chargestorm.se ([194.237.220.218])
	by smtp.gmail.com with ESMTPSA id
	h24sm4950255ljb.46.2017.02.01.22.50.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Feb 2017 22:50:23 -0800 (PST)
Date: Thu, 2 Feb 2017 07:50:22 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170202065022.cmo6ygp5krswgb6f@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1485846907.git.anders@chargestorm.se>
	<6f44da9601d2ae87573905ca1b7fa30cf5043100.1485846907.git.anders@chargestorm.se>
	<385d3282-7a91-7d60-cd6a-393ada75bd09@gmail.com>
MIME-Version: 1.0
In-Reply-To: <385d3282-7a91-7d60-cd6a-393ada75bd09@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [PATCH v2 2/7] python3-manifest: move htlm.py to python3-html
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
X-List-Received-Date: Thu, 02 Feb 2017 06:50:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Khem Raj <raj.khem@gmail.com> [170201 17:52]:

> On 1/30/17 11:18 PM, Anders Darander wrote:
> > This allows us to use html.py without importing misc.

> html.py is provided by many packages. Does is make more sense to package
> html.py on a package of its own ?

I'm not against that.

I can easily provide an updated patch, if this is desired. I put html.py
in this package only becaused a few of the other modules seemed quite
close. For me, my image would likely be reduced in size, if I move
html.py to it's own package. Thus, I wouldn't mind it.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

