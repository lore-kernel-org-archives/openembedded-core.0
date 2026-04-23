Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B36FDEE26
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 16:21:34 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1500.1776961289876973051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 09:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V8efg05n;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so68384195e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 09:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776961288; x=1777566088; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pcz8uVKUbYGNkFiH6c/m9fLGCHOr6o+7MSiNRaxoQkk=;
        b=V8efg05n67OtU6mGQpbgfdcwNTjPF5oStQNpU99B0krA6+/6drBXTBiWAPn51thldu
         sc/lBYEgkU3wNPb9LfWx1d7LA1TTWa9LIIh9BGmjkJSvvIhtYnssz3Vujwo+qFspg0Oo
         x3sZks+gpU7IOCdr0lzqqph+1qAIQJmzQSoKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776961288; x=1777566088;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pcz8uVKUbYGNkFiH6c/m9fLGCHOr6o+7MSiNRaxoQkk=;
        b=BqI806QLC+F6aXMAYf1vPaN3BwF8EhOfQVID6rwTaI/QM1WrQ2q45aNyHwPj4KNBlP
         YIOH/sDNGlN9ji14QnFKvuc0VPay24HuG9L927jy8GdWuEdE1EJrtpqUoCj9oYwL8425
         oKwVTNgM0SmUF6JLPMeCKtQa2HlzDgrObnro4ale+YaeXpt/okzyK9L4JaXQJHzzZWtD
         o5dHPdApW3CJPqQtEl4neLbCPr3XTUdsCLCoxx2i3CcHgDjLakeiol2dJ6tKjq9CM/Cs
         +5VG8VCuiI6O0elRGVCdkFH0Yhxiu3bMNRqzP0BsY6s3F13NZ0n8tHWq9StwEE9lH2D/
         ciiw==
X-Forwarded-Encrypted: i=1; AFNElJ8uQfOU+SdBBqSjgPuxosViHXgoDbGiSXV0UfHGDWkUUx6k6ruz1m4vyRGmynvNxETCNFyM8B+grRryKxrTBh3+RA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywj6V6s5viVkCDs+ib4fEOid1f3DIaKVd1oHbzy3BAQP/xRGGYt
	dDL0RJPCvrJcwZomyPubnfNOHzPBpQWtlDkMhi8lkCNvnEu5YQHZPRRUKmHTj2N/gE4=
X-Gm-Gg: AeBDieuzfhtR9v0uMKJ5qBLXD6ZFxubbk8XRmfdLH/KS6M+pXaOgma/yl3vvRxeumS3
	1K6rE3a9GbABBm0Rn+FtmtEBi9cEgyPZhQncl++VFTeKuIg4MtgTR4H1CnSLki4l6Mi7xtwAPVD
	Q2vF1q2RIuAhhw59lB+T6zKn8j8mn8ejGdg5cN7AnPAvaids7pcwGiZPCTQUzXDX3fxd7WtN6jl
	a5I2oX8st4xag0xBO7w/3G6LT3nDxLs/pz8E6riOdn57ZMaQFoA/73CTEz18tXJhpXKWiwjA7bD
	VH8ETfmegka1TvXwfjjE5uxOs3v2XBnEAo+hRdtPvXd3268lVEPl6JdV23GDpckytdsQYReC8FD
	cBhWNylVL/70/ibsT/NPuQXQc02MqrTksexOneuCXzFJtyOM8BjZDJLTDhifIea9BSzGODMwngN
	qpIuyHmXu+OimV+Znjt5yZqfdMj4NTv1/45ye4/iXnCBCYapgDCR6KFO3aFICU0BFdoy+wxDUnH
	Dt8k5jrxIBQjpvzx6pGQOAN7Q==
X-Received: by 2002:a05:600c:34d3:b0:489:1cda:bbb7 with SMTP id 5b1f17b1804b1-4891cdabf13mr236482925e9.25.1776961288088;
        Thu, 23 Apr 2026 09:21:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a59816b71sm88760095e9.1.2026.04.23.09.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 09:21:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 18:21:27 +0200
Message-Id: <DI0O7DT3OEKM.16YR48C2ZFIHZ@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] openssh: Fix CVE-2026-35414
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <ashissh7@cisco.com>
To: <pahaditechie@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260406073618.3629883-1-pahaditechie@gmail.com>
In-Reply-To: <20260406073618.3629883-1-pahaditechie@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 16:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235825

