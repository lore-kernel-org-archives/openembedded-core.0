Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2920C7DD6D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 15:20:30 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id l26so415637lfh.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=IXIk4EGQGI/hf50NufJzwu335K6RQm6Q1zwiqO5X2gU=;
	b=f/x8MC3tTPg3b+1GIKWPultet0BkIt6ALdl4Iy1gymWybxJUlsndCJrXm0+cSSg8E+
	Se/h1/abdsmVd0sHaVxYjB+r7y96vyDtN54GLdnXR7zcppNbDyFCNqDt0Lz4RVTQpldU
	VjQ/T5NC9faIc6F/K216bfNsBlYkr3nTNziMaKJtX3/mrYRAj5pVFZjnJho0ZbUaKKdT
	//QEd36YrntveMv2RIIs5elxPMnd9ZN1qE5OOW/1NQNeYKC3d6H64mfqUnPDED3ZkBDH
	N7HEFPUuhYptIYBNEs/3LZNJyWKp+Znc3h8DCzPSk8u44krOFAEuvD81NXPt0gy24TxZ
	EmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=IXIk4EGQGI/hf50NufJzwu335K6RQm6Q1zwiqO5X2gU=;
	b=fKlCA7JMm49jHGlu7e7tADkadENmZkyoeYyyJicQvxWyRqMvXOMoU5dLTAzUVVrSYK
	v2s5DNYNN5WBqUkQJm8stKWsL7oCv4Do3+iItH2ZcLsyKD/6VoRFn4OMhjWCAu7zzxYj
	bHauCmwf0Yufy6aisVeFwl/9vzwP0AV626UVV4Gq882/7gxzjl4V78vpPsQBvLw50MVn
	wIMFUEiTZTEIDe/Czd+N/v7h+Hps2rfhWE1PQYRCcw/hSMuSr+7gUwOrwS+BWrWzh8pC
	cdnPLIuKeFJ6792tsF2J/RifDEypIjET06a2v/CrxIdbr7vme7M+SjFBXBfCLqBLu9A3
	5HrA==
X-Gm-Message-State: APjAAAUigemVbndZknwxg35tTF7wg+xuoNH0MRz2atOfofjQIJ5pJ0sm
	f/d6uk/rWzRo8529MRU/r1RVHd7ZsyHU9uzBoU+OeieD
X-Google-Smtp-Source: APXvYqzk64rsiyRBwNsZMzN9z3TGZxI74cTEOhnq22JHtwVVQowlmgO4twTm66jLs3VW1n18gYEmFR+GAOs4Bydexf8=
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr23573007lfl.1.1559834430329;
	Thu, 06 Jun 2019 08:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190606151814.5114-1-nick83ola@gmail.com>
In-Reply-To: <20190606151814.5114-1-nick83ola@gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 6 Jun 2019 16:20:18 +0100
Message-ID: <CABPh3UNaYtGr8nJdBxnaQwUzxj_jgyzd_wO9v2z_NOEsBFZ1RA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] rng-tools: recipe cleanup
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
X-List-Received-Date: Thu, 06 Jun 2019 15:20:30 -0000
Content-Type: text/plain; charset="UTF-8"

posted v2 of this with an extra patch please ignore

On Thu, 6 Jun 2019 at 16:18, Nicola Lunghi <nick83ola@gmail.com> wrote:
>
> - add missing DESCRIPTION, AUTHOR, HOMEPAGE
> - cleanup DEPENDS
> - fix variable ordering as per https://www.openembedded.org/wiki/Styleguide
> - remove unneeded checks for systemd, sysvinit in do_install
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  .../rng-tools/rng-tools_6.6.bb                | 63 ++++++++++---------
>  1 file changed, 33 insertions(+), 30 deletions(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.6.bb b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
> index 6796c9be9e..41959a2695 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.6.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
> @@ -1,58 +1,61 @@
>  SUMMARY = "Random number generator daemon"
> +DESCRIPTION = "Check and feed random data from hardware device to kernel"
> +AUTHOR = "Philipp Rumpf, Jeff Garzik <jgarzik@pobox.com>, \
> +          Henrique de Moraes Holschuh <hmh@debian.org>"
> +HOMEPAGE = "https://github.com/nhorman/rng-tools"
> +BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -
> -SRC_URI = "git://github.com/nhorman/rng-tools.git \
> -           file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
> -           file://0002-Add-argument-to-control-the-libargp-dependency.patch \
> -           file://underquote.patch \
> -           file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
> -           file://0001-configure.ac-fix-typo.patch \
> -           file://init \
> -           file://default \
> -           file://rngd.service \
> +DEPENDS = "sysfsutils"
> +
> +SRC_URI = "\
> +    git://github.com/nhorman/rng-tools.git \
> +    file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
> +    file://0002-Add-argument-to-control-the-libargp-dependency.patch \
> +    file://underquote.patch \
> +    file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
> +    file://0001-configure.ac-fix-typo.patch \
> +    file://init \
> +    file://default \
> +    file://rngd.service \
>  "
>  SRCREV = "4ebc21d6f387bb7b4b3f6badc429e27b21c0a6ee"
> +
>  S = "${WORKDIR}/git"
>
>  inherit autotools update-rc.d systemd pkgconfig
>
> -DEPENDS = " \
> -           sysfsutils \
> -          "
> -
>  PACKAGECONFIG ??= "libgcrypt libjitterentropy"
>  PACKAGECONFIG_libc-musl = "libargp libjitterentropy"
> +
>  PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
>  PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
>  PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentropy,libjitterentropy"
>  PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2 openssl"
>
> +INITSCRIPT_NAME = "rng-tools"
> +INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
> +
> +SYSTEMD_SERVICE_${PN} = "rngd.service"
> +
>  # Refer autogen.sh in rng-tools
>  do_configure_prepend() {
>      cp ${S}/README.md ${S}/README
>  }
>
>  do_install_append() {
> -    # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> -        install -d "${D}${sysconfdir}/init.d"
> -        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
> -        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
> -            ${D}${sysconfdir}/init.d/rng-tools
> +    install -d "${D}${sysconfdir}/init.d"
> +    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
> +    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
> +        ${D}${sysconfdir}/init.d/rng-tools
>
> +    # Only install the default script when 'sysvinit' is in DISTRO_FEATURES.
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
>          install -d "${D}${sysconfdir}/default"
>          install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
>      fi
>
> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> -        install -d ${D}${systemd_unitdir}/system
> -        install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
> -        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
> -    fi
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
> +    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
>  }
> -
> -INITSCRIPT_NAME = "rng-tools"
> -INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
> -
> -SYSTEMD_SERVICE_${PN} = "rngd.service"
> --
> 2.20.1
>

