Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7431B60269
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 08:07:53 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id y207-v6so5942054oie.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cjz7FQxEblw3S9mEr1wxudObG9s4hTXVpUimk1JLpBQ=;
	b=AWUfc/iUDs/uP0GPg20mcXWGK+hZAM1Mj3XDSDUj4ZfwcZXaKUSZ4YmRf3boE2pzO7
	YMOaMEQsKWAQwPNHvsc2M82ZUiWpHksS5ATi6XMTvFQpHD3GKShuaqYmK5Z0PBQgE16a
	MQOWLFzxOpt2Jm6FP9QaUg+skQ8JIsFQRMbN3iVTRwPqLB+n4LpgLWuF+QpAUEgV+ILl
	yLTVZA8Yt6S/cif6IK8HBfDtPomkRIZlYexA97mLuiLBF08hsPF5HoWgczX6VF2cAx1m
	20g6mcmBEZpHbaOjoSYRz8ECkKv7ZtXnEjk4QSwW66Afk7hoqfbTRcGIqRorjNed4wzC
	5JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cjz7FQxEblw3S9mEr1wxudObG9s4hTXVpUimk1JLpBQ=;
	b=mF465afO1voJ6pvtWhreROLyYV1XOnafR1dRzxCJB9aw1zvIzd5pTpZJ31/RCKCTPm
	ARayahx3jkiyxPb7rQzA3NKhFlxwhQHsvTkCIdfZQRbrJSyz/gPXdtO5jwQEeMTYpBVf
	uLbGhemHNZPGCtC9yuyswztR1UTpbk8t3HCyGUm1dhHvV+xgY7F9sw5XiHVJ3X/GRM0a
	8QC4TeerYxrkW/luLdOZaNLxCWbji1z4jTfdY99YxziF/lDvbj51pjVEb4UxTHKFega/
	rtiKniXcRNa1nF9SgEGxQ72cy2PM98VRjPsnr5LWswGkmrZjLXpWrQaYH2nHO7lrwi+z
	PbOw==
X-Gm-Message-State: AOUpUlENjMXqgaA0cl02TaIP2DdfNe8ydCOm99bf9iD4rDECp8xrpG8V
	u/ajBVD9SbW64zTdzk0cn9EoobPhDvxaEhuZV2g13ebs
X-Google-Smtp-Source: AAOMgpcmmTzaobne9xb/Zku8Nlxl8SuF6BKPIaMoiRDyBjOAfmBxlhmAwuXqsSkqhGnUoZsHXeUxYQ5Dwq3ov+xcQtc=
X-Received: by 2002:aca:5f56:: with SMTP id
	t83-v6mr2261112oib.115.1532419674446; 
	Tue, 24 Jul 2018 01:07:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 24 Jul 2018 01:07:33
	-0700 (PDT)
In-Reply-To: <1532418493-21449-1-git-send-email-ovidiu.panait@windriver.com>
References: <1532418493-21449-1-git-send-email-ovidiu.panait@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Jul 2018 09:07:33 +0100
Message-ID: <CAJTo0LaFai2biC-973Da-o7NMFwYkMWRTa4F5O+prseWFNwW4A@mail.gmail.com>
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsof: Update SRC_URI
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
X-List-Received-Date: Tue, 24 Jul 2018 08:07:53 -0000
Content-Type: text/plain; charset="UTF-8"

Well for master if there's a new version then a better fix would be to
upgrade, but we do need to make sure the previous releases are using
mirrors.

On 24 July 2018 at 08:48, Ovidiu Panait <ovidiu.panait@windriver.com> wrote:
> lsof 4.89 archive has been moved to OLD directory and turned into tar.gz,
> so update SRC_URI and checksums.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/recipes-extended/lsof/lsof_4.89.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
> index 14546db23c..b58b8281f9 100644
> --- a/meta/recipes-extended/lsof/lsof_4.89.bb
> +++ b/meta/recipes-extended/lsof/lsof_4.89.bb
> @@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
>  # https://people.freebsd.org/~abe/ ). http://www.mirrorservice.org seems to be
>  # the most commonly used alternative.
>
> -SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
> +SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/lsof_${PV}.tar.gz \
>             file://lsof-remove-host-information.patch \
>            "
>
> -SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
> -SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
> +SRC_URI[md5sum] = "8afbaff3ee308edc130bdc5df0801c8f"
> +SRC_URI[sha256sum] = "5d08da7ebe049c9d9a6472d6afb81aa5af54c4733a3f8822cbc22b57867633c9"
>
>  LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

