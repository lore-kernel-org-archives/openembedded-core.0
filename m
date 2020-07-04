Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.26673.1593897049528525817
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jul 2020 14:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=WPDNZDAa;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=cbi1=ap=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49zkyF1pmzz2C;
	Sat,  4 Jul 2020 23:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1593897046;
	bh=fZRUHbM+1SFQrLrJHTv3GXN0Zp2iRgzOwkB5SfrkNbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPDNZDAadUmrZrZkdD9BMkJWcAxVKjtns3am14rqeFSrlQ3LU1ix2lyWAUt0yYTnl
	 6ubYGMTdK+s/V2nLO1kNtwpht6WaJmNrD0Bz8a2IO6EBBLgbH2H9WKfPLz9LhQiB77
	 2rexxEzIJYh/junAQNHGDyY+AIM4aDUIGsSgXvLFnq356hsmWxnhy3lwaKSeBEN7m+
	 2u8AGxBVO/tjiyOUfrdMqyOcMeR25chHcByr/YvoPgnnl439og3Or/uL8lTayU2+O3
	 QE4hFYkgwq2HE7JzTM/szMjZLSmoM7ZF+XWr9O8ffRCNUOULmyZ8MIB6xVMdnkjxCF
	 O1tcun9/f67jMr/v/a2vkrr3yEf7tA4wtyuiOEoX0s8wUsNBYnUW1nVIJ2OuVRg3J9
	 AK63pHktwCoKnqexUgoLTAoyXFG02L2OVYXYQGwWdzD1hCGi28SK/mQ/dsf31E3PMS
	 sVV5O+StYmTW9HfU3JlCsx/GyngPqi/25ztVhR92HOGyMjj/vGkJpPWiF47q/8wowz
	 8fW5Lyi+rtTcSt9EzFgQkm9sdcF7lm9esakrXrXOTrk2P/g5VTUt1mpiaCPNmUh+KW
	 8kfoKM52aeLAow4A2RfWvAq1o4Ae54AXOPitzByhpNdD9GohYOVegVzz3w6OpiUCfX
	 Di5DXv9Ko3TGnLZngd8hDdvI=
Date: Sun, 5 Jul 2020 00:10:43 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][dunfell] coreutils: don't split stdbuf to own package with single-binary
Message-ID: <20200704211043.GA24166@localhost>
References: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
 <64b8f2c4fbc20ea866a83844d117816de59082dc.camel@linuxfoundation.org>
 <ee34bd95-2dcf-cbea-2b3f-e5c11f95e5e2@prevas.dk>
 <5c9d33386f921a0b7fe06bfc480b6d52bfa26708.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <5c9d33386f921a0b7fe06bfc480b6d52bfa26708.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jul 03, 2020 at 11:48:36AM +0100, Richard Purdie wrote:
>...
> I hadn't realised there was already the reverse dependency. I think we
> need to let the package exist in both cases so the two dependencies
> need to reverse direction depending on whether single-binary is set.
>...

What about no separate coreutils-stdbuf package with single-binary,
instead an RPROVIDES of coreutils-stdbuf?

> Cheers,
> 
> Richard

cu
Adrian
