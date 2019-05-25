Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 10FB67E419
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 23:23:31 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p26so10347499qkj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 16:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qa9gZbQkL0CRytYX4MDBCMACWwJEsQdGkPQG7jVxZNo=;
	b=boGSu+A2R7sWv86Qacuvq07Op7sAjHkBunfiRLAW5hqrH3p6ABXJLPvXg+qAJi8Lri
	onIawWf+DMsmCSC0RECKXI8+hxMkTAWhtOcT7GpwkoRXtmSYZ6Rzck4wTIYk36Km5W1Z
	JS/JsQsPjTcZ01QUIbpau7qN0PciKr1B6VMB9a31ggmA7i933Fe6O0SmwvPMta+pkBhy
	dmmtmkSJC+0RyB0iV5U4OkSnAJIrt6cMibaZ0S1WooZLofbQjeiE5YXAJilRSlbmwgFv
	BE90RzfusSuLiM4DlPb5jC6sDgz02lQ8JR9QdrX2J0aNqHWNDOU2DhUp2WUa/6mYwTo8
	alWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qa9gZbQkL0CRytYX4MDBCMACWwJEsQdGkPQG7jVxZNo=;
	b=ZhI1f1cDgGbag7aKSqxgaxOFQGw8OaNFRcFqM/Mj1m+xXOOqHGxeLOJne6UxJY+7Ds
	59yGIQkXHGrYGYB3QPQByv64gFDL/TTKQ3l6jev0Ms2WxCQZe6k30gOSgqSCnqQYyCn/
	sbK7Ez0f7vQs2uHpgBdh4hdVKCYVqhKvw7XsNGdr0QXaFooZfNKYSVnf5fwu3m3x75nl
	ARFspSnyTVFaL8rR+IwvK4pUyF7q40LGgWj19prtq/bOZ21rEsk+xKQBlPi+38Txh5d/
	zk50mNHvl0jvWTLjspK2aLkvrXvCx/gamREKTIWG0i8HVQC/opnJ6KhPorRc+aOhTPdD
	vanA==
X-Gm-Message-State: APjAAAVnZ9BVvD/ACYFcJKgrovUVle1LmTiJ4+t39L4JiC7/jl9DS776
	JlTdgECAbtz+sckPxOUjXo13YBK6i2l6FyM0gBU=
X-Google-Smtp-Source: APXvYqyRIUjGY5PEyhi26HuJzxdiXKFoIJcVkCgP1Kd4c6IQPwuuFRbWpBszZJRdJu2pMZ34SeLl4k/E8FEg+x1Bycs=
X-Received: by 2002:a37:a017:: with SMTP id j23mr3449517qke.258.1558826612499; 
	Sat, 25 May 2019 16:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190525201851.23732-1-richard.purdie@linuxfoundation.org>
	<20190525201851.23732-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190525201851.23732-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 May 2019 16:23:06 -0700
Message-ID: <CAMKF1sqVFS3Zr0wWpyDF721BnYGdXud3iWbhk0aUe4yGZtUU6A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tcmode-default: Test gcc9 as default on everything except mips
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
X-List-Received-Date: Sat, 25 May 2019 23:23:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 25, 2019 at 1:19 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> mips is the only rchitecture not working with gcc9, switch the others
> leaving mips on gcc 8.X until we can figure out the fix for that.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 744c6c3247e..5c10a4bd0d7 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,7 +18,9 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
>  PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
>  PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>
> -GCCVERSION ?= "8.%"
> +GCCVERSION ?= "9.%"
> +GCCVERSION_mips ?= "8.%"
> +GCCVERSION_mips64 ?= "8.%"

maybe pin it for all mips using mipsarch override ?

>  SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.32%"
>  GDBVERSION ?= "8.3%"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

