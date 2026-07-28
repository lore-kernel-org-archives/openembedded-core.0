Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B70C54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 14:00:42 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12142.1785247237375233480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 07:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iJgsuqAm;
 spf=pass (domain: smile.fr, ip: 209.85.218.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15f020a223so526289566b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 07:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785247236; x=1785852036; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wq3vHQS2R3281/wX5STDR3nazuCwNLYt0yrghdsHb3I=;
        b=iJgsuqAm8XSfIcvsSmiKlablih8LdxgW+K2M43XAQW9f73s3X7meeyTcdBQDxMm9cM
         Tc4tc6PXX9XlYePCc654MuhK+rdXru70B0naZiyQseny+CJXoHCfwk1A28BxfHi/3PpB
         O9sQWrD0XVdujxTNSVznNjE+gls8V7UjAX2s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247236; x=1785852036;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wq3vHQS2R3281/wX5STDR3nazuCwNLYt0yrghdsHb3I=;
        b=Vh4PCPaBlNe4Jqk+AdB8UzoI3z09m9+0FEPVogVw751NHB6KvJogE6tb6O5My+RufW
         onVZ8VOVkaM31wkakHnMIijdLl8zZB18uVPcY0c2Cteo/XSyALDK2O2k+ZVXoy0VAHeV
         e/NyuaQ2eQA5sfWn4MH29wVXa66CMVyeJ0SnDFMaD7Ou9ETkuMeZ7tuBLW65MDHELyvv
         9iD5SNhAd3hnCln+M48vU8xNErMEmPz8QWBTLnLJVyzz0eu12B8+gBVd6PPWQqcRlZ2R
         siPjpOqLpI/aeGIM0Fut99DWOXN6/R0GPNh6V/e01+l2FhU/pVd6DtkhWDJbqslXbv4q
         w+4w==
X-Forwarded-Encrypted: i=1; AHgh+RpeetLT1Bo3+l3ZQD0lccCJTm1iw+PxB4+bvCfMJ0raut5VHcapAxGO4AeT6pAlFQxxbVKK5kceYMTSEOj760r4dg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVuvnz6r5fybW0OoIQUtySJTxFYQc7wiJwrMCrJ9nAjBxOBqND
	QI1Flv5TtiyzwB7zUr3iRPOWvqTjB0OCO4hZGiHsSjKUwLMlR0ZSQ7MSjyWYhrrV6hg=
X-Gm-Gg: AR+sD12TAEaRTthuI0ebVm6tqQmHMwnvAZNhClJPYQ2KfgZrU+9mpTYkOrcSwyt9L6r
	ra3+u1oUng2nG/nurf4xdqOJ53PMWP+RAXQlJdF5QNXqAYB9EcrMOl39eEeebAA3LkeklDiQ1Lk
	CTb+9lRJvIw0QLsRa3gYJC7P+s4uV9FqN9ue+Ji2ujT2XjBIb/uOXq5LpWwEZC7mQ4J0sCfNA+f
	v/SA5sZnGXxvDUkUg1pA5F478Xse1NxqplPhVoAbsH4eHAjSv3tgWhz0grLy/i1W4HyZ6NS2Gcq
	GjrtNvBz7TRp0ZrhbNgp1MaafiVXIpgLz1O912LjqtbHvb9HHId91/ZoEnqVmuSvHMhjhCjnH6b
	UIp6dXw+5vryQw83XvyhaElSP8uKFvrUCcQ1j+JUtbePy/MKqSeXbnrwy0m92rHPWPIhzZN+z1B
	K4e9SS1dDWJUZSwDTnFQ/o3Uhw4VYdx5AxNzcrAos+HYOVrOKUyg5kVW6rnT9fFQ==
X-Received: by 2002:a17:907:fd89:b0:c15:bcb0:fc5f with SMTP id a640c23a62f3a-c1f7218f076mr157876766b.47.1785247235447;
        Tue, 28 Jul 2026 07:00:35 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90b42sm790824666b.38.2026.07.28.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:00:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 16:00:34 +0200
Message-Id: <DKA9BTHYY16T.2Z07XWAT3C7MP@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
To: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
X-Mailer: aerc 0.20.0
References: <20260612121514.2282121-1-asparmar@cisco.com>
 <DKA8EDJ6USH4.2QWN8732Z6OV8@smile.fr>
 <SJ0PR11MB5896A3DCBC1BB59645700280CFCB2@SJ0PR11MB5896.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB5896A3DCBC1BB59645700280CFCB2@SJ0PR11MB5896.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 14:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242195

On Tue Jul 28, 2026 at 3:50 PM CEST, Ashishkumar Parmar -X (asparmar - E IN=
FOCHIPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> Thanks for reporting this.
>
> I checked the Debian 11 build failure. The Scarthgap rsync changes curren=
tly include <linux/openat2.h> and use SYS_openat2 unconditionally. The Debi=
an 11 build headers do not define SYS_openat2, so the compilation fails.
>
> My local validation passed because the available build headers define SYS=
_openat2, so it did not cover this older-host case.
>
> I also checked whether upgrading to the upstream v3.2.7-sec-patches1 tag =
would resolve the problem. It would not: that tag has the same unconditiona=
l SYS_openat2 use and does not contain the required configure-time portabil=
ity check.
>
> The current upstream v3.2.7-sec-patches branch includes the follow-up com=
mit:
>  https://github.com/RsyncProject/rsync/commit/729ec83612d43e361ada1870173=
b525bc0b9ebac
>
> This checks for both <linux/openat2.h> and SYS_openat2 during configure, =
defines HAVE_OPENAT2 only when both are available, and retains the existing=
 fallback on older systems.

Sounds good.

>
> Once you confirm,
> I will add this follow-up to the Scarthgap series and rerun both rsync-na=
tive and rsync build validation before sending a v2.

Please also test debian11 (I used a quick container to reproduce)

Thanks!
--=20
Yoann Congal
Smile ECS


