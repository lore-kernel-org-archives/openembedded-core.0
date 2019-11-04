Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 31B267F856
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 23:25:56 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id u22so26609950qtq.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 15:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hMmCO+y+Oq8FkuZOZswTb8WiBVrzjgc7vlIq/SNRCIQ=;
	b=lvp7pTgBookNN4aT4+tdrDzyh0S0NoQvKbsjOhWlKNiPOrQtVbUwxgm5SyY2Q5vOE8
	D8mvBNQUlBk6TTuEvIVptiNW2fpb4xyzDa0Bhp38OEJyLRdyqJc85eHNlcZwFdRPOGkN
	3RVexIhGIomjPHDU63Mmdjgpa/r+4ZoJlaY3uTtLFgg3sKOiUaD/Ma32WmiHNnxm/19A
	3Fuo9m2U1PTelrXEdujV8LgdjWK2DrzmvSBhPqWFKBLS9TuS+f9adPzaRJe4Y+7bly2B
	jrK5c0QicFo+sP/QUcn0fFtp8JfXpKdDoK0+I/DT5L7kFxEZyTjtL8rBOCl+cF6N7wgN
	FLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hMmCO+y+Oq8FkuZOZswTb8WiBVrzjgc7vlIq/SNRCIQ=;
	b=KvofBrDRn4XV+pGpjdxd1IYheHIcGgO2z/KKXpmf6VCI7BM2EOe8ERMtWIvDErLDJP
	WFaeN+thr3VQEbXh/55QIYKhmkCkSrFMOClQR7Eyp6IaCjOb/z6Bt0KpvY2eTw40mAIh
	UuI0mu1eP9R+ry3ywzW6aQIb93Lv8h8gIjCnnn7Dg0OyBvavHrJ4OLKeDv5luFyDxx7P
	rqcLvLghSI9fOecsxQWSlih28M+YmRjJ9ciV40YOwFR6bP1sD6oSWHyL82EZ5cbYPEye
	fqlz2zSF7w9Rad1sl5N8IA7f9p8Ylm/e8Hf0s8z2qwSc6iigYRKHXKnIA7kEF/sReh48
	SpXw==
X-Gm-Message-State: APjAAAXF+EC1Z+8Ds9wck6ZAFV4E6LA3aMZ35vVEhIGcXFegzvrYEsqV
	OEh3Jr8IIc21wVzKTU0f3V0VEWysLQh8JyRt2/y8Jgbg
X-Google-Smtp-Source: APXvYqwI/Uge7aAfD8dRpLdJYxhK2r2Ea/gZVlBc6pir5wi8jOgYDS73FpNDSrSVevwLNEEYstWQLi6qb5cMohd9n7o=
X-Received: by 2002:aed:2724:: with SMTP id n33mr14776413qtd.194.1572909956712;
	Mon, 04 Nov 2019 15:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20191031172303.31664-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20191031172303.31664-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Nov 2019 15:25:30 -0800
Message-ID: <CAMKF1sraV5pEF9UanBy3Rj7mQKs33Ke2Sr_+28ewDrgaJZ43TQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ell: update to 0.26
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
X-List-Received-Date: Mon, 04 Nov 2019 23:25:56 -0000
Content-Type: text/plain; charset="UTF-8"

This has API changes that will break iwd

On Thu, Oct 31, 2019 at 10:23 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Changelog:
> - Fix issue with memory leak and TLS certificates
> - Fix issue with buffer size and TLS PRF handling
> - Add support for D-Bus non-root ObjectManager
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-core/ell/{ell_0.25.bb => ell_0.26.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/ell/{ell_0.25.bb => ell_0.26.bb} (83%)
>
> diff --git a/meta/recipes-core/ell/ell_0.25.bb b/meta/recipes-core/ell/ell_0.26.bb
> similarity index 83%
> rename from meta/recipes-core/ell/ell_0.25.bb
> rename to meta/recipes-core/ell/ell_0.26.bb
> index f6201f9bf6..f1f252ce4f 100644
> --- a/meta/recipes-core/ell/ell_0.25.bb
> +++ b/meta/recipes-core/ell/ell_0.26.bb
> @@ -14,8 +14,8 @@ DEPENDS = "dbus"
>  inherit autotools pkgconfig
>
>  SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "8a8adc712718c770a72e4df6c9855c26"
> -SRC_URI[sha256sum] = "7f2be568219d991d566ca50c58a56e69df9a248619fed758dcd9a4b04e655e5b"
> +SRC_URI[md5sum] = "4660e25541071e933a2bb02ef2f94e7d"
> +SRC_URI[sha256sum] = "7855b4b8f271ba6ee67d87d0965b975a9a8dbeaa616665ca2248afa3b5fcbc77"
>
>  do_configure_prepend () {
>      mkdir -p ${S}/build-aux
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

