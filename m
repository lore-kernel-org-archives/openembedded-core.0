Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B2C3C78489
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 22:35:43 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p96so691692wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 14:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K0hhKqniFNw8CWNJ137qcBAmAuqF+37HE91J8FP1OkM=;
	b=Rlr0jqkuTuHxAZckK9Sc0xCgEGM6wdHWwL8MTcblrrBSvNsKvTN0sW9WRnh26GGD+5
	PyYQWpVSX0PjaM8jCYIOFE9N/8sfxCpNV0RryyYawJvhZDgdQ5Vnz7UTrv9a2zlMWFjW
	NjmDaS+j9u5VLHWPyGjs2tkOtrUAmwc3ModNok3tA3rH/h068CVwZc1RkaWxVTxsz4U/
	cEigSg3W+WHJQF7gPlTiGof8Zl2sSXPUu/2MYg52k7YmpZgTRx8t2HjWArb/FzWciLOv
	M4TkXp4k8XGatBVXqHpQYdOX3yBjWNjUpageqVci+Bg49Uj6dWD6W49qFVrSsicKuLQZ
	bGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K0hhKqniFNw8CWNJ137qcBAmAuqF+37HE91J8FP1OkM=;
	b=mVPDMHw0fsJqEtyvxaD8MMfzsUn2GLQKYFJ8IC/WLkQX/nKvxM+Jw2g+BnYayc3GhE
	qdvmr29CvCr+Ihg2bKv80TG8yrOnTmkMDPK79VlhGUGW6QHy12LVEvKRWqSX6PRRiZ4Y
	rTMoIjPAFYRcLJpOnaF1qJtSgTGr6JdD0oLj44pTa1QpjUmt3yQt6a63MSN+DwpOKKL4
	N5k8qYPM9w6LbgN826aHTVlXXe4LJDsizSGYQLICz316o4hdqSP39jbKzVW5ateuRQKs
	pyYjgNoqsB449l2Zl6bRls/RNfgRSjHORtfLVTZNt41QeB6EtSasQmb+a9f44ok5ralR
	fLlA==
X-Gm-Message-State: AJaThX4HN3Jpia3bJewPIoIdXZDSlu1sOeY+6elKInMqcBuUyQqwy3Y8
	m/kKx7ZYyFTx8KCvIKt19GZWW5QrVmb14li4Aek=
X-Google-Smtp-Source: ABhQp+RyvxrGDWgNoM7Hp3xCH428TV/qjd8xfxTHrotLKwj6Jg6jdxE6Gu8g9B4tBscGEhvsqNOtr5rPHU58htC0tcg=
X-Received: by 10.223.135.243 with SMTP id c48mr180057wrc.140.1510094144194;
	Tue, 07 Nov 2017 14:35:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Tue, 7 Nov 2017 14:35:43 -0800 (PST)
In-Reply-To: <1509141048-32541-1-git-send-email-armccurdy@gmail.com>
References: <1509141048-32541-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 7 Nov 2017 14:35:43 -0800
Message-ID: <CAJ86T=WSqJysxG6mBxbKnKpsp9TaFN=gfWGv0k7joF5LVU--XQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: set more conservative default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Tue, 07 Nov 2017 22:35:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 27, 2017 at 2:50 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Setting IMAGE_FSTYPES_DEBUGFS to the same value as IMAGE_FSTYPES can
> lead to creating a large number of DEBUGFS filesystem images, many of
> which may not make much sense (or may not even be buildable).

Ping.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9696273..15feb57 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -757,7 +757,7 @@ require conf/sanity.conf
>  DL_DIR ?= "${TOPDIR}/downloads"
>  SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
>  IMAGE_FSTYPES ?= "tar.gz"
> -IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"
> +IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
>
>  INITRAMFS_FSTYPES ?= "cpio.gz"
>  # The maximum size in Kbytes for the generated initramfs image size.
> --
> 1.9.1
>

