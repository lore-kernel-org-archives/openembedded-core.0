Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1C99E7E701
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 12:36:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so16679932wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=4WBQ+PU7VIz0pAGgVeO8ZY2DJeHZ202G7YeXVIcMlo4=;
	b=boLyI/wrukcAVHiI7ejmZvIjcGkT3LrqcVCBp9sP0VeCSTevVfLtGXe48IEyts6Bsp
	pcoDGW5LcPJJyaUwOKCZRV+Oo5gNc5GzM3m0Cc9ExIx5nAq1X2SUezEjR1zxjCYmoaoB
	gGxLhkzFHhjOp+FSGJuulmBlmD0YZ7+4m6IWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4WBQ+PU7VIz0pAGgVeO8ZY2DJeHZ202G7YeXVIcMlo4=;
	b=OWnvkQJsxPZVOl3tHrxDMF9m85mZXsr6Gr0bhyTRc5lOpNzkTcZ2DI/aEfwrtl6Ib0
	DyzAebV2fkLGAhe1eTE3ReeQBylfpzygrCN+IJGrdXbTbEL7lv0pZkNY0yOW9wpTsJz1
	VDHSbzFaOzMcv4g9BpDH96ocme/1BVFi1ilqUyf69xvegMDjAdyzFWzObXaduI/p3N6G
	iCfwjY3mflA8/s8pLD9Gh9VDON35KSngFmbL9vdUQR80Io0W9ST480NhYqNJ61rxJHDL
	39CLJsq7VtYrpzhGEu+JJoOxiutjYw3evBDlz3f1FFJAv/Dnv0mGb0nk5mwx8kStbWYr
	0fFQ==
X-Gm-Message-State: APjAAAUDnNNVEDegoEXc58BEFbkyUI4SRsoJJuU9SsnzIZQt+/7HzKDG
	SOKpOEXyda4fqIdUxI9uW5tZ1C2sEZc=
X-Google-Smtp-Source: APXvYqyziNN4lQGLH/sFSxqp4V/FXc9qAcE+cykbpUEjdsXcmOa4fQnQ+uuKXIowVXYUDlWlHU89rw==
X-Received: by 2002:a5d:5542:: with SMTP id g2mr39232735wrw.232.1560342993756; 
	Wed, 12 Jun 2019 05:36:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c5sm5817153wma.19.2019.06.12.05.36.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 05:36:33 -0700 (PDT)
Message-ID: <fddad43f3c2052f390bddeb16fce29b30999b5d1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhe.he@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 13:36:32 +0100
In-Reply-To: <1560337967-208223-1-git-send-email-zhe.he@windriver.com>
References: <1560337967-208223-1-git-send-email-zhe.he@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v3] lttng-modules: Add git based recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 12:36:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-12 at 19:12 +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> The git based recipe is for those who want to build lttng-modules with bleeding
> edge kernel, to avoid regularly backporting patches from upstream.
> 
> Note that PREFERRED_VERSION needs to be set to select the git recipe instead of
> the tar ball one.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> v2: Correct a typo in SOB in 0001
> v3: Use devupstream to make it more clean and clear
> 
>  meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> index 70a6843..dfd166a 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
> @@ -11,7 +11,6 @@ inherit module
>  
>  COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
>  
> -#https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
>  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
>             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> @@ -34,3 +33,13 @@ python do_package_prepend() {
>          bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN'))
>  }
>  
> +BBCLASSEXTEND = "devupstream:target"
> +LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
> +DEFAULT_PREFERENCE_class-devupstream = "-1"
> +SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=master \
> +           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
> +           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> +           "
> +SRCREV_class-devupstream = "${AUTOREV}"
> +PV_class-devupstream = "2.11.0-rc+git${SRCPV}"
> +S_class-devupstream = "${WORKDIR}/git"

OE-Core can't access the network by default so this will need to be a
specific SRCREV which you can set to AUTOREV in local config if that
makes sense.

I've sent a separate email to openembedded-architecture about a better
syntax for some of this but that isn't anything wrong with this patch,
more just the way devupstream works.

Cheers,

Richard


