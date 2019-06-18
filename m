Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60ADF7E8FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 12:34:10 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w9so2207331wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=lPSQKJ4NFSDMaJOz3dGPZOImWIdq195waIIZDZbPN2M=;
	b=GUM8++jeaxmg7vj4z/od1U1f0XlnV10GTrnjtyM+TNjGzMDSln1jd/CuoDBTlZy3eC
	myojVAva6lklqLW9OXIZKplOg9SNZu8pO7L+xHYOZ7+RzyFl2zTaoWJCb93Z5NIQzAdJ
	frTzIBIhytVXdX1r9lkKRttlo21rvjWEnc3Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lPSQKJ4NFSDMaJOz3dGPZOImWIdq195waIIZDZbPN2M=;
	b=BpRpPRqhNrCgYp+1DIaNr8dTQrYQXE9w3jbWXLQImV2q4GgqaLB2eiRVtkZiU1/X0V
	Vd+1IuE8finBnwJJ7ngh3GEcAzCsFafEUQhRgeWnUIt84S8tAqn9qRBDPDDIx8yKaI1U
	w0YCSAbYkmhHQjVxLDEivDh2oOxWgD5OHL/QqYLhTQeUgVx5xo9bnd3B1wr45xUX4My7
	AVze0h3vs9Sl8wBkY1dp8YdEqhWEr38yY0zgk9wlgmdbVg0jFmJI45nSlYGoHMmztV2D
	BqL53YVk6dua66qrnOzbBD7owC3wUByj4UooPUrjcRGP9yUOPatr9tZq8DIBuYzoUwjM
	BuQw==
X-Gm-Message-State: APjAAAUrFZeKNvb/u/kcLYxe9ZS1WeVtVHfzAny34LeBG8lSHDapzm/8
	KN3k+aTmkvtXiBrG/S+IABxJOU9s4rY=
X-Google-Smtp-Source: APXvYqzTmD7DiG2zFfjrnS9lJPibZ696o8HzE7UIcceAV9TtI/XXSzPKNR3RhVejfaxdwzzBZPUmYA==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr2844822wml.124.1560861250931; 
	Tue, 18 Jun 2019 05:34:10 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g5sm15913157wrp.29.2019.06.18.05.34.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 05:34:10 -0700 (PDT)
Message-ID: <bb0334d27a1ec6cb25e6eb5b994a89c56f311c7d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 13:34:09 +0100
In-Reply-To: <20190618061128.17422-1-bunk@stusta.de>
References: <20190618061128.17422-1-bunk@stusta.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] wireless-regdb: Add recipe
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
X-List-Received-Date: Tue, 18 Jun 2019 12:34:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-18 at 09:11 +0300, Adrian Bunk wrote:
> Since wpa-supplicant is provided,
> the database of permitted frequencies should also be provided.
> 
> wireless-regdb-static should be used with kernel >= 4.15.
> wireless-regdb can be used with older kernels and is mostly
> irrelevant here, but keeping it in meta-networking would
> create needless recipe duplication.
> 
> This package was previously in meta-networking.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../packagegroups/packagegroup-base.bb        |  1 +
>  .../wireless-regdb_2019.06.03.bb              | 44
> +++++++++++++++++++
>  3 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-kernel/wireless-regdb/wireless-
> regdb_2019.06.03.bb

This seems to break deb rootfs construction:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/712

> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 38fc711f5c..26851d66e0 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -726,6 +726,7 @@ RECIPE_MAINTAINER_pn-weston-init = "Denys
> Dmytriyenko <denys@ti.com>"
>  RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-which = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-wic-tools = "Anuj Mittal <anuj.mittal@intel.com
> >"
> +RECIPE_MAINTAINER_pn-wireless-regdb = "Adrian Bunk <bunk@kernel.org>
> "
>  RECIPE_MAINTAINER_pn-wpa-supplicant = "Changhyeok Bae <
> changhyeok.bae@gmail.com>"
>  RECIPE_MAINTAINER_pn-x11perf = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-x264 = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
> b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index cae704aa24..d05403635c 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -271,6 +271,7 @@ RRECOMMENDS_packagegroup-base-ipsec = "\
>  SUMMARY_packagegroup-base-wifi = "WiFi support"
>  RDEPENDS_packagegroup-base-wifi = "\
>      iw \
> +    wireless-regdb-static \
>      wpa-supplicant"
>  
>  RRECOMMENDS_packagegroup-base-wifi = "\
> diff --git a/meta/recipes-kernel/wireless-regdb/wireless-
> regdb_2019.06.03.bb b/meta/recipes-kernel/wireless-regdb/wireless-
> regdb_2019.06.03.bb
> new file mode 100644
> index 0000000000..df50938a1a
> --- /dev/null
> +++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "Wireless Central Regulatory Domain Database"
> +HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA
> "
> +SECTION = "net"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
> +
> +SRC_URI = "
> https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
> +SRC_URI[md5sum] = "4b5ba3f089db7fdb7b9daae6a7c1f2cb"
> +SRC_URI[sha256sum] =
> "cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf"
> +
> +inherit bin_package allarch
> +
> +do_install() {
> +    install -d -m0755 ${D}${nonarch_libdir}/crda
> +    install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
> +    install -m 0644 regulatory.bin
> ${D}${nonarch_libdir}/crda/regulatory.bin
> +    install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-
> regdb/pubkeys/sforshee.key.pub.pem
> +
> +    install -m 0644 -D regulatory.db
> ${D}${nonarch_base_libdir}/firmware/regulatory.db
> +    install -m 0644 regulatory.db.p7s
> ${D}${nonarch_base_libdir}/firmware/regulatory.db.p7s
> +}
> +
> +# Install static regulatory DB in /lib/firmware for kernel to load.
> +# This requires Linux kernel >= v4.15.
> +# For kernel <= v4.14, inherit the kernel_wireless_regdb.bbclass
> +# (in meta-networking) in kernel's recipe.
> +PACKAGES =+ "${PN}-static"
> +RCONFLICTS_${PN} = "${PN}-static"

To work with apt/dpkg this may need an RPROVIDES and/or RREPLACES.

Cheers,

Richard



