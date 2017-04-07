Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 05CD477E3A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 17:42:27 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o21so16061371wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gIO7s8JLq1LYw9AiKWAxNGidtZC8vKPAQ0ArUCHz4pI=;
	b=WfhAnoWhC1zSTwALaB9mZsTmuAlgpHjxyli7PNbF08XRBBOiiFIsm8pDuV6ki03uJs
	pGG/MachvaJERCrsE8a9WOfCj25MXjTml0e/FOKUclQar5eQ9tDFMVyhCqjM3wCQkmjd
	aGMrwMCCC46Fvtqyx9xRZwXnSiK1jz12Pso5WT0/HURrjR5NNDwvUKlIKa4ei1ud7IoE
	yIeTvjPo0U2Eql+pBpYmjfpMgddPLniz7o8TWWXJkrPKC5MzS27jAEjJXU56jIcxRFHQ
	d7jwgENgtSm7j52+Y2fLaTAcdZlM/nOGiwYI0KvU5vkXcjEZZPbo/JfBMhdCGfy7AE+Z
	VB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gIO7s8JLq1LYw9AiKWAxNGidtZC8vKPAQ0ArUCHz4pI=;
	b=EyPr4xgpS7KIq7Yt9xNnt0juBOuufTjcDHg2c+iDqtQR+J3qqWuoficemweYGfHfIz
	JuD2mnq2WDB47aaS0prqVVuLBEh16gbMkEaA4WymIP2DApoHW03a1K2b7Fnb0nRUEwE5
	YBOmwjrIYt+MGboTpx3tAumLhWMHz8LJb45IcLnABT0kH33RdGHJDhf17kp+I7nMZpsz
	m8fT3hSDLfH++mmfpdDNX3HSegtOoXECaAxMQWx2WJXFg0UQK4Jg1ah6mpV+HqTmDqks
	Vlb3KQ0ekTzeW6AwxJZF353uNW1C2s4PLsDXqsjkgNRabNZN3yAwRO9/sec65Ed99k4C
	w6Ig==
X-Gm-Message-State: AFeK/H3DpcUuUDtCHw6jhReMB5MHAv1E7XQamJzdTLPQ8RS1pdSUWyXP+fq2qXX7GRv973ZztqgBVmcj1WhAkw==
X-Received: by 10.223.181.135 with SMTP id c7mr34307797wre.19.1491586948588;
	Fri, 07 Apr 2017 10:42:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.248 with HTTP; Fri, 7 Apr 2017 10:42:27 -0700 (PDT)
In-Reply-To: <1491583311-1551-2-git-send-email-richard.purdie@linuxfoundation.org>
References: <1491583311-1551-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1491583311-1551-2-git-send-email-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 7 Apr 2017 10:42:27 -0700
Message-ID: <CAJ86T=WV75JhhcJXpdmHXn9WrEBT0F=oS6g-sk8JAApFYVp1xQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] no-static-libs: Add entry for ncurses
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
X-List-Received-Date: Fri, 07 Apr 2017 17:42:28 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 7, 2017 at 9:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Yes, the option to disable static libraries in boost really is

boost or ncurses?

> "--without-normal". Add this for ncurses and its variants.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/no-static-libs.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
> index 54f34a7..f8d8c09 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -33,3 +33,7 @@ DISABLE_STATIC_pn-libusb1-native = ""
>  EXTRA_OECONF_append = "${DISABLE_STATIC}"
>
>  EXTRA_OECMAKE_append_pn-libical = " -DSHARED_ONLY=True"
> +
> +EXCONFIG_ARGS_append_pn-ncurses = " --without-normal"
> +EXCONFIG_ARGS_append_pn-ncurses-native = " --without-normal"
> +EXCONFIG_ARGS_append_pn-nativesdk-ncurses = " --without-normal"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

