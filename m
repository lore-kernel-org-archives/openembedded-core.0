Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.15401.1625856969908702313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 11:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=jjYwlc3T;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DA1F28323F;
	Fri,  9 Jul 2021 20:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1625856967;
	bh=MFCfocyk5Nu9gRgHdFvEhUYzJRvua1dZJ4yWoMKgT14=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=jjYwlc3Tu52VU8bRR9CqtgNV/bkl+vSyZjY6yzYhXV9CLfqRyTooUXdjov0Sczcpj
	 med7yWpumbsTIbDG/jE2S8O+ndss5LVvmmOgtqmrR9fPod/Jik8XB+QM/KROacoAHA
	 ABdHO09UnOXUt1Ys+8jyICOCwONZfiJuQxBV2eLNYhY+FSP3v3+URmeAqIncV4ju1r
	 aUM/6v9jBQFP3Lzdlo7GZv/lxgWKaqmgW61cta0YQUUEb2dX+qvlpEGuvcVhKRzvOX
	 nKZ+LeHlBdCw4bAJBrF+UqeSB0nRsqDiCeuHuvmZ3G5YNQX0QwoUyIQ+HiF1rs9xpA
	 Cqz3m9gnuDkaA==
Subject: Re: [PATCH][dunfell] update-rc.d: update SRCREV to pull in fix for non-bash shell support
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Changqing Li <changqing.li@windriver.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210709181630.63081-1-marex@denx.de>
 <CAOSpxdayDMfbkBP8bs062Ft=2uvAJ3PHR7bfLunD5NsBDb5osg@mail.gmail.com>
From: "Marek Vasut" <marex@denx.de>
Message-ID: <b416c2cb-7a39-3187-a932-c998b84bb45b@denx.de>
Date: Fri, 9 Jul 2021 20:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdayDMfbkBP8bs062Ft=2uvAJ3PHR7bfLunD5NsBDb5osg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/9/21 8:32 PM, Steve Sakoman wrote:
> I'll cherry-pick this into dunfell once it hits master.

Thank you
