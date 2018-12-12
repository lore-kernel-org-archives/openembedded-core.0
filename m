Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 220E26BF3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 10:36:55 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id i145so8302568ita.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 02:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ARnA+Qy3YOCswKQDwLkUr2qmjPKT7kZ9FOm9Ar2/Yb0=;
	b=vC0PFlZ0vBBwYjG2oD+U09VI6uiB1GZLEyvT5IGc5tv5l6OZDsiM8qnzIRPo0Zkr7c
	MgaD8lxKH7P5ohssb+DORoaLzrlLkJCUEa2xlkVY+Ror1710i08rK9wRZ/kkgiw2Ss2i
	FlLWm5f8Wkg+OTLCtdOWMQEBiHHOXgDc0PsKXFERfx54Hi9fojV9UneUmFKXONzUZJcj
	HId33D1Wo2vrvP8l7fiGay62ydWTJvLwIk0/KtbGSm3vT82pzAlZpTOuH0GI43FPo641
	zZ8MoZE6526f908cWXp3pb16rQWzDib3UjVeCYEPDjaCNd6NuDLjbqSekbbWPZUFtPAV
	qiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ARnA+Qy3YOCswKQDwLkUr2qmjPKT7kZ9FOm9Ar2/Yb0=;
	b=ZYOihUDcLeq/e1S8eYm9gR3GIQd81/ubk2mHWmJsY5POSsmYMdeVTlMiqS0qoSxxcx
	ybtEvY8Q3Jy1CX+bpRjs/pAm0myClzJSb12pIlQjg4WK0antUhZEN3iABe5XYddzfzLa
	6NhfMzjuStdUWw0xmgLUbrrRKAO0WQrPl2X2NVVuGu0tU28P9lqXKl/xCy9SXztLodJU
	QFDhfFcS+LEyi7mJ0h7jNnXRjm87zwf0wLBruhxlkG58OykIn1Y6FI1GCsmJBzS9uTl4
	m3jXitTxfHoRg2mzsiWgAPkCnwi2Z1z6yJDPN3NI+dl5fPWoI9v1VZrAi+k3s9C/BUSe
	3OxQ==
X-Gm-Message-State: AA+aEWYnXcfc6n3RypH5iOKZtC+dZ1iKF0Po5wafEGNdvuDL14bqUDD3
	UQYTGEjf21PJrOwqjxtHx13b9WGHGQ0i/U5lVyfaAA==
X-Google-Smtp-Source: AFSGD/UpAyXtMkAt/NWcb8vGYf/75YIU+L37FQ36nD2h9+PtwPzv0L7qZJZDEq/C9nMiV1G1XEMWv4QhOD7+DB85z28=
X-Received: by 2002:a24:c601:: with SMTP id j1mr5817019itg.130.1544611015854; 
	Wed, 12 Dec 2018 02:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20181212003909.31594-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20181212003909.31594-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Dec 2018 10:36:44 +0000
Message-ID: <CAJTo0LZrmu1tQBVTMPoaNc-v76qyLndngkRsLZkbU+rO5oNt8g@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] python-setuptools:upgrade to 40.6.2
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
X-List-Received-Date: Wed, 12 Dec 2018 10:36:55 -0000
Content-Type: text/plain; charset="UTF-8"

Upgrade python3-setuptools too as this breaks that recipe.

Ross
On Wed, 12 Dec 2018 at 00:39, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade python-setuptools from 40.0.0 to 40.6.2
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc            | 4 ++--
>  ...ython-setuptools_40.0.0.bb => python-setuptools_40.6.2.bb} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-setuptools_40.0.0.bb => python-setuptools_40.6.2.bb} (100%)
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
> index 315ba31396..fc89eefffd 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -10,8 +10,8 @@ inherit pypi
>
>  SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
>
> -SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
> -SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
> +SRC_URI[md5sum] = "1c45c7d66dc84ae4ee36581dc9e5359b"
> +SRC_URI[sha256sum] = "86bb4d8e1b0fabad1f4642b64c335b673e53e7a381de03c9a89fe678152c4c64"
>
>  DEPENDS += "${PYTHON_PN}"
>
> diff --git a/meta/recipes-devtools/python/python-setuptools_40.0.0.bb b/meta/recipes-devtools/python/python-setuptools_40.6.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-setuptools_40.0.0.bb
> rename to meta/recipes-devtools/python/python-setuptools_40.6.2.bb
> --
> 2.17.2
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

