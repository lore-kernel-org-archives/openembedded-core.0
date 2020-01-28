Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 912B27FE78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 12:02:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so2237981wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=OTjk/aTWZxYBLj0H7JnWNVMyhhyu2WztqoTejXSmdWA=;
	b=fDLRW/KVFviRDIaS+zv/lmgwY22fu2Y6/pHDM/Tt0xSPAG6sC5JxPSYeTy4Sab3pE4
	cs/Co6GF7CwT8tBVVCdVa/7dbApP4jwijo+N7ual+pmmrCkNQJT0QLmmww10akzWcBdL
	bqZl8YObkNIaAgyi7+g2ks3mFKbSmuMORsiFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OTjk/aTWZxYBLj0H7JnWNVMyhhyu2WztqoTejXSmdWA=;
	b=kdaui71QAwI8fQNRZO1kQ4EX+eiD48dK8Ha/lbxfFpDupurKIxJcENnGM/D/Is8bEb
	4YkRoOOihQklI0UV6eLDz7bK2Bcj1dLg52nK8Q4H3IzUnfzWua1N+436gragarMjQ5Ut
	u5pj5ca7CTYISgl+h5zefBkfrDhj3Nb9Rf6ilKCjhtUu8z0bqzyKOLt9aI0DXGgKemjF
	vM7qRXXWZIZs8DsZZusyJ+9+1hRFINi+1zVb2To2HuJaLd7/k3a/d0nzSNUPTD1PVUX7
	ZfoTpmmjb+1yBCqseONbtNT8ud6ooxw+rIQKWCE9eLNFl3CDdRzCuR5KrVA7OBKHpiin
	BftQ==
X-Gm-Message-State: APjAAAWLCV5V7dLdWsbB0wfTuU0h5LOzEnG6A/lr2QE+aSxyY/Mo4Jld
	nz8foAZCdjOiAFBfeB2jLyeOdg==
X-Google-Smtp-Source: APXvYqx+Puwh2lWMRopBMuSZg6evlK6vT6dIBn8A37cupCU2rdPprpJJvdQWQbdgWUbEdyk8ooCu2w==
X-Received: by 2002:a05:600c:2042:: with SMTP id
	p2mr4836352wmg.79.1580212938233; 
	Tue, 28 Jan 2020 04:02:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 16sm2753430wmi.0.2020.01.28.04.02.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 04:02:17 -0800 (PST)
Message-ID: <15178a56a7fff6877d13b52312ffc8b898a60f3f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 12:02:16 +0000
In-Reply-To: <20200122071934.60789-1-alex.kiernan@gmail.com>
References: <20200122071934.60789-1-alex.kiernan@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] libxcrypt: Enable static builds
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
X-List-Received-Date: Tue, 28 Jan 2020 12:02:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-22 at 07:19 +0000, Alex Kiernan wrote:
> Whilst glibc builds static binaries libxcrypt doesn't, without which
> we
> can't build, for example, a static busybox. Enable static libraries
> here
> so that anyone who needs a static binary using just basic libraries
> has
> one fewer dependencies to track down post libxcrypt being split out
> of
> glibc.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>  meta/recipes-core/libxcrypt/libxcrypt.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc
> b/meta/recipes-core/libxcrypt/libxcrypt.inc
> index accbdd636152..e98d8084470c 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -32,4 +32,6 @@ CFLAGS += "-fcommon"
>  API = "--disable-obsolete-api"
>  EXTRA_OECONF += "${API}"
>  
> +DISABLE_STATIC = ""
> +

My worry with this is where the line is drawn. We let glibc generate
its static libs since turning them off turned out to be a nightmare, we
disabled everything else we could, assuming the user would turn on what
they need if they need it.

In some ways I'd much prefer this was in some example config rather
than building things piecemeal that most people don't use?

Cheers,

Richard


