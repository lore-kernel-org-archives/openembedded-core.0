Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5A08E6D3A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 21:03:53 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id z131so8361231itf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 13:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7DmUux9c9YF2mLaz9z6i9FuJ4ZkQD8/KUX1u5fX0g7Q=;
	b=nPLHVYmjtM1LQcHG8GfZ553kG48HNzKklncIS/JMGqb4k8+dmUzdxEqt0pVagPLvpj
	fIFAZWFvXjcFpebc4m4tAXawF6p79d1rXI3cERKgLrxM0AR88f6T8sqHwK7/9OY36jeY
	AgsR97LqjJp2asCYasIK555OVqvvzTjjySf0t5SUywcN1am8MJxQ1rh6lf35KF9K6UxA
	6D0cQxWgsZqI/xOm4wKZcWdSzP4IOX3RrojWIZT/ODsQVjSiXw48d1/26vQJzcRl+oo3
	kMSXkFV8SQ6tdhC2vqXVvzgIJgVdDbNcOhY8oWPYALK/CypGHYxv1s7FR5NRFqbdm3L+
	SkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7DmUux9c9YF2mLaz9z6i9FuJ4ZkQD8/KUX1u5fX0g7Q=;
	b=hZS4qA512VjkofcTd3ZZAmid2OkxA8Yq+MbQuVZu23E2DdYXGdU1qPj/OKX+3jyBlV
	kmtBq7RVGFXADMDMVGTmhC3BtBMG9lf0/UECtg7dylNdaZpGhbnWMOMjPdsQmS81R8cq
	NZyheLNCpYb+3ot1RMwtPnH0IUS/iQoNdaE2lkHowUhlgKcjoS0GNSI3WT5OMu7dzGe3
	d4P8xrps7iPKcoHGV9NGl55AdPwTipr8ZOjBN/jtBovq2QK+OxBKbWaI/tM1Te9ZaYQu
	F6e1Lw+lQ0dfrhh9PedQpPx98ztWH4GxgFHPPYrekyTKVG4Trb4PcfpX5entm/Y8nREU
	MNwg==
X-Gm-Message-State: AHQUAuYf55wW6Z5C2BN08uzATfK+v5zQRu6JkyJ9CsjeutrvyPWv/zcr
	whG7cgq0zuCztRIRo7RtGiBYzhagdrw/MZXmkkbV5w==
X-Google-Smtp-Source: AHgI3IaYGm7dYSLBNxdzvqlSMjas06eEEJcAbkFh20C74qvTNGQ9NyPTFlWpZPJHrmrAfOPOsulUAJ8OdkOZke3CsQw=
X-Received: by 2002:a02:ac81:: with SMTP id x1mr3468989jan.31.1550178234256;
	Thu, 14 Feb 2019 13:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20190214191706.87864-1-ddedrick@lexmark.com>
In-Reply-To: <20190214191706.87864-1-ddedrick@lexmark.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2019 21:03:43 +0000
Message-ID: <CAJTo0LYqdpCricB39Yz0PAZn99wLkUGn0JZwtUAtySeHhr-=-Q@mail.gmail.com>
To: Dan Dedrick <dan.dedrick@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cve-check: allow filtering out patched issues
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
X-List-Received-Date: Thu, 14 Feb 2019 21:03:53 -0000
Content-Type: text/plain; charset="UTF-8"

The report explicitly lists would-be-vulnerable-but-patches issues and
marks them as such, so why can't you just ignore them in the report?

Ross

On Thu, 14 Feb 2019 at 19:18, Dan Dedrick <dan.dedrick@gmail.com> wrote:
>
> It can be useful to filter out patched issues since they are no longer
> vulnerable. This makes it easier to sift through what CVEs still might
> need to be fixed.
>
> Signed-off-by: Dan Dedrick <ddedrick@lexmark.com>
> ---
>  meta/classes/cve-check.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 743bc08a4f..a486d686ae 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -35,6 +35,7 @@ CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
>  CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
>  CVE_CHECK_COPY_FILES ??= "1"
>  CVE_CHECK_CREATE_MANIFEST ??= "1"
> +CVE_CHECK_EXCLUDE_PATCHED ??= "0"
>
>  # Whitelist for packages (PN)
>  CVE_CHECK_PN_WHITELIST = "\
> @@ -54,6 +55,8 @@ python do_cve_check () {
>      if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
>          patched_cves = get_patches_cves(d)
>          patched, unpatched = check_cves(d, patched_cves)
> +        if d.getVar("CVE_CHECK_EXCLUDE_PATCHED") == "1":
> +            patched = []
>          if patched or unpatched:
>              cve_data = get_cve_info(d, patched + unpatched)
>              cve_write_data(d, patched, unpatched, cve_data)
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

