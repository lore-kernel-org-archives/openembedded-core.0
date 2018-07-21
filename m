Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7288A78AE1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 16:55:57 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id e19-v6so12991017qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DWxS+zOC4qdA0r/5NpHN/LZ9v0fTWgnmjbNjCsdaMDA=;
	b=peU87GhSVyu+b07x+/X5XTvu7bNOhC6rphBcnk0WNMf/eGEtykkWcSPT1hiQmp1pbh
	ODwoOWTQl/BXdcqdWQyHqgVLQ6kfaHBvD3HWi1Gm5XTS12MyUIzew9jRvIV/AW0WkPnC
	hlZX69v/zM6rq8mXmhhdpuwvsemxicULfn8qGUprPoKqa24PIg1ZexRnzsX1RP8jwDC8
	oJkFhIWykbteqoTi5oUqpnaVGgdfTJwhpqyx8QFu+bfr+OjMpzrYUMAIEUBTjYlHZLAd
	zi43YdRnJ5W8ZS8Be+/lNSJ7X1IOSH7ZF5UUycdg9E02InRIdWIkb6VPq9x09ut+1xLR
	ifZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DWxS+zOC4qdA0r/5NpHN/LZ9v0fTWgnmjbNjCsdaMDA=;
	b=U3dIIaUdES01jeP7fshVG5vMIQJwEkQ9ZrfCrQ80EVnxqOQmnGwXuJnPOZOQq9ZD2O
	PRRFAypu7GWCgWXlaCjh/Wlgbcb3TYEmdR9ulrMPuVKYdS7jG24ImLj+Xy+d2GVafeMr
	hFcA4l5OXfjEc/rLfbTzwiV2R5yUNaWl8k+My2S4ccPljOTXNofyXBH0HjrpS3ZhEt5m
	uDqqrgjLZKj5kPRsc/lF0qQqBFILCOCd31yMHoxwiZRsbzmzaTjDXHmw15vccVvy6hLu
	nemgZAf0CxY5GIwQxTq7kJmN8E14CSVoGviP9aCPf6Mp/oH7f7fg/yM2Zy/fiOw05jWj
	4YZA==
X-Gm-Message-State: AOUpUlHiUUCvcOrbJgZ06ioUl+XD3oyK47GO+a3YBcTf7HRprH0oNFHO
	8lI9nvEv0VgG204mZ5ZIchCGV/lqCmINaUEm0qpnC4op
X-Google-Smtp-Source: AAOMgpcpjB5Q54JdNU1Jpn7HxAoGbzG7s97PBAAwJqSTqiHp6cmGA8kwV6Mfp5oz9dSKYipmjH4lyFn6Ku+lw8yA7zs=
X-Received: by 2002:a0c:d2f3:: with SMTP id
	x48-v6mr5789530qvh.214.1532192158075; 
	Sat, 21 Jul 2018 09:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1531792805.git.Qi.Chen@windriver.com>
	<5295abf3d83cb0dfd3a3d90e2ff878e80bdb5c12.1531792805.git.Qi.Chen@windriver.com>
In-Reply-To: <5295abf3d83cb0dfd3a3d90e2ff878e80bdb5c12.1531792805.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Jul 2018 09:55:32 -0700
Message-ID: <CAMKF1srb8iryMh0q5y8J99-btHjKP5DU4tfLFjW0VTjEb61vow@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd-boot: upgrade to 239
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
X-List-Received-Date: Sat, 21 Jul 2018 16:55:57 -0000
Content-Type: text/plain; charset="UTF-8"

With (musl/x86/security_flags) I am seeing these errors when systemd
is enabled in distro features.

| Error relocating
/home/jenkins/oe/world/oe-build/build/tmpfs/work/i586-bec-linux-musl/at-spi2-core/2.28.0-r0/recipe-sysroot//lib/libsystemd.so.0:
__start_BUS_ERROR_MAP: symbol not found
| Error relocating
/home/jenkins/oe/world/oe-build/build/tmpfs/work/i586-bec-linux-musl/at-spi2-core/2.28.0-r0/recipe-sysroot//lib/libsystemd.so.0:
__stop_BUS_ERROR_MAP: symbol not found

There are several packages which are failing with same error
telepathy-glib
at-spi2-core
gconf
avahi
polkit
libgnome-keyring

I think we dropped a patch which fixed this error

http://git.openembedded.org/openembedded-core/commit/?id=a54b025bfde774353aa278ca78fa0116c52b6d71

we need to revive it.
On Mon, Jul 16, 2018 at 7:02 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Upgrade systemd-boot to 239.
>
> The following patch is removed due to recent fix about meson's cpu family
> mapping and validation.
>
>   0001-Also-check-i386-i586-and-i686-for-ia32.patch
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../{systemd-boot_237.bb => systemd-boot_239.bb}   |  5 ++--
>  ...01-Also-check-i386-i586-and-i686-for-ia32.patch | 28 ----------------------
>  2 files changed, 2 insertions(+), 31 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot_237.bb => systemd-boot_239.bb} (91%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_237.bb b/meta/recipes-core/systemd/systemd-boot_239.bb
> similarity index 91%
> rename from meta/recipes-core/systemd/systemd-boot_237.bb
> rename to meta/recipes-core/systemd/systemd-boot_239.bb
> index afd3848..7fe420c 100644
> --- a/meta/recipes-core/systemd/systemd-boot_237.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_239.bb
> @@ -3,9 +3,8 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>
>  DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
>
> -SRC_URI += "file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
> -            file://0027-remove-nobody-user-group-checking.patch \
> -            file://0001-Also-check-i386-i586-and-i686-for-ia32.patch \
> +SRC_URI += "file://0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
> +            file://0006-remove-nobody-user-group-checking.patch \
>              file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch \
>              "
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch b/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
> deleted file mode 100644
> index 877bb1c..0000000
> --- a/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 3e8c19bb1bbc4493c591f75c00c1fefe3b1c8a69 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 27 Feb 2018 20:42:41 -0800
> -Subject: [PATCH] Also check i386, i586 and i686 for ia32
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 28cb8b60e..489531a43 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -1217,7 +1217,7 @@ conf.set10('SYSTEMD_SLOW_TESTS_DEFAULT', slow_tests)
> - if get_option('efi')
> -         efi_arch = host_machine.cpu_family()
> -
> --        if efi_arch == 'x86'
> -+        if efi_arch == 'x86' or efi_arch == 'i386' or efi_arch == 'i586' or efi_arch == 'i686'
> -                 EFI_MACHINE_TYPE_NAME = 'ia32'
> -                 gnu_efi_arch = 'ia32'
> -         elif efi_arch == 'x86_64'
> ---
> -2.13.0
> -
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

