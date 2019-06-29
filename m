Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id AE8BF6BC19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 19:30:35 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m24so19823905ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 12:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hLkdB25enEYb5xiiX9zhiaIaOz/KrMFpXWIP3pLdIDM=;
	b=g+Fd/V0StrSxHenrJZmlujSb0mANRNSVTll8HXBpkF7yn6SF7mPBzSSboKWiZZ+cin
	1yKDDtzBFXjogMs9u/iKi0WavBqbXSoD5qfA1f7Tbq9OmBxiUaWfoNCt+c2r2a13Tzpj
	xXuSiYF/Cv46BAAtyQIyU7pjBzU1Q0BU1pLIu56Y3Sc2WJDaUH+X7wBc6PrSemlIGPW8
	I1QWqs+G0Tz/mEH/MoWrCjEahKCMMdAdSiO1Xt1Y/927mGDjIVTuAGaozCIOPrI8iykc
	wzhUDb7NKIGgaRpYpu2Ct0OnF62he6s0zsxGkE34JFnaHw4BBp4qTiGSzmqS04iTqzJQ
	hdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hLkdB25enEYb5xiiX9zhiaIaOz/KrMFpXWIP3pLdIDM=;
	b=iFOrT7tRA/oXH+6moXlVBDkYJnsceYrOnRwFBcvPb+AM4a/56RlARR2ph3yFPOVoJl
	WmBYXs6bDmCBL5KCqoqQFJQrEkx4znApbOPs/os3XAY7jdM2JlZqZEqUvJ/V2n+jZcZB
	9L6rm8iMGbALWy3Zhbs/oJXN9Fvw4MyMnkGviTI43Yfc+gY8NaF+gISiPE97Tq8nIOMi
	eW7FoCCADXvtq2xCfNao2qin3vDxc7ILZBIGBM/mYcUWifWdbwXypAAk4nOGGqFkHb0h
	g9j+W6/7c1ZNj2ZYzP/W+KYDsGjHL0csW11KyLPgZ4AJqqCD+EI8WIOPZzTqI0UGgCmD
	/BbQ==
X-Gm-Message-State: APjAAAWnxFmI1gV8XChNAOmko+2KDbGCN/H3um22b6yUKRd5ZyKS7vuP
	v6rJQEektEdsjbIfSi+o4KXKnbBVG3gYVCHf1eUk470S
X-Google-Smtp-Source: APXvYqyd/IvqFtzQrA/XzXHliLD5K2jZI8i9fHl+k7Dy9/XPA90gMPoW8HFAOm8+fxCtZRqpbHJh6FQxyA8UAKii2x0=
X-Received: by 2002:a5e:9701:: with SMTP id w1mr14906618ioj.294.1561836636584; 
	Sat, 29 Jun 2019 12:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190629192754.101979-1-anatol.oe@belski.net>
In-Reply-To: <20190629192754.101979-1-anatol.oe@belski.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 29 Jun 2019 20:30:25 +0100
Message-ID: <CAJTo0Lb1o8HVmrYAXAuh3Vkfzjm5rco5A5V-ECQT-j+FycLpMg@mail.gmail.com>
To: anatol.oe@belski.net
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH v2] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Sat, 29 Jun 2019 19:30:35 -0000
Content-Type: text/plain; charset="UTF-8"

For master, lets upgrade to 1.0.7 instead.

Ross

On Sat, 29 Jun 2019 at 20:28, <anatol.oe@belski.net> wrote:
>
> From: Anatol Belski <anatol.belski@microsoft.com>
>
> Affects bzip2 <= 1.0.6
>
> Signed-off-by: Anatol Belski <anatol.belski@microsoft.com>
> ---
>  .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    | 37 +++++++++++++++++++
>  meta/recipes-extended/bzip2/bzip2_1.0.6.bb    |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
>
> diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> new file mode 100644
> index 0000000000..8313fdcfcc
> --- /dev/null
> +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> @@ -0,0 +1,37 @@
> +bzip2: Fix CVE-2019-12900
> +Upstream-Status: Accepted [https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc]
> +CVE: CVE-2019-12900
> +Signed-off-by: Albert Astals Cid <aacid@kde.org>
> +
> +From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
> +From: Albert Astals Cid <aacid@kde.org>
> +Date: Tue, 28 May 2019 19:35:18 +0200
> +Subject: [PATCH] Make sure nSelectors is not out of range
> +
> +nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
> +which is
> +       UChar    selectorMtf[BZ_MAX_SELECTORS];
> +so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid memory
> +access
> +
> +Fixes out of bounds access discovered while fuzzying karchive
> +---
> + decompress.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/decompress.c b/decompress.c
> +index ab6a624..f3db91d 100644
> +--- a/decompress.c
> ++++ b/decompress.c
> +@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
> +       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
> +       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
> +       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
> +-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
> ++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA_ERROR);
> +       for (i = 0; i < nSelectors; i++) {
> +          j = 0;
> +          while (True) {
> +--
> +2.21.0
> +
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> index 025f45c472..6791020d05 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> @@ -6,7 +6,7 @@ HOMEPAGE = "https://sourceware.org/bzip2/"
>  SECTION = "console/utils"
>  LICENSE = "bzip2"
>  LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=39406315f540c69bd05b1531daedd2ae"
> -PR = "r5"
> +PR = "r6"
>
>  SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
>             file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch \
> @@ -14,6 +14,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
>             file://Makefile.am;subdir=${BP} \
>             file://run-ptest \
>             file://CVE-2016-3189.patch \
> +           file://CVE-2019-12900.patch \
>             "
>
>  SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

