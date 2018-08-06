Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7630C601F1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 12:00:48 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j205-v6so21674462oib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 05:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tZHPwMg807Ydd4Y882zkSCF0K8VB/RRxZQwhAhG1dHg=;
	b=NaQdTRUCM1Ool6rtXF3SZrsICE+yb/rE+i6TtYg5ubqh+AHe7VowbKtZeG6c37OiGL
	/IEndV9C2WrZgzi7ZuIcs/F9dKcvVPsCZ3xu+kfp5ywXxQphAT72iIeiouKETKkhhKOf
	38GPlS3VmAIym9f6YBIRL2BxqrUrWdoF724VfrbXiZB6MXs0WDSiWq/Re9dLZB2FMJYe
	XLwrQreYbwWGcL7t7poDz/OQInz0iZMZubdydLC1FbosQaCiNvBKnqRJ1LMcvvfoRWYm
	lc9AUQ3Hgz4UEiGL6Kn7p8BdnC1+8lNNv0KuMlJqXNtyEZknRqyMXB++wEOl4AjqNmmY
	GOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tZHPwMg807Ydd4Y882zkSCF0K8VB/RRxZQwhAhG1dHg=;
	b=FEHqOJAtXSXzNDgUMvWCc5Qk2581pccad5EslU7heXrK4D2id5D2DHmPU8iAd2CZlX
	OcgIZFJnXy7Q0T9uhaKDPzGF9G37A5/BzkgUzO4ZRNZ9+HSAeBl2LXlyzB5L+WdXdfUm
	Cv5O4cIuO1E0tgBlH/cuaR3JelQ6GjxIVKNPHKa7YjK39fPOc9HuJx8L1VcSSie/Jo33
	EMcgz4V6+G0DPQaPYdpshIBVLyOaXZ6MXHXrjP+N/UdkGy3GjtZv2T05b5uDqwoVsSqA
	GfyFChkjfFJD0x7vOWCEK5RxiLgSUWxefnls3G6gnQ1B+tMoa0P2EZFvXYfgz4LHyPJf
	WzEw==
X-Gm-Message-State: AOUpUlHCVf9Lo9J5QmPl5LszV0KIi2fIZH41deZls906i2LvzGkmam2O
	+mv98QLDRCcwEAWT3os0u6lswkfbjOMpfb6AbUAbZw==
X-Google-Smtp-Source: AAOMgpeGcFjsOD1inzPQf7wOWlTVydnbKtrYaVM1pWwOgW66utCqAsgBrvYJ7yhb6HArMHS/QnBrkfrjJeDun0UOokw=
X-Received: by 2002:aca:3e56:: with SMTP id
	l83-v6mr15297721oia.170.1533556849701; 
	Mon, 06 Aug 2018 05:00:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 05:00:29 -0700 (PDT)
In-Reply-To: <C4F20EE9-9435-4061-B634-871DE7DF369C@gmail.com>
References: <C4F20EE9-9435-4061-B634-871DE7DF369C@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2018 13:00:29 +0100
Message-ID: <CAJTo0Lam_z0M4oPwOoyPZMa=ZkWBj9qXKz8T1uMKFSiLS93Fgg@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cpan.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Mon, 06 Aug 2018 12:00:48 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

Can you use git-send-email, as the patch gets corrupted by Apple Mail.

Ross

On 2 August 2018 at 09:20, Jens Rehsack <rehsack@gmail.com> wrote:
> The modern the time, the improvements in ExtUtils::MakeMaker.
>
> Nowadays, .packlist and perllocal.pod aren't touched anymore when appropriate
> flags set during configure stage. Controlling the flags globally avoids
> dual-life recipes need share patching.
>
> Further: remove prepending ${PERL_ARCHLIB} in PERL5LIB - it's wrong (search
> order is site_lib, vendor_lib, core) - and ${PERL_ARCHLIB} contains core
> libpath only ...
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/cpan.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
> index 8e079e0d55..926c6358a6 100644
> --- a/meta/classes/cpan.bbclass
> +++ b/meta/classes/cpan.bbclass
> @@ -16,8 +16,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
>  export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
>
>  cpan_do_configure () {
> -       export PERL5LIB="${PERL_ARCHLIB}"
> -       yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor ${EXTRA_CPANFLAGS}
> +       yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 ${EXTRA_CPANFLAGS}
>
>         # Makefile.PLs can exit with success without generating a
>         # Makefile, e.g. in cases of missing configure time
> --
> 2.17.1
>
>
> --
> Jens Rehsack - rehsack@gmail.com
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

