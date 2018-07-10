Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3914C75562
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:46:40 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id i12-v6so41427126oik.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t/CJ+tnMxLOTx7nIhmypSaUCHzTb16ScluuUyjUTRG8=;
	b=TiLHX4ZDq2PJJ+gieI2dZebKmhNaPygIisz7JVBfixGo3L70Wyiy1Ijd9ERiedF1O2
	P0oib8KDpXWy6oH0HFYh9UTPU1TlU0OZid5qVhCnvZyDkgltK8xEFEJB0562gLj7RuoE
	ictI/jQpShsZKtpV/oN7cRVcMXCFPDZdyu6lPCMy2oc7FYrI3cRyYmuhBEIAQE6q6pFX
	CFFSSnjbyTSoR4vOCBFlkDWA9HwP7jw65Kq+3GTkx/RTQ19tycD3v1+aiFBbhMCCv+xx
	rwhYk7lt1cFA+JWowLunD6Z5xnYoGKuEkkWg2mHpMVE52ZZuj/0BcG59X5/EN/4h3G3l
	YBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t/CJ+tnMxLOTx7nIhmypSaUCHzTb16ScluuUyjUTRG8=;
	b=CCNYZmX6HoNRMzGnugFFH8WzH6Rhw3jTafPwKFVhf4br/EzQwSYGETbsebih6kNhEk
	9wKLeMz+WARlplYnFXgTOCvowlUw0gLlB3FeAfJFvpQBx7CAl1eX/Ojh9cPfN+2Yi0xW
	d/AaYUdOdwOOxtXUfbhyD1wYlRAOp3SX6gSLL69IKKuDYGv/XrvpkytzLIVi90OJx7+Q
	nC9Fz8wgTv313QWjLdRpSn1KQmtZvu5/ftSfTKrbILcHURdj/5UWKh54GtCMAQ1li7Qe
	0K8FvPMoruc7XPKNwZS6if8KQ3uv1nqQAsme1Zk0HfaREBOgn3GZ9zR30aqwHC8isDPp
	V3Sw==
X-Gm-Message-State: APt69E21Zq926/xE2UKgZlNMGeS9I/KtbyNk67l3qJjfDub9kEb2J3X1
	25V4WmM1aS1QDuFBW/L8I+12lOb8OymT6Q+x0OGGTQ==
X-Google-Smtp-Source: AAOMgpd4IZXAcDTOOKwuRr8jgFkmSffEaAy+N3piPeC8Oy83582uTRlsvhVRCZ7q0KwilMOxd8F4fvlIIxhaOY38+0k=
X-Received: by 2002:aca:2808:: with SMTP id
	8-v6mr28008804oix.235.1531216001316; 
	Tue, 10 Jul 2018 02:46:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 02:46:20
	-0700 (PDT)
In-Reply-To: <20180710024207.6296-5-hongl.fnst@cn.fujitsu.com>
References: <20180710024207.6296-1-hongl.fnst@cn.fujitsu.com>
	<20180710024207.6296-5-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2018 10:46:20 +0100
Message-ID: <CAJTo0LYA1p21cRh8uS2DcM0a+uGvRd1_RxQQdaH+Q+j35Bm7Jw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] nss:3.37.1 -> 3.37.3
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
X-List-Received-Date: Tue, 10 Jul 2018 09:46:40 -0000
Content-Type: text/plain; charset="UTF-8"

master is at 3.38 now.

Ross

On 10 July 2018 at 03:42, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade nss from 3.37.1 to 3.37.3
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-support/nss/{nss_3.37.1.bb => nss_3.37.3.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/nss/{nss_3.37.1.bb => nss_3.37.3.bb} (97%)
>
> diff --git a/meta/recipes-support/nss/nss_3.37.1.bb b/meta/recipes-support/nss/nss_3.37.3.bb
> similarity index 97%
> rename from meta/recipes-support/nss/nss_3.37.1.bb
> rename to meta/recipes-support/nss/nss_3.37.3.bb
> index 0e8b5be..a053659 100644
> --- a/meta/recipes-support/nss/nss_3.37.1.bb
> +++ b/meta/recipes-support/nss/nss_3.37.3.bb
> @@ -25,11 +25,10 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>             file://nss-fix-nsinstall-build.patch \
>             file://disable-Wvarargs-with-clang.patch \
>             file://pqg.c-ULL_addend.patch \
> -           file://0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch \
>             "
>
> -SRC_URI[md5sum] = "e9526d7217d02afa96b90b89924c38df"
> -SRC_URI[sha256sum] = "097b30e436479ad737b3703b25b6198b6513e202731085c6f097d8853dd20405"
> +SRC_URI[md5sum] = "22e8ce40f80ce1e7d9d92ebd07124840"
> +SRC_URI[sha256sum] = "9af2bbb615d010bd866bb83f8c0bb22b0fa086171e93030ffb03da3da15cc5be"
>
>  UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
>  UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

