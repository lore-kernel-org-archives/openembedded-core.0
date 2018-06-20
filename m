Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5907552B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 17:20:18 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id f30-v6so198784uab.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t+wJUumeaGFtPUjP6NSpQhkdqdCeIH9REOVgKuVQzO8=;
	b=BvUad+qHjMlP4b/g7HSoaUaiVcATfZnhrgbJqSg452Pg9sJ8Qwu9mqMeySk7B4l4Y2
	knqBYejn4qNJ3KOOFYUX8Yz51lYse9HN0KqNHEgcuLU6EI//+jJhzHDnn1HsVrn0tXAa
	6WnywBcJBI66u8LMlDCkq4pTrfEaYKE1RvmywDX+OX5TIC4vbH/sQoezDSkVcR6uVbom
	9nFvVCu4KAFU+8XMg/dXhHlmRt/YLip1BNTcDLW4MZbk22goXTp2iBhN7LbF/eFvX2A6
	msHPrKkI4xXvdOUuhMF0W2spccue8iM7x9OBB8nxGaM9eKF+CHsI+QlvId5Ttbv5SktC
	LzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t+wJUumeaGFtPUjP6NSpQhkdqdCeIH9REOVgKuVQzO8=;
	b=jINSd5VdPWLC9D4MbZdTn65VpFU0eba7RO0EPeGf6vVyTl/L1RkdovRHSkJMd2PZoV
	0ILiLgDCQdT8gsTDr1g7odLK0iEml5THe4N4sJz3Zct2J15UPyzPzk3iEqFsTp/NNtuX
	qeNP5Fe07ZtQc7PZoOoJ0rGPdtnZXlwF7Zfw64BZ+eEE6u3GP30wbi5XKA7hs0C4PNr7
	QYREl33GDgbSAzSGYNTxZOUjWmjJSEvfkOfvL1R5Co2l0D1JD0bMv+YwLMm4TrASw7LA
	qNYO4hqced+Y5aBy4eiTPIhGY9LQiPsc6JyfoH9SycMEupiIbZ4Tp8aFl1mQnmY0T9K0
	vWig==
X-Gm-Message-State: APt69E1VZIGyNFjvagkNyFyE3skN3GzP8Qcu2huja5A8d3qQT+dwXyCL
	bvEJcrM40F7LaCU1cRzRpCK+vfs7l4WGaJReTmE=
X-Google-Smtp-Source: ADUXVKJhyzIZdnpqPrden9m3JQxnid7Sda1qRfbR6YrLtRW+aGi/AxRYnKs1acTciV5maWo53NHBDeHBhv6HUcbtMBs=
X-Received: by 2002:ab0:5851:: with SMTP id
	p17-v6mr13850299uac.164.1529515218999; 
	Wed, 20 Jun 2018 10:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
	<1529503642-7158-2-git-send-email-maxin.john@intel.com>
In-Reply-To: <1529503642-7158-2-git-send-email-maxin.john@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jun 2018 10:19:52 -0700
Message-ID: <CAMKF1so5xW1KMmTgXB2exwqEAdGjJxc-F_JRrt76SsCx97uRaQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] piglit: upgrade to latest revision
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
X-List-Received-Date: Wed, 20 Jun 2018 17:20:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 20, 2018 at 7:07 AM Maxin B. John <maxin.john@intel.com> wrote:
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> index b936ad8..1a3e888 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -9,7 +9,7 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
>  UPSTREAM_CHECK_COMMITS = "1"
>
>  # From 2018-02-26
> -SRCREV = "4ce0887e2f7f848d2be2e435a2d0f3c80e44ea3b"
> +SRCREV = "3aa8c1cfe1a9ddae40c60d9dc76fe8dce47b15cc"

Can you update the comment about the date as well

>  # (when PV goes above 1.0 remove the trailing r)
>  PV = "1.0+gitr${SRCPV}"
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

