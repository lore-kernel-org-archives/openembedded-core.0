Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 42B047FE44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:54:45 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id t204so10279082qke.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 12:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nHARIWU+fAeGEql2NneK9nlpC+6NQRLpJcNXpocacKY=;
	b=S4K2eGVDf/+Op8kxT8Uz9RpSUFAsTx1CzDyxjyNgnaXhG2uHdBPJCbuR+hKwStsVFW
	eEtvNSDNQ5RRP/LBNYiaAaqigADp2gfJnxhygfaWCvMAq7Js+wuR9FZWYctPoitwVWIe
	0sbHh5YdbBvSeXYw1meRRr+sJUmgeOBaECdnKDgqIXtsD7FmTWG8YmjFFsF78T1WkSVw
	BiyV+gyfRd+4u8nHfGoVxZA03NiCUGFmPBczfMQB7nM8ZKG5KFvir54UPaBiwFkkjb5W
	+Xrb48SESo0IWshbKMepWtz3vXaYzfp/P4GE2Es1UWJE9J8c6CGFH6ScAvraltUfVc06
	xNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nHARIWU+fAeGEql2NneK9nlpC+6NQRLpJcNXpocacKY=;
	b=QuAquH9/YjerNL/hBxsTORr36uMSLXDqFu2LRrcgvI0za+cRB1q2JihPk8h6PIl4cn
	Qu1VBVpU295yklRbEhLt8dhP0FWf4F0OMCHCBF3Ni8nbAx/M3L8HHQqs6sKI8t69v8UO
	YTx1GuCE96qD3LqQHH4fLK8uCsHKSvGA9OCspXjzuGZQ0zy2cA6d6aHrxV26nD1Z4yP5
	FkXhgafdNPfDlCpJ6alG7VlG1m7/JTX/MGg3Ae9QgLa4I+4gXrW1231vz/g2gi9WUPOy
	0tnjnazM6IXZ7efLbnzOR9zbqgFp/iC1ots4Px4mpDHdTgWJFolIyuwVpONyAGWQ8Kzy
	hX4w==
X-Gm-Message-State: APjAAAW4ebPQbwEmG1/e0B2SEdVE5gwV5CZJqW5AW4N2enyBxiWVT5WS
	6zYeCIqOBjkXgCoX1n9iTRq5Em8OhIvmLL2FmSQ=
X-Google-Smtp-Source: APXvYqzB702sEypUpO8d5mmoqpn8dHZsFvHgR4IXe+I9yFB1qKtwG7OVhT47cuc2dTB4xMMvSCGMFt502ft19mG2/JI=
X-Received: by 2002:a37:de05:: with SMTP id h5mr18894724qkj.474.1580158485885; 
	Mon, 27 Jan 2020 12:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
	<20200127141908.84922-7-alex.kanavin@gmail.com>
In-Reply-To: <20200127141908.84922-7-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 12:54:19 -0800
Message-ID: <CAMKF1sooYU9dr5nkmgoW0cPjd3L_QJYtQBUMOpJAABTJ=mqrzA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] core-image-sato-sdk-ptest: use 2G of RAM
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
X-List-Received-Date: Mon, 27 Jan 2020 20:54:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 6:20 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Particularly, 1G wasn't enough for lttng-tools ptests as
> half of that went to /tmp, and lttng-tools needs more.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> index 7490b773d2e..58c257c49fb 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> @@ -16,4 +16,5 @@ IMAGE_OVERHEAD_FACTOR = "1.0"
>  IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
>
>  # ptests need more memory than standard to avoid the OOM killer
> -QB_MEM = "-m 1024"
> +# also lttng-tools needs /tmp that has at least 1G
> +QB_MEM = "-m 2048"

perhaps we need to be cautious here and check if all qemu machines can
support 2G emulation.

> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

