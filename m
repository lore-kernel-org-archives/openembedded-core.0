Return-Path: <ross.burton@intel.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 394FB6A9E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:18:34 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h1so1708035oag.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 03:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=JMkW08I45O9NP1tFPb/MxylganFhvLfClI4M1EnZHmA=;
	b=WonEniHPwXXoFwpzRdiy5GFkITWXQgwsQDMJzeXf5GxsRAma5PYVX5xeJq4ulcbeXM
	f5/lexlzHH4lA6DWgv1FSVj2INNSYipKGCxBOG+VWL7QKtuxrRY17wB4Xp0I0OI8mBKE
	QpDmuUTgOghgLmvvokMQTyysCU5uoWr7PsUiIexdyoIHWkkA7rH5hg4lF7tJidf7hqiL
	uMD5MITv9+WO6ysYwiZ29WPDOY4y4HwR5v84Av1skJnb56XGKZixdZ/g/cE5iSvidPUZ
	r7eVvn9xul2oBD10URd+GTs2IEKGJhD0esM/iZqM9Z8QBhz7Iq3G5xlpFPcMfYeqopWN
	cGXw==
X-Received: by 10.182.144.231 with SMTP id sp7mr5389515obb.14.1372933115326;
	Thu, 04 Jul 2013 03:18:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.160.41 with HTTP; Thu, 4 Jul 2013 03:18:15 -0700 (PDT)
In-Reply-To: <c9b8490c65d03e9bc3f603d2a3a20ea680c089aa.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
	<c9b8490c65d03e9bc3f603d2a3a20ea680c089aa.1372890071.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 11:18:15 +0100
Message-ID: <CAJTo0Lbqz_0HT0Q80CcvjUuQSNqurEYfHDLCo_Ujj8eFWCF6dg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlQ2CMWXLrlz9bF+g2XIrGi+NZH90CoE57Q+fcJWnkVdp3NOvf3XBV9A7cpQ1UXMtbJ2V0H
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] util-linux: disable runuser by default since it depends on PAM
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
X-List-Received-Date: Thu, 04 Jul 2013 10:18:34 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2013 23:26, Saul Wold <sgw@linux.intel.com> wrote:
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -45,6 +45,7 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
>                  --disable-vipw --disable-newgrp --disable-chfn-chsh --disable-su \
>                  --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
>                  --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
> +                --disable-runuser \
>                 usrsbin_execdir='${sbindir}' \
>  "
>
> @@ -52,7 +53,7 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
>  EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--enable-socket-activation', '--disable-socket-activation', d)}"
>  EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
>
> -EXTRA_OECONF_append_class-native = " --disable-login --disable-su"
> +EXTRA_OECONF_append_class-native = " --disable-login --disable-su --disable-runuser"

Surely the class-native append is redundant?

Also, is runuser something that we should enable if the pam distro
feature is enabled?

Ross

