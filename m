Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B826F7FCDD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:57:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y5so11158323wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=B7s6IvcwfCJJDqIBjBq5RGGRnsVet/7csiYudM9efR8=;
	b=XJPMelegRenDM9qqyrjr5PpkVh4C3gnS9bG2toSVli9TxSIExane1MBmhtqS+/5J7s
	tSfPPas8g0vFC9gSg18Ap1w80oft1Bf9YxQOucO7q93kGJXRogh4YqkP0645pTG+8K3u
	eMgGDsOUZ4pImXocE+77Isbn8SCzZSQrONIJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=B7s6IvcwfCJJDqIBjBq5RGGRnsVet/7csiYudM9efR8=;
	b=t4kQXj6/ukfjZpgAfRApQIm+jbM25xj5lLrXU6WBQUbPGwImM1EvI4FLgGU5RO1GIc
	Oy+MT4B0pGXrHGZwXvSQVWozE79ybZbEjdRMNlRKJb0263um5Nyr/JM6TtX+8itDDssy
	oILSMV+zQlER+/LsYqkqjwH/CCu+Sz9KLa9NPxEr6xibXA5ZTV5+6PQA+IN8aJkVvKjU
	W09TjKxYBRY1Mv578c9FXuOkLNV/D3KYgYznuhCQjVvJVmsyIbxGi5UlcjRViENj6Nsn
	og1QDtZ1tJiF6HVUiBwayp+LfwCNLumPbUE3UCwzxM22KnKTGsblFBGZQ7OXA1i52APz
	HGZQ==
X-Gm-Message-State: APjAAAUVudMjvLRXKhlPcyDSzNYX/5f+E6wxzRu8KlU/Yb09WoEJRhsN
	0Nnth65HBdNZuHDOURuuIsZEUw==
X-Google-Smtp-Source: APXvYqxwDWIvJcZJC8xRw9uP/ke6IjR3T9/Lmcg8bBDuKz8w3+gIzyEJwl83g2/XoVVtpY9GpeqXwQ==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr22028091wma.140.1574528267229;
	Sat, 23 Nov 2019 08:57:47 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id g74sm2399074wme.5.2019.11.23.08.57.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 23 Nov 2019 08:57:46 -0800 (PST)
Message-ID: <450bcf43dc473f44df8ca375f56af5f9192dabc9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 16:57:45 +0000
In-Reply-To: <1574439782-29100-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1574439782-29100-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] cronie:upgrade 1.5.4 -> 1.5.5
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
X-List-Received-Date: Sat, 23 Nov 2019 16:57:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-22 at 08:22 -0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta/recipes-extended/cronie/{cronie_1.5.4.bb => cronie_1.5.5.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/cronie/{cronie_1.5.4.bb => cronie_1.5.5.bb} (94%)
> 
> diff --git a/meta/recipes-extended/cronie/cronie_1.5.4.bb b/meta/recipes-extended/cronie/cronie_1.5.5.bb
> similarity index 94%
> rename from meta/recipes-extended/cronie/cronie_1.5.4.bb
> rename to meta/recipes-extended/cronie/cronie_1.5.5.bb
> index d35c667..b327381 100644
> --- a/meta/recipes-extended/cronie/cronie_1.5.4.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.5.5.bb
> @@ -16,7 +16,7 @@ SECTION = "utils"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
>  
> -SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}-final/cronie-${PV}.tar.gz \
> +SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
>             file://crond.init \
>             file://crontab \
>             file://crond.service \
> @@ -25,8 +25,8 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
>  PAM_SRC_URI = "file://crond_pam_config.patch"
>  PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
>  
> -SRC_URI[md5sum] = "20233b96997e17a142e1fbe0d7ce8223"
> -SRC_URI[sha256sum] = "af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882"
> +SRC_URI[md5sum] = "351a37d0b5bd0144816724b4482747ad"
> +SRC_URI[sha256sum] = "be34c79505e5544323281854744b9955ff16b160ee569f9df7c0dddae5720eac"
>  
>  inherit autotools update-rc.d useradd systemd

Seems the feedback for v1 was ignored and sure enough it does fail on
musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1267

core2-32-poky-linux-musl/cronie/1.5.5-r0/recipe-sysroot-native=  -c -o
anacron/readtab.o ../cronie-1.5.5/anacron/readtab.c
../cronie-1.5.5/anacron/readtab.c:33:10: fatal error: obstack.h: No
such file or directory
   33 | #include <obstack.h>
      |          ^~~~~~~~~~~
compilation terminated.
make[1]: *** [Makefile:727: anacron/readtab.o] Error 1
make[1]: *** Waiting for unfinished jobs....

Cheers,

Richard


