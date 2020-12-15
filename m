Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.1780.1608062969555900140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 12:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KUQD4HJt;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v3] sudo: split into smaller tools package
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608062968;
	bh=XZ8hkwi4aMw0Coo1dL9VnPRS1lMYJk/x3Db4gIy35Cw=;
	h=To:Cc:References:From:Date:In-Reply-To:From;
	b=KUQD4HJtjZGHrPUtKeV7vERcvJE39sBaPmen7oL53oJiSdFiQoyu7MWNdU2izzFsB
	 IQrlbg1LFETLfC1QAr05TMQw/3fQvu1L/1FKlMAUXs9Zigr3lgLqpkFTTieB+9U+LM
	 Z0dEDBcKZARSY3ZIo7vO24PhOcD1ccR5XNuih4xr4BidFtm0Xh353nW1CMb1ryVZ/o
	 D3VH1xhX5r6AhZ4dSnv0pe8CehJiQG/rMZ3iFes8JRw2VIAAcWbM4RZ92sFvU4/HoA
	 UbxuAW1qbQkea4llVWdLFDQdiG+LOhWnON0rE2D8ZrEAxWQWty5lsjik/5Uu74jcnR
	 fdeyLzSbXhK9g==
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201215193506.13053-1-okaya@kernel.org>
 <CADkTA4OWM5PJXSgp7SMu+n0071YE-3wkaoV2JUPCuf5u=XdAnQ@mail.gmail.com>
 <8861f46e-fc85-2af4-fb2a-0aed9cb89791@kernel.org>
 <CADkTA4M6bbosSG3nhoe5uNm3ZF-qUZisOiCbnevnRVGCr_tLpQ@mail.gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <ec673a83-2804-2ffd-4b5d-0230c55ebcc2@kernel.org>
Date: Tue, 15 Dec 2020 15:09:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4M6bbosSG3nhoe5uNm3ZF-qUZisOiCbnevnRVGCr_tLpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/15/2020 2:57 PM, Bruce Ashfield wrote:
>> Interesting, I didn't know that RRECOMMENDS can be turned off.
>> I was hoping to do a non-invasive change for existing users.
> A good goal!
> 
> It's this variable:
> https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-NO_RECOMMENDATIONS

Would you be interested in setting it as default for the tiny distro
with a patch?
