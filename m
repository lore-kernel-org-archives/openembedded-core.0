Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.4285.1591075477881853712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 22:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Nt7ywBP+;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ahm2=7p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49bgTG5SX1z4y;
	Tue,  2 Jun 2020 07:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591075475;
	bh=zthfuBu3ttiYsUb2834feQ/LY7X4J2r+6iS0bgv7gwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nt7ywBP++ioYbaxq+qWS93cfmmKiHFqAtwUSHTfhldTLg7Qr9W/pWNiVgJGHJwoWX
	 vFMVOinP8TOYJ+dQ4gzMF/R2DvYhyTljsk5UyFKYgIu+y0mhWW5Snw9u+dxAPOZilw
	 lClEzuiiGCFt4M6anXg9hTFDRjG233KtzwqXPcWIe+9uzFvkQO5rWKtQIuf7b689dq
	 GsYB4idHTSIPk8EQaReb2KtNRUYng12tSK0YEtpr20rbMbCbpy7dO3y31uzkY+8+Jt
	 KbyTxOSZiciMkW6Jn4XMY8xoUVkSAIx99nnxwQ2rxc7HUV14W0VghgBxlBb8lCcclt
	 D+590xClXtEXRZzTzDI6LEjvOnJ+7xor5on3kZDGP87pF0jLcHgNgqRFDRjHtlkZBp
	 kejAbXvJ+XQLyuxv+KxSYGMoUF5iYyyddGQyFZTMhkgY8fEEubGFplBXUCdaqJNLTW
	 BjoUopnrlEMepzF0otJf0mrf/SK1ryUqqg8/hhe+lyq56pJGmfhzxAStRpUwV2124j
	 QqgeR0Oexs+GgehqGSgjAqWHcetLdMA2NKXMh8WhHcYw+HPQke+zxrXkKfOgiQ6OGp
	 paSRoNvfSoY3hWdroMWZ1RDGYQ4DrUJkjrqyUWO5KUCcge/UOG7jYgp8SzLovElUKb
	 aF2fy7ax98BI62+FfX4m2UA8=
Date: Tue, 2 Jun 2020 08:24:32 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell 11/16] libubootenv: Remove the DEPENDS on mtd-utils
Message-ID: <20200602052432.GC14631@localhost>
References: <cover.1591020366.git.steve@sakoman.com>
 <ce5500cc07da270322b67db5001fc1476b6bf2fe.1591020366.git.steve@sakoman.com>
MIME-Version: 1.0
In-Reply-To: <ce5500cc07da270322b67db5001fc1476b6bf2fe.1591020366.git.steve@sakoman.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 01, 2020 at 04:11:19AM -1000, Steve Sakoman wrote:
>...
> It was only used for pulling in zlib, but this is now
> a direct dependency.
>...

This should be harmless, but no reason to backport this cleanup.

cu
Adrian
