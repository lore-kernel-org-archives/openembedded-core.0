Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 81BA87D6B4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 15:20:45 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f20so17726605pgj.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=CXEj7MlMt46lRLBlS0x3SO2/eUMEOBWE2aL3Mqm/eUQ=;
	b=LGT2J+RWkK7/e4GEQk8IZyW+3XaM+oBaHxIiHZiHPY4i8VzEcWnCy4r11vIICudUtV
	wKmFfhx7xfABIJ9BYeZ63/dd3MPyZyPH+I3q/vTV4z8Um46381NRyShB28EN/b+z11dm
	G9ENh9L2o4Exe0agTcBq7Xy9DVns0d1yNwZLJqkuxNKboFYSzPhLwlsq4pHCRj8Mm59p
	+Hi1tPm4ACz2u+Pry+w9Vje3cv3/6oHM0ac2jOnTwAFZuRbm6e9cKISUdgli5KJOOJxo
	zQII3X0yCK6X035mxDO+SGefxOzw67QxgQJhGm2SQtFynj0P8b5V8VZPVEK8mknfKRFE
	DKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=CXEj7MlMt46lRLBlS0x3SO2/eUMEOBWE2aL3Mqm/eUQ=;
	b=BpH3KNsQfTag7obpuo+ucGJOuOdkfaOYqbu9EGzdOEfjL2zoPk/bPPMi5DR28ywbS9
	ll/Mgk3xOidOMtXZMcF7kIMR0oSZxfhlKblpGA2EOQEheqi5JjBIG9kIGp5MjnoEiLcR
	qwdXvOlkirZAMzQ5dKyt4wphXaSdblbAPzqblxWVQxnL6FEF/cClMfHfV4oLGoOV11ZO
	ak2rdmOrJ+2omvuJrOKwNPHCZLJq7J5OaI/wCDj8iwxhDhh5n182yp2VRLYUKMI/WDBt
	SeVeSfYdM9m9MTL8aiplAlTkmJ/KiR9DvFGPuHdlw9heP3qQA54addrC1mjfxCjWpCut
	zhKg==
X-Gm-Message-State: APjAAAXZ18i5ki5wcJcWM+L68ZyWAVk1wlpds+OLuR2cQpxtlmHgEhC/
	uj335wvMgfiOfbexWWWeZ4siDukhkq0=
X-Google-Smtp-Source: APXvYqwNmzbfgX81UGatr5mH2o/8hhgb3gYa66mGNsVKDfTH+maWVco28LOKLI0lxA6FsrVnAplTnA==
X-Received: by 2002:a17:90a:8c92:: with SMTP id
	b18mr105641488pjo.97.1564327245928; 
	Sun, 28 Jul 2019 08:20:45 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::e5a4? ([2601:646:8500:6bc6::e5a4])
	by smtp.gmail.com with ESMTPSA id
	b24sm27056693pfd.91.2019.07.28.08.20.44
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jul 2019 08:20:45 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, Armin Kuster <akuster808@gmail.com>
References: <1564260566-8134-1-git-send-email-akuster808@gmail.com>
	<20190728092843.GA15666@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <16f5f88e-54fe-71c1-419f-04d278b7fec0@gmail.com>
Date: Sun, 28 Jul 2019 08:20:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190728092843.GA15666@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Update to latest stable, 9.14.
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
X-List-Received-Date: Sun, 28 Jul 2019 15:20:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/28/19 2:28 AM, Adrian Bunk wrote:
> On Sat, Jul 27, 2019 at 01:49:26PM -0700, Armin Kuster wrote:
>> Even releases are stable and supported for 1 year.
>> ...
> 9.11 upstream support covers the whole lifetime of Yocto 2.8,
> 9.14 upstream support does not.
dhcp server would need porting to 9.14 as well
>
> Eve worse, Yocto 2.9 would ship with 9.14 that might become EOL around
> the time of the 2.9 release.
>
> ESV (3 years supported) releases are planned when upstream
> is divisible by 4.
>
> cu
> Adrian
>

