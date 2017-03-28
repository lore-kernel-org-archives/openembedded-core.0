Return-Path: <slemieux.tyco@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8FE71A39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 17:20:56 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id e75so4782725itd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QKI0NR49ulc2tbdxAZ4H0T8bYMZDWaao664OMuVpW0E=;
	b=lB6wCPBENMwgCb048VaO+hNr30D6GfGisYTMzYD6lAeOK0RBOfJiYwQjzRwEsCPxB/
	TvEc+NjHAKagWwtJ7arxn0fqcrXh8K+F94Svygc1xHpN2NmuXOfB3P6q1+Kowtaz6M3k
	K4XtxXxDut/Q8ChPRPSOwEqngwi+AjM4AfAyAc3aR1aToqWls3+5PCTYSHOBmu4zlUkv
	B/BO2QwbtANHz0MLWiKextsByMm09JM2Hu9aUbrWRK+h7m60YCArtGCcZWQt6/87zICz
	r60ooqqqEBUtLFE1OL5UpEbvWXA2F1D05cVRKnSlpl9jPPu47EmEaHWX0QiZ7L5an/6J
	cPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QKI0NR49ulc2tbdxAZ4H0T8bYMZDWaao664OMuVpW0E=;
	b=pPN7iOFA6MwQLKZ77gcJdWwv5gp5SIKUNoUccjNyBY1pX56oAhglSDaAKxyHRJlRqG
	GCbjAjKiQs6Z6kwmc2YhPsgNwSV6mVLJrkNhvnsSE8ORFLNGqt4JOgcMmWBVUbtDJyHw
	nw8oZkUHg8zQ2YYgaXnuoGNgxw4LauauS/Auqc0Pin2nrLkSLPg1EFSTrYJSpT5QWM1W
	D79gorTiXk+Lpab8r94NyDfp1AA2Ac/gb1bl/rwcuGumPYQFMXjixp8DshmrvlgPZMpB
	yWsknjk1Z8bWPm//i/Vxtw/7+P9WEivdlTZ9E8gtA+6B4RICmipupnKLpYWtEi8WfKXY
	k8xQ==
X-Gm-Message-State: AFeK/H3p2Ew1faVzp7adKG14tlfXh7eT4zy0Ce5Wgp0ptvf8teBkj97uFia5P+qxR8NAmA==
X-Received: by 10.107.180.70 with SMTP id d67mr31926986iof.21.1490721658137;
	Tue, 28 Mar 2017 10:20:58 -0700 (PDT)
Received: from CABRO3AP00510 ([74.51.240.241])
	by smtp.googlemail.com with ESMTPSA id
	x127sm1797719itg.26.2017.03.28.10.20.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Mar 2017 10:20:57 -0700 (PDT)
Message-ID: <1490721656.24147.0.camel@gmail.com>
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 13:20:56 -0400
In-Reply-To: <20170307205502.14261-2-slemieux.tyco@gmail.com>
References: <20170307205502.14261-1-slemieux.tyco@gmail.com>
	<20170307205502.14261-2-slemieux.tyco@gmail.com>
X-Mailer: Evolution 3.12.11 (3.12.11-22.el7) 
Mime-Version: 1.0
Cc: gary@mlbassoc.com
Subject: Re: [PATCH v2 1/2] recipes-core: busybox: setup "cron" sub-package
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
X-List-Received-Date: Tue, 28 Mar 2017 17:20:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

ping

On Tue, 2017-03-07 at 15:55 -0500, Sylvain Lemieux wrote:
> From: Sylvain Lemieux <slemieux@tycoint.com>
> 
> Setup "cron" as a sub-package in "busybox" and
> add the support to install "cron" as a startup script.
> 
> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---
> Changes from v1 to v2:
> * Rebased on latest master.
> 
>  meta/recipes-core/busybox/busybox.inc | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 39c2eef082..3bede6307c 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -21,7 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
>  # We don't want '-e MAKEFLAGS=' in EXTRA_OEMAKE
>  EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
>  
> -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> +PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-cron"
>  
>  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
> @@ -29,8 +29,9 @@ FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfd
>  FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
>  FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
>  FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
> +FILES_${PN}-cron = "${sysconfdir}/init.d/busybox-cron"
>  
> -INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
> +INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-cron"
>  
>  INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
>  INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
> @@ -38,6 +39,7 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
>  INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
>  INITSCRIPT_NAME_${PN}-syslog = "syslog"
>  INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
> +INITSCRIPT_NAME_${PN}-cron = "busybox-cron"
>  
>  SYSTEMD_PACKAGES = "${PN}-syslog"
>  SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
> @@ -45,7 +47,7 @@ SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
>  CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
>  CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
>  
> -RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
> +RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc ${PN}-cron"
>  
>  inherit cml1 systemd update-rc.d ptest
>  



