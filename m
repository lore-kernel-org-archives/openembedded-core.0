Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id BFD487F59D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 05:27:13 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id g17so1669477qtp.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 21:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JcrBO258hG50B1NgHvT+7a5qY/tj++gAgYTBOPlKw10=;
	b=hisHO7T8cOvSqT/6K1GGnqbMtTQm9JbKserE4CE+W4k5KzZMij6AKC0pln31Kor+HD
	HGQozbz7zLu9IBQheu+By582CIKdhQda0Su3mXB9eM64WIhpAnxhwkTLyDcfLSTaoQjE
	OUcKyW3UMX0v9zKawr6HKnHPWHt4VlQwPSkFsNGdPWihzV82PXXquNX9eYS8l/IT3Ddt
	b1+0rOplsdVrZvAgp2RbOe7+3HM/5+Y9ORrVZC2WNs2hUCSpVr7+ib1GAKVS2EsOh+Oh
	kopTJl3a34iW/E3g9XWrccWYbnTRsGh8sb8hER/IAl2E1znYHOOt2j+7fFltigF1n0es
	FvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JcrBO258hG50B1NgHvT+7a5qY/tj++gAgYTBOPlKw10=;
	b=TvzEC/akIjkIYZYxGniyqnFdPPFZl6nd/CKDNkHxbJYFUFjah9DluRT9P3PBD8MPJA
	V4KOdaPCNMWZE3pgDfWQjwtgB0cCdTNd+FHrfHhb6foSkujDXHEhS1XISDOTuEcRS9Fp
	1nyAnJVs6t8uJRnFN6sNxh/yS2yGD/U2P9u6IUX90QnqQWOY7tk1Y1DRdvZpjoq3dNq/
	2lDijGkGFJ5SKYeNn3IKB4PHMS2eEe3w93M9C2rwuAhWAjoIM/xcDjkaahiH9xXKV5hx
	L9ETN09jq6CL9Ci2lRvAt/dK6Zz50dcP495eyiuG5dpuJiaLCy3aGC+iVk+E8PUdd7Wz
	UKlg==
X-Gm-Message-State: APjAAAWyktSoi41t884sccxiekZZPuKn/v4Yp9jYljidsNWz6Jdkqv6b
	nCEO0N+MF1rZRQPgbjl+hV0hwVwyxvm6On3VW18=
X-Google-Smtp-Source: APXvYqwN1lwEcTJ6y5qbEi+mrtTU0fupQLvCoPtz87O87TBL5nVRaboIdWDDx3fcrVIA0zYtOUEscUwlIKfSQ/fZTVY=
X-Received: by 2002:ac8:6ca:: with SMTP id j10mr16025835qth.378.1576387634466; 
	Sat, 14 Dec 2019 21:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-21-alex.kanavin@gmail.com>
In-Reply-To: <20191212181436.1322-21-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Dec 2019 21:26:48 -0800
Message-ID: <CAMKF1sryfLQN0GgBwaC5mstgjuHa_nOLn3=3choTTZ=LtNxttA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/30] lttng-ust: update to 2.11.0
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
X-List-Received-Date: Sun, 15 Dec 2019 05:27:14 -0000
Content-Type: text/plain; charset="UTF-8"

some undefined symbols

https://errors.yoctoproject.org/Errors/Details/297311/


On Thu, Dec 12, 2019 at 10:18 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Remove patch as issue addressed upstream.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../lttng-ust-doc-examples-disable.patch        | 17 -----------------
>  ...{lttng-ust_2.10.5.bb => lttng-ust_2.11.0.bb} |  9 +++++----
>  2 files changed, 5 insertions(+), 21 deletions(-)
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.10.5.bb => lttng-ust_2.11.0.bb} (89%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
> deleted file mode 100644
> index bff852799d0..00000000000
> --- a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Don't build the doc examples - we don't need them and in fact they
> -never successfully built in previous iterations of the lttng-ust
> -recipe anyway.
> -
> -Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> -
> -Index: lttng-ust-2.9.1/doc/Makefile.am
> -===================================================================
> ---- lttng-ust-2.9.1.orig/doc/Makefile.am
> -+++ lttng-ust-2.9.1/doc/Makefile.am
> -@@ -1,3 +1,3 @@
> --SUBDIRS = . man examples
> -+SUBDIRS = . man
> -
> - dist_doc_DATA = java-agent.txt
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb b/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
> similarity index 89%
> rename from meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
> rename to meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
> index cfaad30b694..6d7c05e65e3 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.10.5.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
> @@ -15,6 +15,8 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
>
>  inherit autotools lib_package manpages python3native
>
> +EXTRA_OECONF = "--disable-numa"
> +
>  DEPENDS = "liburcu util-linux"
>  RDEPENDS_${PN}-bin = "python3-core"
>
> @@ -26,12 +28,11 @@ RCONFLICTS_${PN} = "lttng2-ust"
>  PE = "2"
>
>  SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
> -           file://lttng-ust-doc-examples-disable.patch \
>             file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
> -          "
> +           "
>
> -SRC_URI[md5sum] = "f0c86a9fa7dcfd0205fb42584a310b1c"
> -SRC_URI[sha256sum] = "06f9ed9b2198855b1c7fcbf15fe57297ee259409ffa1b3bad87321412d98bc35"
> +SRC_URI[md5sum] = "99823cfeb76562d753ffe67880e9cc59"
> +SRC_URI[sha256sum] = "683280cfe5e12021e64c32cef9eeb0128f1f23dec32ba28adb5a2074be37c4d8"
>
>  CVE_PRODUCT = "ust"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

