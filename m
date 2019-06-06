Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id D308F7DE74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 16:21:30 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id h20so882578itk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JF/EEzUTFcVXzNgNm5FXyAD5BQjHBK7xoJijImZezuA=;
	b=Hin1orN+FVSZNTFbI6AU/hh00Ofs/MuHiisw2YDUenWC2LRIQxCnnALZefiU000ahs
	lAI+OtoviuLfl6Aj0svPmZT//47cDj0XsZgvkaKTwufVqJ10jeNyXDH/+i1Qu5fVw0XT
	cV1iRPyQfEidLAZrwzIjSinHHss+xQP7/+I0zoctCyxs9r3UErRz6HtGXpCNhXD/A3qA
	AuhtgzgPcoBBiQvhBV+gu6n/xwLPhFRTBTIPy80FcwHLdd4Zc9iGbQ34WLZe0yg2CFcb
	BvB59B+xxtgimJWSmYgOrQcHpOI1hkiHnwS5jzZ0/k+heNzh0v21zR66UenST+l9y3cA
	OD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JF/EEzUTFcVXzNgNm5FXyAD5BQjHBK7xoJijImZezuA=;
	b=ADdA3wwQU6b5o006LovgnS9541TBlN1KTWtCMmQBK848yjyo9AlQZ/RA5uLLTeiV7z
	m5FUJ2ULwd6vQy5NuFZrUkEOGtA4UdHF+ZHmu0wP2VsYmwDbFU/tpZBk08IWPrqof3Sr
	C16ARNYSHWyLNaCZeFbZOk+02eV4borWwm51Jd44WHERnzIjLpoy7HEmQtJ+7UTQpWtC
	TfvPxLRr4uccSkmxHznOCEV3XLlcLUlb/fHidvEY4YDtpEcqCo8O+j9p38o78dP4vvL2
	DbPz/0xgMfnJ0YfLiWpiPxVOv6vBk3GlmmOrO3//S9WsREcme9y2h2gxL06q/wppY+eV
	ozQQ==
X-Gm-Message-State: APjAAAXzyguOka3sX5G95Xu6y/UgP9Ui8mD+AvzsKpWCs11DPoUYk0Ev
	OssSrVYp8ynY+hFaSBkyLz/AQf9GE27jAF0IaOdoSA==
X-Google-Smtp-Source: APXvYqwU1FAkxdaXGEQM7eOBHXl3JIjYLHVPqISlXtrzrZ6qRU4r0oLta0eURHgUCw1Doy0GjUXc++MlGF9K3NhP83E=
X-Received: by 2002:a24:64c5:: with SMTP id t188mr703808itc.83.1559838091931; 
	Thu, 06 Jun 2019 09:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190606151814.5114-1-nick83ola@gmail.com>
	<20190606151814.5114-3-nick83ola@gmail.com>
In-Reply-To: <20190606151814.5114-3-nick83ola@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Jun 2019 17:21:20 +0100
Message-ID: <CAJTo0LbbohRqYwtFz954moOAiVCBay-X-37JK-Rui+pErXZ-ag@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] rng-tools: armonize systemd and sysvinit files
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
X-List-Received-Date: Thu, 06 Jun 2019 16:21:31 -0000
Content-Type: text/plain; charset="UTF-8"

Do you mean "harmonise?"

Ross

On Thu, 6 Jun 2019 at 16:18, Nicola Lunghi <nick83ola@gmail.com> wrote:
>
> this commit will permit to have a default file
> both in the systemd and in the sysvinit file
>
> Also reorganize the install_append function
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  .../rng-tools/rng-tools/default               |  3 +--
>  meta/recipes-support/rng-tools/rng-tools/init | 21 ++++++-----------
>  .../rng-tools/rng-tools/rngd.service          |  4 ++--
>  .../rng-tools/rng-tools_6.7.bb                | 23 ++++++++-----------
>  4 files changed, 19 insertions(+), 32 deletions(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
> index ab7cd9327f..b9f8e03635 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/default
> +++ b/meta/recipes-support/rng-tools/rng-tools/default
> @@ -1,2 +1 @@
> -# Specify rng device
> -RNG_DEVICE=/dev/hwrng
> +EXTRA_ARGS="-r /dev/hwrng"
> diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
> index 7cf78393a4..13f0ecd37c 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/init
> +++ b/meta/recipes-support/rng-tools/rng-tools/init
> @@ -1,26 +1,19 @@
> -#! /bin/sh
> +#!/bin/sh
>  #
>  # This is an init script for openembedded
> -# Copy it to /etc/init.d/rng-tools and type
> +# Copy it to @SYSCONFDIR@/init.d/rng-tools and type
>  # > update-rc.d rng-tools defaults 60
>  #
>
> -rngd=/usr/sbin/rngd
> +rngd=@SBINDIR@/rngd
>  test -x "$rngd" || exit 1
>
> -if [ -e /etc/default/rng-tools ]; then
> -    . /etc/default/rng-tools
> -fi
> -
> -if [ -n "$RNG_DEVICE" ]; then
> -    EXTRA_ARGS="-- -r $RNG_DEVICE"
> -fi
> -
> +[ -r @SYSCONFDIR@/default/rng-tools ] && . "@SYSCONFDIR@/default/rng-tools"
>
>  case "$1" in
>    start)
>      echo -n "Starting random number generator daemon"
> -    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
> +    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
>      echo "."
>      ;;
>    stop)
> @@ -38,11 +31,11 @@ case "$1" in
>      start-stop-daemon -K -q -n rngd
>      echo "."
>      echo -n "Starting random number generator daemon"
> -    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
> +    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
>      echo "."
>      ;;
>    *)
> -    echo "Usage: /etc/init.d/rng-tools {start|stop|reload|restart|force-reload}"
> +    echo "Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|restart|force-reload}"
>      exit 1
>  esac
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> index f0355db14f..b1a78527be 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> @@ -5,8 +5,8 @@ After=systemd-udev-settle.service
>  Before=sysinit.target
>
>  [Service]
> -ExecStart=@SBINDIR@/rngd -f -r /dev/hwrng
> -SuccessExitStatus=66
> +EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
> +ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
>
>  [Install]
>  WantedBy=multi-user.target
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.7.bb b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
> index 9cc5951345..12cda9ae1e 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.7.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.7.bb
> @@ -50,18 +50,13 @@ do_configure_prepend() {
>  }
>
>  do_install_append() {
> -    install -d "${D}${sysconfdir}/init.d"
> -    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
> -    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
> -        ${D}${sysconfdir}/init.d/rng-tools
> -
> -    # Only install the default script when 'sysvinit' is in DISTRO_FEATURES.
> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> -        install -d "${D}${sysconfdir}/default"
> -        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
> -    fi
> -
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
> -    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
> +    install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
> +    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
> +    install -Dm 0644 ${WORKDIR}/rngd.service \
> +                     ${D}${systemd_system_unitdir}/rngd.service
> +    sed -i \
> +        -e 's,@SYSCONFDIR@,${sysconfdir},' \
> +        -e 's,@SBINDIR@,${sbindir},' \
> +        ${D}${sysconfdir}/init.d/rng-tools \
> +        ${D}${systemd_system_unitdir}/rngd.service
>  }
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

