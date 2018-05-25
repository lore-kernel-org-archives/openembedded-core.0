Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id C8BCA74E29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 03:34:59 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id x191-v6so2340968vke.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 20:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h16TiuKmI0OH4xwIDkdKUCbS7Gj8Fei1mNEGQLmd5wU=;
	b=gE5m4GfrFguY4S4qF4Ko7taqj1TSXFc2arPyoRXm0UcC1m7evnZBLn10hK3m2spMjA
	2XXqViTOvEgr/7FvSjInkNMuNpslwbKnSw17KVuu20mPp4xo30H200t/NSM9HPATco5T
	/r5rZtJ9ZLnds79GLFYCJNphoKz04mzqHxTqWeJbO+whAg0S5uR+f50JOIZd2A2U/79c
	zpPkOJp3gS8FNj3jV94BHZjwznSC5DLt5sD2kgcwWKPgc24zaIxZ8tlHpzuRWSrmPFoC
	9dgGMzaiFSd2y5NiiGL8+u88QQ/WCc2sz+bTWn/C+91O3L6jhJW1o6sM7r7Z/rLRQpfU
	3w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h16TiuKmI0OH4xwIDkdKUCbS7Gj8Fei1mNEGQLmd5wU=;
	b=l5iIH9pnA0uYTmxtPWMVCGd+ZRhG+wqUZu7n+v5pwi5GNEc+bisKsIfbOVx7WtubaJ
	+GUYSoT2wqwB8rgj4x2BUMyKnhYf5i05payG4wm26nOm8zasJAb+F9OaffHx7JqnqHaX
	D0xDfnPu6Gh75jQx1YebF75y2gl671QAjEH2VvAc/R5AS44+FIyygBgrDeVJVWOuyXMy
	iWhBaEROlwskbjFL5EY1FUcSW7glZnwksGwg7SaCy5B7MY5DpgEfzsVmdRNQwZmax9X0
	Mq0BtEo9v4poUE1P9Nbk1LhvG4pnOde9aCYKQqNcKZeNUZlgu5qfPBONGwHtSJVR9coq
	IGLQ==
X-Gm-Message-State: ALKqPwfuqPLX/Zzc9FIdnEYms7pNCBCDlxA0M7s2pjra3sI8KWijwsQl
	/1UKxex8LXbbCXyKOFlFcDjPgVqy6yK78rFDByk=
X-Google-Smtp-Source: ADUXVKKApePBg5JVAjMHsWjJuTAXnhcC0SaQmDVr1w7PVj/lZiaG3uRfXz1tBFLw1eq2EjYxmXNEt1bhmu8tHvHP45k=
X-Received: by 2002:a1f:28ca:: with SMTP id
	o193-v6mr357487vko.194.1527219300253; 
	Thu, 24 May 2018 20:35:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Thu, 24 May 2018 20:34:59
	-0700 (PDT)
In-Reply-To: <f4bfb14098d86375865642c0ae4eb338ea759b1a.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<f4bfb14098d86375865642c0ae4eb338ea759b1a.1527216285.git.liezhi.yang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 24 May 2018 20:34:59 -0700
Message-ID: <CAJ86T=V-LQ_MxSfB=NXcz_eMPkPJyJRUJ-3FaHQ-i-N20=JGXw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/24] dropbear: add default config file to disable root login
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
X-List-Received-Date: Fri, 25 May 2018 03:35:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 7:48 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> root login is disabled by default for openssh and we can
> enable it through IMAGE_FEATURES 'debug-tweaks' or
> 'allow-empty-password', so change to the same default
> behavior for dropbear.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-core/dropbear/dropbear.inc              | 3 +++
>  meta/recipes-core/dropbear/dropbear/dropbear.default | 2 ++
>  2 files changed, 5 insertions(+)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.default
>
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index 16ac644..3c79be9 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -20,6 +20,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
>             file://dropbearkey.service \
>             file://dropbear@.service \
>             file://dropbear.socket \
> +           file://dropbear.default \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
>
>  PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
> @@ -63,6 +64,8 @@ do_install() {
>                 ${D}${sbindir} \
>                 ${D}${localstatedir}
>
> +       install -m 0755 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear

Files in /etc/default don't need to be executable.

> +
>         install -m 0755 dropbearmulti ${D}${sbindir}/
>         ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
>
> diff --git a/meta/recipes-core/dropbear/dropbear/dropbear.default b/meta/recipes-core/dropbear/dropbear/dropbear.default
> new file mode 100644
> index 0000000..522453a
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/dropbear.default
> @@ -0,0 +1,2 @@
> +# Disallow root logins by default
> +DROPBEAR_EXTRA_ARGS="-w"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

