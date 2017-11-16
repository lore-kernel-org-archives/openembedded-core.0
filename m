Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E4D01787DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 20:06:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r68so2531463wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 12:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mwnhl0jOjFCBIvYVmtIB2c3NSqVzNcqrueTzxDUAoOg=;
	b=oCKFj78nYjWDsKQMNOCZfqESqAaLEoCpsivpRMKAP9PN1WS38fhDrV+MHxKP5X9uDi
	y1EuSF8sYUl3U6ALXRoWawlneXbf7g8v7TOMWy48TC0wfLIbkTGpg428uC2FhndMDvzn
	FMRWb4TXeJLzENKt9LEQZQAq1RrkA904gI6PPEVn0U7vRVDdxYa8Dz/uN8+JOuSVFzVz
	EvDTjanyzsrA7+I2jprRVkCkB1Eqs7/Xi4ed0U4oW0LtWlMn00MQnCWZsb8MqjoGiFbI
	nHZrbz3/N8PaBoBB2y1I6iVduDMZiimP+lIW6hQuVT5Ol29X58pMg0QsUy7MKt42qdeV
	avZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mwnhl0jOjFCBIvYVmtIB2c3NSqVzNcqrueTzxDUAoOg=;
	b=Y4Z/9vO6XTy0WMZf0chyBZ9O7OOIGhAPxzE38g7kcRUzRaHbbHwmrba2IZgv3HBuMW
	d7v2CqU5EHSb9MJ/27dt3GOkiDANnIkYbXHkwtonCc+y5KzPsCKH5z6iQCg3MUPDgLmw
	NcuqHoGk81kq4LrDzjWN6dgLkEoUjL/8BxrjyiH0St55Z93yWX8rcCaaGDyTI4fdZSmQ
	c73bqunvSl0PuF00mBNn1cjWYrejzAhrLWaRWoQwZ/BkUWDbOYCJD9MFxRKowk6+m0/v
	yQZC0dntSNaCKjfZ464ZXrc0pgpm3l0rwQVs9ehZj1wzJy7FT+qJ4tkmV4q1RTn/EWiv
	acrg==
X-Gm-Message-State: AJaThX4aTAR/1HSPXp+s+YU8UW4wOziLoxEJTDQFFY2tyBeR8yZe0r6U
	siWkCqxOGQiCGh1qiRzr1pEaEn85GFE2tpdwbcA=
X-Google-Smtp-Source: AGs4zMbpkVgQFeQ8N6xUB+TmTSAZJQvCLJR6hvIyyuAYRy0u1Yckjb2yis+iY1z3zAhtOiANNqSFHJjcSs7mE6/sFaY=
X-Received: by 10.28.127.197 with SMTP id a188mr2474620wmd.138.1510862764835; 
	Thu, 16 Nov 2017 12:06:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.99 with HTTP; Thu, 16 Nov 2017 12:06:03 -0800 (PST)
In-Reply-To: <1510861730-82471-2-git-send-email-juro.bystricky@intel.com>
References: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
	<1510861730-82471-2-git-send-email-juro.bystricky@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Nov 2017 12:06:03 -0800
Message-ID: <CAJ86T=Xs5b3dNfaNFE_kzDJ1AMknRPqMw60gC_c+8gBA21SiNw@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gnutls: improve reproducibility
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
X-List-Received-Date: Thu, 16 Nov 2017 20:06:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 11:48 AM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> Sanitize generated config.h containing build host reference such as:
>
>  #define POSIX_SHELL "<builddir>/tmp/hosttools/bash"
>
> The path for POSIX_SHELL is not only wrong for the cross-compiled target,
> it also prevents reproducible build.
>
> Prior the compilation we edit the value to:
>
>  #define POSIX_SHELL "bash"
>
> With this change we can build reproducible libgnutls-bin, libgnutls-dev
> and libgnutls-dbg packages.

Is there a configure option we could use (perhaps via
CACHED_CONFIGUREVARS) to achieve the same end result without needing
to run sed on config.h?

> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 29b5dd6..5b45b27 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -53,6 +53,11 @@ do_configure_prepend() {
>         done
>  }
>
> +do_configure_append_class-target () {
> +       # Remove build host references from config.h
> +       sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${B}/config.h
> +}
> +
>  PACKAGES =+ "${PN}-openssl ${PN}-xx"
>
>  FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

