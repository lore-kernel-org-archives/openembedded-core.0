Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id CAE2371D3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 16:30:48 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id 137so74351014vkl.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 08:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8yKE1Led9dsxKS12tH3w9UQpcoIwHaklwDkcjCErtDY=;
	b=vhMvKd+3MNt+DSh79dWeRkq/sN0FoEYweIMOsxi63Wh4wsv9gl8M1O1gc/Bo7lc5IB
	Vem6UIpPmFWxZRCRaDF6QqRggv6QUrslwRxRcdJ+KYeBaej8zmzIWGLDTs2wB//kQyn+
	iJ7OiQr82FgS0vg/h549qVpc9GW4lrHzd8K2qfI8YNia2od7LcHGRyaLcAOa3r7vUT74
	5dF1r2tv4EgnYHLNU+AbxObGhRkQ8zgh+f78Ia2v6EeI/NcCSn6bX+Ly1b6M78nmXMDJ
	2QZu0lnAr6FujQIOqRBmX8UNA2Z+YYIichTdBV5Dno0taA3twZHM/hFttbxW5FiM/pdB
	UJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8yKE1Led9dsxKS12tH3w9UQpcoIwHaklwDkcjCErtDY=;
	b=hNZoprn85QhLT0odHCaT1Di5/oRYKPE+y8Hk/dJBF9mZJakVbUCnWfqJ3eCWZyODMw
	Hx099chPusOdI0tInu6zK2FXOQaDi2aiVaEgGSYvhva4jPICI8w1VqoiK0Kh7GEhjx0u
	87lQYdtVz7GwVMKeBKqaG+Jhm40O8iWMUT6nmHEJUBfOGxZRcOzQKufi3JNhxGE+t66M
	rTtSOawZjzlgDskXzCVqU4QpfATc4XsUP2anfuqOIMSavn+0iEPojuocVUCXcT2Kh0hJ
	k0lWNiMlp6G6mNd8ZPg6ZUKg0OZ+yfvz7xmOT7ad9sG8SbmZtwPoILzozMqq+mz19HMA
	1BMw==
X-Gm-Message-State: AKaTC03bEmIy613FpO/3Uvh2Bvy42zJ9NvHsTgSd8o+eGeqbsjhgifmxhXjUq+dRRVUtR7jdpgeCvOSfEXOwcQ==
X-Received: by 10.31.8.8 with SMTP id 8mr1521796vki.173.1481819449885; Thu, 15
	Dec 2016 08:30:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 15 Dec 2016 08:30:19 -0800 (PST)
In-Reply-To: <20161215144011.1761-1-nicolas.dechesne@linaro.org>
References: <20161215144011.1761-1-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Dec 2016 08:30:19 -0800
Message-ID: <CAMKF1sqehO96PHPGv-kOUqi4mqUsaMeU1Oq_8RFUovy+RB45jQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: default to using egl
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
X-List-Received-Date: Thu, 15 Dec 2016 16:30:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 15, 2016 at 6:40 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> With the current set of PACKAGECONFIG, we end up building with 'gles2' and neither
> 'opengl', nor 'egl'. As a result we are building -bad with neither 'glx' nor
> 'egl' platform support. So let's make sure that we at least have egl by default
> (since we default to 'gles2').

This looks ok. meta-raspberrypi will be able to unbolt one of fixes
its carrying in own layer.

>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index d3c5326d45..3cb7ab1ae1 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -12,7 +12,7 @@ SRC_URI_append = " \
>
>  # opengl packageconfig factored out to make it easy for distros
>  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
> -PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2', '', d)}"
> +PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
>
>  # gtk is not in the PACKAGECONFIG variable by default until
>  # the transition to gtk+3 is finished
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

