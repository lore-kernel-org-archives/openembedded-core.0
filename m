Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id CC09160125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 18:29:36 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so41016193wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Oct 2015 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cKXH8LIHf6Bmb3bkFwbl19QSc6/ABr65eUUYvv8tSV0=;
	b=hAjh3/SEkSIKEM/WsGEebhaxAz5N1s2G0tA9rWoQIvdjc+XWUUNzMGfeOPEQa5Y0Nq
	ah9hQhI2UC8P85m2qMHemDkApw/6nWOkVtWlOJyJ/MeYF0f1FmYWaG2AgIohd8uZMB1k
	RFjpUoLjPnSPMasgwbg1cpo6iXAFxREDjPCpxe4Pe5B7QjxJyRldwphK2MkIJl6I2rW+
	4bfE31RSyLd4Rk1RHG65wbqpDBFiLo3AIuTwz5/Dx5i1gsTYtLmkeQ3YS51+dNX0orNW
	W501x3uZ3wAmwnI25f5rxsqlniU8HA2p6o2gAgv6QRCL+wQJugmtvIwdOSHufAn9q5uB
	YnRQ==
MIME-Version: 1.0
X-Received: by 10.180.107.193 with SMTP id he1mr27400329wib.81.1444242576277; 
	Wed, 07 Oct 2015 11:29:36 -0700 (PDT)
Received: by 10.194.169.6 with HTTP; Wed, 7 Oct 2015 11:29:36 -0700 (PDT)
In-Reply-To: <1444233072-11071-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1444233072-11071-1-git-send-email-alejandro.franco@linux.intel.com>
Date: Wed, 7 Oct 2015 11:29:36 -0700
Message-ID: <CAJ86T=UaQKp1jmSiiLfk5frk+f81DO3R2ong=28HVJqwbz-B8w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] test-empty-image: rename from core-image-empty
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
X-List-Received-Date: Wed, 07 Oct 2015 18:29:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 7, 2015 at 8:51 AM, Alex Franco
<alejandro.franco@linux.intel.com> wrote:
> As the empty image isn't a "core" image, and it's meant for testing
>
> Additionally, don't set LICENSE as it is inherited from image
>
> [YOCTO #7664]
>
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> ---
>  meta-selftest/recipes-test/images/core-image-empty.bb | 7 -------
>  meta-selftest/recipes-test/images/test-empty-image.bb | 6 ++++++
>  2 files changed, 6 insertions(+), 7 deletions(-)
>  delete mode 100644 meta-selftest/recipes-test/images/core-image-empty.bb
>  create mode 100644 meta-selftest/recipes-test/images/test-empty-image.bb
>
> diff --git a/meta-selftest/recipes-test/images/core-image-empty.bb b/meta-selftest/recipes-test/images/core-image-empty.bb
> deleted file mode 100644
> index 550567c..0000000
> --- a/meta-selftest/recipes-test/images/core-image-empty.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -SUMMARY = "An empty image."
> -IMAGE_INSTALL = ""
> -IMAGE_LINGUAS = ""
> -PACKAGE_INSTALL = ""
> -LICENSE = "MIT"
> -
> -inherit image
> diff --git a/meta-selftest/recipes-test/images/test-empty-image.bb b/meta-selftest/recipes-test/images/test-empty-image.bb
> new file mode 100644
> index 0000000..88d8d61
> --- /dev/null
> +++ b/meta-selftest/recipes-test/images/test-empty-image.bb

Not test-image-empty.bb ?

> @@ -0,0 +1,6 @@
> +SUMMARY = "An empty image."
> +IMAGE_INSTALL = ""
> +IMAGE_LINGUAS = ""
> +PACKAGE_INSTALL = ""
> +
> +inherit image
> --
> 2.5.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

