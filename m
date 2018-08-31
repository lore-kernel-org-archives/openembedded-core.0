Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C07AF795EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:25:58 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g44-v6so15116365qtb.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GkF9QM4eX7q4NkGz+Ujn+eqhs1LQAqsjdwQRUunkdko=;
	b=pVAFEpLYkRVsAL7GXA0qm7H3xjx3fPzCIJWOapcIE+ECSqtOJlENqqvYIWx7s/qZJY
	Qxix3an9FH0OmJ1f/IqXh6DIYqEA9Az8tWq2h3FyP2x+mgQD5GvKqq+mPlccIjFvqzv3
	HVVtnuUS6YiP6nHbXq0tHSJeOv3DoEQ2CQ9YPWComhiCnoiDe/TIDAQnWfBaNPHCm8gp
	KIRB0QSlZAmv48m9SqiyQzvRp2Hyr0gOEq/nN9baTmvtafQNBEza1bCery3wsDhbuTtM
	gWDXljJifVgJDw4PtgdNv2WVKH1wv40AOLARzuyU1lQla+nWY5BbCEM/mzHnn5ngJNIV
	b7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GkF9QM4eX7q4NkGz+Ujn+eqhs1LQAqsjdwQRUunkdko=;
	b=nJTfEA265QPSpTUxgAynYz7tMQMbmWgO+IxfQ0tlFiCaR6eQ0WK+9GmDwYPNe3c4pC
	omF4ZSUL39KlypANmhEub850bBb8M0mugeM0Y/PS26rqj1aPAXnaoOteFxLIGgqv7rrT
	1SpaN+OJYYfBQX4hCVz3lqg9XgHSfYS2BU5QTtATMqu3EedUN2A0INHsKSHBvVY+IbHV
	ZNJImx9t+NJRoOSVbDLtXAe5/HtnzIGllr1loi45QhBzDI+103xlRy4qNl7dMsGp9NNi
	Xxf0Hz6FxQ4HAc+lH+kfhOPbDavz0aM+fsloafGR+UitZvr+12/gg/XvRqheVtSyVCiY
	M7kA==
X-Gm-Message-State: APzg51BcgCiYT2KeTYOlkHI5hE1ezFZKcKolaTNoo0Tz5QMZrGzAUUd3
	atR/9LR91ep50ngmu1mxeIv+h6T49C4rDsOCFdg=
X-Google-Smtp-Source: ANB0VdaKWSgdQFgb2dRXg9coMrHVrq4vBekwl1B8Vi2Dqj5u95aW288JaHr0FUPHmrxVamzPjzuzElO4twNYs5vBIl4=
X-Received: by 2002:ac8:4649:: with SMTP id
	f9-v6mr17021832qto.34.1535732759600; 
	Fri, 31 Aug 2018 09:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180831134136.18889-1-ross.burton@intel.com>
In-Reply-To: <20180831134136.18889-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2018 09:25:32 -0700
Message-ID: <CAMKF1srq3a0vAd=8Y3kcRAeNvRfAnKdkZQm17Y81f5ErPUjD0A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] fribidi: add (from meta-oe)
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
X-List-Received-Date: Fri, 31 Aug 2018 16:25:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 31, 2018 at 6:41 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Originally this was fribidi 0.19.7 from meta-oe, with the following changes:
>
> - Upgrade to latest release (1.0.5)
> - Drop GLib and PCRE build-dependencies (removed upstream)
> - License is *or newer*
> - Upstream has moved to Github
> - Remove the historical PROVIDES (patches for meta-oe sent)
>

this use to be in oe-core and it was dropped and then used from meta-oe
what is rationale to move it ?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/libfribidi/fribidi_1.0.5.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/recipes-support/libfribidi/fribidi_1.0.5.bb
>
> diff --git a/meta/recipes-support/libfribidi/fribidi_1.0.5.bb b/meta/recipes-support/libfribidi/fribidi_1.0.5.bb
> new file mode 100644
> index 00000000000..303ccb71d0d
> --- /dev/null
> +++ b/meta/recipes-support/libfribidi/fribidi_1.0.5.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Free Implementation of the Unicode Bidirectional Algorithm"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
> +
> +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2"
> +SRC_URI[md5sum] = "0f97f65038545340316ec0f4bd53df0b"
> +SRC_URI[sha256sum] = "6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d723107e8a7e6158e4ce"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
> +
> +inherit autotools lib_package pkgconfig
> +
> +# TODO use Meson instead of autotools when
> +# https://github.com/fribidi/fribidi/issues/87 is solved
> +
> +CVE_PRODUCT = "gnu_fribidi"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

