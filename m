Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 22C7178522
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 16:45:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r77so14967019wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 09:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SlzeUAkPDRMn7QjAAjd5ZXdMQJRRiXDvM1O+JTQOm0o=;
	b=IU3+5CclboGc+hw4UyHyxBcmr0i66OqrjBSef6EbvWstOrVth/FjBkAvEAA6XPaoD8
	LL+gIvpNFcurxN2S+X/R5QizjqWLguAhYa4XszWoEcwUJuAY3bQBcBfIUnluSTUsmlTW
	f/XjeXaLbQGZPOprUsm/Jm9GQy8wr/TklfOeCTgIrt5ycfZOqS5+Rx0K5OSFHbsrm+lH
	CCjoNQca3pBXngBqLGZyFZk0YanOT31rxb5kQZmxEGAsBYh6D2yFEvBbuntblP5EJSsG
	d3zyyx2AJo+dR+YQwmr+hdwWj1A9AUxSAEx6PI1ct/Yf8Ix2h3sL/I/I5h3zW6R1mGpG
	42jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SlzeUAkPDRMn7QjAAjd5ZXdMQJRRiXDvM1O+JTQOm0o=;
	b=Yt0e8yaat88+EF80rM/bC/yiNX+eXNnV+86d78N/dqr8NUTNAh+6Qee84ZJk7H5zKf
	F8xk67dioyX08zZjwhiB+y27uVvoLfBSgnrJkhZ5C1MHRbqtI7pp4FTiuIOhx7IBfmZ3
	IEWBt/OB6BDMPlwoJoPItz4D8w2Ft1I5mq8et+5jy5mPF/nlTA1Lc05185+Eb89w8kEv
	wz+B1l2f2b27h8ciEO9P+o9qhne0n55Y+fEbVBFA+KLTUlEniGw1JOxtlaP8d4yRC6MD
	PimILG7s0sjuh59RwMvcfHVMJpqd1yCA4FyOy+4X8vAwy4RdhPemS2FJkPI2JvSGEJSQ
	l79Q==
X-Gm-Message-State: AIVw110n9PRyhAJh3f42ONjmB5KKJxHFRUcYBKIdnk/+TolzHpryMoVp
	CniLHrdHQYdI0sQwjE+Kee/n0LtI5g==
X-Received: by 10.80.139.65 with SMTP id l59mr7152011edl.52.1501260350316;
	Fri, 28 Jul 2017 09:45:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 28 Jul 2017 09:45:19 -0700 (PDT)
In-Reply-To: <f05e1212a87f739cf27fe9a6c32f45ef92a6fdab.1501250341.git-series.patrick.ohly@intel.com>
References: <f05e1212a87f739cf27fe9a6c32f45ef92a6fdab.1501250341.git-series.patrick.ohly@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 09:45:19 -0700
Message-ID: <CAMKF1sq98x8jpV_A0Fz2doMO25Cii9v4Ez178ex4uUoPqnnB8A@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Fri, 28 Jul 2017 16:45:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 7:01 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Having common macros in OE-core that are needed by autotools based
> projects makes sense. For example, tpm2.0-tools in meta-measured
> depended on meta-oe only because of autoconf-archive.
>
> This is a verbatim copy of the autoconf-archive recipe in
> meta-openembedded rev 1cbd1bc1, with just one change: the patch which
> disabled the installation of ax_code_coverage.m4 and
> ax_check_enable_debug.m4 was removed.
>
> So now autoconf-archive in OE-core provides them. gnome-common in
> meta-oe will be changed to not install them and instead depend on
> autoconf-archive.

+1
LGTM

>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-devtools/autoconf-archive/autoconf-archive.inc           | 15 +++++++++++++++
>  meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb | 13 +++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
>  create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> new file mode 100644
> index 0000000..9684d1f
> --- /dev/null
> +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
> @@ -0,0 +1,15 @@
> +LICENSE = "GPLv3"
> +HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
> +SECTION = "devel"
> +
> +DEPENDS += "m4-native"
> +DEPENDS_class-native = "m4-native gnu-config-native"
> +DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
> +
> +RDEPENDS_${PN} = "m4 gnu-config gnome-common"
> +RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
> +RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
> +
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
> +
> +inherit autotools
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
> new file mode 100644
> index 0000000..0a1a771
> --- /dev/null
> +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
> @@ -0,0 +1,13 @@
> +require autoconf-archive.inc
> +
> +
> +PARALLEL_MAKE = ""
> +
> +LICENSE = "GPLv2 & GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
> +SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
> +
> +EXTRA_OECONF += "ac_cv_path_M4=m4"
> +BBCLASSEXTEND = "native nativesdk"
>
> base-commit: d3a41fbd94462efc8c6f1b55f6fb54001b447c45
> --
> git-series 0.9.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

