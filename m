Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.20838.1590696627888359150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 13:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=iipA7WR1;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=eclz=7k=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49XzMf4Wk3z4c;
	Thu, 28 May 2020 22:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590696623;
	bh=gUud10ulhPpJGpM2sRwEme7WOnWIAYcMJLoS6DXL1i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iipA7WR1KEpWNdaLiY6skJfnmFd5tf82j3xJRZgAy6AQWeuiek5CRMAjcUpxTzf4d
	 7Gs/svGkUFBSdm7K3W6kp8W4R4rv8pdtDIfeJs2wKFMe7a02U3JwiGUhebKkV2Cflv
	 7N1uch2P9ncfP1T0D8Vfvdujcqs6haA4ZzimR9NBiTSn/b2ed+Aeuj3UfodtSwD1i6
	 yks54S1lZFDCubRKatNNqKTclNdy3CMs0adRVesAaOnZjCER483vNqwHJn4G2XdxN9
	 DRO00rOVRS5Fi/JR3AqCN6/8XxxfbXIwo3fV2x3tz0RVIF63aHleVplypFB8Jy93lH
	 aksYw/5tmWdHYYfFE1wlkgof2JBqoo2ee8L81TSSBpgt1lCqY+paTCOf251I8vauAQ
	 JatC+OVjmsrq72oNVUR1FYtxW/iaoM0pX2gnhQCbprwHpG2sCA4UmaJmcD+sPM2Gfe
	 DCduxRC+58C7hp0WoScmmBb7DVW465u7QHJZV95f/94oE3i8nM0wd/k3V/yi0k9M6X
	 fyumY6xIs5h77Um2y1A2GswMu2+Ldz3w0GF/+otghqwx3sNxuk7owIEZqnlHJMnsRk
	 DTIAXy4CeTlHxdfw2s1nCNoKjjZUZZM8AX9dliqArXEC5F6wlVFhwAwystc4i+w1yh
	 9ZnupN7yPF8HksnjUe/ogZj8=
Date: Thu, 28 May 2020 23:10:20 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
Message-ID: <20200528201020.GB996@localhost>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <20200527231145.GO17660@denix.org>
 <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
 <7f778511-3aff-016c-4c54-10990ba2b033@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7f778511-3aff-016c-4c54-10990ba2b033@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 28, 2020 at 11:33:45AM -0700, Khem Raj wrote:
> 
> this is not a freestanding toolchain, but hosted one, so they need to
> provide OS (linux) headers. think of case where apps are build just by
> using this toolchain outside OE, app devs are not expected to provide these
> headers.

Various gcc libraries like libgcc or libstdc++ might be used on the target.
What C library was used for building these gcc libraries?
What kernel headers are used by this C library in the toolchain?

cu
Adrian
