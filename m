Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 89559748AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 07:49:48 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id m129-v6so30752351wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rSM2K8WSeFdCaJy8TeP2u5p4noYYx5W9hFecGJKjD6M=;
	b=BienceN0tbIwkVRx8HLuLsn+LoBIeSs4Hf6+7wajSpZYStwznpxT+dVuFY9d/y+q3Y
	bsMkPpXbY2slosm/aBbJ0jXuujnnK7dSVYB8SxXaXJZR14ME5rVtjWnQTy/4ac4inbm5
	gC4B9/wxdfm8+7F8YE6/mB/ia7p18kgPTRKbdp0ONzl81pMoNJeWmKuhC8VN2YWjm5aT
	IIxaC7NVaQr1UMdbIbCjiGbjbklBvf2+bRNVBJnCwpM9VdGfNoJAHMU+R19d70RiDr6/
	MjAR/N1LM6/ZjayNSxZQQqrVB3uI6wDEr7xPiDFheVqOo7XL1shk0v+IiffnbTgHGSXX
	R91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rSM2K8WSeFdCaJy8TeP2u5p4noYYx5W9hFecGJKjD6M=;
	b=b6wGNvHVYupkNjlhW0BBXseMR6OtcqKg7QSooO6g0O3PAkIRJJRcKjyoosnkk3uP8Y
	AfVMojUgtvabF38+6i+VI9wVaOKLy8NUBbU0aDZSS99lWjt5d4/ZIcNwIrytqkMXPTsb
	4KAv793jjq1UzdQxQ2EP5CJxyC/FnFc2M9A7ptK1akfeuQrcmCVyQ2f5bEtTGYK+fgn2
	fQnJq8PA60zg50tA0TfSPDJGxBxRU811ih1VP8CAK6bHFnvMQACLX9ON3f3/SSRtoAMo
	w+ryMIqWvLZhq9nkinuWSnEtsBL/SB9Q5a7quFwBNjlKmwqn+2fP/tgWOeh35uqjDkuW
	rGjQ==
X-Gm-Message-State: ALKqPwe07JVNp6Uq58P2vt3SCJrHWDlcrss3yATEyNCbzuRH14/6vclz
	5QSBBHcwThGgfYSybcGlriS3fCl+9y+ye8217Yw=
X-Google-Smtp-Source: AB8JxZp4ZIeu3r5LHW+MlMjqz9BOFGEkeKBpp8BrGHAu2Zk3oTsj5yxwOqkJhUrkq0jdTCwTMUAwKddn9XqEfKjoJf4=
X-Received: by 2002:a50:e681:: with SMTP id z1-v6mr752232edm.275.1526975388973;
	Tue, 22 May 2018 00:49:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.72 with HTTP; Tue, 22 May 2018 00:49:48 -0700 (PDT)
In-Reply-To: <b3a976f9a497296a3cecd524931f1e8ea048489f.1526944475.git.denys@ti.com>
References: <cover.1526944475.git.denys@ti.com>
	<b3a976f9a497296a3cecd524931f1e8ea048489f.1526944475.git.denys@ti.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 22 May 2018 09:49:48 +0200
Message-ID: <CAAQYJAvkUet1eLhbLaAFd=QH=ReBc82CcKituaanwZpEXcZEiw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] mtd-utils: upgrade 2.0.1 -> 2.0.2
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
X-List-Received-Date: Tue, 22 May 2018 07:49:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 1:17 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index a0e1cf7..97a3e0c 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -10,9 +10,9 @@ inherit autotools pkgconfig update-alternatives
>  DEPENDS = "zlib lzo e2fsprogs util-linux"
>  RDEPENDS_mtd-utils-tests += "bash"
>
> -PV = "2.0.1+${SRCPV}"
> +PV = "2.0.2+${SRCPV}"
>
> -SRCREV = "9c6173559f95e939e66efb2ec3193d6f3618cf69"
> +SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
>  SRC_URI = "git://git.infradead.org/mtd-utils.git \
>             file://add-exclusion-to-mkfs-jffs2-git-2.patch \

Hi Denys,

I am just wondering about this patch:we carry it since 2009  [1] and
is still marked as pending.
Why was it necessary to ignore part of the filesystem? Can you remember?

Just curious...

Cheers
Andrea

[1] Denys Dmytriyenko 2009-03-17
http://cgit.openembedded.org/openembedded/log/recipes/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch


>  "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

