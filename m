Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 96DEB744F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 10:35:21 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id e23-v6so2815899oiy.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oVP/GQyP04MWV2PEL9kIOabTsBLa/m38Ap7oiNjUXrY=;
	b=pMmszfTuQFNua2pyuz86it9YCC2MYogKyyYPdK3vwJbcyJSqcl9wfWVScdVhYb1nLU
	as8l9+4Y1xbdMIZ81EwowB4Tgb7u12kkpL3sx2pyOVzh611lpDR2DFS/CKoq91SCW0d7
	t9vZEOqPrTM/6ZWDxFYEGdFbHlY7ax0UV3Jtl0mY9QzyJtfw88DvUDpBr8PGthqHjzMl
	AsHs4gRL5jfiiHS3SC+8W0ge/wXAu3xymsHk+pwVd4o5fi4aLB/sWJUZ0+pyuOC4v7yx
	aNU7beSV5mTSqKzgxcyDd5qoQ6pmqilQYiSxDG5o4FASZ1oleqW3KargsPwfC0telB1I
	556w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oVP/GQyP04MWV2PEL9kIOabTsBLa/m38Ap7oiNjUXrY=;
	b=fO30T3v4I1lZdy4YOPXFp+pHUPdqancIZvCqaVsS/edIlgopupamJFDevn/f0AdksI
	9PkCT6h1FHXiKS3aCyr05ECVWQOh8BTCrXq7yU0x1XAVZ0swqrM8X0kuOb8+1YrAPTfd
	IZIJXawk4IFg4C04mOR7x2SprBDJKc+14+kqZI8yhFFdD4caZYbswpEqGoMlSacRDJZM
	Zl8Yc25jr+CKU+juGGTNr+vDRAmTq0NAdsWyQ9tIEXbK1CKSrt4o+P+W88aIUu+zxr6+
	TrHRbMMD+kI35obol2GX9YU3WCUR8JUJ5cgcOqQBSftvnyhKs9W6Z8Ei71M1G0LN9onx
	gh2w==
X-Gm-Message-State: ALQs6tC1VMUIMomhLOeX0ZrZEAPcGOQi/RCM/NMDGlphRDRbfn2GEX7m
	p7AGLERtSpPYkm6w2SEm4NDAm6JvhMuJSNU996gCog==
X-Google-Smtp-Source: AIpwx4/sIMuH/dZuu4U0uHUjtCtBET4nStSwYLH+v3Ow/kpN0C9k0how97FiGqzfETcPS9iN8VdbcMuwojclTsSjiZc=
X-Received: by 2002:aca:d09:: with SMTP id 9-v6mr14915407oin.170.1523874922488;
	Mon, 16 Apr 2018 03:35:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Mon, 16 Apr 2018 03:35:01 -0700 (PDT)
In-Reply-To: <20180414065456.62948-1-niko.mauno@iki.fi>
References: <20180414065456.62948-1-niko.mauno@iki.fi>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Apr 2018 11:35:01 +0100
Message-ID: <CAJTo0LZuBXy1w3=RmQQx-4J+RQByH0tKQ92Q6M8_ZcZUYGjeKw@mail.gmail.com>
To: Niko Mauno <niko.mauno@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] run-postinsts: Replace pi_dir variable test
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
X-List-Received-Date: Mon, 16 Apr 2018 10:35:21 -0000
Content-Type: text/plain; charset="UTF-8"

I'll drop it myself, but in the future note that PR bumps are not required.

Ross

On 14 April 2018 at 07:54, Niko Mauno <niko.mauno@iki.fi> wrote:
> Since commit 5159ddcb62682e1b7e63a20a9218ea96e3fe10a2 string length test
> performed against pi_dir has effectively never been able to succeed.
>
> Change this to rather test if pi_dir is not an existing directory. By
> doing we remove the chance of seeing the following console error message
> during first boot to a pristine rootfs:
>
>   'ls: /etc/ipk-postinsts: No such file or directory'
>
> Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
> ---
>  meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2 +-
>  meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> index 50c0a1afea..307feb7187 100755
> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
> @@ -43,7 +43,7 @@ remove_rcsd_link () {
>         fi
>  }
>
> -if [ -z "$pi_dir" ]; then
> +if ! [ -d $pi_dir ]; then
>         remove_rcsd_link
>         exit 0
>  fi
> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
> index 31c98ec99c..85b3fc867e 100644
> --- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Runs postinstall scripts on first boot of the target device"
>  SECTION = "devel"
> -PR = "r9"
> +PR = "r10"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>
> --
> 2.16.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

