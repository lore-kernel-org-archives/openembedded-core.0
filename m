Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C28E36C0BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 16:26:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m22so3024061wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 08:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Tl+2LpDTpfC+8IbZTtQtD0J40ONNB8sLWmrkPYLx+Qo=;
	b=gziCL3CddVXdd2IcnvHtRMXZPTRmSddIZqsr8fxKQdsc6gvXfoNDz6/2p1Tz+fYuco
	BSmhPS/fefblHwD5Npee+QaVDd83sSoy9BMH3cuH/UcthnPnad8LB+svRdovy9uPi4ou
	KiKfDsme8zoORUMqu9twTvcNwdagyiqQ3JAxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Tl+2LpDTpfC+8IbZTtQtD0J40ONNB8sLWmrkPYLx+Qo=;
	b=Af4CdTTfZ/7oQx4g4MqxgNuNRd1YcbOP7nmDgOljyCJIrr5ihnKJ0hJ1DfV9I698AQ
	bU/nyx4pGqD89/6LB97RaIHrS5dXlgolI4wUapJ0Cm3N28RLaEvcbqLBjb1dI6u03Lxw
	T9pEAycrkc53dHXs5bXv3ELfVoX40wIHuMdLfB0NHXeewjIOLd/0r6ZKiiFwFl0zqYtF
	+tIXhAbRBEYxz/T5gJw8TQsEzh4ghhvvqGtyzWpEEMGP41GMs0vLUmt9zvSak3V3Y+0f
	7boujC15Hs6OUT0SV1zjHVFTHPT/YQIQySGFvDStBsEQ9MjU48xG790wu+vzWtqePo8z
	xZUA==
X-Gm-Message-State: AA+aEWZwLXB4wGF6EIrNW3sVq5jsDCvqBLXEqZyTpfN0dvPJpnaDsvtl
	neJ7bFBL0m9WSLLZbzZBre1N6Q==
X-Google-Smtp-Source: AFSGD/V61/8GIbbmQiE2pA9OjwgXSZOQSMa1umUDVEALPgf1+CRglpMcJAT1LxNn9+OsVYmia4jbCw==
X-Received: by 2002:a1c:2c44:: with SMTP id s65mr12202wms.80.1544718386452;
	Thu, 13 Dec 2018 08:26:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t12sm1682086wrr.65.2018.12.13.08.26.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Dec 2018 08:26:25 -0800 (PST)
Message-ID: <b7c0b17395606a87550133d858b00f76d354d1d0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 16:26:24 +0000
In-Reply-To: <20181213141312.14587-1-andrea.adami@gmail.com>
References: <20181213141312.14587-1-andrea.adami@gmail.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Subject: Re: [PATCH] python3: fix build for powerpc-linux.musl and powerpc64-linux-musl
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
X-List-Received-Date: Thu, 13 Dec 2018 16:26:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-13 at 15:13 +0100, Andrea Adami wrote:
> Add the missing triplets (not considering uclibc) for do_configure.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../python3/powerpc-musl-triplets.patch       | 43
> +++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.5.6.bb |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/powerpc-
> musl-triplets.patch
> 
> diff --git a/meta/recipes-devtools/python/python3/powerpc-musl-
> triplets.patch b/meta/recipes-devtools/python/python3/powerpc-musl-
> triplets.patch
> new file mode 100644
> index 0000000000..477d049858
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/powerpc-musl-
> triplets.patch
> @@ -0,0 +1,43 @@
> +Using musl libc the task do_configure fails on powerpc*.
> +
> +  checking build system type... x86_64-pc-linux-gnu
> +  checking host system type... powerpc-oe-linux-musl
> +  checking for python3.5... python3.5
> + ...
> +  checking for the platform triplet based on compiler
> characteristics... 
> +  powerpc-linux-gnu
> +  configure: error: internal configure error for the platform
> triplet
> +
> +Fix this by adding the musl triplets.
> +Note: uclibc is purposedly not considered (unsupported in oe-core).
> +
> +Upstream-Status: Pending
> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> +
> +--- a/configure.ac	2018-12-13 14:44:55.414309610 +0100
> ++++ b/configure.ac	2018-12-13 13:22:37.546497547 +0100
> +@@ -831,14 +831,22 @@
> +         or1k-linux-gnu
> + # elif defined(__powerpc__) && defined(__SPE__)
> +         powerpc-linux-gnuspe
> ++# elif defined(__powerpc__) && !defined(__GLIBC__)
> ++        powerpc-linux-musl
> ++# elif defined(__powerpc__)
> ++        powerpc-linux-gnu
> ++# elif defined(__powerpc64__) && !defined(__GLIBC__)
> ++#  if defined(__LITTLE_ENDIAN__)
> ++        powerpc64le-linux-musl
> ++#  else
> ++        powerpc64-linux-musl
> ++#  endif
> + # elif defined(__powerpc64__)
> + #  if defined(__LITTLE_ENDIAN__)
> +         powerpc64le-linux-gnu
> + #  else
> +         powerpc64-linux-gnu
> + #  endif
> +-# elif defined(__powerpc__)
> +-        powerpc-linux-gnu
> + # elif defined(__s390x__)
> +         s390x-linux-gnu
> + # elif defined(__s390__)
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb
> b/meta/recipes-devtools/python/python3_3.5.6.bb
> index cd7991e7f8..2e8ae711d5 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -44,6 +44,7 @@ SRC_URI += "\
>              file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-
> 2305.patch \
>              file://run-ptest \
>             "
> +SRC_URI_append_libc-musl = " file://powerpc-musl-triplets.patch"
>  
>  inherit multilib_header python3native update-alternatives qemu ptest

Do we need to make the patch application musl only? This tends to make
it more painful for recipe upgrading and we should only do that if the
patch would have an adverse affect on non-musl. Would also be good to
get tweaks like this submitted upstream...

Cheers,

Richard


