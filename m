Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id EABD46C3A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 13:18:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c6so10085173wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=mHJ+GD6q73YT8mM82HS5vcFvjRo59EGuug5DFoCTAe8=;
	b=LTAF1PRN7544R96dUFoW0OeokZTr4TGAIgIUzjHDbvfxUPNfTlpB8b9zjjvA2mRIJF
	PqFWOUMLe/cV5cwkZkSX4PxMfK+zZbwWJ/vU0PDsDSFWNJVG3JGOh7Xl27FfnU4+x00H
	Oo+jmnrTcMMTFRcC2sqmRf9ZE3Scg84ijBRyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mHJ+GD6q73YT8mM82HS5vcFvjRo59EGuug5DFoCTAe8=;
	b=L2o9TEdEjAVZN4WcEQN8PpAoEJ0cFrZqibfv8FkNuDo91J9IGSlsO085x9D/thEYm6
	cegdNFrUa5rOa7zVEO/I2xHE3UfCDmRUv3RU3p7S+hiLXDy+644TE+11L3FoD6tOVbcI
	7iWTo5DeR6WYyDsLAkI+mGYIcXCP+W6ZEDEznuhWGq63ob4Ggb7sx4XoVMDdBHFYN5Bl
	IqCcXq++3d6IYGHvy6diuxtkfR27sxv6NmX8eTUKmNOT6yv//6UduXlwt8p6yGxMt2xQ
	20utrBmUDv9mx5Fz7D8s8wlcaBGSboC5FIm1ga19DEczUQcA1H4goLzSyyryceaQ4lxR
	A2lQ==
X-Gm-Message-State: APjAAAWbgKF0HCeZdrEliQwTWrUxoprY3deVxlGG/F3oQOf4tYIO4npM
	sbzsPtVQJN0Dz2XrugtZMv5Lkg==
X-Google-Smtp-Source: APXvYqyaXYDZp7LVpR5bfSjV0utRAvimInp9FyhCUtDFxglC8aoGZTGNXxoDoRHLUmwI7t8h6P8bfg==
X-Received: by 2002:adf:ec09:: with SMTP id x9mr13661314wrn.187.1555939102982; 
	Mon, 22 Apr 2019 06:18:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x84sm15657881wmg.13.2019.04.22.06.18.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Apr 2019 06:18:22 -0700 (PDT)
Message-ID: <e3150ea55289518f632f8265dce2a832bd65be59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>, akuster808
	<akuster808@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 22 Apr 2019 14:18:21 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84F3782B17@ALA-MBD.corp.ad.wrs.com>
References: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
	,<d12938fb-ffbd-05e5-c518-96cf7222d9f8@gmail.com>
	<007BD92917A2324FA403BCF9A464CF84F3782B17@ALA-MBD.corp.ad.wrs.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] core-image-sato-ptest-fast: Add 'fast' ptest execution image
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
X-List-Received-Date: Mon, 22 Apr 2019 13:18:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-19 at 18:52 +0000, Slater, Joseph wrote:
> gdk-pixbuf is fast?  Not for me.  Some of its tests take about 2000
> seconds on qemux86-64 on a 32 core machine with 64GB ram.

from the ptest logs from gdk-pixbuf:

SUMMARY: total=20; passed=20; skipped=0; failed=0; user=27.1s; system=0.2s; maxrss=20260
DURATION: 28

so yes, it takes around 30s for qemux86-64 on the autobuilder (single
thread qemu).

Are you using KVM?

Cheers,

Richard


