Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 890EE6E668
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 19:35:34 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id p9so22428835vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 11:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CRMBOhEah6sY5rds1AXe6m3bU+HlA786707FxLiLyjI=;
	b=iq2YZ1NGj+7gi3JtEEf7TbMJ7thaHIKDLG/mxQCKGjXfhKByVoi28iqvdj+qdXsdMY
	HlrRfzPfgqZkmhm+E9TtfcD3JXB7PfUDi+R/JENkbT2jbLAS9RzaAjZ2Ip114p63MyS7
	qQGpdUGkM443pZ0uiW4v4EqCU2+b8JXfkF4+JXWdathnv47GTPryFALFypfwQQ95ybVA
	whWXPuz1KdGCOiFti2oYkdtKdBI1CBK0Y0fIWtqcnvlMHMV190JifjdBgF0so6EsxG//
	crpCQMAhO0wVKO+3Q0euq01ELhf3zSt3BedOlFDadL1j2S7imj49TGy8EaguMtsi8N56
	uHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CRMBOhEah6sY5rds1AXe6m3bU+HlA786707FxLiLyjI=;
	b=jUsfM7xgrzapC/6Qz7OW1WInRUzcC9WauY5XKPVYoGvlegLv+ngIxuCuHB19OdtMej
	5rArLssIxDVqRun+Pb3JfOY6XMgVbUUfNfyx67i62sYp+J8cC520War1399FMfN7axpj
	vPCgO2hGTZYUt5ToqzSAAHIRnC0QnRQcZ8AIQnpIJb64Xo1O7e9ziuwnE6HJzJopjWmL
	1GkYLpzJrxzvwISuLDvNePPcqFwnaaqvCtCF4Q6Ct3LnwCHzHYP+YWkmyXokSO75gxh5
	q9JZ2wWF77Pbm4C2OfOXd1CsAPZZD03miBPRz3lrvsNWlbxp6E+k/4CoPNKeCd5uhtzU
	16Ig==
X-Gm-Message-State: AKaTC02PKSlZamigT8X6DE9fW9cjbZuV4N9kRWRFEMO/TvFNceL4B8t6hKGTQ9kqAItLgiCtRCzUWbo7VnRIIQ==
X-Received: by 10.31.8.8 with SMTP id 8mr4684943vki.173.1479670535900; Sun, 20
	Nov 2016 11:35:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sun, 20 Nov 2016 11:35:05 -0800 (PST)
In-Reply-To: <1479643823-11675-2-git-send-email-herve.jourdain@neuf.fr>
References: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
	<1479643823-11675-2-git-send-email-herve.jourdain@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Nov 2016 11:35:05 -0800
Message-ID: <CAMKF1sq6KOibu2XqE4RDsP7_C-DkFBjp-7rBHmsFz--wjdcyMQ@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] arch-arm64.inc: include arch-armv7ve instead of arch-armv7a
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
X-List-Received-Date: Sun, 20 Nov 2016 19:35:36 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 20, 2016 at 4:10 AM, Herve Jourdain <herve.jourdain@neuf.fr> wrote:
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/conf/machine/include/arm/arch-arm64.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
> index 9440698..9eeffac 100644
> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> @@ -1,6 +1,6 @@
>  DEFAULTTUNE ?= "aarch64"
>
> -require conf/machine/include/arm/arch-armv7a.inc
> +require conf/machine/include/arm/arch-armv7ve.inc

This is ok. However a better commit message would be justified.
I have similar patch see

https://github.com/kraj/openembedded-core/commit/8ece89ac164062601d3418576d51434c69654e28

>
>  TUNEVALID[aarch64] = "Enable instructions for aarch64"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

