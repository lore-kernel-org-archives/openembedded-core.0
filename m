Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id B3F896C0F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 15:59:01 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id c9so8751274itj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 07:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oe4V70G83E95vC8c6WYzAARUHS28T12SWgw4rSUnFqs=;
	b=pM1+1SLnZdccaSnwOtzlFpO8aA5vVFs+Yc+iTcS6rTO4s0l2GO4oaUgZh8onGS/6jO
	q/O/xfNNQB4BoRV0ulF8v+kuJ6lsk/L0yH4YGqCQHNWSOLpQS50XkAw2Sym4sqqmgQxp
	46G5BNdyP81zf0g+kQ3JjRM4gVfeejRw4Hqb7+X7WL/PuGiWpPS0aCwmjGfCk5cHUph+
	7uYkX2QiJk09A2v5iFJr98hv23dgCMNyVxfE9kqmSOKBT1dzrBJWwBhXh75zPCxLGIz4
	ZwV6gTGHgXn3mMzzXOlHUfsJt3mivswlXZVEEjEKDH0X6m9kHKeNk2w7wmJhV6Esitxn
	r6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oe4V70G83E95vC8c6WYzAARUHS28T12SWgw4rSUnFqs=;
	b=I/JIugMnMKpQaK/kEDPNceENoKJXjdsk9EokNkMJvR1LU4kPQwJgnnxmiDud4Dx2d8
	U+Gwyyd/NKpkhxFsEtSCFQG6YkOKKv5iQyvOdnDlCSR/RrY2MGr5+Z2kdgUtCqW/yjVs
	yPSi2Omr6M/igKo31BEl8K7v2m+lMG/GrLT+SNjy4eHJKp2WjufwHOym12k2kC/zGvej
	RdWpY3JT4vvmtSqC0B7nOcwZ8UtqgmmsUntOXUwDB0TNJbT1eZzrKYftNLrW6bRg7ICS
	6P45/wUB6W4d76nLbPctp98Pb5Cn/YoPhdlii+o3mEDP5T6e0t+vPoSOZG9CrPYfxabN
	2i6g==
X-Gm-Message-State: AHQUAuY53ERcfSU2H+b123cyERjDnJ/imbXeuAX3qF5ZM2XXjgYZfTM9
	BCkRrpgKVebQYOqIWiiV3CQfbaZv7C3N7U6WD7eNKA==
X-Google-Smtp-Source: AHgI3IY/Q13sDRmoHHgzc+7ftcPZzPUmH4Rz4aio4QRps9+9XjLsO9OoCIBZeufE1GG2eX7ghb1/H6N+WPXW1nuTxuA=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr1975105itj.62.1549987142635;
	Tue, 12 Feb 2019 07:59:02 -0800 (PST)
MIME-Version: 1.0
References: <20190212054754.2801-1-raj.khem@gmail.com>
In-Reply-To: <20190212054754.2801-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Feb 2019 15:58:51 +0000
Message-ID: <CAJTo0LYDstsDdmO-Y++5nkAuPgk4OFS+bpYTTYKh8edpzW=hkw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] busybox: Remove PN from rdeps of PN-dev
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
X-List-Received-Date: Tue, 12 Feb 2019 15:59:02 -0000
Content-Type: text/plain; charset="UTF-8"

Would a neater solution be to PACKAGES_remove = ${PN}-dev?

Ross

On Tue, 12 Feb 2019 at 05:48, Khem Raj <raj.khem@gmail.com> wrote:
>
> PN-dev is empty and causes dependency loops during SDK build
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 24c15e4aee..2444afabd5 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -21,6 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
>  EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
>
>  PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> +RDEPENDS_${PN}-dev = ""
>
>  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

