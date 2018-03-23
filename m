Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id A7C2978889
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 05:26:28 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id k22-v6so6826771pls.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 22:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d5nuHqxSwgtidIAovHhIckn/hlTbtZMq4w2wIE/zdgE=;
	b=VQaRQZ4wDg5Cj3VyadOB8bPlQW0gW5zcDKAbHEBwMZpLA1q2mHxPxYSy1Ab9ZxfKLQ
	qSfuvAz7cP7pKafLcIQ5XrGNDPj1cl1K/Gl2Ws+/RR6+8onc9JMnSUnIZx6yAtgQ/u7l
	c+HGWGq3uQxgMt81jfhpqpVnVqdau1JYHzDIbmaxWi6jg0/0xE2BwvGsUE0xywmMxAyL
	6tH0mrDdUwCqguYxQ2SQDtRAqgm5DSwsXNJXNcXuha5n86MO3L8I6CcJJt91kO3D8azI
	L2pLPicY6ljGacTF79nQ8TQHKltGMv8V7IzEg7oT7xxSR9ZwKGK29xlNgMwFriq90xJt
	WQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d5nuHqxSwgtidIAovHhIckn/hlTbtZMq4w2wIE/zdgE=;
	b=PMqZlcKOMvggSPP9FD2Z19NdE9SdvTd97xmj2ju1GpSAVxKhLn5EuO+KN14ZT9N6N8
	H038XjwXy35XBSJSw6XX2ZlpiRyzIJ4mdETTviMKI17RdizdS7m3fZ4ibPXQT53FQemd
	kDVAPWbLNpduH9Zmy387ilkhZEsmaMA3m1cf3papGHwjZl7AchMbpo5y3H8Ub9wNxq9j
	RKARapV2GSH+dIsqHHgdnypsDkxKNlBjwZFinYMVbxiSFwThOqRGUPeVlpTnk6xYpDhX
	O64hINgmBACkrkGCZTYIcki3AgBPC5DC8oPnXhFrnL2TrmuyGtsxP+YhAlAQkyC4rkh0
	j92Q==
X-Gm-Message-State: AElRT7GzFkKnkPC7bUJ7JXmRdmqjvlVBIL1FoAaw9fYC901Np4pycq7Y
	q0FshqhIr/O/4HnPyhCEtBGlHJXVpHLe1aWjPfE=
X-Google-Smtp-Source: AG47ELuEh5EuP45Tug91k60JnsmjJGC1JLSi3XjYq6bxAWVdggkAF1kI8Oa/2Araxmvj09Eqwf2/lw0H9nTv5SDvb7s=
X-Received: by 2002:a17:902:6e01:: with SMTP id
	u1-v6mr17941163plk.96.1521782789807; 
	Thu, 22 Mar 2018 22:26:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.173.149 with HTTP; Thu, 22 Mar 2018 22:25:59 -0700 (PDT)
In-Reply-To: <1521781486-20919-1-git-send-email-akuster808@gmail.com>
References: <1521781486-20919-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2018 22:25:59 -0700
Message-ID: <CAMKF1sreT7Pm9k7C74S7JggUOA7i52YefxoGGKyq5HhOkspaew@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][v2][PATCH] distcc: Change SRC_URI
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
X-List-Received-Date: Fri, 23 Mar 2018 05:26:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 10:04 PM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> ERROR: distcc-3.2-r0 do_fetch: Fetcher failure: Unable to find revision d8b18df3e9dcbe4f092bed565835d3975e99432c in branch 3.2 even from upstream
> ERROR: distcc-3.2-r0 do_fetch: Fetcher failure for URL: 'git://github.com/distcc/distcc.git;branch=3.2'. Unable to fetch URL from any source.
> ERROR: distcc-3.2-r0 do_fetch: Function failed: base_do_fetch
>
> [v2]
> upstream deleted the branch and the hash no longer exists.
>
> Took the git snapshot from yocto and created a copy on my github.
> There was no offical 3.2 release, only rc versions.
>


I think V1 was ok. Is there any difference in the 3.2-maint branch that
we may not be able to use it on rocko

> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-devtools/distcc/distcc_3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
> index b6da65a..e6f159c 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.2.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
> @@ -14,7 +14,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
>
>  RRECOMMENDS_${PN} = "avahi-daemon"
>
> -SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
> +SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
>             file://separatebuilddir.patch \
>             file://0001-zeroconf-Include-fcntl.h.patch \
>             file://default \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

