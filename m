Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2EAC5787EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 21:08:24 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id n17so1001437pgf.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=8R8oiB4WjGD6IX+219XonblivByjWjhUJwz4kl6MoaM=;
	b=PRmTbtBg5FhT91QpgMth3H3oYO08MneYV7X/0YQ7PHJg4n1ZbCWCs4Ok+dxRrodvJr
	DExXwKiJxQBQZHbYRIQtg1hSVD3cMXXbiPPTM6yT4zf03bQByo/UyIfMU7fMOyky22ea
	bjVwQf0yVstbcdWUsocUvWepz27Pwpeklh+PUKQiW9tl7AZ0SeDS6JYQfmcBuk2nDcWe
	D/BFXYXTMKLZw6u7Oh1zA2d12rrHy8zGC2i37NDtFn1dzcH7n9fyx0SUMkcbc4rUhbRv
	ydnCTda5z4VX50Hp8fItfuuvdUukH2d+MP/2XtTyahmq8EJhIHLj7AQxHts4CMJFd8l8
	YF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8R8oiB4WjGD6IX+219XonblivByjWjhUJwz4kl6MoaM=;
	b=I3l38avlVTW3UfhmQiS98k9843FpJ5Vxlyd51MLOl79tvx3rYXWof2wP2egdTMtrXJ
	VVHqOlZitEif10IcaKwTMlL/lYKyL0ZLAukWfnXCKoqd/lR8DVs7FEkjoNTZzQAHSJBO
	njdXBq+3YxpIDI/ID7QUP3esRIq4nLjJ4rUwbFcOxYGuIOoxAPm/fom8zf0tbEwXhpQa
	taUZOqmfGZneQJV65iXRC0KrSRopzptVf4M/Ld9FwmKZbkmKbCHJrMC95OwLdPDE/aun
	Ia/A3ZBV6eo3tVVh5nzZ+rqq+6JA0vcrJztfjrn/EJZ02z8QoTqYLCO6a+gqORGSap5N
	FdLw==
X-Gm-Message-State: AKwxytfkxt2SkKUr0k5bSODNjgm591xfAUUJT7qqlty8h2fjsQvotTWD
	unAd+KlftMU873mcaKwd1VCqGcu1
X-Google-Smtp-Source: AH8x2262WNlvzu7LU5QuHK8zLc396SiztYqh+rmRkKJ05BuKx/DQl0zFh6jy97zJYCQrXT6uKzcphw==
X-Received: by 2002:a17:902:50e:: with SMTP id
	14-v6mr15124170plf.360.1517000905810; 
	Fri, 26 Jan 2018 13:08:25 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:8048:8e81:904a:f6ac?
	([2601:646:8880:466c:8048:8e81:904a:f6ac])
	by smtp.gmail.com with ESMTPSA id
	r13sm8335537pgt.27.2018.01.26.13.08.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 13:08:25 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20180123162136.11518-1-alex.stewart@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <02d818cd-6ba1-d375-c454-ca83ff99ed49@gmail.com>
Date: Fri, 26 Jan 2018 13:08:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180123162136.11518-1-alex.stewart@ni.com>
Subject: Re: [PATCH] recipes-core: breakout hwclock.sh from busybox
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
X-List-Received-Date: Fri, 26 Jan 2018 21:08:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/23/18 8:21 AM, Alex Stewart wrote:
> * Move the hwclock.sh initscript from busybox into its own package and
>   recipe (hwclock-init). This script is generally useful for distros
>   that get their hwclock implementation from sources other than
>   busybox (like util-linux).
> 
> :busybox/*
> * Remove the busybox-hwclock package, as it no longer has a purpose.
> * If busybox is configured to include hwclock, the busybox package will
>   RDEPEND on hwclock-init.
> 
> :util-linux/*
> * util-linux-hwclock RDEPENDS on hwclock-init for its initscript.
> 
> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> ---
>  meta/recipes-core/busybox/busybox.inc              | 16 +++--
>  meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 -
>  meta/recipes-core/busybox/files/hwclock.sh         | 83 ----------------------
>  meta/recipes-core/hwclock-init/files/hwclock.sh    | 83 ++++++++++++++++++++++
>  meta/recipes-core/hwclock-init/hwclock-init_1.0.bb | 31 ++++++++
>  meta/recipes-core/util-linux/util-linux.inc        |  1 +
>  6 files changed, 124 insertions(+), 91 deletions(-)
>  delete mode 100644 meta/recipes-core/busybox/files/hwclock.sh
>  create mode 100644 meta/recipes-core/hwclock-init/files/hwclock.sh
>  create mode 100644 meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 4012f921c6..bfcc6ba31a 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -20,19 +20,17 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
>  
>  EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
>  
> -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> +PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev"
>  
>  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
>  FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
>  FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
>  FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
> -FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
>  
> -INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
> +INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev"
>  
>  INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
> -INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
>  INITSCRIPT_NAME_${PN}-mdev = "mdev"
>  INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
>  INITSCRIPT_NAME_${PN}-syslog = "syslog"
> @@ -276,9 +274,6 @@ do_install () {
>  	if grep "CONFIG_UDHCPD=y" ${B}/.config; then
>  		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
>  	fi
> -	if grep "CONFIG_HWCLOCK=y" ${B}/.config; then
> -		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
> -	fi
>  	if grep "CONFIG_UDHCPC=y" ${B}/.config; then
>  		install -d ${D}${sysconfdir}/udhcpc.d
>  		install -d ${D}${datadir}/udhcpc
> @@ -377,6 +372,13 @@ python do_package_prepend () {
>      else:
>          set_alternative_vars("${sysconfdir}/busybox.links.nosuid", "${base_bindir}/busybox.nosuid")
>          set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_bindir}/busybox.suid")
> +
> +    # If busybox is configured to provide a hwclock implementation, add a
> +    # package dependency on hwclock-init for the /etc/init.d/hwclock.sh
> +    # initscript.
> +    with open(d.getVar('B', expand=True) + '/.config', 'r') as fp_conf:
> +        if 'CONFIG_HWCLOCK=y' in fp_conf.read():
> +            d.appendVar('RDEPENDS_busybox', ' hwclock-init ')

I wonder if it has some implications when rebuilding from shared state
since .config might not be there


