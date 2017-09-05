Return-Path: <matt@madison.systems>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 393C170057
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 10:52:10 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id q132so9515737lfe.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kBc/jCMf8eFcmhzrwci8pYPE6qQrPdBictTOpo335s4=;
	b=EjbGnpmm9lg7lpnTuItKZzPb+bQHnHLvNqUEzttZnl2XZvDuZAKs/osVMBEWnoob5b
	iWhByan8EKtqtpluHxMPEAT90hZxRZtatKdeKTvhRSAshXdl0jc62TKA3ArtHPTnJP9m
	+P7+iOUHhKGfyQNSqpwFjm0gu2anDsfHeQXJzvKQTEWfxGI9wT45Y1rg/ePX0lnrZGZC
	RP0tDse/V7dDYLfAY0L1Ljpo1zCZLfnZtKr4KLKHXOpMEPpGhNXsoCYZmFvfYPF1hPPm
	7om8DAlofXLp+CMmaDZNLLwUjYqZgwywLOWRSUmmwP4+wOWYs2LHelHiaE2FqcuDfF51
	DSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kBc/jCMf8eFcmhzrwci8pYPE6qQrPdBictTOpo335s4=;
	b=BQEGTZWHmf76TNboMC/y6Sc7iZNrlQ2KKT6jrxWgb11OM+CMSWd3mxm56zr0g7tDYf
	0hmR1PcMYEymLv/hxii39kRapgJ4yDXFW1dQrGdqd9SEdsHUMbUoBaWcKAr9mi32+TWg
	aUakTiHz1S9wWmGDN4q6su/kbsTjBQv0pNHL+Vrj71P+NrZLGCQXgwvyBNs9OurCJ1KC
	4FK3HCEdl1MHfrVT3smTmoCmoseE0MkF4bLubXqzGQjk4aDNa3DbDl2G8pzh5OWBNcvI
	9J2kpixqmw9HFk/vVn0NKQZmYD6y3/2VhLIlJeiulZIDQBhlnjN86cpGi6YaIJ2whzCu
	DwKw==
X-Gm-Message-State: AHPjjUhfAPjfa/9cdAFmWDtWpi1Dvu0GC67PM1AvzIurHe1DIMQUKfUk
	G46Arf1IHtoVAp7LpJ4azqkUB+P11QME
X-Google-Smtp-Source: ADKCNb5sg0Qkg9JZoBygyACaAQ2J8ff9WH6Eq0tdOXe2QdU+XzPFPbBcZeHG7IUU/Hp+QNyl1FidIL82WvLnYnnjhuc=
X-Received: by 10.46.66.145 with SMTP id h17mr1287024ljf.140.1504608731934;
	Tue, 05 Sep 2017 03:52:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.146 with HTTP; Tue, 5 Sep 2017 03:52:11 -0700 (PDT)
In-Reply-To: <20170904210608.23764-1-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
From: Matt Madison <matt@madison.systems>
Date: Tue, 5 Sep 2017 03:52:11 -0700
Message-ID: <CAGgRHJoJn+XfppzeCqs8adBoUKYyOOEF3BbQabXicgAUt24fdw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Revamp the Go support
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
X-List-Received-Date: Tue, 05 Sep 2017 10:52:11 -0000
Content-Type: text/plain; charset="UTF-8"

Looks good overall.  Thanks, Otavio.

-Matt

On Mon, Sep 4, 2017 at 2:06 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> This is not yet complete but does improve some parts of
> Go support on OE-Core.
>
> We are trying to port as much as possible work done by Matt on
> meta-golang back to OE-Core and also to avoid carrying old releases as
> there is no need to support more versions of Go toolchain.
>
> The first commits on this serie does fix errors in current
> implementation, the others are improvements and clean ups.
>
>
> Otavio Salvador (7):
>   goarch.bbclass: Stop passing True as second argument of d.getVar
>   go.bbclass: Fix binary installation path detection
>   go: Remove Go 1.6 and 1.7 releases
>   goarch.bbclass: Add support for ARMv5
>   go.bbclass: Use a global Go build flags
>   go.bbclass: Enable parallel build
>   go.bbclass: Use an auxiliary variable to add the build dependencies
>
>  meta/classes/go.bbclass                            | 34 ++++++++++--
>  meta/classes/goarch.bbclass                        | 20 +++----
>  meta/recipes-devtools/go/go-1.6.inc                | 19 -------
>  .../go/go-1.6/armhf-elf-header.patch               | 23 --------
>  .../go/go-1.6/fix-cc-handling.patch                | 50 -----------------
>  .../go/go-1.6/fix-target-cc-for-build.patch        | 17 ------
>  meta/recipes-devtools/go/go-1.6/gotooldir.patch    | 30 -----------
>  .../go/go-1.6/split-host-and-target-build.patch    | 63 ----------------------
>  meta/recipes-devtools/go/go-1.6/syslog.patch       | 62 ---------------------
>  meta/recipes-devtools/go/go-1.7.inc                | 19 -------
>  .../go/go-1.7/armhf-elf-header.patch               | 23 --------
>  .../go/go-1.7/fix-cc-handling.patch                | 50 -----------------
>  .../go/go-1.7/fix-target-cc-for-build.patch        | 17 ------
>  meta/recipes-devtools/go/go-1.7/gotooldir.patch    | 30 -----------
>  .../go/go-1.7/split-host-and-target-build.patch    | 62 ---------------------
>  meta/recipes-devtools/go/go-1.7/syslog.patch       | 62 ---------------------
>  meta/recipes-devtools/go/go-cross_1.7.bb           |  5 --
>  meta/recipes-devtools/go/go_1.6.bb                 |  4 --
>  meta/recipes-devtools/go/go_1.7.bb                 |  2 -
>  19 files changed, 40 insertions(+), 552 deletions(-)
>  delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
>  delete mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
>  delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
>  delete mode 100644 meta/recipes-devtools/go/go_1.7.bb
>
> --
> 2.14.1
>

