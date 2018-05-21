Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7570D74DE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 13:48:48 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a20-v6so7132516pfo.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 06:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a9raFdh4aTefSzZL1QOOofNCIbsCsNe4ohM6vi/SNLM=;
	b=mKQVO/gNqc7T+/0FXHZCgMX8JuNQOo7Lb9865vc4IwlH85Fh0MSn4pIyJUuovEXNl8
	nJgZpWYIzf9Yd7b00edgs72sPjpRAF8SQCRFGa+HYGx9OuwWHTUPR+2dkfKySz3njORH
	2AThUOknVy4j6LkoFRiTZIYIU190NW/t2lngH4+Fom7e/qCJSfMbDiuyQIsLQTBTggia
	wHQR3JufLQ1br7EyWnAJiXSp7bLHgsBy6FzZ39A60lHeQAivUpGoRb9NkbfuGOC7grT8
	9hVVFIINwUH3ZiqcshjxxXQk/Uq5nLty93GIzleIrqb6VfY5MiNaD+redGvgUH/7bYEx
	2Veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a9raFdh4aTefSzZL1QOOofNCIbsCsNe4ohM6vi/SNLM=;
	b=fTemkJykOG8ltikNch3NefmC2iojR/u5CEYZPZO4phI+EYUjEtQvanBvu0fL4qtKCb
	UZy0G9FMeLptdiE5bQVtdu+Dn+IDYwUwJ2I5TGuFXYi+tO+nHEAwqhUqrr2anwW+yqld
	AcOr0oFHX9N5Kn23EYtOX7z8WQPAFIWiNszoRp7v4DHLBDRVXg2ogg3jLzluV0oQT6CM
	9cB20d/fjbckyMop3gGYX0T2PHI5CjnerhWpnRb9Y3iCWuMch+0qVUm+tLsL38UxiLgc
	W4p5uSNRBaNlmu2Q5RWYpj90JFFCUi+2ORU+HAzTe2aJ5ZJBmGDJ4oHFcY1ZLVvFtX2i
	aruQ==
X-Gm-Message-State: ALKqPwcqZ72iU9kHEasw/oFWNWyo52N+/ZSuYaF3NVurfdyYlksVmLsr
	xmyo7jE9jBJXNUr0ml3WJGV8wt0h6ye4G5r6Lig=
X-Google-Smtp-Source: AB8JxZo1xip6qxXnaOls2fmFlbvK3dZH5Qj6DtgbGqQuw64OeZURqBSb8VdQWnNfiF0NbKW75G+zYRlDOntdSR2+rBE=
X-Received: by 2002:a65:4a46:: with SMTP id
	a6-v6mr16031753pgu.227.1526910529335; 
	Mon, 21 May 2018 06:48:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Mon, 21 May 2018 06:48:18
	-0700 (PDT)
In-Reply-To: <20180521085306.112262-1-jibin.xu@windriver.com>
References: <20180521085306.112262-1-jibin.xu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 May 2018 06:48:18 -0700
Message-ID: <CAMKF1spA_JPf1Zro9Cfk42D4oGATawRzB4vLs=9_cT2cdErYhA@mail.gmail.com>
To: Jibin Xu <jibin.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: upgrade 1.19.4 -> 1.19.5
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
X-List-Received-Date: Mon, 21 May 2018 13:48:48 -0000
Content-Type: text/plain; charset="UTF-8"

this has security fixes i wonder if this should be backported to sumo

On Mon, May 21, 2018 at 1:53 AM, Jibin Xu <jibin.xu@windriver.com> wrote:
> Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
> ---
>  meta/recipes-extended/wget/{wget_1.19.4.bb => wget_1.19.5.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/wget/{wget_1.19.4.bb => wget_1.19.5.bb} (60%)
>
> diff --git a/meta/recipes-extended/wget/wget_1.19.4.bb b/meta/recipes-extended/wget/wget_1.19.5.bb
> similarity index 60%
> rename from meta/recipes-extended/wget/wget_1.19.4.bb
> rename to meta/recipes-extended/wget/wget_1.19.5.bb
> index fb7cce5a20..e37d8c7847 100644
> --- a/meta/recipes-extended/wget/wget_1.19.4.bb
> +++ b/meta/recipes-extended/wget/wget_1.19.5.bb
> @@ -3,7 +3,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
>             file://0002-improve-reproducibility.patch \
>            "
>
> -SRC_URI[md5sum] = "a2a2c1dc4ac5003fc25a8e60b4a9464e"
> -SRC_URI[sha256sum] = "93fb96b0f48a20ff5be0d9d9d3c4a986b469cb853131f9d5fe4cc9cecbc8b5b5"
> +SRC_URI[md5sum] = "2db6f03d655041f82eb64b8c8a1fa7da"
> +SRC_URI[sha256sum] = "b39212abe1a73f2b28f4c6cb223c738559caac91d6e416a6d91d4b9d55c9faee"
>
>  require wget.inc
> --
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

