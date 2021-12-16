Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E852EC4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 17:27:04 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.13529.1639675623056605433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1mxuWr-0005iJ-V9; Thu, 16 Dec 2021 18:26:53 +0100
Received: from localhost ([127.0.0.1])
	by ptx.hi.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1mxuWq-0000U2-QT; Thu, 16 Dec 2021 18:26:52 +0100
Message-ID: <3ab3fab5a6355a247b9f539e5db6a5a7187a2909.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH 1/2] busybox: refresh the defconfig from 1.33.0
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Martin Jansa <Martin.Jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Dec 2021 18:26:52 +0100
In-Reply-To: <20210310133731.1890031-1-Martin.Jansa@gmail.com>
References: <20210310133731.1890031-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 (flatpak git) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 17:27:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159801

Hi Martin,

I just noticed that since this change, syslogd is compiled in by default, even I
have SRC_URI:remove = "file://syslog.cfg" in a bbappend. Is this intentional?
Otherwise, I'd prefer change the back to disabled by default (SRC_URI still
contains syslog.cfg by default).

Regards,
Jan

On Wed, 2021-03-10 at 14:37 +0100, Martin Jansa wrote:
> -# CONFIG_LOGREAD is not set
> -# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
> -# CONFIG_SYSLOGD is not set
> -# CONFIG_FEATURE_ROTATE_LOGFILE is not set
> -# CONFIG_FEATURE_REMOTE_LOG is not set
> -# CONFIG_FEATURE_SYSLOGD_DUP is not set
> -# CONFIG_FEATURE_SYSLOGD_CFG is not set
> -CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=0
> -# CONFIG_FEATURE_IPC_SYSLOG is not set
> -CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
> -# CONFIG_FEATURE_KMSG_SYSLOG is not set
> +CONFIG_LOGREAD=y
> +CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
> +CONFIG_SYSLOGD=y
> +CONFIG_FEATURE_ROTATE_LOGFILE=y
> +CONFIG_FEATURE_REMOTE_LOG=y
> +CONFIG_FEATURE_SYSLOGD_DUP=y
> +CONFIG_FEATURE_SYSLOGD_CFG=y
> +# CONFIG_FEATURE_SYSLOGD_PRECISE_TIMESTAMPS is not set
> +CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
> +CONFIG_FEATURE_IPC_SYSLOG=y
> +CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=64
> +CONFIG_FEATURE_KMSG_SYSLOG=y

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

