Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8815775E80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 12:47:09 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id q63so4483037pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 04:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=s9xfaGt5lxoDm3EsZ1htcw4HBIRU1Q0iP94przmppGI=;
	b=CZ5zVvFsP6DedxbtmpeT/iRcYUB99sgCawuzYbWS1PQg5fX4WFUFd89cC4IZfM30v5
	wssTas5lmc2qTJGSo4ZEdzJ5wIGfDSb96mT0Lv6t1tkZGpZoCf/Q2qfu7W9BXOA2568o
	tXc7fRrCmOMSbBGOcT2yi9eWsvtkzVpzbTWgGGMIbfzSOhkurPcqWkNuPUttSJfydsUI
	nGn0+EN7VECCMJbvA1k9vFsuhoD3OOdwl3jRDQci97lAqq9o36aoGwXZu5OTxhulG8ud
	DJwBZ/Z4k2BI01jsFBk5Dt9L3i6DmIpHlp8G2H/O7rkUGZmwilCypmSYOiTesuF74jE4
	V09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=s9xfaGt5lxoDm3EsZ1htcw4HBIRU1Q0iP94przmppGI=;
	b=mjQkgqN/zFrSEx4r6YQwR+KiNKPJ42+SJBdOm7HUzKiri4HXaoH3JRzvMWwXaI039h
	IeW+kAZPezwcHPlL3gnEFyBN1ZX8Iq0cpe7ib39G4Y3kl/Bf1hQITP+tUUKwYAzt6oMY
	7w81LZcvIdVzfo6ZQYApsn9GM0F81xoPpDUUniljvld0lBULyD2Bn2oLVZ1MmQL13OO6
	htbf8zy5fHIXf/1mezFQCP9deVyvjpVD89u0/UwmQbe+TE2YCqLydhNzwukH6UcEj4HQ
	4hXczkwDDPwmnuIr0I12p4CLXVlHWBuuKxgmSAziiY1CRALVZVGtU5jenhjRpsXaCVrd
	eM2A==
X-Gm-Message-State: AG10YOQhUvo8yBubDrEFeMYrFFsGKsAqZWPf71Jr1OEDLLel3DerK/5DP5qYjVLODHwSOg==
X-Received: by 10.98.2.150 with SMTP id 144mr42353109pfc.11.1453898830204;
	Wed, 27 Jan 2016 04:47:10 -0800 (PST)
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com.
	[209.85.192.177])
	by smtp.gmail.com with ESMTPSA id 73sm9019765pfm.10.2016.01.27.04.47.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 04:47:07 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f177.google.com with SMTP id q63so4482506pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 04:47:07 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.67.149 with SMTP id l21mr4462324pfi.112.1453898827211;
	Wed, 27 Jan 2016 04:47:07 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 27 Jan 2016 04:47:07 -0800 (PST)
In-Reply-To: <1453897414.10340.6.camel@linuxfoundation.org>
References: <1453897414.10340.6.camel@linuxfoundation.org>
Date: Wed, 27 Jan 2016 10:47:07 -0200
X-Gmail-Original-Message-ID: <CAP9ODKobYd4j07iD9k8DcH2Ta4thBZ7Xb4DyB871onbL8V7qVw@mail.gmail.com>
Message-ID: <CAP9ODKobYd4j07iD9k8DcH2Ta4thBZ7Xb4DyB871onbL8V7qVw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base: Move COMPATIBLE_MACHINE out the scope of SOURCE_MIRROR_FETCH
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
X-List-Received-Date: Wed, 27 Jan 2016 12:47:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 27, 2016 at 10:23 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Recipes setting COMPATIBLE_MACHINE are likely to have SRC_URI
> entries which can heavily depend on the configured machine. Skipping
> them for SOURCE_MIRROR_FETCH is therefore not advised and leads to
> build errors whilst not particularly improving source mirrors.
>
> [YOCTO #8802]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

