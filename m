Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EA5C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:05:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.11443.1645715125334446761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xfk9/eoy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d28so99345wra.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=APqRNwEv5PD4futNzSCq/Zfv1knuxmZ0iA4GbB0pb5g=;
        b=Xfk9/eoysa4FcpKQCY5Gapl8RhsRTo65aDIBF5/NQhawf5+HycoF49iX8wEbjAAPSQ
         qzsSVltrO0kO9BhGVV6E+JI2B8Ty9NTMJfQkkDSMVL3PfkXkHqZc3JxlvE9v7E30s77f
         cjKsILgi945g0l1nwF3kK9V7gsleD6jtTpK6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=APqRNwEv5PD4futNzSCq/Zfv1knuxmZ0iA4GbB0pb5g=;
        b=lLkxs0CCX05eRgZQ8bYjsVdHgYpnqqkX8yrk5G6nZJTmx4IAKnHoXZctiLyZz2r83f
         ofj0RtFrCX/Xf5PIEfkCnZuzRS2QoIdScweDV5ncrvnIGDBY5eChyMtacziPM3+hlXPX
         7kssEgSEO+/lIo9V2wp+dfTDlMpxLmJlQ8Xo/xAfMCbxH2q/9viowtLgeFNc+VzRb73z
         YNCpRbPflqo+MNkSxY3IFkXb0cXDPz4peCUwljNPfe96unAdQx2bSji9VqD/kuUQrb+8
         l89ZhWJk/SC25yOf05+5o/pPpy/c5godClZcOJnna0osB4AgoGonONfexy4QhABMkuv8
         yb7A==
X-Gm-Message-State: AOAM531bxAMIpLCeif1LUHx4us0odthJ5mcZau6wpQyIITutQWb1OFVL
	AHj8QtEDlz/6jj0xvyW9BZq6m4QMiy/3CzBc
X-Google-Smtp-Source: 
 ABdhPJyWKTO5nKDKEZ+w/K5SSsE8D92t4aZgvrnxz+NacwkYEeEkaIyiDlH+ZXE+WxisQ+CrqV6hLQ==
X-Received: by 2002:adf:f608:0:b0:1e3:1ee5:ee6 with SMTP id
 t8-20020adff608000000b001e31ee50ee6mr2602586wrp.460.1645715123792;
        Thu, 24 Feb 2022 07:05:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d62:f765:e1dc:ad89?
 ([2001:8b0:aba:5f3c:3d62:f765:e1dc:ad89])
        by smtp.gmail.com with ESMTPSA id
 g6sm2934412wrq.97.2022.02.24.07.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 07:05:23 -0800 (PST)
Message-ID: 
 <21f4c04019c2ef890b0c2a3cc726d90bacfa4ad6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] libsndfile1: bump to version 1.0.31
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandru Ardelean <ardeleanalex@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Feb 2022 15:05:20 +0000
In-Reply-To: <20220224125927.32821-1-ardeleanalex@gmail.com>
References: <20220224125927.32821-1-ardeleanalex@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:05:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162319

On Thu, 2022-02-24 at 14:59 +0200, Alexandru Ardelean wrote:
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> deleted file mode 100644
> index b8e703d084..0000000000
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -SUMMARY = "Audio format Conversion library"
> -DESCRIPTION = "Library for reading and writing files containing sampled \
> -sound (such as MS Windows WAV and the Apple/SGI AIFF format) through \
> -one standard library interface."
> -HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
> -AUTHOR = "Erik de Castro Lopo"
> -DEPENDS = "flac libogg libvorbis"
> -SECTION = "libs/multimedia"
> -LICENSE = "LGPL-2.1-only"
> -
> -SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
> -           file://CVE-2017-6892.patch \
> -           file://CVE-2017-8361-8365.patch \
> -           file://CVE-2017-8362.patch \
> -           file://CVE-2017-8363.patch \
> -           file://CVE-2017-14634.patch \
> -           file://CVE-2018-13139.patch \
> -           file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
> -           file://CVE-2018-19432.patch \
> -           file://CVE-2017-12562.patch \
> -           file://CVE-2018-19758.patch \
> -           file://CVE-2019-3832.patch \
> -          "
> -
> -SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
> -SRC_URI[sha256sum] = "1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
> -
> -CVE_PRODUCT = "libsndfile"
> -
> -S = "${WORKDIR}/libsndfile-${PV}"
> -
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
> -PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> -PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
> -
> -inherit autotools lib_package pkgconfig multilib_header
> -
> -do_install:append() {
> -    oe_multilib_header sndfile.h
> -}
> -
> -# This can't be replicated and is just a memory leak.
> -# https://github.com/erikd/libsndfile/issues/398
> -CVE_CHECK_IGNORE += "CVE-2018-13419"
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
> new file mode 100644
> index 0000000000..c70c2f32a5
> --- /dev/null
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Audio format Conversion library"
> +DESCRIPTION = "Library for reading and writing files containing sampled \
> +sound (such as MS Windows WAV and the Apple/SGI AIFF format) through \
> +one standard library interface."
> +HOMEPAGE = "https://libsndfile.github.io/libsndfile/"
> +AUTHOR = "Erik de Castro Lopo"
> +DEPENDS = "flac libogg libvorbis"
> +SECTION = "libs/multimedia"
> +LICENSE = "LGPL-2.1-only"
> +
> +SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.bz2 \
> +          "
> +
> +SRC_URI[md5sum] = "3f3b2a86a032f064ef922a2c8c191f7b"
> +SRC_URI[sha256sum] = "a8cfb1c09ea6e90eff4ca87322d4168cdbe5035cb48717b40bf77e751cc02163"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
> +
> +CVE_PRODUCT = "libsndfile"
> +
> +S = "${WORKDIR}/libsndfile-${PV}"
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
> +PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
> +
> +inherit autotools lib_package pkgconfig multilib_header
> +
> +do_install_append() {
> +    oe_multilib_header sndfile.h
> +}

Thanks for this, I was a little surprised the do_install:append became a
do_install_append which doesn't work with current bitbake?

Generating the patches with -M should help make these kinds of differences
clearer too. It does look like we've missed out on a few versions of this.

Cheers,

Richard



