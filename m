Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC91778A34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 23:45:40 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id k12-v6so18170609oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 16:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NzPrTSSEOE8+0fO3omsol1ElmPHz1M68p9E+IojEz2s=;
	b=0eFvNVf+8dXvX5niU6nZfHDkrpz/1N4RWq0X7cHA9JWfMJtUFFcjY2122aAFqPSw9i
	ZL4pM0GhnCnVqNsMG13Lxe4mTR1nI4rfzfQeGCFeSDvWO3NRmb1GfI6xsNGV+x7+spef
	voCEddarDFl4WQEDT31Nsmzo5kKSGp61LLgDmZLzJ2VgYMFARW/k/Ss7dj4uwrYeRqzI
	rExe4UiS2/z1/oodEzPw78+zSoMSTVM+Jii9m7/EdqGhadrw8yooaQYc4AVjUK1N4Chz
	XGXwTJR6czw+PZyEXph9bZlxSCziDD3geIN6o1kdr6kI3u4WLHtvkVajmOCgrLVH4vYr
	MB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NzPrTSSEOE8+0fO3omsol1ElmPHz1M68p9E+IojEz2s=;
	b=MPigA5uOcxJdXFinADWnUlHiVumvdQr8S81+eI/pGEVHFz8A5qkesHJmrudipOYzuO
	ONv6EXBQdwjFNWfMYYoMsl35vL7li9G/Fa69Fs/UPNtOvd97lOqIXFsOh4wFtLaWYDHy
	VOERa11LSTMCGdOj/XX0cQvdncA7LhLea8LQztGAiuJlhAfxzuOiB9cf75212cEGiZ+J
	E7wh/AImwSvag5goxkdBkfxtV7hLnfAGtbod5AKVCjTA005BKJxk2YI4pEgfEJYCIel0
	Qn87bMbyjXoVSSjEjjHSyhbttgV8qfjIDC7u68cmDZ2yxB/0T4Fd5yb0I4at1q3ejn3q
	jMHQ==
X-Gm-Message-State: AOUpUlEjOmethRO6/QJ8PKZ2GpWwKZds1p7ufod3d8E8KD5AyYANs4w7
	YcmEp6JFHb+ZcBIyFFdvfma2ytQ4FQMl4QBWHpDtAw==
X-Google-Smtp-Source: AAOMgpdX0+bm4DrpCr4zLX+XNJAoiHlWskcKH2pfimjgTtE0AjFkk8TKh+hSCPOGBZQmY/R+XQIdhhqpOd5Bu+KKnO4=
X-Received: by 2002:aca:4c8e:: with SMTP id
	z136-v6mr140795oia.170.1532043941900; 
	Thu, 19 Jul 2018 16:45:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 19 Jul 2018 16:45:21
	-0700 (PDT)
In-Reply-To: <20180719134150.8488-1-adrian.ratiu@ni.com>
References: <20180719134150.8488-1-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Jul 2018 00:45:21 +0100
Message-ID: <CAJTo0LYfgcFCwKNRTxLQJLJ+hWMK56FeaSZEMFp2zBBXZBPpqg@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsb: fix usrmerge install path & QA warning
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
X-List-Received-Date: Thu, 19 Jul 2018 23:45:41 -0000
Content-Type: text/plain; charset="UTF-8"

Remember to check what happens without usrmerge:

packages/corei7-64-poky-linux/lsb/lsb: FILELIST: directory renamed
/bin -> /bin/bin, changed order

lsb:
/bin/bin/lsb_release

Ross

On 19 July 2018 at 14:41, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> ${base_prefix} is set in bitbake.conf to empty. This makes lsb_release
> always install under /bin which is a problem if usrmerge is in
> DISTRO_FEATURES, because it needs to be installed under /usr/bin.
>
> By using ${base_bindir} instead, we fix the usrmerge install path and
> the following QA warning goes away.
>
> WARNING: lsb-5.0-r0 do_package: QA Issue: lsb: Files/directories were
> installed but not shipped in any package:
>   /bin
>   /bin/lsb_release
> Please set FILES such that these items are packaged. Alternatively
> if they are unneeded, avoid installing them or delete them within do_install.
> lsb: 2 installed and not shipped files. [installed-vs-shipped]
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/recipes-extended/lsb/lsb_5.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
> index 746204b6ec..1657ba6f78 100644
> --- a/meta/recipes-extended/lsb/lsb_5.0.bb
> +++ b/meta/recipes-extended/lsb/lsb_5.0.bb
> @@ -33,7 +33,7 @@ S = "${WORKDIR}/lsb-release-1.4"
>  CLEANBROKEN = "1"
>
>  do_install() {
> -       oe_runmake install prefix=${D}${base_prefix} mandir=${D}${datadir}/man/ DESTDIR=${D}
> +       oe_runmake install prefix=${D}${base_bindir} mandir=${D}${datadir}/man/ DESTDIR=${D}
>
>         # these two dirs are needed by package lsb-dist-checker
>         mkdir -p ${D}${sysconfdir}/opt
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

