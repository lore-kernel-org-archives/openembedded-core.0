Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDE7786BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 22:21:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 16so10386694wry.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 14:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5CSrN1MoWyw9sJpE8/NIo1KIK4HySHNWIOYv6g77hXY=;
	b=aQvnzgI0Vv+ag9M6dqdU034ECP1+pGxuYtAhB2D6O5PefP9pjpMRFPrvywD4sE9jTx
	caoCo+HdmCNFvTlxBgvCOMQNoyFHLfFbnjjZASKnjoIHx5REno6qzN8PJisV9rcIS8df
	Xg+l1BzGYftnlWyGWa8Zo+B0GU27l3TvwD9G1NHHqUoPZ/jL9vEhKK/+Ff6L7Nrl8Uvv
	ZUm2qby/9CPiOCH8W7CU2cuNVsVlGsl8jCSys+K2If7ttXsLzSHlyWKABeOxfMZUHgaT
	W5lNKVsoYqdWrTsiBl4LA2irrNumltBTiTWgKbkXLw13nGsXZez5p/XmyeFwzxsarPN4
	gsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5CSrN1MoWyw9sJpE8/NIo1KIK4HySHNWIOYv6g77hXY=;
	b=rcb0TQ7wwl3DAwbe06pu+96j/ok+9kscHk7JpmhBQjj4Cq7cZG/GSMXQ+npznROlsq
	dlqXcklqFkDCWT1WkfdbfP2DAqRgogB66EQUvGW1o5LRo1E7doKL0Yg+wWE+j4O5WmY6
	raHTaijoqNdaXUrM7vuOY6KALev6Kq5fSvAgddrzhzqUoCfDfqXizmYSGsujCoX29CUh
	lWv0b/+tXw/zrpweDCk9SrskJ1YIyc0NRgERMwpjM2iHkxcpN7Bj0JaYVX1dvZoJJngF
	JlIP6/83kiVkcofkW4j+Zez5nvbLbqaZC837jPSHyl0HLU0IpsxMbB/JD/KgFuAaMhKP
	hRsw==
X-Gm-Message-State: AKwxytdIPg3RFdPtsbesxQdFGaj7mydBfG89nVxyEG+RvVrldC0scyHF
	VFc4rwnZTI81KI7RybTmLcA4mJd/k3k+jPdIpQo=
X-Google-Smtp-Source: AH8x226FY3afxiJmGkzKa28XwVEL92f+x83qULhb7Ub+cGgMI3k/wSFl2ReIzh/bk6MDT+ku7wVHNVpLjtJg20fPmmU=
X-Received: by 10.223.195.25 with SMTP id n25mr263295wrf.191.1516659719746;
	Mon, 22 Jan 2018 14:21:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.129 with HTTP; Mon, 22 Jan 2018 14:21:59 -0800 (PST)
In-Reply-To: <1515344448-4116-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1515344448-4116-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 22 Jan 2018 14:21:59 -0800
Message-ID: <CAJ86T=XBAhwV7mrOOPYdvXw=OdqhBR9LXRGuuRVnndSNYs_xxg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: Disable documentation explicitly
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
X-List-Received-Date: Mon, 22 Jan 2018 22:21:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 7, 2018 at 9:00 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We don't have latex2man in HOSTTOOLs so documentaion is never built but this
> dependency does cause problems on older releases like morty, pre-HOSTTOOLS.
> Document the configuration explicitly in master.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-support/libunwind/libunwind.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
> index fc33786..31c3df1 100644
> --- a/meta/recipes-support/libunwind/libunwind.inc
> +++ b/meta/recipes-support/libunwind/libunwind.inc
> @@ -9,6 +9,7 @@ inherit autotools
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,xz"
> +PACKAGECONFIG[latexdocs] = "--enable-documentaiton, --disable-documentation, latex2man-native"

Typo.

>  EXTRA_OECONF_arm = "--enable-debug-frame"
>  EXTRA_OECONF_aarch64 = "--enable-debug-frame"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

