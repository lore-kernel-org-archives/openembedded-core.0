Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4850.1588673672932300094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 03:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=aZTQW73I;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=1wnu=6t=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49GbDj2Hf1z52
	for <openembedded-core@lists.openembedded.org>; Tue,  5 May 2020 12:14:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588673669;
	bh=DCDgOqBNh/TN4wLK9IVKAc+HsdxSFF1C90tYaz6mBEY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=aZTQW73IB9HBF+nsN5wuhpOYnTHuC3pJp8COUUvUHAMIGq017Rwe6zkeoaATk5rYb
	 nYHoA8dPTUBtS190/KNuVLWpxdKx59ITcvm+86ZcpwQpMhS9F57shquQNz//TrVHDG
	 0E1AwWWyyK2mGvuFB4Lf5mZt0qLWCL2WxmYpo1TnYe5ssBRi1kJ72YTCRWIsmK1DP+
	 ntOznqOao10KruVVjPxRVVYl6kI/X5vJiMLY7SYg99djZFUSNcnwobQ2WxD7D/7D8r
	 DTCUr1JH5SIyCu/V2pegM4NnMJAP0yzDV4KWTVo7Auhf5P0eet2qPdLoqcMFFnT3Mn
	 TenwYTmcCf3+YriBqARpXRfHFIQV0T3fRSFnao7Qbsz4Cffix/7gf0twDAySK8dSV+
	 MiRa9FdkCksusBGAV/4zoth+vTAS3Klnbtk89mKib0AG0WMeGWay/CPWBAbihXwgqL
	 vl5vNGVbNU3Jl1BnuDK8iF0DBGJrWaMv61ylKIeaXMFfBWPrL+4jR7WjCPOR5TIvLY
	 2xt9Q9F+oKYiRWWlvbSSR5giRo9HJF6kwpCoicB8WdFcwbVczw0Mmz7m+01/e7kxSl
	 3SD63LlEUkIs9XrCxMSaV239Fxlpu24Nv+CxnQnfe1VtEGhXeJetjxe0vUn5zhcyPy
	 2mcB+47MtJL4+6sdj6/Pm30U=
Date: Tue, 5 May 2020 13:14:27 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] gcc-target: Ensure buildtools-extended-tarball doesn't use arch=native
Message-ID: <20200505101427.GA19882@localhost>
References: <20200501164602.1540633-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20200501164602.1540633-1-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 01, 2020 at 05:46:01PM +0100, Richard Purdie wrote:
> A nativesdk BBCLASSEXTEND was added to gcc-target without realising this
> would pass arch=native through to it for x86-64. This heavily optimises
> gcc output for the host its running on meaning it can't be reused via
> sstate on other machines.
> 
> Add class-target overrides here to get the desired behaviour. All
> targets have been covered for completeness.
>...
> +EXTRA_OECONF_append_x86-64_class-target = " --with-arch=native"
>...

What do you expect --with-arch=native to do for the target
of a cross compiler?

cu
Adrian
