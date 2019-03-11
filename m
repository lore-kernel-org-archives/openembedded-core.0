Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E1C546B7C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:32:26 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id u7so3650888qtg.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 21:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d/IL6+vz40cmkm526hX/PNpH5OhOKymdldrAMUeReDo=;
	b=duCU4OWqhdtWHFgbmJTu5i4RZqSe+INQpyR60M6c6C37cXOrsTVMkDWS8LuQRm0gRF
	CCfCBmgCjdcmXpw8JHrPfLJWdYvUFF73Cd9ixOPwwA8SQx4U/I69K+uSgEWnUdZUBxD8
	vD9vpYv4XOzQh8TXVAaQPsiPc3KgUrB1zPyxszIGm43Jt5PxRQTlvg+zM4jercArqcOv
	KfqLEA1nCLsiDRhjaXfzBXvpqbY3m+mvVKLFA7xRgBq/X8WAHggSa2l3jOwV2oGCHQ6D
	FqTcysl2TEXJEGVQ3RxND/YsTEqoDM32x8ncpQabfsbf67O5ejniBoW4Gq0wJixgHe70
	0uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d/IL6+vz40cmkm526hX/PNpH5OhOKymdldrAMUeReDo=;
	b=lvRTrqi96bIZPTCQhVbeBTq/C+5sqL8upeIn5qRl+KTI3m9jC62xByIqDFgN/ihI4k
	3Oc8gCEEOyI1voA6qxUBEM6bEraVmexs84Ik4PXQOFh0FY0x92k+zBbOrjNPaKlCEFm/
	Xme6zxOV7YwuFcrLtwb/MQQVbhsbdkl4HjmmdDGsK8NN9pj9ETDvRbFwocF3bDAf2bjl
	yMUFsVGi7ylRjryNcCixj+Depz+R/bPjBdPqfT/gv/sfBS+E0uBI0vOt2KZbf+q4zm6K
	aE+vUN1+ylR7r9ewvgMP5qwQSn11y993gjcDz/IYieuwW/pOvP723Y28Bhi+zv20UE33
	w3fQ==
X-Gm-Message-State: APjAAAUtBKMXTCYE/F1/2U5liBOvvf+hSFaQAsMxXST6wxmkRBXSremU
	08Jr2HsaBYfwFpimDonJ0lWcBFwE7orR1SaKbiE=
X-Google-Smtp-Source: APXvYqxnqn2mgIp+2fIL0cO1ejdubLMq+KCvKUD00Ge2Q+u0wHpRvlJgcZzAXDnOhk0SlBWoPD/2U+cS92wr0j6EQgs=
X-Received: by 2002:aed:2268:: with SMTP id o37mr24379791qtc.29.1552278747528; 
	Sun, 10 Mar 2019 21:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
	<1552241263-26116-11-git-send-email-akuster808@gmail.com>
In-Reply-To: <1552241263-26116-11-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Mar 2019 21:32:01 -0700
Message-ID: <CAMKF1spYY-+uFrZr5-d0xZC_WVM38h1QgaVC+RQ3=m1=Yha=Cg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/12] gnutls: update 3.6.6
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
X-List-Received-Date: Mon, 11 Mar 2019 04:32:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 10, 2019 at 11:09 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> WARNING: gnutls-3.6.6-r0 do_configure: QA Issue: gnutls: configure was passed unrecognised options: --without-libunistring-prefix [unknown-configure-option]
>
> drop --without-libunistring-prefix
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.6.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.6.bb} (91%)
>
> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.5.bb b/meta/recipes-support/gnutls/gnutls_3.6.6.bb
> similarity index 91%
> rename from meta/recipes-support/gnutls/gnutls_3.6.5.bb
> rename to meta/recipes-support/gnutls/gnutls_3.6.6.bb
> index dfc3507..3cad896 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.6.5.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.6.bb
> @@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>             file://arm_eabi.patch \
>  "
>
> -SRC_URI[md5sum] = "3474849e1bbd4d16403b82ab2579000b"
> -SRC_URI[sha256sum] = "073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35"
> +SRC_URI[md5sum] = "30c5b63686edcd260d87d8fb8a06977f"
> +SRC_URI[sha256sum] = "bb9acab8af2ac430edf45faaaa4ed2c51f86e57cb57689be6701aceef4732ca7"
>
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
>
> @@ -44,7 +44,6 @@ EXTRA_OECONF = " \
>      --enable-local-libopts \
>      --enable-openssl-compatibility \
>      --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
> -    --without-libunistring-prefix \

this was regressing when attempted to be removed last time see
https://git.openembedded.org/openembedded-core/commit/?id=d8d32b5a58eea161711e3539c4530682de551ede

Does it work when libunstring is installed on build host now ?
>  "
>
>  LDFLAGS_append_libc-musl = " -largp"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

