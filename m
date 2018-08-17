Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
	[209.85.222.50])
	by mail.openembedded.org (Postfix) with ESMTP id 56E0079365
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 21:31:25 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id y10-v6so6567593uao.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fib6xrnMWrucAqlvlWe4VxOVlXNMY/2mN8exlv6y18g=;
	b=hWSAMeue7TbKK7pZi9mCubR4e0oeyzVhS6nWmlefRa7CP1pe4nhf4pI+8ObKL27H2n
	s/qgi9mgYwIU4t7fJs9f4tFgOdS76VJjYuPoZCVW07rk3YWgX2XWVq+eAD1OQFviB01X
	o/Qa9+u3iP4NaOTdKkAkxB6W/RlhfCkqPYgqNyT5D4/8uJPjdalQL7v1UIAlnlhGhOrh
	pJXSp6A33Z7E14TogRS18pz85hnojm2aYnZN4IEoO7DrZg+R10GyIm9FsM9OUxAYDkOS
	8dA4NJ1wrKcbI3Tsq8xvCUUHmhR+saw1URPVCaSrjYFeuxD23qEXvdjrOVpWUz4aLQom
	ClAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fib6xrnMWrucAqlvlWe4VxOVlXNMY/2mN8exlv6y18g=;
	b=jpL6daAZTCELEEOK5Lso0A9QR9W0nfVxGDpa6WP+36K5/NHNXMpolIcl/BrszJIJW2
	IzTdgEKqpGOTRb0HYUheKGA+rNqoXqTLUGiSyGK+a6Uw7rKLIaQ3XQ9NkO7ykcCNULLg
	oP37omc6wJpVmxAHDUrp9ez2I5+NUa5kMhkK9c8xK9mxUz3+XoJT5NaJlt/fF0hICOi9
	FCBKbovAEWIrjIjsApZ7KeiI9DEOM7d2CD1Vye3SQuNX163jgEbcGvwEU68FtAdx0gNV
	8kIcH7lUX0FiHXjOTZr/FUzD5ANgVzZoM8oFRA31nxEgI2GMw6+JRlegSLvxiGRWld/C
	60sQ==
X-Gm-Message-State: AOUpUlHa09P2Nba/H+9w4jlWUksjsbpw/lrSz78oqtBf3kgoJ2XZNJCN
	LaNnJZUaiZmOC91VPgwGeS2sOI+9RAttclNkTaY=
X-Google-Smtp-Source: AA+uWPzW0Im4h8SAD3mWHxExIWuVyP+xjvXGLcG14WB7slSryO8tmNDaoRnaxz7youRJZ/YjSEBtq/+ax/q77ShMHmU=
X-Received: by 2002:ab0:5b8f:: with SMTP id
	y15-v6mr23898116uae.59.1534541486196; 
	Fri, 17 Aug 2018 14:31:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Fri, 17 Aug 2018 14:31:25 -0700 (PDT)
In-Reply-To: <20180817141411.31825-1-akuster808@gmail.com>
References: <20180817141411.31825-1-akuster808@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 17 Aug 2018 14:31:25 -0700
Message-ID: <CAJ86T=WfkmRWbrj6EgQXyRNhYxTxhzEfNvCkLySa3q1=hNmK_Q@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] gnutls: Update to 3.6.3
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
X-List-Received-Date: Fri, 17 Aug 2018 21:31:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 17, 2018 at 7:14 AM, Armin Kuster <akuster808@gmail.com> wrote:
> [v2]
> Fix new config options form with to disable.
>
> [v1]
> release notes: https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008584.html
>
> add ssl3 and tls1.3 config options now supported.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc                       | 2 ++
>  .../gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb}              | 5 +++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb} (53%)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 04c0fd2af8..f204e5f4c0 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -30,6 +30,8 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
> +PACKAGECONFIG[ssl3] = "--enable-ssl3-support,--disable-ssl3-support,"
> +PACKAGECONFIG[tls13] = "--enable-tls13-support,--disable-tls13-support,"

I'm not sure whether either of these should have PACKAGECONFIG options.

SSL v3 is obsolete and if gnutls is disabling it by default now then
it's probably best to leave it that way (dead and buried). Experienced
users can always enable via EXTRA_OECONF if they really need it.

TLS 1.3 is the opposite - it's brand new. If we add a PACKAGECONFIG
option to control it then it becomes the gnutls recipe maintainer's
job to figure out when to enable it by default. I think it's better to
leave that decision to upstream gnutls.

>  EXTRA_OECONF = " \
>      --enable-doc \
> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.2.bb b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
> similarity index 53%
> rename from meta/recipes-support/gnutls/gnutls_3.6.2.bb
> rename to meta/recipes-support/gnutls/gnutls_3.6.3.bb
> index e540528a8e..c560305032 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.6.2.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
> @@ -3,7 +3,8 @@ require gnutls.inc
>  SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
>              file://arm_eabi.patch \
>             "
> -SRC_URI[md5sum] = "8b4912c6c0e5ffefd3dbb4888eaf8a58"
> -SRC_URI[sha256sum] = "bcd5db7b234e02267f36b5d13cf5214baac232b7056a506252b7574ea7738d1f"
> +
> +SRC_URI[md5sum] = "d3b1b05c2546b80832101a423a80faf8"
> +SRC_URI[sha256sum] = "ed642b66a4ecf4851ab2d809cd1475c297b6201d8e8bd14b4d1c08b53ffca993"
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

