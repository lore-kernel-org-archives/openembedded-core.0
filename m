Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2396C102
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 10:53:24 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id z126so13911131itd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 03:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qu2smXSwUopZNgyA60csf6OuDFl9LGxqrC7V3jX2m5U=;
	b=NGBDk8ZsmJ7IJIuGfj+BOyp+vVJmA7dVIHMf++7tswXXQyWoac2yfhecazXesNJPJv
	zwt/hZeO+Lif/H5GjWaaz3qlmyVYXT29QdENmRnaOpFueEwq7H3Qlr2UJ1ZVAD1s9cLj
	J05SBjY0/ESfhrZmIe1tMtYXyI1tCebfYOu6m40rJgz7Gm+PwIBdo+2HQRSZq/fMpGcz
	q2ohLng0cclZTVytBNiXlLZdGHuryE9FCkdwqSw4N77rJAEXTkTcpbFen/MKKxHbrhab
	kISp+HV1yC5jEOHqFxan6ilKmFoqgChlmS3V5w9hCFrt6BSlqSmLbzVLMaq2QB6syOqu
	1rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qu2smXSwUopZNgyA60csf6OuDFl9LGxqrC7V3jX2m5U=;
	b=MqH/zTvIAqF60vEVQmFoQJ78/2g+lV791siaVUP3XGH9yRj11u5kcO+qTC9zwbszRj
	jivbeC/Td/jc0MIxJVrAfpCte/kwW3l46pQF74OkzBCc4G++9rWhKzN3oCnJoyvPYen0
	R8EfdpGN+Slv6lOfjv6wFO6Rv5UEApYMIZOTYpZxjZ3R9744NjSkUxOO8UE2lxi9euWK
	ZcCk7W60i0hgh06iwQqExcuDv6HJ9qnZGGlqn5vuS+mBQRlk8gNu50GCrWaJMSWs4t92
	/1Xkn+ixk0koGfzrKXt9wFSaMVcWqjCBJcn9NIJPTgTcJoi6Ja/rvcrYcSaJX8AIwnIa
	Mi6w==
X-Gm-Message-State: APjAAAXmt4LC18Tl/XpM38+emrGBgJRk+OIfFXLDLrfSG1CUdBw7mY8h
	lbIQ11PxwlXgLFr6Hvl5ucz9r77HSWQP/qDAHtB4Vw==
X-Google-Smtp-Source: APXvYqxkJ/wd2ism/oStHwkBVcnJXJ7AwA8nG6sGdlGRp/oym0MzmtkarY4+uCtV7t1nSRNZTEbOYR3JWKkyWk5guCw=
X-Received: by 2002:a24:52c5:: with SMTP id
	d188mr15376269itb.130.1554116005491; 
	Mon, 01 Apr 2019 03:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190401022035.10074-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190401022035.10074-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 10:53:13 +0000
Message-ID: <CAJTo0LYb5VtcLZYx7QEay+h62nQtPPWQnEyyuersa9cybKptqg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cronie: update to 1.5.4
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
X-List-Received-Date: Mon, 01 Apr 2019 10:53:24 -0000
Content-Type: text/plain; charset="UTF-8"

ERROR: cronie-1.5.4-r0 do_patch: Command Error: 'quilt --quiltrc
/data/poky-tmp/master/work/corei7-64-poky-linux/cronie/1.5.4-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch crond_pam_config.patch
patching file pam/crond
Hunk #1 FAILED at 4.
1 out of 1 hunk FAILED -- rejects in file pam/crond
Patch crond_pam_config.patch does not apply (enforce with -f)

Remember to check the recipe for conditional patches/logic and test all paths.

Ross

On Mon, 1 Apr 2019 at 03:21, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb}             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb} (94%)
>
> diff --git a/meta/recipes-extended/cronie/cronie_1.5.2.bb b/meta/recipes-extended/cronie/cronie_1.5.4.bb
> similarity index 94%
> rename from meta/recipes-extended/cronie/cronie_1.5.2.bb
> rename to meta/recipes-extended/cronie/cronie_1.5.4.bb
> index 3abca7f920..d35c6672c4 100644
> --- a/meta/recipes-extended/cronie/cronie_1.5.2.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.5.4.bb
> @@ -16,7 +16,7 @@ SECTION = "utils"
>
>  UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
>
> -SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
> +SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}-final/cronie-${PV}.tar.gz \
>             file://crond.init \
>             file://crontab \
>             file://crond.service \
> @@ -25,8 +25,8 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
>  PAM_SRC_URI = "file://crond_pam_config.patch"
>  PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
>
> -SRC_URI[md5sum] = "703314f58a49ea136e9966d3937d9bf4"
> -SRC_URI[sha256sum] = "370bf34641691489330e708bd4cdbd779267296a030668a12f77b7e36872fd75"
> +SRC_URI[md5sum] = "20233b96997e17a142e1fbe0d7ce8223"
> +SRC_URI[sha256sum] = "af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882"
>
>  inherit autotools update-rc.d useradd systemd
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

