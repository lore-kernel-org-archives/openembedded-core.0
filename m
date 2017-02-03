Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 84B8971A19
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 05:41:19 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id v186so4579456lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 21:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=CbvJWPVdVk4jVrVvGkkVBfxdorPvyXKH0Vd65xCdoD8=;
	b=cVZURwKmZRHLBIuCSkcUafRU6mvl1BbtZuK6conxoOj1JmJ4k0q3vRMEYVpo57LzsK
	sQhcrAmcS1XBy2ZZlHJAalAFkVZ9QnWjTrfX6BGcdpHoEpuakvZZxLSK7JbJZ5BnYsof
	8hNekjesqRhHM53cjZ1Zb0UGp1uBZBOCh9GjZbCNq1IqQEdEFOfEKtWh+WLjx7qsJX2Z
	ALYadh3xwnNAXPFyGiggh55bRea+moI+P3CpUAdCeaZ17a3DxXp2GmidXi4Cv0SkTLGU
	57LH3BmHQufPs21jAFteSHtzxaKRavsM4RxQncm40UdOrt6YyUIVFzNoGyRCBp10iqke
	Kjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=CbvJWPVdVk4jVrVvGkkVBfxdorPvyXKH0Vd65xCdoD8=;
	b=U2Nt02nBp8Mwfmj+iqejQKPNVFlwWAKtrS8lnI71kDqo7TjMF0vsZYCtDEYeUkCZXB
	kROZOla9yUoH5L+48mOzuFIFwpd9ASU7raLV2EE0+xfxSDriXNxQLJZFhsUvd9Tjdl2S
	bIvTx3spoIuGHfe4YNRuGbr6VyAEk2nQT2mHupKYNf10LfWOFs0+nf4oNaIkpXOoIQPf
	+14JdYBn2aB3C0CL74KQJmEwLuKqsj1XXyFh3q4kui/RjzDKoRvo1OsLkc+KWgSAQAlE
	CBH1SnlSgX1D6m3TdIdKyfDSxnFNWSSa8i2ctvkyHc4v5ZNq27vKmn0c5La/8hsrRdS/
	beCQ==
X-Gm-Message-State: AIkVDXI79b9BsdPpqHUekJ0TGAolbzgO8SGFO/raR2rDs1d6fS86wpZbRGrc5WudrzDWjA==
X-Received: by 10.25.234.15 with SMTP id i15mr4368188lfh.25.1486100478865;
	Thu, 02 Feb 2017 21:41:18 -0800 (PST)
Received: from ad.chargestorm.se (h83-209-191-235.cust.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	o91sm7506763lfg.17.2017.02.02.21.41.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Feb 2017 21:41:17 -0800 (PST)
Date: Fri, 3 Feb 2017 06:41:15 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170203054115.elslrymlzm2xepnz@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1485846907.git.anders@chargestorm.se>
	<6f44da9601d2ae87573905ca1b7fa30cf5043100.1485846907.git.anders@chargestorm.se>
	<385d3282-7a91-7d60-cd6a-393ada75bd09@gmail.com>
	<20170202104105.yl4nrp3wbym7ahhf@ad.chargestorm.se>
	<CAMKF1sptX0x3-WDdu5vgXiKcd4DWTWSZCePvy__DkOA=GWzzOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sptX0x3-WDdu5vgXiKcd4DWTWSZCePvy__DkOA=GWzzOQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 Feb 2017 05:41:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Khem Raj <raj.khem@gmail.com> [170202 19:37]:

> On Thu, Feb 2, 2017 at 2:41 AM, Anders Darander <anders@chargestorm.se> wrote:
> > * Khem Raj <raj.khem@gmail.com> [170201 17:52]:

> >> On 1/30/17 11:18 PM, Anders Darander wrote:
> >> > This allows us to use html.py without importing misc.

> >> html.py is provided by many packages. Does is make more sense to package
> >> html.py on a package of its own ?

> OK, I guess we have to address is when we have more occurances of
> packages providing html.py show up

Just a further note, there's a typo in the commit message, as can be
seen from the patch, it's not html.py per se, but rather `html/`...

Not that it makes a lot of difference...

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

