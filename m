Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347A5CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:33:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40819.1781166812690110382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S1gJW2y3;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b64c8311so84102205e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781166811; x=1781771611; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2zHcYRkT1QznhDIL3nVy0IIxaJhRjgBJ9b2FH1LAZo=;
        b=S1gJW2y3JqU2lFQfi0cfN4GD0ijttctK4iPU51duvETiqVMChm/jghe+Ct3ZXlsGm3
         UBUIc0KOZOrxqTy9pYBI7idOosxGt4WRF1WRrNuf2NhdorQ2tFhvrDICMqsDdaE7L8HW
         PSPQ0BPyjlXxcMYc2cfXI2qOXAme52YGmVvmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166811; x=1781771611;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2zHcYRkT1QznhDIL3nVy0IIxaJhRjgBJ9b2FH1LAZo=;
        b=QpBOI9uZFnZXp5OzdN2UjeI8iApgm2MwUbWN1Zq+Vk1bvbs5lD+MHhqWy2bsgBxCLQ
         KecsyU9BRvqwb/Mjhd1Qm4SHAlZfV8JuRxS/3290stZb/3oL4dxMGnb7OmHzraJ984bi
         /rYYgCJR/Ync0evgZfpNO4uTqgRr6+FW2jX8i2fsB1+PhUDDmFtgYaT1yGCAvw5p54BH
         aqiL4ClwAnrXEJRa0WMie+kEHak5f2SEdHfC07a1xtAXe7eil8ufgTZQBIKnsyhFek/r
         ttsucYVeVgvHjtED4exBpl392LfqSX8gzActbAZmBLyVQLdQyMe6j42jTDJCnwWJ60Y1
         ishQ==
X-Forwarded-Encrypted: i=1; AFNElJ8n3YvMjuxdsx67ZY7F94lq6Rj9XAE3uyb3xmwXzKrnJub5v86lJvFWZ8c8y1Q12otx4aYCeeorchseQHzxjNtieA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQQ7YJSLhWFXqnCaozyw5e468pa0uxIiuwJYS61pfmIm8DFfqb
	Wxjx3o34DDV8k2cHSLzn4wv2tFxVyxp8CvX2Nqs43QwbsS2qOTPR6IG/b9qEcQwtFA==
X-Gm-Gg: Acq92OEnD/g7R325QNyNqKj12Qz1gMd4Zg80NxBHFj1E13vsynW+7LW+yjY93b7IXTs
	O46SRsuz/+ovTF4OVq3UoHsufdSPy3clYBGq1v0MHdOTrMFVt/qWiBPby1ECTYIL+KDOAI418LK
	MkzKPLLml8MQ5Fo78WbEPiAQ3LVZNgyL4IuSePgiol9GYo/O+Uj3k1YBa/sZo7uQ//99m/Fw43P
	wOfEgLv49pp9aqhuflVDCA01Wl2Vglm1S6Ti6k+gnZ5Lxnsnrs+uwRVxm8+FaBL//X7fH2nORq6
	H4042rUq8B4Ru8gmgfwZsBl657JQHQ6FHZyYykTHziqLgqTyYoVS5zUeC943xVn5MC6Fbd2CDhu
	bT85leIUP/wjDuvpJpaM8jGD6YIZq0a3bDb5mvso6f4mxGjmlkJVcaBMkB3PaB/gPtqlCPpI0cS
	cZffTnkgc3b4WiVfkeGhnI5Hc7eir58BbcCiXShTq22HlJt8RPQx3WjSaCUn9QVuLLarEOOoCA/
	ilqMDhHmRtTo8wir2ItCYJtTVRtC00=
X-Received: by 2002:a05:600d:640f:10b0:490:adb6:793d with SMTP id 5b1f17b1804b1-490e5623617mr14652825e9.26.1781166810968;
        Thu, 11 Jun 2026 01:33:30 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm62621438f8f.10.2026.06.11.01.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:33:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 10:33:30 +0200
