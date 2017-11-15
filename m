Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7387831C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 19:39:38 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q4so9606974pfg.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 11:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=228W4lxPq98VgK+qhSmqgY2VZVh229mJ+63Wzu72r/U=;
	b=Jxd2spVRcZp5DK1BkddHglmsPzn+GVkJj/B/6CLD+8VDoO3GOIENOumpglLm3qgXiI
	DrfocB4Ekz/QxZ+VOHZxxYS7q/SIQCHVq9lTgRLDrvEMKdMtAq3x4CcRU15l+AphluxY
	OdmbKX79bbEdWA+egv0GTY4iT8KZb4Cd1SaMEZ2eqyBMZ8ToR/2chJwJbtBomO/BVjyB
	a9KCr2BYUxCKCAi+25+nXarDsUcIQuVXuEdYnqqOQl2PS52zEBJ87bERZTNRQIJlu9AR
	xCLJsiXcXwh9FD6nhbd7ibQmo6q9VOYR7tAoYXjNbsBspxGHwuIxW8Lhzdg5iwhuaH6o
	5jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=228W4lxPq98VgK+qhSmqgY2VZVh229mJ+63Wzu72r/U=;
	b=an5WqulrJut7PYug7Yzy9G6QzjXuJg1GTM4bEKCQ76DQZFBYk8V9RZ1HVCsGgrg3Kt
	lf5Sz/ugqxwYp1GVBM6v+LRCPPrK3JfxBudfUBvPAIg6p55DInhqT/lB5XcHM6dd8pne
	q8tDTzkTVCvBHXEiKqTfxRJLW1RgkS95GdpZkuWunZwjvile6wYU957PA7quQIJJrYGJ
	Ig38OKykc7VqNv5l/lT9ZaGtJ+VTrrSH1TI0A6S80JLzlSMqSJrZwDnZs1m5PHI3dzrw
	S+dvCgPbeS7M99mNrlfYk1mmoJ70VkK/tn+IT7r3tL7xMiG3B2n2dfyrMf9wQRidJ9O7
	rH1Q==
X-Gm-Message-State: AJaThX4+H7H/gp1wcA9dNgfUTfb7+tHKyFV6uXKTYNDm7z42LIIPayVM
	uMr3OUgQskJ/rnZa2bpVDH91S2GNrQGNmrx/LsY=
X-Google-Smtp-Source: AGs4zMbSCWsoHjQLA1xG5j9LmkYH1rEo5eFbQMVp/y12hmELHxv7CMQhi8noc8fwdmOhQdXEAmjczM5ODz9J2zO8Ef8=
X-Received: by 10.84.179.67 with SMTP id a61mr15809933plc.338.1510774780089;
	Wed, 15 Nov 2017 11:39:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Wed, 15 Nov 2017 11:39:09 -0800 (PST)
In-Reply-To: <20171115185409.12050-1-jslater@windriver.com>
References: <20171115185409.12050-1-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Nov 2017 11:39:09 -0800
Message-ID: <CAMKF1srAN=7-=Tt1MYGW45Qm==UFyCfFs9396NOj1u0LhMSfcQ@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nss: pay attention to CFLAGS
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
X-List-Received-Date: Wed, 15 Nov 2017 19:39:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 10:54 AM, Joe Slater <jslater@windriver.com> wrote:
> nss ignores CFLAGS so we suggest them via CC.

is that a limitation or intentional in nss build system.

>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/recipes-support/nss/nss_3.33.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/nss/nss_3.33.bb b/meta/recipes-support/nss/nss_3.33.bb
> index e3d4f96..06d81ce 100644
> --- a/meta/recipes-support/nss/nss_3.33.bb
> +++ b/meta/recipes-support/nss/nss_3.33.bb
> @@ -104,7 +104,12 @@ do_compile() {
>      # We can modify CC in the environment, but if we set it via an
>      # argument to make, nsinstall, a host program, will also build with it!
>      #
> -    export CC="${CC} -g"
> +    # nss pretty much does its own thing with CFLAGS, so we put them into CC.
> +    # Optimization will get clobbered, but most of the stuff will survive.
> +    # The motivation for this is to point to the correct place for debug
> +    # source files and CFLAGS does that.  Nothing uses CCC.
> +    #
> +    export CC="${CC} ${CFLAGS}"
>      make -C ./nss CCC="${CXX} -g" \
>          OS_TEST=${OS_TEST} \
>          RPATH="${RPATH}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