On Mon Apr 6, 2026 at 9:36 AM CEST, Ashish Sharma via lists.openembedded.or=
g wrote:
> The match_principals_option() function in auth2-pubkeyfile.c used
> match_list() (which performs glob-based, comma-separated matching)
> instead of exact string comparison. When a certificate principal
> name contains a comma, match_list() splits it into multiple patterns,
> allowing an attacker to craft a principal name that gains unauthorized
> access.
>
> Fix by replacing match_list() with a strsep+strcmp loop for exact
> principal matching.
>
> Backport of commit fd1c7e131f331942d20f42f31e79912d570081fa from
> openssh-portable 10.3p1.
>
> CVE: CVE-2026-35414
> Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
> ---

Hello,

Please add a justification in the commit message as to why you think
this is the proper patch to handle this CVE.
I would need a trail from a trusted source (Usualy, NVD or the Debian secur=
ity
tracker) to the patch to merge this and I could not find it.

Thanks!

>  .../openssh/openssh/CVE-2026-35414.patch      | 78 +++++++++++++++++++
>  .../openssh/openssh_9.6p1.bb                  |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35=
414.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.pat=
ch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.patch
> new file mode 100644
> index 0000000000..dbc0968a3f
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.patch
> @@ -0,0 +1,78 @@
> +From fd1c7e131f331942d20f42f31e79912d570081fa Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Thu, 02 Apr 2026 07:48:13 +0000
> +Subject: [PATCH] upstream: Fix matching of authorized_keys principals
> + option against certificate principals containing commas
> +
> +When matching an authorized_keys principals=3D"" option against a list
> +of principals in a certificate, an incorrect algorithm (match_list)
> +was used that could allow inappropriate matching in cases where a
> +principal name in the certificate contains a comma character.
> +
> +Exploitation requires an authorized_keys principals=3D"" option listing
> +more than one principal AND a CA that will issue a certificate encoding
> +more than one of those principal names separated by a comma. Typical
> +CAs strongly constrain which principal names they will place in a
> +certificate. This condition only applies to user-trusted CA keys in
> +authorized_keys; the main certificate authentication path
> +(TrustedUserCAKeys/AuthorizedPrincipalsFile) is not affected.
> +
> +Reported by Vladimir Tokarev.
> +
> +OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
> +
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/fd1c7e131f331942d20f42f31e79912d570081fa]
> +CVE: CVE-2026-35414
> +Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
> +---
> + auth2-pubkeyfile.c | 26 +++++++++++++++-----------
> + 1 file changed, 15 insertions(+), 11 deletions(-)
> +
> +diff --git a/auth2-pubkeyfile.c b/auth2-pubkeyfile.c
> +index 896ea19..e729cc5 100644
> +--- a/auth2-pubkeyfile.c
> ++++ b/auth2-pubkeyfile.c
> +@@ -50,6 +50,7 @@
> + #include "authfile.h"
> + #include "match.h"
> + #include "ssherr.h"
> ++#include "xmalloc.h"
> +=20
> + int
> + auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
> +@@ -146,20 +147,23 @@ auth_authorise_keyopts(struct passwd *pw, struct s=
shauthopt *opts,
> + static int
> + match_principals_option(const char *principal_list, struct sshkey_cert =
*cert)
> + {
> +-	char *result;
> ++	char *list, *olist, *entry;
> + 	u_int i;
> +=20
> +-	/* XXX percent_expand() sequences for authorized_principals? */
> +-
> +-	for (i =3D 0; i < cert->nprincipals; i++) {
> +-		if ((result =3D match_list(cert->principals[i],
> +-		    principal_list, NULL)) !=3D NULL) {
> +-			debug3("matched principal from key options \"%.100s\"",
> +-			    result);
> +-			free(result);
> +-			return 1;
> ++	olist =3D list =3D xstrdup(principal_list);
> ++	for (;;) {
> ++		if ((entry =3D strsep(&list, ",")) =3D=3D NULL || *entry =3D=3D '\0')
> ++			break;
> ++		for (i =3D 0; i < cert->nprincipals; i++) {
> ++			if (strcmp(entry, cert->principals[i]) =3D=3D 0) {
> ++				debug3("matched principal from key i"
> ++				    "options \"%.100s\"", entry);
> ++				free(olist);
> ++				return 1;
> ++			}
> + 		}
> + 	}
> ++	free(olist);
> + 	return 0;
> + }
> +=20
> +--=20
> +2.25.1
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
> index 1cdd888ccb..4d0b9afca0 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -34,6 +34,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://CVE-2025-32728.patch \
>             file://CVE-2025-61985.patch \
>             file://CVE-2025-61984.patch \
> +           file://CVE-2026-35414.patch \
>             "
>  SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd536=
2de09385aa7a777c"
> =20


--=20
Yoann Congal
Smile ECS


