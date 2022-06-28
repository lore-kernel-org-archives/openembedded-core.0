Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72558C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 16:03:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.95.1656432219274543409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 09:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=diLkScW5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id r20so18404301wra.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=HpNkS3LPLpnr/I+6bjdhWryzz9RIN6BuW1NJr/XAMTA=;
        b=diLkScW5C9qzlDPvctbOxiICjU5+kL+rYxKcpWgy3I5eIQVEhFKSabHbAfVxTW+7QC
         fKsKzCYNFqr6xQ9553cLMsjOb/mwedhYLzp593q32Z4ek63aHSOWpsfVxhUMZCjQKJRB
         u5e1/FIOCrb0kLgN2eJjNYakTteqpCwiicCqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=HpNkS3LPLpnr/I+6bjdhWryzz9RIN6BuW1NJr/XAMTA=;
        b=2mL1DbW92A+puICTpRdxIQYCZspkd5/a9yRozdEjtjD4v5AChQrXdsjXoH6sm7ebbq
         JiBMgXFfJR3gpRk/cMswnQCOC0lcMMeaIWukfeWbT4gDT8HT43G3XU5oURJ2gYFtqa0R
         OlTgvAppVy8BUG2vdATQMIbwaa6Ab7rNafnkWaW/JU4fhVonebLSskSLxJKBtIidnDql
         AZzxH6RS/WSqkl0L/agCgfKbdPA4XlJhEfiYSVtRqgymoVSeSnmkH1MJq6l1KCJ3U76k
         orD5kcnvGYydDdWV1DyqWGjoJC8FzuGzStfheyD1UPl0n+hlM7fUld6DP00HovfDrwwP
         la+w==
X-Gm-Message-State: AJIora/pbIN5M/U/WFzqMPz0K0V7Ojl6VBebXC1gzzVhA5z2xgkPTxn8
	V7Jtn4zbmWPCShtTJ9GjkyW2Pg==
X-Google-Smtp-Source: 
 AGRyM1sX7SsQgDFd6/lIQXd17iFq7DY0T3gY5J8kHw3nQzk21bXRZN3H2jNRL/YWB1iUXpie3oABaw==
X-Received: by 2002:a5d:6c64:0:b0:219:ea71:306f with SMTP id
 r4-20020a5d6c64000000b00219ea71306fmr17762939wrz.223.1656432217492;
        Tue, 28 Jun 2022 09:03:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1624:49b4:7dc4:c660?
 ([2001:8b0:aba:5f3c:1624:49b4:7dc4:c660])
        by smtp.gmail.com with ESMTPSA id
 v14-20020a1cf70e000000b003a02de5de80sm31533wmh.4.2022.06.28.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 09:03:36 -0700 (PDT)
Message-ID: 
 <738df83db6fae233af819932c4bf56174cac0528.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc-tests: not clear BBCLASSEXTEND
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2022 17:03:36 +0100
In-Reply-To: <20220628152228.16791-1-kai.kang@windriver.com>
References: <20220628152228.16791-1-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 16:03:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167350

On Tue, 2022-06-28 at 23:22 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> It clears BBCLASSEXTEND in glibc-tests recipe to remove 'nativesdk'
> which is set in glibc recipe. The side effect is that it removes
> "${MULTILIBS}" at same time if multilib enabled. Then there will no
> multilib version glibc-tests. So only remove 'nativesdk' from
> BBCLASSEXTEND rather than clear it.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-tests_2.35.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-c=
ore/glibc/glibc-tests_2.35.bb
> index 414f8660de..028e83e865 100644
> --- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
> @@ -18,7 +18,8 @@ python __anonymous() {
>         d.setVar("PROVIDES", "${PN} ${PN}-ptest")
>         d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
> =20
> -       d.setVar("BBCLASSEXTEND", "")
> +       bbclassextend =3D d.getVar("BBCLASSEXTEND").replace("nativesdk", =
"").strip()
> +       d.setVar("BBCLASSEXTEND", bbclassextend)
>         d.setVar("RRECOMMENDS", "")
>         d.setVar("SYSTEMD_SERVICE:nscd", "")
>         d.setVar("SYSTEMD_PACKAGES", "")
> @@ -95,7 +96,7 @@ python populate_packages:prepend () {
>          d.setVar('DEBIAN_NAMES', '')
>  }
> =20
> -FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
> +FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/${PN}/*"
> =20
>  EXCLUDE_FROM_SHLIBS =3D "1"
>=20

Have you tested the multilib glibc-tests and been able to use it
successfully?

Cheers,

Richard


