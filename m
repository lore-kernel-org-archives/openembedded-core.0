Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 81A237198A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jul 2018 00:57:48 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id t4-v6so8629025vke.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jul 2018 17:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SKgGAoTiV0N+w3Nmw4Vvg+OzDF0FO75FkJV0d/6lqhE=;
	b=PwFAO4Bzuo8Ay1awEBHTskPJfqhmJCn1nF+Z5uY5EsT5SvfW9vA8O0uV29bDTNLrSu
	a1ub9ofSuxMvvcA2to5p1TICqd9ew74/ME7AK5TKak8CbsjUeJzOfZuVj1UWxDsM0wDw
	OAWlg+SYKclKxvwW+L9/ZY0pcDx1P9R466ayK2wAogROTwnpXR0w+aRjsClJzFA8zuGv
	3wuRsaumL+SrEhod/tHzmNnoxz4v+51gobg+WRIeRRmanMrShB/32jLY15wlbBf0Dzby
	JEeS0swI8OOaSBPw64ast7b5wapY2qhboKwWisls+ABWG+hoSCwUguvE+HT3BoP/dLgp
	SnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SKgGAoTiV0N+w3Nmw4Vvg+OzDF0FO75FkJV0d/6lqhE=;
	b=hCirVFGFOtsRTtBrpu+5OYDVkykIeHvD/OFuwOD4POaA/d0x3JQaCY0I97Y/TGoG57
	3qMQKwcu1yteAGwUhIFG+gc1l9pGK5RuaLetuZXQ6RsshYRLi72nq6oAAA2DWsOw8IB4
	GpBK2aMi7SbNfUB+fA0m91l5wc/vcKgDImcbcNM+473r0COwWKfwB3ba90yhvPeOBR0v
	SeA3r3GC4ZDLMZU59iKLKgbPXdrCSKGVe9ZlRS9z9T09RqKY2qY+kLHuFFYk+B5DXxb3
	b3CyCf80JeikXBQH3WxJ7QEIU9dJd978Z26/uZjXEIQq3/tRtioQglTA8RMZE8lDyHIr
	xSIA==
X-Gm-Message-State: APt69E3z2nUlkqdEAp5ZAhOkIA/69xxnRxjeLe1xK1DZwz0q55c9RJzt
	VDC6bV/yE1iQ1Fdwgf/AxZIWrPaFxJvBrR/jq8w=
X-Google-Smtp-Source: AAOMgpc45TT3F3u/IKFnkgtKFVjyM6AhXCTrNaLP5C67Of3r8JvZG5vKiVNylC0hQaW1ED3u52b4FDz86yVYKmrh6KE=
X-Received: by 2002:a1f:7c4:: with SMTP id 187-v6mr8740154vkh.60.1531011469043;
	Sat, 07 Jul 2018 17:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180705155805.20847-1-ross.burton@intel.com>
	<20180705155805.20847-2-ross.burton@intel.com>
In-Reply-To: <20180705155805.20847-2-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Jul 2018 17:57:23 -0700
Message-ID: <CAMKF1sqvsQjmhZyBTCz0Kjieitai263b+MbQ2DFy7EOR6++h8A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] distutils: clean the build tree in do_configure
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
X-List-Received-Date: Sun, 08 Jul 2018 00:57:48 -0000
Content-Type: text/plain; charset="UTF-8"

For the record this breaks few recipes in meta-python

meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb

It would be better if meta-python was exercised as testing for such
changes in oe-core for better coverage.
On Thu, Jul 5, 2018 at 8:58 AM Ross Burton <ross.burton@intel.com> wrote:
>
> base_do_configure() tries to do "make clean" if there is a Makefile present.
> For most recipes using distutils there is not a Makefile, but we do know that
> "setup.py clean" will work so call that instead.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/distutils3.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
> index 6c303068820..99ad64d287d 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -8,6 +8,12 @@ DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
>  DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
>      --install-data=${D}/${datadir}"
>
> +distutils3_do_configure() {
> +       if [ "${CLEANBROKEN}" != "1" ] ; then
> +               ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py clean
> +       fi
> +}
> +
>  distutils3_do_compile() {
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
> @@ -71,6 +77,6 @@ distutils3_do_install() {
>  }
>  distutils3_do_install[vardepsexclude] = "MACHINE"
>
> -EXPORT_FUNCTIONS do_compile do_install
> +EXPORT_FUNCTIONS do_configure do_compile do_install
>
>  export LDSHARED="${CCLD} -shared"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

