Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id C93A873166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 21:55:55 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a186so13835555qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 14:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j6244M0UPOZy2B/HxTI7wFfVe+/iYAz5fV0NVAjkG6o=;
	b=yXNYpglx3W32rnc8NL4L4BatihK98D1iPIWJ3ng/W1FJmFKlDVpQw5e1JkkgWqe3vm
	Y2Sz/dgXtGdNYF56ctYGUJAptF9pjzsBeTrEm8FHwXvfDbuUHtmThAt0dYHKTggUxK6a
	V08oVPQYf6NRNFbVB9DICIgocJdBXCw5AeqseH+dSkNa9jxtUq529MRJn4xZeNh3ToOT
	n89i4Hx1g3uTy7S86b9y02+6e9zzAGWcALLdP+iXh5hIaloV9ihVCQ1o6/vYtkj3xDIO
	xvIEMslo7AZIie8uE/6mrggtUL2ZsHwtXoVZohfiqw1y00cCFWgCLY3rK48VWDa+9yY9
	0zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j6244M0UPOZy2B/HxTI7wFfVe+/iYAz5fV0NVAjkG6o=;
	b=OmtmHBBzbZ+9dP8LZhN2TQ1gJWYSvCmOtj/+JSs2cN+HmjgIpBrOqHipICvd/MJJiO
	ioVDlvOd66KkdHR7qIONidDo5l5YmF118zBQ1TOqrPzuRXwI1g2ABswOYpqbyYT9kOCq
	xm6Z1zbzy6GeZoelWATMVNL6kinfGeIBpTrz8wV72UjOP7D85pkBB+wQ4g4ikhXmqBO+
	hCRFCbtKs7sqG7IEs6AG8Fa87HiTjlN+8jLAZNl44zrXZXd/aWQyMpnGMWWjiXbRFNdF
	pA25T+UKYhtl/plwuA4P23BDuFmNtVkdnL8Pcutvt8RQCMNgq4ak/fG7w6/yWFkXUzkm
	6Ziw==
X-Gm-Message-State: ALyK8tKcjbEolZkdfs+EJiuQXy/yg4rkkU7fTTu7OBfX5icV1pAKnSzQpUO12BiJeL8S7DMFtBTukF/IG+iTQg==
X-Received: by 10.55.27.202 with SMTP id m71mr5371319qkh.151.1466200556116;
	Fri, 17 Jun 2016 14:55:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Fri, 17 Jun 2016 14:55:25 -0700 (PDT)
In-Reply-To: <1466167297-19753-1-git-send-email-d.falko@partner.samsung.com>
References: <1466167297-19753-1-git-send-email-d.falko@partner.samsung.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Jun 2016 14:55:25 -0700
Message-ID: <CAMKF1soKUtvOr+gPCwv8TOjp8Zw4m6iXpEQhitz1hM10g4hAFw@mail.gmail.com>
To: Dmitriy Falko <d.falko@partner.samsung.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Alias _obstack_free to fix binutils build
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
X-List-Received-Date: Fri, 17 Jun 2016 21:55:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 17, 2016 at 5:41 AM, Dmitriy Falko
<d.falko@partner.samsung.com> wrote:
> Binutils as(sembler) trying to referency _obstack_free when building
> it for ARM uclibc(not cross compile version).
>
> Enables it(just alias to uclibc obstack_free) to fix build of binutils.

this is ok

>
> [YOCTO #9781]
>
> Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com>
> ---
>  meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
>  ...Alias-_obstack_free-to-fix-binutils-build.patch | 31 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch
>
> diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
> index a56fa7c..ea1d37d 100644
> --- a/meta/recipes-core/uclibc/uclibc-git.inc
> +++ b/meta/recipes-core/uclibc/uclibc-git.inc
> @@ -6,6 +6,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
>
>  SRC_URI = "git://uclibc-ng.org/git/uclibc-ng \
>          file://0001-Disable-lrount_tes-function.patch \
> +        file://0001-Alias-_obstack_free-to-fix-binutils-build.patch \
>          file://uClibc.machine \
>          file://uClibc.distro \
>          file://obstack.cfg \
> diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch
> new file mode 100644
> index 0000000..8f97ab8
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch
> @@ -0,0 +1,31 @@
> +From f795fc77a2cf90ce77707faddc93a51f736a4553 Mon Sep 17 00:00:00 2001
> +From: Dmitriy Falko <d.falko@partner.samsung.com>
> +Date: Fri, 17 Jun 2016 11:31:02 +0300
> +Subject: [PATCH] Alias _obstack_free to fix binutils build
> +
> +Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com>
> +---
> + libc/misc/gnu/obstack.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c
> +index 38cfd83..2689263 100644
> +--- a/libc/misc/gnu/obstack.c
> ++++ b/libc/misc/gnu/obstack.c
> +@@ -385,11 +385,11 @@ obstack_free (struct obstack *h, void *obj)
> +     abort ();
> + }
> +
> +-# if 0
> ++
> + /* Older versions of libc used a function _obstack_free intended to be
> +    called by non-GCC compilers.  */
> + strong_alias (obstack_free, _obstack_free)
> +-# endif
> ++
> +
> + int
> + _obstack_memory_used (struct obstack *h)
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

