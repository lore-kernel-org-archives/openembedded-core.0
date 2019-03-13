Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 44CE66BE2A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 21:55:14 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k21so3101681ior.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 14:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IbNrZr0q2bW+BwsdUQD9xEmd3Pd3Uf/roN4ZFLGLOYY=;
	b=b/+2j6rnmuewgr7XeV8BzBD6oIYsBgoDjmv7CaAhqf7nnDpvs6Vi4ECav0rZQA3suS
	u7oVmQoiUDQjhQI18TmS4AL2YEQdIUW32pgoFPsnKD4+GFSxXt7s+Ki0anZ6ZW3VfaNp
	xXf3J0RTZ/TJhbrwak7yJIlr4+TovkguaUgO39InkbLNLEXLDOf5r00BrLZ0pHaMcsfd
	f61HamyA88P8AsTEPsNkuwoPqwnQO+oCkCHILAqqQVypZp01UTTusmJHVYmmjGZgOmgt
	WnrjRI2efiws3jkqKCDb9CRlE/eTAlqM4BaWewwtN61wEHJLBIGLZZOE8XXqHuKuYjmS
	4Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IbNrZr0q2bW+BwsdUQD9xEmd3Pd3Uf/roN4ZFLGLOYY=;
	b=khxHXYERLbIlOmN6XQURCGpxPHt82aC4WW/q25vZidqSeP1V8piOnkb0Ho/DubBP7P
	2Mq4w0/dwlN5xQ1ndaMySYVRf2CZplYTRQwnhiweJjMw6OHt8DHTuOC5YYD+Plp04Lty
	JwjfOhlccqku7Mdrxq5oPv6SVybocwgG8Nm13LmW5yeWXjH3y3Dr90ICtBsISGTZAGRF
	q92TkCk+b9tovzoHdPrsSFUuckmKukDcuUVAEQtGfdumHzKMNNRCzeaTgbiES/13akID
	nm490QNnmNIQmjuvVpOeI9/UDuhEvIvDiDzcKpokGGeSoWqcrDrP119qBv5aygpt4MQd
	x+Uw==
X-Gm-Message-State: APjAAAW3BEJksOo4oq4M+YK6ZzN7LJ+5tbtPue1oRYUA1yH/R37uHf+m
	8Rezr1LmK/Opv5r5Zye8s/CWMh2/MlHa1e8JUknX1tI9
X-Google-Smtp-Source: APXvYqxfnIRHGYYb+V/xArH6dd4lwX+odvuN1Bp6ipoD7AxzG3Iqru5y+JQiNLkyOIurp1K5z29ePuRXkhkWyZeEmdg=
X-Received: by 2002:a6b:ee1a:: with SMTP id i26mr9780104ioh.201.1552514115039; 
	Wed, 13 Mar 2019 14:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
In-Reply-To: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Mar 2019 21:55:04 +0000
Message-ID: <CAJTo0La7dXYLasfbUwSn3R1tFUXaJn=qTsF0anPstGfsR_=WfA@mail.gmail.com>
To: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Sumo][PATCH 1/3] lttng-ust: update to 2.10.3
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
X-List-Received-Date: Wed, 13 Mar 2019 21:55:14 -0000
Content-Type: text/plain; charset="UTF-8"

You need a *very* good reason to upgrade in stable releases, so please
explain the rationale.

Ross

On Wed, 13 Mar 2019 at 20:54, Jonathan Rajotte
<jonathan.rajotte-julien@efficios.com> wrote:
>
> Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> ---
>  .../lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb} (90%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> similarity index 90%
> rename from meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> rename to meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> index d79a47931c..b5c43200d6 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> @@ -23,8 +23,8 @@ PE = "2"
>  SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
>             file://lttng-ust-doc-examples-disable.patch \
>            "
> -SRC_URI[md5sum] = "4863cc2f9f0a070b42438bb646bbba06"
> -SRC_URI[sha256sum] = "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e4662712aef2d635b88ee9d"
> +SRC_URI[md5sum] = "ffcfa8c1ba9a52f002d240e936e9afa2"
> +SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b40852b"
>
>  CVE_PRODUCT = "ust"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

