Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD9371DEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 14:25:55 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id e28so10125140uah.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 07:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4zmChvQsXpezHyuQRnAHtPk/vcAvJ0nxd0qDMLtCaRI=;
	b=E9K9Baz+9hshPP3ESlY65ahnmRQih0ZCk+kAvvOqBEgxyYzGKZYygXKIHZ/0A1yjWF
	a9K1QZsih7ZjPXG5r5Cjld3Cfg+SEmHcvvN1LmlfAhOOGNl/izGlJ9QmRfrP+O0gCLjt
	gCWTLvoq01I/JtbvTZiS/kQow+U52Cg1Af8qXpsZbpfO7rfMIsFdBqUkFeatS6mFIeru
	PFgWK1+WH05F/kRUB9hpfEjm6bt9o3hSg+MX4/24doCrowAgHDzdyd5J6TlAtNQ5sI52
	RGztH0+O0zthZuxZLLDGmLVa6+sSUO3qvHuPZ9f1/T84LbToFEz2bjr7V9nqu9Em8OmN
	cAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4zmChvQsXpezHyuQRnAHtPk/vcAvJ0nxd0qDMLtCaRI=;
	b=khsVGutLH7npCTmZcBpspwRpg2XvlwFIzk3GOWBu9UhYSem0osS/pwie6sIsnGlmo/
	mEJYkkI1kEUvVf95NNX8TXJjZrdVub2G0nijCIQqX0Ep3I+xQMIbocfHWiUD8I7rqyuc
	lJJgpgqzldkO+t3UopSxElVX5msmaKWqKkG1Iwx19imBisEeMXg/C2lfm7Mmj1rtBlsc
	A2Ki0s5Ksdk5zMQPDUXEcMfaa8vUA+knd5syvKI2yH0CBaPBfPIUVKd3/cbPy5pGdt5h
	Zl+2tkRzedGLKKe/oh8fx3ibh+kZm/uFC9epvbYHVbcTwvIOmqX90KDF4zeLx3k8DYIF
	aSgQ==
X-Gm-Message-State: AODbwcAhh9XZCiHqgO8Ldm6tMm2pYX5oWvNATeLoBO9yRleL/Pr7soB3
	YWciS49CkUZlBsAjgOzRPiACyY9+Eg==
X-Received: by 10.176.25.108 with SMTP id u44mr3247598uag.16.1494858356631;
	Mon, 15 May 2017 07:25:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Mon, 15 May 2017 07:25:56 -0700 (PDT)
In-Reply-To: <1494848069-15504-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1494848069-15504-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 15 May 2017 10:25:56 -0400
Message-ID: <CAHUNapQ54qAdDyN2SX-rqkpQwSh-ESiYA2M97dAU=LTsQhdiDQ@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libx11: 1.6.4 -> 1.6.5
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
X-List-Received-Date: Mon, 15 May 2017 14:25:56 -0000
Content-Type: text/plain; charset="UTF-8"

Could you try adding "-M" to your "git format-patch ..."?

On Mon, May 15, 2017 at 7:34 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
> Upgrade libx11 from 1.6.4 to 1.6.5
> ---
>  meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb | 10 ----------
>  meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb | 10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
> deleted file mode 100644
> index caa95fb..0000000
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require libx11.inc
> -inherit gettext
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -SRC_URI += "file://disable_tests.patch \
> -           "
> -
> -SRC_URI[md5sum] = "6d54227082f3aa2c596f0b3a3fbb9175"
> -SRC_URI[sha256sum] = "b7c748be3aa16ec2cbd81edc847e9b6ee03f88143ab270fb59f58a044d34e441"
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
> new file mode 100644
> index 0000000..71cbf67
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
> @@ -0,0 +1,10 @@
> +require libx11.inc
> +inherit gettext
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +SRC_URI += "file://disable_tests.patch \
> +           "
> +
> +SRC_URI[md5sum] = "0f618db70c4054ca67cee0cc156a4255"
> +SRC_URI[sha256sum] = "4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

