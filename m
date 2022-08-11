Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1666EC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 11:18:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.5186.1660216707155484393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 04:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bkOq+0eJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id h1so73478wmd.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=mdd5jCcZ0Q5Qphowo7H8QdwOvQHkMPRR+CfVODcs/Jc=;
        b=bkOq+0eJ5VbcgNfk5TUbPL0Ic6H9dP2k61uyhSOcwe1eXiSAXRhJ5/MKOzDImQ79V/
         34sQC8bmf9qH0RYvTwQttoBbwE1qwaUJTJXIGhLe1yE/fdG1WcKePziZWlG30+J2rk4X
         4ZHhTAyhGnshdYx1CUbAVx99GBVDSb4blkagw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=mdd5jCcZ0Q5Qphowo7H8QdwOvQHkMPRR+CfVODcs/Jc=;
        b=v0X2lZB1gIxLdq21YpkI93roILVbsmwgyr0bCYcFtZoEZE0OSGPQEj+ZDzeswbDfrR
         xRBBkeZb6LWGIouDLizf/Tng7k6Iafh4JsNiUJejpL0e7d6hahvSgvTc5IDHd0XJVpVV
         TaeBY77wfLmFvIhbysyqThdkNVI34uNjjMRrUbK2Fynxvsp17n0WeftU+6NE1poYFABu
         mYD4tOXRpTBr7nqRaEWuBkrU2D3KKE9XLW87lE+f7m4ztFW8igiLjwB6sCWxK4/WkeBN
         ZplzkHcBYMTX1ieFIFWGTUguJh1Z56qNRRrzEluD+e+C3a5H26tzvwhGBozeKPqUjEuy
         bPAA==
X-Gm-Message-State: ACgBeo07denZKdRp54VqxPq4V2j7wIdrSRdmZ+pi7a7EvMqngBgdYNKm
	CJHdLKvZHAIsAcZkmo5zfkA9qw==
X-Google-Smtp-Source: 
 AA6agR6yCH3U2wB5eetfsxWXmqX/GkgSz2Z21xMCvbvCYZ+qUjwe5N3SnPWqvoRKEHLtDAgaqpvKJA==
X-Received: by 2002:a05:600c:a02:b0:39c:97cc:82e3 with SMTP id
 z2-20020a05600c0a0200b0039c97cc82e3mr5348052wmp.97.1660216705427;
        Thu, 11 Aug 2022 04:18:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7?
 ([2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7])
        by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b003a30fbde91dsm6791140wmq.20.2022.08.11.04.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 04:18:24 -0700 (PDT)
Message-ID: 
 <4a201b8f37bf865f46f3f9362ce4bac59618658d.camel@linuxfoundation.org>
Subject: Re: [PATCH v2 1/1] ltp: Add post release runtime fixes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <pevik@seznam.cz>, openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Daniel =?ISO-8859-1?Q?D=EDaz?=
	 <daniel.diaz@linaro.org>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Aug 2022 12:18:24 +0100
In-Reply-To: <20220723203014.5332-1-pevik@seznam.cz>
References: <20220723203014.5332-1-pevik@seznam.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 11:18:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169241

On Sat, 2022-07-23 at 22:30 +0200, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
>=20
> Backport various post 20220527 release runtime fixes:
> * The concept of max runtime
> * tst_test.sh: Cleanup getopts usage
> * mountns0[1-3]: wait for umount completed in thread_b
>=20
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * add patches to SRC_URI (Khem Raj)
>=20
>  ...-Fix-usage-of-PAGESIZE-from-memcg_li.patch | 121 ++++++++++++++
>  ...ait-for-umount-completed-in-thread_b.patch |  63 +++++++
>  ...x-usage-of-variables-from-tst_net.sh.patch | 154 ++++++++++++++++++
>  ...0001-netstress-Restore-runtime-to-5m.patch |  53 ++++++
>  ...fs05_make_tree-Restore-5-min-timeout.patch |  31 ++++
>  ...igrate_pages03-restore-runtime-to-5m.patch |  44 +++++
>  meta/recipes-extended/ltp/ltp_20220527.bb     |   6 +
>  7 files changed, 472 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-memcg-functional-F=
ix-usage-of-PAGESIZE-from-memcg_li.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-=
for-umount-completed-in-thread_b.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usa=
ge-of-variables-from-tst_net.sh.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-netstress-Restore-=
runtime-to-5m.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Re=
store-5-min-timeout.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_p=
ages03-restore-runtime-to-5m.patch
>=20
> diff --git a/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usag=
e-of-PAGESIZE-from-memcg_li.patch b/meta/recipes-extended/ltp/ltp/0001-memc=
g-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
> new file mode 100644
> index 0000000000..6cc36cda79
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PA=
GESIZE-from-memcg_li.patch
> @@ -0,0 +1,121 @@
> +From bda92ad659a52d38ac810099f69adff626b064c6 Mon Sep 17 00:00:00 2001
> +From: Joerg Vehlow <joerg.vehlow@aox.de>
> +Date: Mon, 27 Jun 2022 10:44:49 +0200
> +Subject: [PATCH] memcg/functional: Fix usage of PAGESIZE from memcg_lib.=
sh
> +
> +$PAGESIZES is set in memcg_lib.sh, which was moved to the bottom of the =
file.
> +
> +Fixes: 04021637f ("tst_test.sh: Cleanup getopts usage")
> +
> +Reviewed-by: Petr Vorel <pvorel@suse.cz>
> +Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
> +[ upstream status: bda92ad659a52d38ac810099f69adff626b064c6 ]

Thanks for these. I did merge them, I just wanted to note that in
future the format for upstream status is:

Upstream-Status: Backport [bda92ad659a52d38ac810099f69adff626b064c6]

We have code that uses these so the format is standardised. I fixed the
ones in this series up manually.

Cheers,

Richard

