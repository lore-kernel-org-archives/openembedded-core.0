Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57732CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 08:41:27 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.125371.1781512885833285437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 01:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A7mXhuza;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49222fb062bso19968035e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 01:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781512884; x=1782117684; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvN53u2XgpUt43OzXtumkPkeJsMIYYxSqpYrOZigQuI=;
        b=A7mXhuzaMryWjC+LoeheGz6nBgS/qSJ3nzELdk6FkHKk9b+kg5B/W9cPZjlMIuQ48A
         2YB4GMnokKYIh7LBA/hwtNEJd05+RJYUqWvhfNAmGPG6C8L9aytD54A9f8OeAMeDgw9M
         CS4t+WmFjqsGvmqWHb4dFNF8CvCrv0XKZOQpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512884; x=1782117684;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CvN53u2XgpUt43OzXtumkPkeJsMIYYxSqpYrOZigQuI=;
        b=pNvU7z7WfMQWauFbM8t7oDWJXhkB5Ur2HFEAEd+jy+Wq8TEXU+hHpLt5mQ/M42jpWB
         ifPAJtSLHfcPEyn4x5wm5D9YcYdxQu4c84NC0z7jMqxL1JvngK5SzCsjY0yyp05h3V9o
         9vE9XUPj30LUBeOgc/5e0fHIW7pqq5Icl1aehD/GjjMlYMfQ0af2CxUL5JU42E2GNzv3
         LWUHByEhj+KIzTVzW+E/6OUg6852BtBubTR02WSM3iXDeUbzQ2Mm7FT8AxS8A+rAZhkG
         w72lk42s7JOXX8moEDYzxxJfXhkf/KWPjLB3/pyTj0E/cSh16Y/L7CMIA5W/YWmCyMLf
         eDIg==
X-Forwarded-Encrypted: i=1; AFNElJ9zKq7pbh4XuKgZEJj42G3z6wf3OJaQA42dKFfr5pXqLWCHlmTHIhYk8LZiNTKgWnGay71EgS521Pq2mTxtf1SK4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxMJmoTYciVBJJdJtNP5GYRgQ09BG43EXpt1c1oiFcnaspHMacR
	Rc9PqIfWgYFpG9CmYRr2oeZiyByNxDqGXPor0ADDe+bNBFZZui5metDo6mFHMNiMKsE=
X-Gm-Gg: Acq92OEojyDf8/c2iK1hFIhnxsAgdq25HsdEwrbC5ESFsvns/b+6r7ENOMg5K08QThE
	JtKjsbNze7IHCMikTObcJpBYPwLW6+RSZB/S9XYQ+qpOWQnGuBSfNs1j7ADQOCf4otorDeO9a24
	6PNfl3fGc2iukIKdjA1yx2c+rwAJPznzQh6vW8vROwvsYWt45wBiRZI3v/znfKGIcivmTPLpHaC
	Woy1uPoeG3fs4onVZvWEj07AJ5pb4vUKaBoxuV+DOdi0f+FIVy72h/d7fmc2x+3CfKee+dlfsUN
	xHyKwckM2UxTVujNDGnmr8xilkG8i1cVjbmoha7baKRxdjJZ0k6iczm9oWZz2RELw0Df54o2VlA
	kNIDuLubKCD4C4ci8nHTSH1n8A+9y0z/kMGegb0v6Y4cKBzg2vBt/2C7PgbYi6EGwv/KBZRbYIx
	42ikMSkNT7cr+n859YfFxndppfLpvuiBmUlZNgG3iw6Q2aYh95NvGRKAtgDfXszvqKBSE43NbK8
	9Oasi+nh2m0MM8=
X-Received: by 2002:a05:600c:82c3:b0:490:bb45:79f0 with SMTP id 5b1f17b1804b1-490ec499290mr158365965e9.3.1781512883700;
        Mon, 15 Jun 2026 01:41:23 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5d61sm216492355e9.1.2026.06.15.01.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:41:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 10:41:22 +0200
Message-Id: <DJ9HM01CT21Q.2HLOH1RLAP4JN@smile.fr>
Subject: Re: [OE-core] [master] [PATCH] apt: fix CVE-2011-3374
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260612122954.1229967-1-adongare@cisco.com>
In-Reply-To: <20260612122954.1229967-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 08:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238823

On Fri Jun 12, 2026 at 2:29 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Details: https://security-tracker.debian.org/tracker/CVE-2011-3374
>
> The vulnerability is a design-level flaw in the legacy apt-key utility re=
garding
> the global trust model of GPG keys.
>
> This is marked as not-applicable-config because apt-key net-update is
> disabled by default, and Debian vendor configuration does not define the
> archive keyring URI required to use that path. Ignore this CVE in this
> recipe due to this configuration.
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---

Hello,

"Fix" in the commit is a bit misleading. How about
"mark CVE-2011-3374 as not-applicable"?

Also, please add a justification for
"apt-key net-update is disabled by default"
In this case, the commit:
  Use sq in the test suite, remove apt-key
  https://salsa.debian.org/apt-team/apt/-/commit/a00fbbdb2
is present since 2.9.19.

Finally, in this case, the "fixed-version" CVE_STATUS might be more
appropriate. (Maybe reflect the new status in the patch title)

Thanks!

>  meta/recipes-devtools/apt/apt_3.0.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtoo=
ls/apt/apt_3.0.3.bb
> index 08b6bac2e4..ad75f3b32a 100644
> --- a/meta/recipes-devtools/apt/apt_3.0.3.bb
> +++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
> @@ -34,6 +34,9 @@ UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/a/apt/"
>  # to express 'divisible by 4 plus 2' in regex (that I know of), let's ha=
rdcode a few.
>  UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(=
3\.8)|(4\.2))(\.\d+)+)\.tar"
> =20
> +# Not applicable: Debian vendor configuration does not enable apt-key ne=
t-update.
> +CVE_STATUS[CVE-2011-3374] =3D "not-applicable-config: apt-key net-update=
 is disabled by default and Debian vendor configuration has no archive keyr=
ing URI"
> +
>  inherit cmake perlnative bash-completion useradd
> =20
>  # User is added to allow apt to drop privs, will runtime warn without


--=20
Yoann Congal
Smile ECS


