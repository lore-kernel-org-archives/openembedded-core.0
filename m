Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB4365D56
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:39:06 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id w8so14708713qac.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Mj8l247IBpG/f4ws0mtRvBSX3SqwC+UoV6firi3fI8s=;
	b=ncoiLLR+Wvaei3PZO9AxuQp93G4bVYwB4GjQwGomNkyExVEvFY3+ydnF3v1k8Zs8UR
	a/qx/85Lzak5qtS/gX8CVzD1Xxrw4MOtK7nxxeWQ19ED63mJPbQJmLPmrL68XI/DoI8V
	G4pu36UJ2Km+KMjRhTlNijiSxAmN9sh4VZHnoAK/nQKtlep49nAsvkABkiFCanCtbh71
	Tj+TS0fSscEdW8IXyASNuCDKz2w0COKkV6QQcjIyYyrNIfMWZY9IWhU3c3X9I9CzJz9S
	HK+BlDX8oL3EcukDFODec5l+cTZadBHFuQ2hSCbHTQxPU2lpLj8jQs84IaKxS0Ek5I/7
	9xEw==
MIME-Version: 1.0
X-Received: by 10.140.104.162 with SMTP id a31mr6142469qgf.104.1410205147646; 
	Mon, 08 Sep 2014 12:39:07 -0700 (PDT)
Received: by 10.96.147.37 with HTTP; Mon, 8 Sep 2014 12:39:07 -0700 (PDT)
In-Reply-To: <1410192780-16794-1-git-send-email-ross.burton@intel.com>
References: <1410192780-16794-1-git-send-email-ross.burton@intel.com>
Date: Mon, 8 Sep 2014 13:39:07 -0600
Message-ID: <CACS+7ZRjYi4uy=Q0vBD2FeuU9FqOLaM4=W1nPXDbYdqW5V8u3Q@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable resolved and networkd
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
X-List-Received-Date: Mon, 08 Sep 2014 19:39:14 -0000
Content-Type: text/plain; charset=UTF-8

On 8 September 2014 10:13, Ross Burton <ross.burton@intel.com> wrote:
> These two services are fairly immature and need careful integration into the
> rest of the system, so disable them for now.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_216.bb |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
> index a7fd71e..7f7982d 100644
> --- a/meta/recipes-core/systemd/systemd_216.bb
> +++ b/meta/recipes-core/systemd/systemd_216.bb
> @@ -59,6 +59,8 @@ PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>  PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
>  PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
>  PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
> +PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
> +PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
>
>  CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
>
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Oh good. When I saw that you were going to remove them I got worried.
Part of me likes networkd and would like to keep it.

