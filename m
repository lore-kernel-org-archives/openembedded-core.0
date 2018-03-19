Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 586E0789E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 23:32:15 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t6so96508wmt.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 16:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TRiuQA/tzweuv+GGfPx+OnBL2Hp8fFCWPfW9iKoIe4I=;
	b=OHqR52DPpclxQvdgGkqJBtZ6g6j/FFBv/uEEq+LSiJ4Wb/MfLYcd9kYjkLOFTUvL8w
	X9CTDEA0zTD8+/Gw4pH4GD4fONif+eFUjR37XcFTk4HnVo7TsQt3Z5Ex0bKx0ZR1HF/6
	UJseaZVz9Btisrmb+oWPYtjgKMT/urhUv8pTDwk/Id+JfZ2Raa8mxTjRkT74X5fhSqVR
	slvSl35MQHYK+mxOtffNcUyO/09MLt7f50q+P2uD60IUqrfVWy1GqheljtiIYZg274eG
	Xfz9jSigf7FNsfA7SDxbYLX2iEUUEPFDeVV0eu/hNyp3KbCmivNxz3Bkkup3ozky1+D/
	0T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TRiuQA/tzweuv+GGfPx+OnBL2Hp8fFCWPfW9iKoIe4I=;
	b=Ph8OEge9JvwReagQ4v75VxhZSDIrub5x4xkqmd7fYLbpy73hlwSov+fenulvEt9lUz
	E31mM2pnYMot/mv2FfqOKtaJ228Kij50V1S/8SFVoNcX2AdHDkaIo/SS4dC1W5Kmwr0S
	Cy5nbc/4hpClw5TAF05NDjz7V6fJ50fquf3l2rCMam2Ibm8sfib+bzjMhxjzEkfYcLLw
	sMRi1mMLo4rfsr6gXS02sXgzZRjO3HuQ3yhXWmsGi1iRe/FD/Hk5FZEa6dw7mkYizGyY
	wkVLnM8LWcxx2NIVDjJuGpR71/XW27xt5PTy4JHlQvvGdgMI43C9tSc2IxMT1s4654DZ
	vRoQ==
X-Gm-Message-State: AElRT7F0nhmkQkoC26d37gxDMnrbK7mo3hqhALTvM2WTPt90ZRtpnTHa
	bbdC27i43eC0+7seP0OitSMgJeQQpXixmpclSoE=
X-Google-Smtp-Source: AG47ELt03Zz+afUi1RJ9m7/DzP7KufqvzNEcP9C1KDlTCOcgDswtRhJDiFb5YQMR9O8Takg40DpMlU2DeWEaIG+x16M=
X-Received: by 10.28.176.134 with SMTP id z128mr405366wme.86.1521502336859;
	Mon, 19 Mar 2018 16:32:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Mon, 19 Mar 2018 16:32:16 -0700 (PDT)
In-Reply-To: <20180317112607.28536-1-Martin.Jansa@gmail.com>
References: <CAMKF1sqfasCaxgxFV_-f1UhAeS4GnwJxSU1uz61UbOg3Rmecsg@mail.gmail.com>
	<20180317112607.28536-1-Martin.Jansa@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Mar 2018 16:32:16 -0700
Message-ID: <CAJ86T=VWaJOesaUHM_k=x-+ip044=0SqFhMA4MfNExsz_VYeWw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] iputils: add PACKAGECONFIG for libidn and disable it by default
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
X-List-Received-Date: Mon, 19 Mar 2018 23:32:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 17, 2018 at 4:26 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * it got enabled by default, but without the dependency on libidn in:
>   commit 5997981fa2c22609a88b8cbb595dbf7758b2f7c2
>   Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>   AuthorDate: Thu Feb 1 20:02:08 2018 +0200
>   Subject: iputils: update to 20161105
>
> * https://github.com/iputils/iputils/blob/master/RELNOTES.old
>   mentiones that IDN was enabled by default in:
>   [s20160308] and surprisingly the same in [s20150815]
>   but there are no release notes for s20151218 version we were using until
>   now, don't know how it really relates to [s20150815].
>
> * but there are some issues with libidn as described in:
>   https://github.com/iputils/iputils/commit/f3a461603ef4fb7512ade3bdb73fe1824e294547
>   so disable it by default.
>
> * fails with:
>   | In file included from ping_common.c:1:0:
>   | ping.h:39:10: fatal error: idna.h: No such file or directory
>   |  #include <idna.h>
>   |           ^~~~~~~~
>
> * Easiest way to reproduce this failure is to remove libidn from gnutls
>   PACKAGECONFIG or to use gnutls which doesn't have libidn PACKAGECONFIG
>   at all (like the one in meta-gplv2).
>
> * First it leads to following QA issue:
>   http://errors.yoctoproject.org/Errors/Build/53212/
>   ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-ping rdepends on libidn, but it isn't a build dependency, missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
>   ERROR: iputils-s20161105-r0 do_package_qa: QA Issue: iputils-traceroute6 rdepends on libidn, but it isn't a build dependency, missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
>   ERROR: iputils-s20161105-r0 do_package_qa: QA run found fatal errors.
>   Please consider fixing them.
>   ERROR: iputils-s20161105-r0 do_package_qa: Function failed:
>   do_package_qa
>   ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/iputils/s20161105-r0/temp/log.do_package_qa.7627
>   ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-extended/iputils/iputils_s20161105.bb:do_package_qa) failed with exit code '1'
>
> * But if you cleansstate iputils as well (after removing libidn from
>   gnutls PACKAGECONFIG) to empty iputils RSS, then you get the error about
>   missing idna.h:
>   http://errors.yoctoproject.org/Errors/Build/53213/
>
> * Adding the libidn dependency explicitly in iputils recipe fixes the
>   issue.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-extended/iputils/iputils_s20161105.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/iputils/iputils_s20161105.bb b/meta/recipes-extended/iputils/iputils_s20161105.bb
> index ad7dbc4d4a..0125739b03 100644
> --- a/meta/recipes-extended/iputils/iputils_s20161105.bb
> +++ b/meta/recipes-extended/iputils/iputils_s20161105.bb
> @@ -23,8 +23,11 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
>
>  EXTRA_OEMAKE = "-e MAKEFLAGS="
>
> +PACKAGECONFIG ?= ""

It looks like mut (and now master-next) have picked up v1 of this
patch, where libidn is enabled by default.

> +PACKAGECONFIG[libidn] = "USE_IDN=yes,USE_IDN=no,libidn"
> +
>  do_compile () {
> -       oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" all
> +       oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" ${PACKAGECONFIG_CONFARGS} all
>  }
>
>  do_install () {
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

