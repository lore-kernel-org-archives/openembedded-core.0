Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 189FB74C68
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 18:53:08 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id e6-v6so2753497plt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fhl1nM3mSdsZhnMZf6gj2FpPbgRgc9fLkBKyBtT+xCc=;
	b=HtDEvbfm1FocAPk3vzPoKGhIaLlm3YHT0pDbGmkcyWdbrNg8rpVa7kk5SFZ6La9PJG
	lDz8MRx5h5RlSH0VInDmBbphM1sgk62eXFEIYvN39nzMbxgFhveNB41kW0gfsgTPG+ZL
	hUAAD3o6ng2L9HEsQpsKAHwM3fzFVK/snViUs28k3gfFCyszZufoyIDc59bIbHFlHl+4
	+dIJrM0VH/VUwDtW/iERlcIBx/Gyq/QxwGw2UVrXnd2ClDZogM3zGaeSDDcHIIm89bRL
	z9uVMvSQ+J5mHHtruv8DimLmKoS97qPHOonOQWdn4QkUEVk9EVIWghVDF+A0h1vG9KW4
	01rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fhl1nM3mSdsZhnMZf6gj2FpPbgRgc9fLkBKyBtT+xCc=;
	b=AeeoHLV/cyOAOWDeN4zluy4KASsUWCjNcwaaZvuKIlCMhrP157PfWzKiHrObSbQMhG
	S0VYIrnFRwtBxJS37iXTsrVf50PRYy8TaEt0p1E9NmEMQbMYiKglnr1n1jKOM9NbjiTd
	0Z16QVT3KqxUjHX5IqBr4TomJZZUlGqGiJQQvZs8VzY1kX6bOTqjaVURny+Kah2jsgPC
	GP4I+C/aeLYEASYzKK0Qxp4Mh2KCIwYBeJIGztN/GR9wK2NsZV4n3yT9fjUPXhkgNPhy
	s7I+gTN5s4c2+4RMAYiNw660bzbbC3x4nnYqFeXIgmqR8nbO7crkJkhbc6lQNeXGfPuL
	oHdw==
X-Gm-Message-State: ALQs6tBHnNfHtMOrZaOFS9vDz5HS5xFMHbfPFpR8buQMWuOpsJ6AYcrk
	Cd4u1Au6n6HRoj7XB82N2qU6TPamzW+0VpxwVxw=
X-Google-Smtp-Source: AB8JxZrWekTEmj+nIcTLSIf0dJdISRcbV3T/iey+JI3w4ZtxHXte35GJZzIjTLMAlvrkl5R3MRZwoSEYDntfx2ud9SY=
X-Received: by 2002:a17:902:14d:: with SMTP id
	71-v6mr17754008plb.275.1525805589657; 
	Tue, 08 May 2018 11:53:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.187.132 with HTTP; Tue, 8 May 2018 11:52:39 -0700 (PDT)
In-Reply-To: <20180508184903.13506-1-mkelly@xevo.com>
References: <20180508184903.13506-1-mkelly@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 May 2018 11:52:39 -0700
Message-ID: <CAMKF1soFoZfwOU8uTNxLOy+FL3P9PhHgqWLEbHO=X9yqR_LERw@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] libmbim: upgrade to 1.16
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
X-List-Received-Date: Tue, 08 May 2018 18:53:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 8, 2018 at 11:49 AM, Martin Kelly <mkelly@xevo.com> wrote:
> This is needed for the next version of modemmanager.
>

this series is better than mine

> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
> A similar patch was also sent by Khem Raj; that patch is just as good, but I
> wanted to send this in the same series because the modemmanager upgrade requires
> a libmbim upgrade.
>
>  .../libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb}                  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.14.0.bb => libmbim_1.16.0.bb} (82%)
>
> diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
> similarity index 82%
> rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
> rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
> index f89ef9d57..5260c0f14 100644
> --- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
> +++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.16.0.bb
> @@ -14,5 +14,5 @@ inherit autotools pkgconfig bash-completion
>  SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
>             file://clang.patch \
>  "
> -SRC_URI[md5sum] = "2ed809e65c85353d3ab59e372890e549"
> -SRC_URI[sha256sum] = "ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b"
> +SRC_URI[md5sum] = "76ea4d8381989919b1d9b91c818fed80"
> +SRC_URI[sha256sum] = "c8ca50beeddd4b43309df5b698917268303bf176cea58fe4fe53d5bf0e93fac2"
> --
> 2.11.0
>

