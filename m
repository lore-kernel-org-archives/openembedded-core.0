Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id F258460626
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 16:32:25 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b185so5618148pfb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 08:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=vfpP0Sp6npT/7zSlIOA2L3gvvrqr9QgzA3B4C4O2rjA=;
	b=EjrVq0SC+HCSlo6/qsIZ18gOTmdUwa2k2BGzO8u04B0+UnTzlequK8GWJGD8wx8jGj
	WYcCwKCVPEP2nonodagwjbQGl/UEC9pqUN4JZFPX/I6mUx1HpHKRx8S5liNjcYq3Tkt8
	WUrnXZ69JQh0Up/ryvEYU4XaixuTa5L9ETXH7ttdRgBnxZL9jvMl4XZTGHfs1ibNJ6FD
	L0jLakhsXlg8pbRxH723mHsAwbXTmVGw/lyCZjI6bfH92zmrKtsf6Hy2xr4ypBvCObss
	mPN3IF6UbELfBIYZqfFnV4p7Up2ap+ECKvEeGBwwh9WXRRXrJjmrXljuLmFLewdVj08X
	rqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=vfpP0Sp6npT/7zSlIOA2L3gvvrqr9QgzA3B4C4O2rjA=;
	b=DhzDDXywSSMyz/7ZZ2eDM+DScvdOYVHkc++rel0nCraqPNE9tkF2uR7YViRHragHpa
	xeDGsLmmrA2BaX45oAnjfeStmay3sK+8pHPAlXaB+VRrAbh0xcl5PM0HARu0iPRqzAe8
	upaAajCffHrOie5ojf9jIRbOcZWpPjFMi8A/L+QeuBAMPs6T2UV08uzdyEVUvIrZM4jA
	WkYo5L88zf8EZpwvG3DfvHo0IYhZnNDoXfu0cz7t7E8KrmzZ1ATy05JsnqTKTbXCp6FC
	xGENBUIibQGDgMeyWNdzvdq8NBAvE8cpg0uTny0buAR590PhfywlzzYw648pA2PiLKgK
	FRwg==
X-Gm-Message-State: APjAAAVpkncMqp3jXTlRi6PZiwxYAAJAP7/FfcDsbXtsb0wdFjaCa0VQ
	epcCY+uwV1xZHuQf3zmwWBBDlGVo
X-Google-Smtp-Source: APXvYqyxtqT1JKwKR5Xo5s3F4Yp98u7c6fRR/yYUVUMyrM0L5VYdai+qpFh2isbDshSfqwABlSLq1Q==
X-Received: by 2002:aa7:8805:: with SMTP id c5mr30340507pfo.142.1582561946700; 
	Mon, 24 Feb 2020 08:32:26 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:7dff:acc3:c23d:7c90?
	([2601:202:4180:a5c0:7dff:acc3:c23d:7c90])
	by smtp.gmail.com with ESMTPSA id
	r62sm13750670pfc.89.2020.02.24.08.32.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 24 Feb 2020 08:32:25 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
	<20200224051745.GA6683@localhost>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
Date: Mon, 24 Feb 2020 08:32:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224051745.GA6683@localhost>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/2] nss: Move to meta-oe
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
X-List-Received-Date: Mon, 24 Feb 2020 16:32:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Adrian,

On 2/23/20 9:17 PM, Adrian Bunk wrote:
> On Sun, Feb 23, 2020 at 04:25:18PM -0800, Khem Raj wrote:
>> On Sun, Feb 23, 2020 at 11:34 AM Adrian Bunk <bunk@stusta.de> wrote:
>>> rpm was the last user in OE-core.
>> we should also assess external dependencies especially on libraries,
>> there might be layers which do not depend on meta-oe but use nss
>> or enable nss packageconfigs in core components like curl.
>> ...
> Is providing a crypto library in OE-core without providing security 
> support better than not shipping it?
>
> nss in warrior seems to lack fixes for at least 5 CVEs.

I don't see how that is relevant to the RFC?

nss package is not moving out for warrior nor zeus.


- armin
>
> cu
> Adrian


