Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 85FC67197E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 16:52:27 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id j126so1105932oib.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=7ShIAb/nvujl/n58w3aBopyMIeJQM1t0TXV/O51PURA=;
	b=2CvtJUi/aNnvr3AplU9XNrXEFpNzYeOeUjULIbkpSQLvfcoVfAT045I0Hj/aH6MR41
	hT7kf9xrwYC8hTyyLANx6IW3T+qoMyX3YgQEGf3nT7eafJdu0NCUbQIq8NHjOb9DoR9P
	GbEFdaWnVLglFza3T1coda2wguKCoznYBSdkkJt3Q98ElkJqehro1tvlhZj66hPR0NLc
	8Ujx6Nmydk7v70r4xgtRR8kU0dkPmdYPJmF9varD1hxC6gn18s2XW8v8KLrRQ92iMeyV
	63A8XhQCsXr+MP66GUxvtuNXSWYNDXL632Z+NqJB629dWTnR8hKNh383T/IiZ5Tv7o/M
	y/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=7ShIAb/nvujl/n58w3aBopyMIeJQM1t0TXV/O51PURA=;
	b=kQDgYgwo1MYqehJxPPfoaPiB9f5FGTXYhj9oly3IiA1RBosTeT+msLKe3m53nXTQGo
	x/oEqD9ZW7odjTuxYrqqDgQ4IoNP6q1g/Aviii9cWSlpA4J+0iqGiFaRQxLfQF3zWikV
	+XQ8fc5++Zqe5uZGwVRX4siAulz7DCYH7bVbXhFBQml5dL7ZCk6aBsuZOcNpla8C3vfx
	WkFqrCgr6z3/+pu6qGkNzfYkBIrV6r/w3QN6HNrNnKocwOC46OMwC5bzLLPsW6ew632D
	vd8jBYFjemOsZzZ/sr72uMKKftCu8otFzxAe5ysGr8imCmozAbpJfhlG8p5I514iI72p
	Kwxg==
X-Gm-Message-State: AMCzsaWeO1hbqgvpenjO6IYx7CI+ZpQpsfsPgxeHvP7JLDWCZ1gLyjlC
	lSBWW+ILkf1JxziWCOzibK+6jjmo
X-Google-Smtp-Source: ABhQp+Q8CwkMHUnRTeJSyTDbkvKYEzYuuAdzFhpc4cNoAa2zzU7iPpWglKIhlqO5DziwhUTsZcB2Wg==
X-Received: by 10.202.84.4 with SMTP id i4mr1339923oib.322.1508950348077;
	Wed, 25 Oct 2017 09:52:28 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	x140sm1305082oix.38.2017.10.25.09.52.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Oct 2017 09:52:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id v132so1149530oie.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 09:52:26 -0700 (PDT)
X-Received: by 10.202.205.66 with SMTP id d63mr1359326oig.352.1508950346342;
	Wed, 25 Oct 2017 09:52:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Wed, 25 Oct 2017 09:52:25 -0700 (PDT)
In-Reply-To: <1508918112-9459-1-git-send-email-B40290@freescale.com>
References: <1508918112-9459-1-git-send-email-B40290@freescale.com>
Date: Wed, 25 Oct 2017 14:52:25 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpUtT3XCXgmWh7Fze8Sy+Qb9gXgmHhAFARnFQQ16+ToTA@mail.gmail.com>
Message-ID: <CAP9ODKpUtT3XCXgmWh7Fze8Sy+Qb9gXgmHhAFARnFQQ16+ToTA@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: Chunrong Guo <chunrong.guo@nxp.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: add DTB_LOAD to set dtb address
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
X-List-Received-Date: Wed, 25 Oct 2017 16:52:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 25, 2017 at 5:55 AM, Chunrong Guo <B40290@freescale.com> wrote:
> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> kernel-fitimage for arm64 and arm need dynamically sets dtb address,
> thus we need a flexible way to load dtb address value.
>
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 179185b..479ffd4 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -36,6 +36,8 @@ python __anonymous () {
>  # Options for the device tree compiler passed to mkimage '-D' feature:
>  UBOOT_MKIMAGE_DTCOPTS ??= ""
>
> +# Options for load dtb address
> +DTB_LOAD ??= ""
>  #
>  # Emit the fitImage ITS header
>  #
> @@ -137,6 +139,7 @@ fitimage_emit_section_dtb() {
>                          type = "flat_dt";
>                          arch = "${UBOOT_ARCH}";
>                          compression = "none";
> +                        load = <${DTB_LOAD}>;

What happens if it is empty?


>                          hash@1 {
>                                  algo = "${dtb_csum}";
>                          };
> --
> 1.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

