Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9EB6C102
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 11:14:08 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id n78so3552990itb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 04:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WZDOs7dVVeqnRY/hgUWOsfVQgCpfvUeJFkRIuJkjTQA=;
	b=fqTqVdrxt/jtae5kb9H0qmf4b1m2KfBnRfa/NkVsvMCvKWJN1zP5b0KZtdyeDzGfAX
	/tcwt1DADnhScd168VdevlDJxk2vnq69rsQpYizAbnU+H0Lmr8UArVSaYJJgs1cB1NaX
	zxvRxOclNuYBTfipICeNXl6mrosI5ylfs8EhaK5vRiJ4APWsLhlQjjYLnpwWP0neU8b5
	D765yjyvbKtRU9oQJeHXgyFELxx4Aht2TNf46RIyyzKgZRu+M/L8KBrK536kShX7P+iJ
	a198/y3QDnwB7kPO20s4cwCAcmDsoocU6slNoMQZymOMafr+rYtevceSSO/X7C6BBOCV
	/Z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WZDOs7dVVeqnRY/hgUWOsfVQgCpfvUeJFkRIuJkjTQA=;
	b=ExDmnAkpTuy7foWNr1/kY0TG263KvoJ/bjWBC0KckPufYOBoAW58kvVg5DL5bodiN1
	loAL2Qtw43+jUnmYUuH73PMyoRDIxxceZrJkOJehL9iUgAYbX3OosoJWdt+ZEPSJJ5Vk
	et0I7DDZO5CsGwec8qpudsr4omeHQAFs+hCY+eKV3l7FJGGeYERjZYV0PA44nvgLSK9v
	uBbWKHCS0lFnzD/bQ0rbj8F+1MA1RXrvudPVKamfriG5gonqSKLuo9VWuzyc6Q0YnI6i
	Ne71CyXFWlRTfC/BcZeaUcWYS88Sf5OYrYs26O96rN4fFavIm/fo4I4faSrRpSm6aEfe
	3NRw==
X-Gm-Message-State: APjAAAUxd5ETzbwQUP9WP4od64xYKHpHNgJJfX4/4u6i5nyVxBhfcB7z
	rP595Vj/wOY0ABeRmBs/bj+2+sLEhZn2PzNTofAOA0yRk9Q=
X-Google-Smtp-Source: APXvYqyyFTisgMyqol9Q2bGS3WDWE1BTYkSLi5eBGtL1jqoCsEbReXud637bKaLSNuME9LGyhYC5Sbeyj5Ct4q02N/o=
X-Received: by 2002:a02:c955:: with SMTP id u21mr2990687jao.105.1554117250146; 
	Mon, 01 Apr 2019 04:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190331164236.6948-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190331164236.6948-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 11:13:59 +0000
Message-ID: <CAJTo0LY=hzB8KbwCzU517VcTOKkhJoqJ_5Sg9xNsABqin28U4Q@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: update to 2.2.15
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
X-List-Received-Date: Mon, 01 Apr 2019 11:14:09 -0000
Content-Type: text/plain; charset="UTF-8"

ERROR: gnupg-2.2.15-r0 do_patch: Command Error: 'quilt --quiltrc
/data/poky-tmp/master/work/corei7-64-poky-linux/gnupg/2.2.15-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch 0001-Woverride-init-is-not-needed-with-gcc-9.patch
patching file dirmngr/dns.h
Hunk #1 FAILED at 154.
1 out of 1 hunk FAILED -- rejects in file dirmngr/dns.h
Patch 0001-Woverride-init-is-not-needed-with-gcc-9.patch does not
apply (enforce with -f)

Ross

On Sun, 31 Mar 2019 at 17:42, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../gnupg/{gnupg_2.2.13.bb => gnupg_2.2.15.bb}                | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/gnupg/{gnupg_2.2.13.bb => gnupg_2.2.15.bb} (93%)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.2.13.bb b/meta/recipes-support/gnupg/gnupg_2.2.15.bb
> similarity index 93%
> rename from meta/recipes-support/gnupg/gnupg_2.2.13.bb
> rename to meta/recipes-support/gnupg/gnupg_2.2.15.bb
> index 3ce2a38c0e..06a257333d 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.2.13.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.2.15.bb
> @@ -20,8 +20,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
>                                  file://relocate.patch"
>
>
> -SRC_URI[md5sum] = "563b959d0c3856e34526e9ca51c80d7b"
> -SRC_URI[sha256sum] = "76c787a955f9e6e0ead47c9be700bfb9d454f955a7b7c7e697aa719bac7b11d8"
> +SRC_URI[md5sum] = "3ab87e377aa0af2f463649515bf66508"
> +SRC_URI[sha256sum] = "cb8ce298d7b36558ffc48aec961b14c830ff1783eef7a623411188b5e0f5d454"
>
>  EXTRA_OECONF = "--disable-ldap \
>                 --disable-ccid-driver \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

