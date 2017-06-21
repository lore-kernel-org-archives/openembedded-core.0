Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 88C287751C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 02:41:50 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z45so22519521wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 19:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=34PXvanAp+eohT34jm0J0KRhk8XoEW3lHsXrfvj8/JU=;
	b=fclAxa8GN0n69LiPkCoeJJKfVli2zpXnR7tlAYjJ9LLtjKplE+7p6ZVwJXjdMZq1oe
	QA747IDAHyPXLRwZOlJa8l2ImVEBfVs4skS78XGpc302JjLO7eOUTwFWQ/TnE9EpGFZW
	ckqWa9JCkcQzLFQLgwcZC172nQLonYWeRZYW3zDgkQDOaX/dQ582m6XXZC+fFCBYywU0
	WZ6NwaJCgYpgKxdbz3n7rZVWU9iaFWU38iYvBd5yuMPzi43Fc717EKxj6PtCjzdCZdkK
	CoTYVQTuBE73TxvELUUxTbORk3WG33p/oF/rmdX0TXvseLfB8ZMK4pZHlavmh4TG0AOi
	49hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=34PXvanAp+eohT34jm0J0KRhk8XoEW3lHsXrfvj8/JU=;
	b=TIi64lY/u6TjaK03p6aPAqzXqNvE4Ld+OrXqns1aoO8bm5tdHyZuqySPhocYqSsUEr
	DYJzI+6D5yWP8KP0dN7TL35WcG8vcYtUwbQc9+oS/+alH6wnWfLZIprt5quHIMnaeGql
	MEFFxEn1NPkVzmQL9wNXSubQopDn7v80MyPz44lkwzCjYYqLvA+iX/xKv3ZIOodVY4CJ
	DajYP7SSXoidub4u1VZDxUa1fRva4dv5iOsCEK2Xh8DBzLNJTiJTnb5Oz2iseyfwjIzK
	NqOr+TgYKb7r1iw7RdbTzUWf45WNYT1vde80y2IOsreoCIu+OgkUG/yYsbm0SskPE6yT
	tQUQ==
X-Gm-Message-State: AKS2vOxYJEgahO64qSK7mJDw2c2z9WvtIew8a+Zd2xcHQbzprT4Pooo+
	UJYbhKr1YdKsDJzSCugDx7XhMtzXxg==
X-Received: by 10.80.137.36 with SMTP id e33mr23613493ede.67.1498012911310;
	Tue, 20 Jun 2017 19:41:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Tue, 20 Jun 2017 19:41:20 -0700 (PDT)
In-Reply-To: <1498012112-27453-1-git-send-email-Randy.MacLeod@windriver.com>
References: <1498012112-27453-1-git-send-email-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Jun 2017 22:41:20 -0400
Message-ID: <CAMKF1sr6jktZh7936pMndka5XBxGs1iPzkeSTtxQ=0Nj8iuV6A@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: work-around ppc gold linker error
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
X-List-Received-Date: Wed, 21 Jun 2017 02:41:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 20, 2017 at 10:28 PM, Randy MacLeod
<Randy.MacLeod@windriver.com> wrote:
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../systemd/systemd/systemd-drop-gold-use-bfd.patch           | 11 +++++++++++
>  meta/recipes-core/systemd/systemd_232.bb                      |  2 ++
>  2 files changed, 13 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
> new file mode 100644
> index 0000000..eac2199
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd-drop-gold-use-bfd.patch
> @@ -0,0 +1,11 @@
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -260,7 +260,7 @@
> +         -Wl,-z,relro \
> +         -Wl,-z,now \
> +         -pie \
> +-        -Wl,-fuse-ld=gold])
> ++        -Wl,-fuse-ld=bfd])
> + AC_SUBST([OUR_LDFLAGS], "$with_ldflags $sanitizer_ldflags")
> +
> + AC_CHECK_SIZEOF(pid_t)

may be a sed expression in do_configure_prepend is better

> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
> index 1007360..1ce9dc1 100644
> --- a/meta/recipes-core/systemd/systemd_232.bb
> +++ b/meta/recipes-core/systemd/systemd_232.bb
> @@ -41,6 +41,8 @@ SRC_URI_append_libc-uclibc = "\
>  "
>  SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>
> +SRC_URI_append_qemuppc = " file://systemd-drop-gold-use-bfd.patch"

is it specific to qemu alone ? if its generic across ppc then this is not
right override. Infact you should also describe what the problem is in detail
here.

> +
>  PACKAGECONFIG ??= "xz \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

