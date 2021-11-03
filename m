Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0FCC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 15:13:19 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.9169.1635952398554518287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 08:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=15/39kgU;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id s3so7107542ybs.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 08:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uhrVDKDgS7ehZffXrxY42DYHopfHMtTycbZoeW1W1g0=;
        b=15/39kgUnoSkTVJSsGjRbm9PId2F9NiwDdji43EaAZpEp5OjIOkBI79SSVbvEj0dCy
         OWi4j49ZbYTovkCyWMrTCcQyBOVIFHAi5tcAByF4Hk6cwqcbnmmdDdTfk90G8nde3Z4D
         YLE4QTXEa4uIMjeyWTa3WEfuXopa0bUe6o6gYkRfjdO3aCt4YFJ3LpiPu3EWNHdGtXLr
         e/EWgqQdTbPHR1gyRanYeZHqlradpSPZt+FGnZDomA1dlYuf8HGuSDnPUYQ+LPqTGanX
         WYUSZuRacCyFhmm0T4V/FCYEORpsvBlqsytCkrs2nlYLxZoDYKKzB2liiaLii53j66gr
         fL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uhrVDKDgS7ehZffXrxY42DYHopfHMtTycbZoeW1W1g0=;
        b=tPH6rJFbj012b/8TnVqRFyd8xeEaZTe0Fa+EN9F5iF4LW00VfxOKxGFsqMEaGTvCJx
         h5DpSoHb8WihhKevTteRBhRwNMbKSgyWrDOnbtkShuFXAVgOmwsjPbbB6RIP691zu2pt
         kWUPt2MhF3SgVrb7v4XI8fYzstpe/NdtVHOfWlBYDc4ZzcKTLyFm7kFBx4oD21bwbsNK
         OgkMN+40dFcy6lx+u/NlJsct0Dfuz5tQOePH+qdvF77T9MsVZS18IBYhewHA/Hz5RxMu
         vloQRt5ldipBUNuUhXGS2mMPVjotRuwW7fV3tQ9qGEtUzJ9kGasq/vyWfjYlZc2QDcwL
         fiCw==
X-Gm-Message-State: AOAM532V112FcoLf3UqrMNU0HE8lwXGAz02+WeNyNro/+KpEh2uJWXso
	Hp5SzKlfFU6j9BHgvbRWEogADCXI1omSS/3jjW8=
X-Google-Smtp-Source: 
 ABdhPJxtfy2Fxt/wEIIUCakcX4C1vDESjIhXep4HtqZ0/GCW5QSRYzFu/BxW5v94vHmf3HbhylpqLCCEb7VZnhtUkcg=
X-Received: by 2002:a25:f211:: with SMTP id
 i17mr50315238ybe.378.1635952397707;
 Wed, 03 Nov 2021 08:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211103072015.7401-1-rybczynska@gmail.com>
In-Reply-To: <20211103072015.7401-1-rybczynska@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 3 Nov 2021 05:13:06 -1000
Message-ID: 
 <CAGDS+nkBhgVrxJ0VcN7xmzDuPRWewP092GATLdJ0faLCT-13ag@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][meta-oe][PATCH] networkmanager: update to
 1.22.16
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 15:13:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157829

Hi Marta,

Thanks for the patch submission!

Since this is for meta-openembedded, it should be sent to
openembedded-devel@lists.openembedded.org, not the oe-core list.

Similarly, you shouldn't use the [oe-core] tag, just the [meta-oe] tag.

There are different maintainers for oe-core and meta-openembedded so
these two things will make sure that the right person sees the patch.

Best regards,

Steve

On Tue, Nov 2, 2021 at 9:20 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> NetworkManager 1.22.16 contains a fix for CVE-2020-10754.
>
> This version includes an additional option by default for firewalld zones,
> --enable-firewalld-zone that installs additional files. Disable it to
> keep the old behaviour if no firewalld.
>
> Also include a patch for fixing reallocarray usage from gatesgarth
> meta-openembedded 165ad9ad4c86c9e63f3afcf3172c8e1d3629f3a5 required
> for the build.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> ---
>  .../fix_reallocarray_check.patch              | 27 +++++++++++++++++++
>  ...r_1.22.10.bb => networkmanager_1.22.16.bb} |  7 ++++-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb} (95%)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
> new file mode 100644
> index 000000000..0a8de5410
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
> @@ -0,0 +1,27 @@
> +reallocarray() is coming from stdlib.h which maybe indirectly included
> +by malloc.h but not on all libc implementations
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -114,7 +114,7 @@ config_h.set10('HAVE_GETRANDOM', use_sys
> + # FIXME secure_getenv check is not useful?
> + config_h.set('HAVE_SECURE_GETENV', cc.has_function('secure_getenv'))
> + config_h.set('HAVE___SECURE_GETENV', cc.has_function('__secure_getenv'))
> +-config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <malloc.h>'))
> ++config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <stdlib.h>'))
> + config_h.set10('HAVE_DECL_EXPLICIT_BZERO', cc.has_function('explicit_bzero', prefix: '#include <string.h>'))
> + config_h.set10('HAVE_DECL_MEMFD_CREATE', cc.has_function('memfd_create', prefix: '#include <sys/mman.h>'))
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -82,7 +82,7 @@ AC_CHECK_DECLS([
> + AC_CHECK_DECLS([
> +       reallocarray],
> +       [], [], [[
> +-#include <malloc.h>
> ++#include <stdlib.h>
> + ]])
> +
> + AC_CHECK_DECLS([
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
> similarity index 95%
> rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
> rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
> index 33a2b7c0c..ff784b8ce 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
> @@ -26,6 +26,7 @@ SRC_URI = " \
>      file://${BPN}.initd \
>      file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
>      file://0002-Do-not-create-settings-settings-property-documentati.patch \
> +    file://fix_reallocarray_check.patch \
>  "
>  SRC_URI_append_libc-musl = " \
>      file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
> @@ -33,7 +34,7 @@ SRC_URI_append_libc-musl = " \
>      file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
>      file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
>  "
> -SRC_URI[sha256sum] = "2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77"
> +SRC_URI[sha256sum] = "377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd4ad72425a68982cffc6"
>
>  S = "${WORKDIR}/NetworkManager-${PV}"
>
> @@ -71,6 +72,7 @@ PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
>  PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
>  PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
> +PACKAGECONFIG[firewalld] = "--enable-firewalld-zone,--disable-firewalld-zone,firewalld"
>  PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
>  # Use full featured dhcp client instead of internal one
>  PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
> @@ -151,6 +153,9 @@ ALTERNATIVE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-co
>  ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
>  ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
>
> +# Issue introduced in 1.26
> +CVE_CHECK_WHITELIST = "CVE-2021-20297 "
> +
>  do_install_append() {
>      install -Dm 0755 ${WORKDIR}/${BPN}.initd ${D}${sysconfdir}/init.d/network-manager
>
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157821): https://lists.openembedded.org/g/openembedded-core/message/157821
> Mute This Topic: https://lists.openembedded.org/mt/86786130/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

