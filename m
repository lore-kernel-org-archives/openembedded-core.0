Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id BB29E7FA34
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 01:34:21 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id u22so4594385qtq.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 17:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3IQKVMs9U5BhFsuZ3GS/KCn4pAqTkeJJE4SegSHRNqY=;
	b=Ofbx4yXyohIzaqL6CIwMXR84Ln0CCaSqH623jbzu2yi/7kfnDUyrnrwzDSGZj91cga
	As+nGzJadsht2nDwhxhOdTKhbaxP538rAjf5zUGaI//FCtkXVV0kJIlABX4D5XWzNXGj
	mM4SOSCowRnWgnsaUdQ9QDgPVDdh3QpN0lET8izJGUvkRFCeIGIfBJr8Qs25Ghg6dptX
	sS27hXSjzsPG2bM51rGKm4A22dyiIF4eeyDCaaVQkWvhrtNTjfch6hvmvXaGjUP4OygJ
	vrXnyIFNtEq0UDkhjlXHa0TYOMDkOwlFScDZ4z7CH7xMFMYn/66zfbRCumGkKfLtoxl9
	1eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3IQKVMs9U5BhFsuZ3GS/KCn4pAqTkeJJE4SegSHRNqY=;
	b=RtKS+rm8VLsfggfH0U/KvLF8mYSkqiyeXPmEOK3rj4GyU47azavhCtr8bezeuU/Tr4
	Rk3xs3ZKBZ4G3+WwUa6jYkWyhNP9bF7hqTXn15NIapF7jSicqzNQ87yQQ2hmAJR3oJdv
	DZkQVQ4Zf81hZXfzvxootmXgjc9We3B1TXzTfJ3zpAZ1OBoAOkw2pYFii3UYs0iFTbd1
	26B5P6yv8JQfWg7PNYTiEttCcRYiH4tnaxWdljVtgPSHiwkkHGN91QneZ/sGADpeSwR/
	KCQ6JmqcZ7AJwHrUuvd+QG7IOvPbDUEzUKdGIlpQJIccWpO/GxjFGV7hBEmdGAlAYXbA
	+XSw==
X-Gm-Message-State: APjAAAUiPDppks0fuNO/YR1B06/Yv6IGdbDnwYqqIwqwOnBZMqs019fs
	5b1z1URZ/q8xnN9tCXJC7JohhVOdqCik0Zpb6RS+ewxz/wA=
X-Google-Smtp-Source: APXvYqzN/plHCgiC/cSYwGKcX2s1wsfKI+oSNr2bvZGEhJk5tUScmUYd110GdwwwobMGDqNrqrMu2ugZV90Kt7V9Zr0=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr7462434qtj.80.1573176862117; 
	Thu, 07 Nov 2019 17:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20191107033029.95107-1-zhixiong.chi@windriver.com>
In-Reply-To: <20191107033029.95107-1-zhixiong.chi@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Nov 2019 17:33:55 -0800
Message-ID: <CAMKF1sqch6TtcwfA_FRZY=VPBTw_ueA6EVapDK9wegEjmNVteA@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libtirpc: create the symbol link for rpc header files
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
X-List-Received-Date: Fri, 08 Nov 2019 01:34:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 6, 2019 at 9:54 PM Zhixiong Chi <zhixiong.chi@windriver.com> wrote:
>
> Since the Sun RPC is deprecated in glibc, the rpc header files
> are not provided any more, but it allows alternative RPC
> implementations, such as TIRPC or rpcsvc-proto, to be used.
>
> So we create the symbol link for rpc header files for tirpc to
> be more compatible with the glibc version and the application usage.
>

https://errors.yoctoproject.org/Errors/Details/275527/

seems to be related to this update

> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> index e73ffe7b17..a284521c1e 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> @@ -23,6 +23,20 @@ EXTRA_OECONF = "--disable-gssapi"
>
>  do_install_append() {
>          chown root:root ${D}${sysconfdir}/netconfig
> +        install -d ${D}${includedir}/rpc
> +        install -d ${D}${includedir}/rpcsvc
> +        for link_header in ${D}${includedir}/tirpc/rpc/*; do
> +            if [ -f $link_header -a ! -e ${D}/${includedir}/rpc/$(basename $link_header) ]; then
> +                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpc/$(basename $link_header)
> +            fi
> +        done
> +        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
> +            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
> +                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
> +            fi
> +        done
> +        ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
> +
>  }
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

