Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id AB94A7F335
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 17:23:34 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id b11so14245266qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v3dQgXxPjwGtUuBqZG10OPSXv0xe8FyhnzKhqV9gB8k=;
	b=IAp1AXjub8T28KD6MBJHLueO5al5j4nTM8fiIL+UNAOOTtrD0prqSr8UijBLVJSrt3
	Y7Xqai+QrRQh532ny+aUlQYicHYS0aFSEBE6UG8yfI/zTu01SDW3ajqPKbAiFdEWXWYo
	2v0iRbi8w+JOsrYht7GywjLAKnCRJxKkppMMZOTsDq5CMCKj9NKnP8o6z4LQUSDWN1CJ
	sulLQLbQMLcfC9/kROHSDfrIQlYv7oIfQUN/LC2bjfcwjtAbcyvDT6tmsvrWUKwRkqvz
	IQR5jjoJnSaOht4VW1AiTksaROBCH9XeebvlOme2SNiYFnq6fIJPHJ8USmxKnYLLK/ME
	lRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v3dQgXxPjwGtUuBqZG10OPSXv0xe8FyhnzKhqV9gB8k=;
	b=lOs+qAdNo/t7H9qX5ZKLdIEklh3fO0Tjiumcx0tZBo45w4frXn2wPUwKPTG1GOEgtD
	bnS++vhBs2XztTBlotChrHbwjoO0BYU7JQgzm380WcxUgp1jEriEc2rqVzfabMLTR6EJ
	ibvpZB6cWZ/wssyUFEJJ2AsuINI03eaubm+Uav3EWFzJr5GMtzKFWjJgOIDSf15ubzmk
	I2Op7l732X0Sb9JwT8U1f1w5SAvgpz0Whepgoih9aRPQMWZQ0sFMH2soDg7LPMp+E1FM
	jUncV9tRwIWfmDqXJv8F+B1+3ZauaGTYgpfxOV70/5M9Zm/K0eeBOu2DZGNKRqkawM0M
	ROrQ==
X-Gm-Message-State: APjAAAWwZNk+IaCJQom/UwzAkZHE397B6X6JHs8KG7XvPLTPBl8lcOKi
	WaxoVVOkPM/LoJxA2F6hjwv9qhHQ819Fk7ydXH4t01fd
X-Google-Smtp-Source: APXvYqz2DkcpoYbLpO1jsEJpHaVpx/0vPvWQwunM8uxoQBc/gMLmhgrTMv7rSPBThQ0jpXVreQ+MQZubVTWzcdB2gUc=
X-Received: by 2002:ac8:d4c:: with SMTP id r12mr10232900qti.88.1566667415399; 
	Sat, 24 Aug 2019 10:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190823203823.4373-1-changhyeok.bae@gmail.com>
In-Reply-To: <20190823203823.4373-1-changhyeok.bae@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 10:23:09 -0700
Message-ID: <CAMKF1spODthDdJisbg4OYCqBNXDa+kTEu1S9yHas5uSvdfWGww@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iw: upgrade to 5.3
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
X-List-Received-Date: Sat, 24 Aug 2019 17:23:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 23, 2019 at 1:38 PM Changhyeok Bae <changhyeok.bae@gmail.com> wrote:
>
> Separated build dir doesn't work because Makefile points out source dir.
>

this would be a regression in Makefile, maybe it should be fixed there and
also sent upstream as well

> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  meta/recipes-connectivity/iw/{iw_5.0.1.bb => iw_5.3.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-connectivity/iw/{iw_5.0.1.bb => iw_5.3.bb} (83%)
>
> diff --git a/meta/recipes-connectivity/iw/iw_5.0.1.bb b/meta/recipes-connectivity/iw/iw_5.3.bb
> similarity index 83%
> rename from meta/recipes-connectivity/iw/iw_5.0.1.bb
> rename to meta/recipes-connectivity/iw/iw_5.3.bb
> index 87b21e668d..f7f13f5a30 100644
> --- a/meta/recipes-connectivity/iw/iw_5.0.1.bb
> +++ b/meta/recipes-connectivity/iw/iw_5.3.bb
> @@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
>             file://separate-objdir.patch \
>  "
>
> -SRC_URI[md5sum] = "a0a17ab1b20132c716bba9a4f9974ba6"
> -SRC_URI[sha256sum] = "36fc7592dde7bec934df83cd53ef1f2c08ceec5cd58d07eb8f71cc6e8464013c"
> +SRC_URI[md5sum] = "6d4d1c0ee34f3a7bda0e6aafcd7aaf31"
> +SRC_URI[sha256sum] = "175abbfce86348c0b70e778c13a94c0bfc9abc7a506d2bd608261583aeedf64a"
>
>  inherit pkgconfig
>
> @@ -26,7 +26,6 @@ EXTRA_OEMAKE = "\
>      'SBINDIR=${sbindir}' \
>      'MANDIR=${mandir}' \
>  "
> -B = "${WORKDIR}/build"
>
>  do_install() {
>      oe_runmake 'DESTDIR=${D}' install
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

