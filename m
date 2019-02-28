Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 733337C40C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 22:24:03 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a188so3471943wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 14:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1TV0QweGZ86EXYYidfi0umzcCt56uSzEJPoy7wFHcPM=;
	b=FQbWA63+WKWwMiRxnZ3uyCgmo9IYyAzkCaVaM6/M4VKEugnYJffFQ1uTr6k3wxvj86
	rGxd7zKTYrle1tIAmNeDadYcP2OF33cr9nL6rr8MkxfcTT+NJcbNd7Dv6GyKSM+yIbRo
	ojxNA5FbJdeuAZNjBUh0rX32496y9nGUC+t8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1TV0QweGZ86EXYYidfi0umzcCt56uSzEJPoy7wFHcPM=;
	b=gsRUPCBtD+drDRIkCNibuwe2IdFo/vSLZtSICZUJln8f3FZO5nVMdZLYtnFNaRYlLk
	8hzuBzlWPfvwcV3BNC6dNND1gsEdC+94zrdXz4cTRdCx5lQBGvnIZSUCHnkezWL8YxOL
	r4dm5jPbuBO3RTnSfpSyJfRh5RaZOjg/TLyd7//13tHgdDB+Bl8S/J8cmd/siZYrljv5
	BIjn0FvO3r+0mNVRltyJakt2Rd0MJREt+eiVBuvFpQ/vHtXWO9BkRQ696BN4xa8D1oWH
	bHzHZAUNeFIU4w13vM8TPMDxLhXkk7/HI/oN4ehSmIfl1PzfSl6tHuAAqIs7Mlvu9n82
	nbQA==
X-Gm-Message-State: AHQUAuaF8k/XD7c4aWj1eEEqf94wWre5L90YeEesLOHrnPg0BcMON7QC
	gqZhb5lRvW8LypcHw/QZ1qw2C/8wo+A=
X-Google-Smtp-Source: APXvYqxRymaOao0X0McxHxYrCyxgL+zMOWO58kQ8gQO/N4oPfsStm/j+/FVAOlYl/xdhk8Q748wAJA==
X-Received: by 2002:a7b:c777:: with SMTP id x23mr1195605wmk.71.1551392644098; 
	Thu, 28 Feb 2019 14:24:04 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h62sm6380805wmf.11.2019.02.28.14.24.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 14:24:03 -0800 (PST)
Message-ID: <44473a1d54ad68139b8fe9ef3e5b0fdc31870801.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <Alistair.Francis@wdc.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Feb 2019 22:24:02 +0000
In-Reply-To: <20190228213251.31036-1-alistair.francis@wdc.com>
References: <20190228213251.31036-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] qemu-native: Add missing fdt PACKAGECONFIG
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
X-List-Received-Date: Thu, 28 Feb 2019 22:24:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-28 at 21:33 +0000, Alistair Francis wrote:
> This is required to fix this build failure:
> 
> qemu-3.1.0/hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No such
> file or directory
>  #include <libfdt.h>
>           ^~~~~~~~~~
> compilation terminated.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> index c8acff8e19..0b6a7f8b6e 100644
> --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> @@ -6,4 +6,4 @@ require qemu-native.inc
>  
>  EXTRA_OECONF_append = " --target-list=${@get_qemu_usermode_target_li
> st(d)} --disable-tools --disable-blobs --disable-guest-agent"
>  
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "fdt"

I think this is a rebuild bug, did you try cleaning and rebuilding
qemu-native?

I did hit this when testing but in amongst the rest of the chaos from
today, forgot that :(

Cheers,

Richard


