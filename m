Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8353C7D6A2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 14:52:11 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d13so2855334qth.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o/afwDyMrR8lNAGqogHCt5jgs89fIMTUnuIJzjv3Pu0=;
	b=j8x0uDByVUnnIqjn8p6Kc7pqsdL1tTlYpEmCgoquQQJBs4vL8mfu50hcFiATpaKJFh
	51fhKXBlBBRWMRuF95OZoEbBwkmf6Br2CseTpb+8b24vsIm1Lb4dDS+q9z3joYlA8nFu
	FiFA3GLcjFuIaiIZPlSjteVTERBaBitXJteaiPvr9dA3mJw/d6bTCKZNuzD4Qu5OV6Hr
	yKYDgeh/BRoCrfMqdak9lRaH/JizeLIiqRScLS8vG/NJ+pid7a7mqRvnyVQ45IgEa4r/
	IgUwNOQf8EvZbBKStCiHLefkkS+0FWwb6DIkFrHbi9uLxpzQb0S0PX03UQgWvvDOHXYU
	l7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o/afwDyMrR8lNAGqogHCt5jgs89fIMTUnuIJzjv3Pu0=;
	b=Aph/P+t27OM9OJewWZ0Oqikgl/UqVr+rsKC/Muti104a0JcIq5EgMznWptcEN0vGhE
	DJmGYBlPOw0WkT0iKfiQC3GkhfKTSwaZh6ANwgCx2D2DPW8tbNk0TeE2jmkf4PrhgrZw
	nbkzNl8tceeepswqU6/QBjfMO2nqsqDNDvZSIM8KnMQaf6aAzv4VVC/HteS4p32e76av
	xIX+emb4c/loqdCCXFI+jRgaEzH2YqiIdQ1Q3nTukhvTIX5iWjOxraHRdT6nsC7FQhBv
	CGLbULPPCCHcd4ADER7JdvswRVoihc9sMXo6dngL5o3datqXTkt8JxWFNCVLphsgrXLi
	+LwQ==
X-Gm-Message-State: APjAAAW/+KgIwfCiXwOiMOvYSUaMBGq4k+/TKj+gumhMjjaJHz0LpASc
	PW7xiE3r74QJg7Y61K/ZDZTP2m6CGwbktnYE8eA=
X-Google-Smtp-Source: APXvYqxWcubc5SSHhe07pbswU+TUzvx+MRTi+Xq8Uxdd6RmN1mNtnY4uOeiF/Riz4/vmYDW1IS5v3rsdvPcPHVKqDuM=
X-Received: by 2002:a0c:a8ef:: with SMTP id h47mr14155591qvc.55.1557586332165; 
	Sat, 11 May 2019 07:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190511140824.4624-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190511140824.4624-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 May 2019 07:51:46 -0700
Message-ID: <CAMKF1spT7=rt=JrAqT44h7KjqAHr342Ew5SxrcPJB0EA3bXJPA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: make sure that the tools/include/uapi/asm-generic directory exists
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
X-List-Received-Date: Sat, 11 May 2019 14:52:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 11, 2019 at 7:08 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * before trying to copy unistd.h into it
>
> * older kernels don't have uapi in tools/include and do_configure fails
>   with:
>   DEBUG: Executing shell function do_configure
>   cp: cannot create regular file '.../perf/1.0-r9/perf-1.0/tools/include/uapi/asm-generic/unistd.h':
>   No such file or directory
>   WARNING: exit code 1 from a shell command.
>
> * tools/include/uapi was added in kernel 4.8 with
>   https://github.com/torvalds/linux/commit/c4b6014e8bb0c8d47fe5c71ebc604f31091e5d3f
>   tools: Add copy of perf_event.h to tools/include/linux/
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 546076f84b..215d0a38f9 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -238,6 +238,7 @@ do_configure_prepend () {
>
>      # unistd.h can be out of sync between libc-headers and the captured version in the perf source
>      # so we copy it from the sysroot unistd.h to the perf unistd.h
> +    [ -d ${S}/tools/include/uapi/asm-generic/ ] || mkdir -p ${S}/tools/include/uapi/asm-generic/
>      cp ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h

you can also use
install -D 0644 ${STAGING_INCDIR}/asm-generic/unistd.h
${S}/tools/include/uapi/asm-generic/unistd.h
and get both done is one call.


>  }
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

