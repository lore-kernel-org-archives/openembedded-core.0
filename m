Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id E367D77B99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 01:39:55 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u108so106496wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 18:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y2daGN6FVTBhx311k2apQKpBYDpOoEQCQKA6edLAJSk=;
	b=CgvzY1/zBFBYAkrd1rJuy1mhpXTTfC+KVVpAy9TqVY9wf+/BdkfJ102YEbUKTtZbrX
	5Y1PB2+Ol6ezOT86NSHtUJlo9S3/JkIhmer1OO3ZApNS28cZBxhs30T8FMMnv0QGls91
	1quiloGYU+Ml2OwlX7VfPbwIqQk9fKVmceJMsF5gD2hFnqcfprm+A98P/dHSG/Snkn0n
	GEWg4mohtNTxWM/OSWfLvjh6+oak8j+VArJH08EvgOyaaDYlNChuHykMkCpgz+iIDa4J
	gCdlBUmDmm9Id89nKVhS7t7KdaKca4SbMznFhgXFr+u2LfjTllrhEeaOCrIZvrp/GH8V
	84UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y2daGN6FVTBhx311k2apQKpBYDpOoEQCQKA6edLAJSk=;
	b=AXFqKP0Zut1ZD4N37XwPGkm07rJ1EPpAvpVUpwVU2jnDK86aSHVHkZNAIt3DRvXMr9
	+aOG6l/mn8hqopitBfVO+g1ZZp5LtpM2VStqgs6XWxSvKfVTGp4Bqwc/y1OQZP6WnyRc
	2dez20aXJ6oWziLu2tyC9AFTzoz9AeLcQFvWtUKROCHTH31MMDEAhx8uVPGvLBDyCn/t
	gj5+lkFb82vSBdh4QHI0svRGKvHpTqoef4MdyhaSVRHoZssfAW5imfjFm6w6WvLlJpoB
	2A0AaBEIX7FakCASIUYUrB2skHcupmYtS9b3o6QcIl7kuga+RXdiX5K1D2xNHYtOvs1n
	Vrqw==
X-Gm-Message-State: AFeK/H2rr2UzynzF4EPlMFY9oM+bWrRWGhRuHhyAPeCcdqiV01uNcaTFNgsb8tHr6qiR5BSURaN/qUtjMRy/qA==
X-Received: by 10.223.152.173 with SMTP id w42mr32603wrb.72.1490319596458;
	Thu, 23 Mar 2017 18:39:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Thu, 23 Mar 2017 18:39:55 -0700 (PDT)
In-Reply-To: <1490313649-32458-1-git-send-email-vedang.patel@intel.com>
References: <1490306205.12818.5.camel@intel.com>
	<1490313649-32458-1-git-send-email-vedang.patel@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 23 Mar 2017 18:39:55 -0700
Message-ID: <CAJ86T=WeV6_5WRj7FSqVUFoJH_+SE6j-5qfD+HQ6UTEBT9guNg@mail.gmail.com>
To: Vedang Patel <vedang.patel@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxslt: Add PACKAGECONFIG support for python
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
X-List-Received-Date: Fri, 24 Mar 2017 01:39:56 -0000
Content-Type: text/plain; charset=UTF-8

 On Thu, Mar 23, 2017 at 5:00 PM, Vedang Patel <vedang.patel@intel.com> wrote:
> Add support to enable python bindings for libxslt using PACKAGECONFIG.
> This will include --with-python argument while compiling the package.
> The support is disabled by default.
>
> Signed-off-by: Vedang Patel <vedang.patel@intel.com>
> ---
>  meta/recipes-support/libxslt/libxslt_1.1.29.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> index be747e608d9d..707f2f97b7fc 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
> @@ -22,7 +22,7 @@ S = "${WORKDIR}/libxslt-${PV}"
>
>  BINCONFIG = "${bindir}/xslt-config"
>
> -inherit autotools pkgconfig binconfig-disabled lib_package
> +inherit autotools pkgconfig binconfig-disabled lib_package distutils-common-base
>
>  # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
>  do_configure_prepend () {
> @@ -33,7 +33,9 @@ do_configure_prepend () {
>         touch ${S}/doc/xsltproc.1
>  }
>
> -EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
> +EXTRA_OECONF = "--without-debug --without-mem-debug --without-crypto"
> +PACKAGECONFIG[python] = "--with-python=${PYTHON_BASE_VERSION}, --without-python"

The more conventional way to order these lines would be:

  PACKAGECONFIG ?= ""
  PACKAGECONFIG[python] = "--with-python=${PYTHON_BASE_VERSION},
--without-python"

  EXTRA_OECONF = "--without-debug --without-mem-debug --without-crypto"

The python PACKAGECONFIG option probably needs to include a dependency
on python.

>  # older versions of this recipe had ${PN}-utils
>  RPROVIDES_${PN}-bin += "${PN}-utils"
>  RCONFLICTS_${PN}-bin += "${PN}-utils"
> --
> 2.7.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

