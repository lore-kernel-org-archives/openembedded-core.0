Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 38D3A75843
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:05:12 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so41985844pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=t9CyZQkq8pnNWGtya5h1+6K+K3qBG+DmDAYtDK/AP1Y=;
	b=O3p3f3kZm4TFlY1NelmpKG1z9BDBcxfKzQIAtKelrb5Oj8d3CugkaLL2D5HOOqRe4s
	2p12tpTGgU6j06oC4ZFej2mA2e45B296j2FPtUqXyr2Ry4eyZz6OdTZlf19E9qQlVzAc
	gTGCoLkG3ThRsEpa+qyJ2bWTbCaUMW1O1J9b3vkFwsfXdb1jy/fOU3fy/MbD/FHZTflZ
	A6ep4vsrdm98BD0y25B5BhhWyknsMywPCV6O5+xFmB0TmH11mqLSancCcHRKGyU48J4q
	Vx6OucvMFJxgJUNPq+I5AF4TEDSsAcUbT1UEuV5d1elLUeReIoChCTsgWobYnT/yqZgY
	hxnQ==
MIME-Version: 1.0
X-Received: by 10.66.136.78 with SMTP id py14mr11815486pab.1.1434553513950;
	Wed, 17 Jun 2015 08:05:13 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Wed, 17 Jun 2015 08:05:13 -0700 (PDT)
In-Reply-To: <1434547172-24620-10-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1434547172-24620-10-git-send-email-alexander.kanavin@linux.intel.com>
Date: Wed, 17 Jun 2015 17:05:13 +0200
Message-ID: <CALbNGRTOzzmCBthScS4EZg9z7YHT9i6+RXxYgSX2LTjzS8RGjg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/22] Add a recipe for libsecret
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
X-List-Received-Date: Wed, 17 Jun 2015 15:05:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 17, 2015 at 3:19 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> libsecret is a dependency of webkit
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-gnome/libsecret/libsecret_0.18.2.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
>
> diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
> new file mode 100644
> index 0000000..cebc83b
> --- /dev/null
> +++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "libsecret is a library for storing and retrieving passwords and other secrets"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
> +
> +inherit gnomebase gtk-doc
> +
> +DEPENDS = "glib-2.0 libgcrypt"
> +
> +EXTRA_OECONF += "--disable-manpages"
> +
> +SRC_URI[archive.md5sum] = "23cdf8267d11a26f88f0dbec1e2022ad"
> +SRC_URI[archive.sha256sum] = "12fd288b012e1b2b1b54d586cd4c6507885715534644b4534b7ef7d7079ba443"
> --
> 2.1.4
>
> --
I think I have seen this recipe somewhere.. A note would have been nice

Andreas

