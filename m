Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9728E7D895
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 11:52:24 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id v143so9435121itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 04:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ThX38akskneO29DAneZ05SrxBHOBDqTCm3izLRpK4xs=;
	b=DkwIYNZJyCU+USI8AdUADAtneJGiJbyp+LA88P82R6sMAOIEJCsR01CRFQTWK0NDYC
	96JzG/LPOyYMgaJBXCS0mtw8B3uCGiWeBUjoPeq/DDUtYZE3TJOTTBMWbLgdF/tPKjOP
	F7xhBgHGanjQmd34wezG0qBiMCK1PBfUs20PeCUroJwOG4vVoRhIoa9EzDmD2ot/pSJ7
	Z3kpfjW0z+yspzP7E8y+BCXXGejvCvIMU5TuuwkssYks3sghsD1Ni4L6mOaL1OSPNUbT
	bBxBwGoMe/w5e1LQ5hwTwp0ZFjCnxFOqqF2Dkg3crNqoRVvwrCxKbW6H0UCotEYrIovS
	ommA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ThX38akskneO29DAneZ05SrxBHOBDqTCm3izLRpK4xs=;
	b=Y/E4zRrjaBfKWCHaFVG1a8+3r65vUrRkZPEDbtYzNPVaiPXj4ZAwQKlub5T9AZ/iPJ
	K+4g2I+ezVvlGondwknDT+Szw/ylDqhyd+/PXNHo3HeJ2YHzx1OWsczFk5mQjSVlbjKF
	AQ8mVSUgxwoU3kGW0loZFJhUwwfntxxxaIgEx3eksBbeJEDXDUX/Y0GEv7KyLP50v9l9
	4DkIU/QwcrCgrLXpUjWLLbnuPGngjxbLluq+/j9mK+8CSAqyw+y5lXNSlXzUZ1PVG0A+
	mXukTjZL7jF8xvv5E6BqmQ+TF/FsHYt8+ZnGxF2fQX0GdZ3QeJyjwrybR5RDsJpW6zND
	/UFQ==
X-Gm-Message-State: APjAAAXLJYRSClO056IMkco+3juxycH+kr+u5R+zGndx8sSU2mZLF3S7
	K88zwibZIvRPA7+dYTHQzaZBru78gDTlkyPqUGVaDw==
X-Google-Smtp-Source: APXvYqz0+pXka8pMsHH4UiMc6hm298Im8QSuccO+PZ+3dkqjPXmkHLe+Ca0f/dWSoCSNbRg4GcvodHZO2V85EejRPNc=
X-Received: by 2002:a02:a812:: with SMTP id f18mr20464094jaj.31.1556711545380; 
	Wed, 01 May 2019 04:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190430192414.43383-1-raj.khem@gmail.com>
	<593bdf6b788838c82d73a7bd7b8cce01a185ba13.camel@linuxfoundation.org>
In-Reply-To: <593bdf6b788838c82d73a7bd7b8cce01a185ba13.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 May 2019 12:52:14 +0100
Message-ID: <CAJTo0LaUQQg2FW9ezwWCwswmJR=HRCpoxS2r3NkcGTqhDaFhYQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
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
X-List-Received-Date: Wed, 01 May 2019 11:52:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 May 2019 at 12:34, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> e) systemd fails to compile

Glanced upstream and couldn't see any obvious fixes so I filed
https://github.com/systemd/systemd/issues/12454.

Ross

