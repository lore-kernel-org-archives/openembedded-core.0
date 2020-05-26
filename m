Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.49677.1590496023562895373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 05:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=XFfXNwoM;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=gx82=7i=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49WY9v60Qfz4y;
	Tue, 26 May 2020 14:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590496020;
	bh=rjuUc1BiZah0Mn2VskSkli0IW+RykKFkuhEf86SNSUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFfXNwoM7lYlJyYGhSgdGyBFOqos96VGTSBNjoZAj2lP1RH3fvymKV/dBfj+Fx0s9
	 zsAAlnrKtPq7VcDfG0AwKSV1Q+FI1WaiVDhgI48Hwkp11B44/bzwhl1zSmTkXaVSwr
	 CIC+SW5R4SoQUlkUJXZ+fgzCC3SCZCSiKWaDiTaXE+X0iBG34Ez08oCvUUhL/J8SmT
	 ZSldG/7iQ5+kfDio23Wdwo6LWaAgtS0iALa+bMA/HqooJfoYguya5U+57H/EW78u/0
	 B2HowfZHvZ0Fssh0Yzaq4vVP5w71F4aRojdfpSMNarZ9gfPTfFjH8OXVk5Yx/u848i
	 5U4GOnwG7IYMRUAtqMM6pvFov7EY3xhBZyxJOm9az75zK7QQeQ7yyqqAlL11+aUj20
	 s4+KVMYGCUbwHZH/Nt0WKODdgsB2lj055OxppKIGtaB6kaPHzEh6kT35VdKOUYiogu
	 w1aB5QiP1i7OWghKZRhplESrCwn2ZnlzZU6xpLyyZW+nbn9YCVIB/SmX/l+iJjxNKz
	 jVsUcQtefD5sGkbRsmBt69zQioXKKuwV6Lz1UzUt5CXNj4EHxQz2R8x7qtmCXtNoJE
	 wKiYJfKU5dP6/v9vsIVIhpPrZMcpBJwMmCDoODmPiOO405BucIoz+RgIbc8oSBk08n
	 xo9dyGW+fOJw/1s4Chsj7mpw=
Date: Tue, 26 May 2020 15:26:57 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] armv8/tunes: Set TUNE_PKGARCH_64 based on ARMPKGARCH
Message-ID: <20200526122657.GB26509@localhost>
References: <20200522013050.1320143-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200522013050.1320143-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 21, 2020 at 06:30:50PM -0700, Khem Raj wrote:
>...
> This lets higher up tune files for arm64 SOCs override them if needed,
> this can help building multiple armv8 machines with different tunes in
> same workspace.
>...

I am getting code for cortexa53-crypto built in a directory
cortexa53-tmp-linux, but the code might not run on cortexa53
without the crypto extension.

cu
Adrian
