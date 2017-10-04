Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2567377BE0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 21:50:56 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b189so21450853wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 14:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hZtMIk9dZd8T4zUs5vCd3cx287vGHfJNU23Yo9Wu5Cw=;
	b=LaQnWSxJAMw8lvv0URD0+KYFg3JV4bWembe0aeuBFS0Ffyv8DHKCJrva9kZKa86/Fh
	QUjJaryrVyNwPRvlRVKnNGqdKPVJZmH6rg0CdjPAzKjRMpsyYFauAAr+VRGS4VC40yPH
	onBoLOJ0UtY2Ye9NEqF+rAFmfUZU/5wMJFteJZkxkCAfhEEZhySD542BXXr485VX3Rz0
	SPP4LOPnuplqkHCEdA2aUpoAsXBEgkZ+OkcZSfUvt7+rAY0oY/9CpDNDJMkXzdb5YZNY
	giWHVpaKAciZke+xpPsKCMC9cItMnTsos0ZB5xvTJkD4wp/Mz/MVzF/wn2o56RidXxTP
	EwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hZtMIk9dZd8T4zUs5vCd3cx287vGHfJNU23Yo9Wu5Cw=;
	b=RbI9f5c9izp12hEgU2j4wq9vWguL/qMdR1+2b/er2uXAu2mGuTX1V/wC/fJr3S4Sgi
	A1u51I/69BCuNW5fP9kpVOvfa5buoxBJXSrTDbS74Vc72EofXcTnXCSZjHlf4FAm9hJj
	nM0Jmp+JPAH7zOjjYY2HVvDgbUhM/9m9zGDsZ0MXUmJT8CprEJjDPlB/8hXvoXw+hUFy
	iaAbUxfdnYkdDG+pBgy9DVBBWHvpSHKcVc3nLUDK6fk3BJ7Hdh/hgukuTBGP5KJtkngR
	/JwM14s88dfyMYyjpxQKAg+GIfYxuHGuefY03B77m5Nm4RNq0oMKA71lmATxKeMXLeVN
	meUg==
X-Gm-Message-State: AMCzsaXZnnkuAgA9DBVDQeiHEuqLaVYedWn8f4PqwYkBdehKYJQl51bT
	iNtRFB/EZI8gQ6tKoBhvxGcY3bUO29UkFnobGwA=
X-Google-Smtp-Source: AOwi7QAjMmGHNTQvQQJ/x7RMg1PidCG9Y92vu0QnefBr26mv2w2NCQf9OhIGLVSX3bKbYNOQgrR6g36U6tZ3eVBG9Sw=
X-Received: by 10.28.54.133 with SMTP id y5mr13412922wmh.6.1507153858110; Wed,
	04 Oct 2017 14:50:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.157.2 with HTTP; Wed, 4 Oct 2017 14:50:27 -0700 (PDT)
In-Reply-To: <20170925225655.24585-1-alistair.francis@xilinx.com>
References: <20170925225655.24585-1-alistair.francis@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Oct 2017 14:50:27 -0700
Message-ID: <CAKmqyKN2b3nHMOTD-QS1-MchR6prLJAtr8_tn7-umWKm=6HB_Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Remove recommend shared-mime-info for MinGW
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
X-List-Received-Date: Wed, 04 Oct 2017 21:50:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 25, 2017 at 3:56 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Commit glib-2.0: recommend shared-mime-info
> (51e4f9ca5368af5cefa26f4ca50b282e858982f8) broke compilation when cross
> compiling for Windows. This patch removes the recommendation for
> shared-mime-info when using MinGW cross compile.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>

Ping!

Thanks,
Alistair

> ---
>  meta/recipes-core/glib-2.0/glib.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index ce15ccefc3..8434b7dae3 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -74,6 +74,8 @@ FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
>  FILES_${PN}-utils = "${bindir}/*"
>
>  RRECOMMENDS_${PN} += "shared-mime-info"
> +# When cross compiling for Windows we don't want to include this
> +RRECOMMENDS_${PN}_remove_mingw32 = "shared-mime-info"
>
>  ARM_INSTRUCTION_SET_armv4 = "arm"
>  ARM_INSTRUCTION_SET_armv5 = "arm"
> --
> 2.11.0
>

