Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.13633.1595151018121134598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2020 02:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=VINYOEPJ;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=vwyo=a6=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B8fj15brHz2J;
	Sun, 19 Jul 2020 11:30:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1595151014;
	bh=+jVknhK78E3PVQwUqI2+KWr2sqqJp69pz6LJNXgWRMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VINYOEPJsQhj4xdkbgIoLLLzDQGmfK8EHfy9Ht/xDSQG0nWrOwwW7L51u7sz0X+kk
	 MRCiYSiPjPbdfss5P2T1qXj+Wq3Wu+t8cxLkWWMnvM67iMxs8LClZBZrOsPsxbpbwS
	 LP0VoLSDIT7w3g3jeKxUddQT3/iSNvRdaBWKmxtOL4/7d5ZPXPRb7J3NybeAyp1cBe
	 ZmoRj0cdzMc31f0UZqJ9lmNiE/mQNPqNjYlMKdoN5iU4//FTGODF6WXaqJe8NEE8xA
	 1GOxgH6RDwQ+LLeFTt9cyXW9BjE+JWKqZSFPE2KFBZ1uZnTuNpyKtTutVoffhD3/ub
	 OCpfsX3l/8Je9n3Of34iUwTpzwpZe9uu3uagYabWHGAqw9Nyhxojtjw2hig9Ci0UER
	 iTBiYC91rRbQtVC6no5YnZ4GXkt+l2DUQPC4m7fi8RTjRVfB5jX46ka0UFZQcjNkBN
	 tTaeXGt4V21WllPzUq5Q+FauNdxnrsT7Dmu3sm3CEjG020YlS98Ttg72Y+NnVZmERp
	 NFs1pN+fgSW0Q6zvU8ukUfdGn8sbz53mkSeqn5422A5qVO/kv+SXsDYKEPoyH7Yv65
	 rfdFbWoCC5QnkO+wwk0xmbq0nDYuOuzU3auVkJatCear5Odot+TW5DEj2eS2XULpHy
	 HQXNLvasfzvqEcdU47oCFovQ=
Date: Sun, 19 Jul 2020 12:30:11 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
Message-ID: <20200719093011.GL1229@localhost>
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
MIME-Version: 1.0
In-Reply-To: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jul 19, 2020 at 12:06:15PM +0300, Tanu Kaskinen wrote:
>...
> I'm currently converting the pulseaudio recipe from Autotools to Meson,
> and the old Autotools build system supports disabling NEON
> optimizations but the Meson build system doesn't. So I'm wondering if I
> should add the missing feature to the Meson build system, or just let
> the runtime detection do its work.
>...

Looking at the git history it seems this was added as a workaround at a 
time when the autodetection was buggy and caused build breakage.

Debian also backported commit 0af05213 (build: make ARM NEON check in 
configure.ac more strict) to PulseAudio 4.0, which was included in
PulseAudio 5.0.

> Tanu

cu
Adrian
