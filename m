Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1025178744
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 20:25:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v123so4350450wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RqJEGmFB4xV6TtXtgOAZacCm8zdzRLl0SmsydHMA0/E=;
	b=d+BlHBZVcoHexClXolN8S3yxI1DOqQ3a7p5JpmXdb5FDHnFyaUgRR0ps/1ffhG+2uS
	EQ9qIi5s3v4fPOgovIjAO3ZvYv7G8neA4GGh6Wb5aqSqPRrDdQVvwjdqh4giUo3zvKr6
	9gDlc0JXwAaPlL7kWh782/73vpkQLkkJ6o9RRHnCqdoaPAarU0cONQSSJqbWbyzCWfD3
	zFVqwTtSunO5m5Ea9JyvEPFpd+sgKVFPMbL96+idJt3LlB3f93/IylpYQUIS3NYJ/+zB
	Pr6dGANW4T1la3G07mUxFWEvbgA7do7yxee+Aq6dBnqAeuaaGjirTvicDlEweojIoLx1
	S2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RqJEGmFB4xV6TtXtgOAZacCm8zdzRLl0SmsydHMA0/E=;
	b=NRfplhUFY6RMGul2Tt9iUv3C0B54Uw1RrkBX44YcWHjqC9zJHQIr4GcDo+3x7EvuLy
	U5Quzj6mezYmNNzRuSDl/WJxiMuJOxZP6ZGU2QrFppjQUz6esqSV52QNHH+djSksDt27
	nbmd4LQonrSy8WeZQYqhwk5el+XE+DaiZxVn8wt8NNvlgtDY83BSZGrW00WcEpNmO9dD
	wwk+n1UFM0icT15X8TKLmEeInT0kTJSSm1WX8BsYcbaCU3OoYWQwo/TV6p5AZnxIUHqu
	vQWETaKxbgHed3uc6ICZVjCg5/Uq+UyuGntQEQRkOvMCQXeL+RTnsSQmytoWJ2IXUaza
	gf3g==
X-Gm-Message-State: AKwxytfV/S6e/8OBNowLT/LSQ+dhwahCdgiwWVb80LHsEchxc5JhJGoj
	qS7oglzFo1RgNPQYFOz00xNG5//odImKWCVKrr0=
X-Google-Smtp-Source: AH8x226wyOWXRNrVKJ5dUwbnhSxL69vPm6+phGlNLEBZBTydpWuipIrm+AY5ROgv5XvIm94IGt2cMhrAftrXy+Qq+5w=
X-Received: by 10.28.232.72 with SMTP id f69mr2635726wmh.110.1516739112554;
	Tue, 23 Jan 2018 12:25:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.129 with HTTP; Tue, 23 Jan 2018 12:25:12 -0800 (PST)
In-Reply-To: <1512524359-16132-1-git-send-email-armccurdy@gmail.com>
References: <1512524359-16132-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 23 Jan 2018 12:25:12 -0800
Message-ID: <CAJ86T=U=fT8tTyRPDEzk78U2qxOXB7CW=R39TOCJfwfcLwxfTQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] bind: move libraries to own package
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
X-List-Received-Date: Tue, 23 Jan 2018 20:25:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 5, 2017 at 5:39 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> From: "andreas.kling@peiker-cee.de" <andreas.kling@peiker-cee.de>
>
> Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> (cherry picked from commit d74ebc91388941295a2321a295cdb06ee87fc38b)
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

Ping.

> ---
>  meta/recipes-connectivity/bind/bind_9.10.5-P3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
> index 13724a8..8309302 100644
> --- a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
> @@ -67,6 +67,9 @@ FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
>  FILES_${PN}-dev += "${bindir}/isc-config.h"
>  FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
>
> +PACKAGE_BEFORE_PN += "${PN}-libs"
> +FILES_${PN}-libs = "${libdir}/*.so*"
> +
>  do_install_prepend() {
>         # clean host path in isc-config.sh before the hardlink created
>         # by "make install":
> --
> 1.9.1
>

