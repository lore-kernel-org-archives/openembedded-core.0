Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 31E1278279
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 16:26:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d127so4840147wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RMuuds3SoT+NRH3PVQ277Mf2WNUGQb3Liv24BSSqSRs=;
	b=EQGSFqTONBN7ugzq1vtdWO53zx8gG2DXhc9kiYF/pFtDhaTOy6MxDSEaicgjUomm08
	WkSJrhg+eHKoBg4yJX6psuyM2vwHUz3XVvI4p8Znaxatub8K6+96FznMs2cVakD30udh
	1cTsYTaSkC6fv9D1Qk0BqMyp8+v5cpPRZUblep/Z6sbI88xVCl+Lt6ue3pBwDelmxOa8
	ch8HmXhXj770uJ4OW4rA1J/3+SkvXi20zR+sLVpqw1y+kG6iqkrtPHSamBF36N8yOc7w
	dKqF4QYMiSMfj0kmlGlhBnRoBb0A70/SzDZL8DqzC1TlSUPm0HbJ3KbOuOEF/WcRAfCL
	mPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RMuuds3SoT+NRH3PVQ277Mf2WNUGQb3Liv24BSSqSRs=;
	b=RHB7SaYm9uguxe7phw+cP5NQ1UVGFP2cpX2+BlfWa6Zoj7tCgiwSROJXHCj4Etatx4
	ryRPo/uiHWL5IcqwoVniaVMShpHDXcbI1ZORIiqahNo4ULviPJotzDjS9+M7AyPmUNDB
	85tS+HQ+g1SAuC20GCrrtcf7gPEM5QMKISi3gV77ltrLqW9oWSo04WPb/l0/C7MVFveo
	UAZkt9iflAqMeMGbMX5vX6gT+1Q+WJQc6TuRWdbkGQgPnXJCH1GbwcBFFKjolU3cDsPp
	ZSwjoB+e7Gmh+HPKyV47CH+0sL8fSIZa9nJcLnarTx6VsYj7an5HWSWEeuvdZAXI6riA
	76eg==
X-Gm-Message-State: AODbwcBbs4rDdxeBeeEIqQpOQ7GOmtPfx3cKWN0tZ53+qxtkSwQ+LCfZ
	RoSG5NNIgIi46QRWJGRg5MT8m1e4Qg==
X-Received: by 10.80.182.35 with SMTP id b32mr3049005ede.123.1495815985725;
	Fri, 26 May 2017 09:26:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Fri, 26 May 2017 09:25:55 -0700 (PDT)
In-Reply-To: <1495815229-10309-1-git-send-email-ross.burton@intel.com>
References: <1495815229-10309-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 May 2017 09:25:55 -0700
Message-ID: <CAMKF1sqWjyXxv8dgtooat_BByt3-Sbf2HTjKCQA8Syu-6JQZKA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kconfig-frontends: fix another build race
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
X-List-Received-Date: Fri, 26 May 2017 16:26:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 26, 2017 at 9:13 AM, Ross Burton <ross.burton@intel.com> wrote:
> It is possible that frontends/kconfig is written to by sed before frontends/
> exists, so add a mkdir to ensure the directory always exits.
>
> [ YOCTO #11574 ]
>

this package should probably be retired from oe-core. I added it as
part of eglibc
kconfig support which we have dropped few releases back.


> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch b/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
> index a06a547..a11186e 100644
> --- a/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
> +++ b/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
> @@ -21,6 +21,10 @@ diff --git a/Makefile.am b/Makefile.am
>  index c8e96ef..1baa110 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> +@@ -173,2 +173,3 @@ bin_SCRIPTS += frontends/kconfig
> + frontends/kconfig: frontends/kconfig.in
> ++      $(MKDIR_P) $(@D)
> +       $(AM_V_GEN)$(SED) -e 's/@KCFG_LIST@/$(kcfg_list)/g' \
>  @@ -348,6 +348,7 @@ EXTRA_DIST += \
>         utils/kconfig-tweak.in.patch
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

