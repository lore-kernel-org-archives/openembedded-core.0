Return-Path: <slemieux.tyco@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2853671A8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 12:49:23 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 203so2602689ith.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 04:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=etMKKBmZx2qwHnshIvlrzdNoYd8Tw5O7JFa5OGE+Z8s=;
	b=GsIJkI74Il7cFwz+BQsIFwdF7vlTXBcHAW8dBNsETeaFVkvBnrmnl5YLUjSD9xIuJn
	nuZ9wiyK93At6O0xnGzJ2v4LZDQidtEAE3PZI8HqU7SGl5pFrpPmDfkkz5JKC6VDx2x7
	wOBz9BOEQKeMxsNsYuo3ol3tXZfQCTwWzi7ih8JQrmiHRaaUgBHP6uDIJdBSdDRI9S4s
	EILIkapcM7LGCMxLOwTlke3wjYZpSp3Vamgq3/DlLwQKV7oZjdbLJCFnY2rQIg1TA4mj
	/ogtZ1B3iDAzDeY3C7jgGInfB8KvJHznd64ebt3dIlcNOi4edkKyufOQGmgZEA6UwozU
	bnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=etMKKBmZx2qwHnshIvlrzdNoYd8Tw5O7JFa5OGE+Z8s=;
	b=LcMbbL3mpdwr+KUGwmytlBcTLGgAlFTno1Jp4vBnnmsJP/e52z3wuzUi1LIfPFrZZh
	Yf/VdwUI7jL1nShHWeR5C2kV3HDpvxAs4mSY4bZJcIftBrvOXHzNfFGAbL3gVqcihrSR
	GpLxDNbnUqxRq9MePw29egRCFxEs5Afk2HcOYmamkM7oOAGu9Z5S+wqC8ILlW8EAVHfM
	J+NGQw0NwQNZBNJ7W3hFa/9zlk2tNbd+S5gL0EZknYqwJboyOL9dbsEQvha2wgbROGGC
	Leorr/NVKyV/nI5LqhFgmLZ9OX1qAS5FiMv6JQBbIK6GRaZOCMgOzk1tpSKd0LHk1MFT
	dNRw==
X-Gm-Message-State: AMke39l781Eousv7fw3d73F5NdkHENagNd0G/3f7TkfWgonwZ94brXx15qq73vHtVopQyQ==
X-Received: by 10.107.151.136 with SMTP id z130mr6391341iod.181.1487335764064; 
	Fri, 17 Feb 2017 04:49:24 -0800 (PST)
Received: from CABRO3AP00510 ([74.51.240.241])
	by smtp.googlemail.com with ESMTPSA id
	r85sm506247itc.13.2017.02.17.04.49.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 04:49:23 -0800 (PST)
Message-ID: <1487335761.9202.2.camel@gmail.com>
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 17 Feb 2017 07:49:21 -0500
In-Reply-To: <bf27f4f0-f8b3-07a8-c65b-1dc563a7f6c3@mlbassoc.com>
References: <20170216204750.21475-1-slemieux.tyco@gmail.com>
	<bf27f4f0-f8b3-07a8-c65b-1dc563a7f6c3@mlbassoc.com>
X-Mailer: Evolution 3.12.11 (3.12.11-15.el7) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: setup "inetd" sub-package
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
X-List-Received-Date: Fri, 17 Feb 2017 12:49:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Gary,

On Fri, 2017-02-17 at 04:56 +0100, Gary Thomas wrote:
> On 2017-02-16 21:47, Sylvain Lemieux wrote:
> > From: Sylvain Lemieux <slemieux@tycoint.com>
> >
> > Setup "inetd" as a sub-package in "busybox" and
> > add the support to install "inetd" as a startup script.
> >
> > Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> > ---
> >  meta/recipes-core/busybox/busybox.inc | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> > index 39c2eef082..a26fa08ca8 100644
> > --- a/meta/recipes-core/busybox/busybox.inc
> > +++ b/meta/recipes-core/busybox/busybox.inc
> > @@ -21,7 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
> >  # We don't want '-e MAKEFLAGS=' in EXTRA_OEMAKE
> >  EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
> >
> > -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> > +PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-inetd"
> >
> >  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
> >  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
> > @@ -29,8 +29,9 @@ FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfd
> >  FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
> >  FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
> >  FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
> > +FILES_${PN}-inetd = "${sysconfdir}/init.d/inetd.${BPN} ${sysconfdir}/inetd.conf"
> >
> > -INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
> > +INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-inetd"
> >
> >  INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
> >  INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
> > @@ -38,6 +39,7 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
> >  INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
> >  INITSCRIPT_NAME_${PN}-syslog = "syslog"
> >  INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
> > +INITSCRIPT_NAME_${PN}-inetd = "inetd.${BPN}"
> >
> >  SYSTEMD_PACKAGES = "${PN}-syslog"
> >  SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
> > @@ -45,7 +47,7 @@ SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
> >  CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
> >  CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
> >
> > -RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
> > +RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc ${PN}-inetd"
> >
> >  inherit cml1 systemd update-rc.d ptest
> >
> >
> 
> Doesn't this patch conflict with your previous one adding the -cron sub-package?
> 
Yes this patch will not apply on top of the previous one.
I sent them this way, because both patch are independent.

If you prefer, I can send a v2 as a series.

Regards,
Sylvain
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------



