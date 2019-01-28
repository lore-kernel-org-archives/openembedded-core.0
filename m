Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 57E0D6006E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 16:54:54 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id l12so18978158qtf.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9BJQBNRYDBbTZN50iUGz8ZBahHxpf4eGu5s32DMeTGc=;
	b=saf9hwkAZC934zO6yg5wNDphErXoplUhmY1/0xRMBVq55rY7thDyaXHLsCaJEUJBUp
	zDwfUXcE9x7g5xZVNPefMSq43cDsXSKy3M9XJvtekYvIVnpnxkdyVPbvel0pI2UfVsRd
	da6D4/rfklsO7BmKmjjBQTNG/dseJGTCeihr9eFUzo0A8zbk2mX2OfmMfIg6o7q60E91
	6aZw9eJcmJ/w6OHW6rdwP7UO0d5NhHewGNrM73VpQV388jbsFnkA7p3uphFIzoy+VGpr
	B0dXDyplDvo8EN1PnTKe7wWUHkJoLO217PCzAN0LUhN/3ATnYpq4cDSVAnxzI77gz9Ze
	9THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9BJQBNRYDBbTZN50iUGz8ZBahHxpf4eGu5s32DMeTGc=;
	b=ASbFt3JCAZrg8e4DhoyOc2ljz6+rksFMXXnJh6u7QVatrSj6CHtucyMWmNcKEtpDTj
	kIVERnOrrGoVGktsCK6QcTJeyBcpDsPMlJoazHCJs1jAyNd3cTU3d0k6Q0qIdpR8MYx8
	WjMZgXMLsA7XmUquOfg/wvNrKWyJ8/pxZpvYqAP8v/YvS7x+5FNIAqNaCt3pJW4KSDyZ
	2flWX5e0L07cwwu6UND2TmHEsqGqsN2DFzwNO9SHVGwmxZVEGIUXLBrY/zoaPPQU21tR
	HtzJD/0CJt0FA/e6TmJVlu0wjAcHJBESv8R0LjUAhmOHjyojaOerWn/Hxis0bEfc+xza
	U3ag==
X-Gm-Message-State: AJcUuke4nSUt6lrK87KiD5hn7OrXsIOLbg+9hkNZ+nKLA0Hru3rr7gIA
	q7B0a/JG5B6VkNfAimREUEmyEF+MuR8QDreBfzE=
X-Google-Smtp-Source: ALg8bN5YsAmplvTeYaWuhv6lsoz+1xa9gIyz5x48LYTxJ+hLND4Z6W0/3nFEgkLpDVKX4uy/ctFmLVQiiXNe+keMaYQ=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr20527474qvd.224.1548694494855;
	Mon, 28 Jan 2019 08:54:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548679462.git.alex.kanavin@gmail.com>
	<e5725a863ac3f610e91c0f242eb7b10307250be6.1548679462.git.alex.kanavin@gmail.com>
In-Reply-To: <e5725a863ac3f610e91c0f242eb7b10307250be6.1548679462.git.alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jan 2019 08:54:27 -0800
Message-ID: <CAMKF1sprbVTsOW6PH+CTGb7gRr7yOEh6fmMvQLS5+y98R+8S2g@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/24] vte: allow building vte-native with gcc 4.8
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
X-List-Received-Date: Mon, 28 Jan 2019 16:54:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 28, 2019 at 4:50 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...chool-asignment-to-avoid-gcc-4.8-err.patch | 27 +++++++++++++++++++
>  meta/recipes-support/vte/vte_0.52.2.bb        |  5 ++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch
>
> diff --git a/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch b/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch
> new file mode 100644
> index 00000000000..9c3f98fa61f
> --- /dev/null
> +++ b/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch
> @@ -0,0 +1,27 @@
> +From 442da9076b52003743ffc6fd7b9d647de6d7aa8f Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 17 Jan 2019 16:37:54 +0100
> +Subject: [PATCH] app.cc: use old school asignment to avoid gcc 4.8 error
> +
> +This is needed to build vte-native on Centos 7,
> +and can be dropped once that OS is no longer supported.
> +

Its fine but it would be good to know what the error it.

> +Upstream-Status: Inappropriate [ancient compiler fix]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + src/app/app.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/app/app.cc b/src/app/app.cc
> +index d424064..675d789 100644
> +--- a/src/app/app.cc
> ++++ b/src/app/app.cc
> +@@ -306,7 +306,7 @@ public:
> +                 else
> +                         alpha = get_alpha();
> +
> +-                GdkRGBA color{bg_color};
> ++                GdkRGBA color = bg_color;
> +                 color.alpha = alpha;
> +                 return color;
> +         }
> diff --git a/meta/recipes-support/vte/vte_0.52.2.bb b/meta/recipes-support/vte/vte_0.52.2.bb
> index 62fb5288fa9..272ae66f134 100644
> --- a/meta/recipes-support/vte/vte_0.52.2.bb
> +++ b/meta/recipes-support/vte/vte_0.52.2.bb
> @@ -9,8 +9,9 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
>
>  # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
>  SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
> -            ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
> -            "
> +           ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
> +           file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
> +           "
>  SRC_URI[archive.md5sum] = "de8181350dccb010e915e366bdd06d18"
>  SRC_URI[archive.sha256sum] = "0f2657cef52accbfe56feede553155552d7c1984b1291838af3cb8cfc19b26af"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