Message-Id: <DJ62XSGKYO25.UE3DCDH36ILV@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] openssh: fix CVE-2026-35386
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260522122927.530024-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260522122927.530024-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238429

Hello Adarsh

This patch seems strange for various reasons

The only thing it does is move the check for valid_hostname, it does not
include the original fix (check for valid_ruser)

This is also strange since this particular fix seems to already be
included (in a slightly different form) in CVE-2025-61984.patch

(also your patch name includes a -1 in its name)

Please check what is going on here... if the above patch fixes two CVE,
please add the second CVE line to the correct patch and rename it to
CVE-2025-61984_CVE-2026-35386.patch

Thanks a lot
Jeremy

On Fri May 22, 2026 at 2:29 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Backport patch to fix CVE-2026-35386.
> https://nvd.nist.gov/vuln/detail/CVE-2026-35386
>
> Upstream fix:
>   https://github.com/openssh/openssh-portable/commit/76685c9b09a66435cd2a=
d8373246adf1c53976d3
>
> Tested with openssh ptest suite via do_testimage on core-image-minimal.
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../openssh/openssh/CVE-2026-35386-1.patch    | 65 +++++++++++++++++++
>  .../openssh/openssh_9.6p1.bb                  |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35=
386-1.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.p=
atch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.patch
> new file mode 100644
> index 0000000000..a4b81bf407
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.patch
> @@ -0,0 +1,65 @@
> +From 96968048d6bb9a3183882b7af0630895bd4e7059 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Thu, 2 Apr 2026 07:50:55 +0000
> +Subject: [PATCH] upstream: move username validity check for usernames
> + specified on
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +the commandline to earlier in main(), specifically before some contexts =
where
> +a username with shell characters might be expanded by a %u directive in
> +ssh_config.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +We continue to recommend against using untrusted input on
> +the SSH commandline. Mitigations like this are not 100%
> +guarantees of safety because we can't control every
> +combination of user shell and configuration where they are
> +used.
> +
> +Reported by Florian Kohnh=C3=A4user
> +
> +OpenBSD-Commit-ID: 25ef72223f5ccf1c38d307ae77c23c03f59acc55
> +
> +Backport notes: The upstream commit uses renamed functions
> +(ssh_valid_hostname, ssh_valid_ruser) that don't exist in 9.6p1.
> +Adapted to use the existing function names (valid_hostname, valid_ruser)=
.
> +
> +CVE: CVE-2026-35386
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/76685c9b09a66435cd2ad8373246adf1c53976d3]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + ssh.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/ssh.c b/ssh.c
> +index 9c49f98a8..951da74fa 100644
> +--- a/ssh.c
> ++++ b/ssh.c
> +@@ -1,4 +1,4 @@
> +-/* $OpenBSD: ssh.c,v 1.599 2023/12/18 14:47:44 djm Exp $ */
> ++/* $OpenBSD: ssh.c,v 1.630 2026/04/02 07:50:55 djm Exp $ */
> + /*
> +  * Author: Tatu Ylonen <ylo@cs.hut.fi>
> +  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
> +@@ -1160,10 +1160,14 @@ main(int ac, char **av)
> + 	if (!host)
> + 		usage();
> +=20
> +-	if (!valid_hostname(host))
> +-		fatal("hostname contains invalid characters");
> ++	/*
> ++	 * Validate commandline-specified values that end up in %tokens
> ++	 * before they are used in config parsing.
> ++	 */
> + 	if (options.user !=3D NULL && !valid_ruser(options.user))
> + 		fatal("remote username contains invalid characters");
> ++	if (!valid_hostname(host))
> ++		fatal("hostname contains invalid characters");
> + 	options.host_arg =3D xstrdup(host);
> +=20
> + 	/* Initialize the command to execute on remote host. */
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
> index 1cdd888ccb..98176a971b 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -34,6 +34,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://CVE-2025-32728.patch \
>             file://CVE-2025-61985.patch \
>             file://CVE-2025-61984.patch \
> +		   file://CVE-2026-35386-1.patch \
>             "
>  SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd536=
2de09385aa7a777c"
> =20


