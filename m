Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26006C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 18:27:17 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.1143.1646072835961464159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hW0lRJjD;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id f21so11016585qke.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OXAssJmzPuQu8CFLq/gh3tqMlpn1DRie6Bp3+iSXoKw=;
        b=hW0lRJjDHPE91GnHVaiHrfz6OUKrFcX2GbfuDGguAOUQYKv3KVV4VLC23PwSpatWXG
         lpWzTdBxBCXmLQo0177gyhwjP4VucQLgMEDK7P5yI14lXH8f6Xep83U2axEFT30tr5jG
         65XoLV3vt4ooxgCQRSHNk7djSXRu8yC2SXu9EiqQ4ZjSWJO1hXYww7zvHeYiF9jPBnyr
         pBZufgpSzhgVQmZArq19Z1848Vzb4jarTCd0oI7mIztOI8fl/n7wpB5oaz+t6zNx+GWt
         gWSCEqQ/2KaADFxv9JZ7qyWZ9GZq4MM+tW6p9RaISY7KZ253amiUNsh3gzGZZeZWBkqK
         /BwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXAssJmzPuQu8CFLq/gh3tqMlpn1DRie6Bp3+iSXoKw=;
        b=IUSWjyLH0WB2itY4+FKKTz6gQwbde7K7P5gFrIa6dYf+WML9y0SMhX1HLv7G+qeJst
         cQNbyehtY5ad15wvVB1lqBDTyxtVV2KT3HEWGoTUeHZuIrgrP2a9zV2pLrHL9LDlT2hd
         5cSMRtzeXXYKPPhHs/rzhE52CyzT6RSDSr6SBwLy7zkLeRUzc0U9BDdRI2B+jD5Vifdr
         LpNBpZJ5+QprJqDtavD5VR0iFvsEEdaXVj6N956E7QKET+PRfqojKIEdDPJ29xLAZJnC
         k26zHwsdIQoj3mN1EoKZf1/Bn/8FVC5g48Ri0adLaUITOZfuZhXIOzn6ugya/sXjdwvx
         ogPg==
X-Gm-Message-State: AOAM530z6WkgnaQaOP/0PSVtw3vEyIOlgmNKL9UEbVolkkPpgT8xiIua
	ypnFrQuqnrO2ieyWvnKufp/7NauNDNyvWErrbxo=
X-Google-Smtp-Source: 
 ABdhPJxz3x8sb2WOyDZBGhPxnIk1SmP/+J+dijyXPYJVZ230vqNRbFJ+UB4og60X92NOolAvEqNGZSoo37Qoz1Izllc=
X-Received: by 2002:a37:b541:0:b0:475:4524:bb4b with SMTP id
 e62-20020a37b541000000b004754524bb4bmr12106490qkf.149.1646072834957; Mon, 28
 Feb 2022 10:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20220228181413.2943079-1-tom.hochstein@nxp.com>
In-Reply-To: <20220228181413.2943079-1-tom.hochstein@nxp.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 10:26:48 -0800
Message-ID: 
 <CAMKF1soeXmno+9xs_Tg91PpXbvkZq74graDzbyNstzYCVv8arA@mail.gmail.com>
Subject: Re: [OE-core] [meta-python][PATCH] python3-pybind11: Override pip
 install variables
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 18:27:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162514

please resend it to oe-devel ml.

On Mon, Feb 28, 2022 at 10:14 AM Tom Hochstein <tom.hochstein@nxp.com> wrote:
>
> Fix the pip install variables since the default values don't work
> here.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
> index dfacb41f1..4d94e2033 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
> @@ -19,6 +19,9 @@ EXTRA_OECMAKE =  "-DPYBIND11_TEST=OFF"
>
>  inherit cmake setuptools3 python3native
>
> +PIP_INSTALL_DIST_PATH = "${S}/dist"
> +PIP_INSTALL_PACKAGE = "pybind11"
> +
>  do_configure() {
>         cmake_do_configure
>  }
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162513): https://lists.openembedded.org/g/openembedded-core/message/162513
> Mute This Topic: https://lists.openembedded.org/mt/89457175/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

