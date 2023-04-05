Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4513BC76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 08:24:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.125238.1680683067344093480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 01:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WwzEyIEu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id j24so35378692wrd.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680683066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XE1VIiSCddDbFhshK9xglScVhPutbMZovZ2vAJBYQc=;
        b=WwzEyIEui5zEW6CA4BdIfkzDiCThiGeGDqw0j8MS40KsQ2OVN+2E8Zsq+Sp+AATr+D
         3M8oyYBgSL4mAq0MK9asK2+LmPp9NQmF7qES+QzDgi5vmY+oCJ7LtFCc9p8nxmI4Q3CY
         LDuc5+zEmnQ1hYinMjp1+vT85U5Wi1SVtVg8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680683066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5XE1VIiSCddDbFhshK9xglScVhPutbMZovZ2vAJBYQc=;
        b=kECuk0R/6acy6HDUddB5ZqNsB5L4BOJSCpdXYZuN3ycMJI8bP9Uvms4wrhqrrCdaDA
         1o8JMdb5u7hp/lhW8Gj0RfXLiIgp8pNAFWFAprVD/Gmjq78X2hYYgM2S+IcQl7eInN2z
         731+cFAxQ/mk1DpZB598gXfiZwsKRQTBByGo/Pna8FNZTLkHlw6fBtVfVvOD+rnklnBY
         CN8otpqyBb1YlO8MUyaYEue+eNwVEbPyUB4TdQQrDarxbOUJj0BTNlmXcJJbFtditE9q
         WELEju7IT0kIOpDUURBpOisvjszyZkJsofivIKqlgaPGUC1CVvmOPlanpuIYKvj8ducu
         LvEQ==
X-Gm-Message-State: AAQBX9eWXdn83LgQNS01A9eXqPMw9j4X89q/rGZSprVQdZDHKBqL+yuT
	rs4GgxqQg/UjhrazPwgYNOOmQFp9ojL95zwabrI=
X-Google-Smtp-Source: AKy350bWhR0eoTCdRCCGgdPmITWDDD2T5Pey5GgsPaWeBqHS3N2fKpPYZRTvHltbwHrmgNKpiHaYzw==
X-Received: by 2002:adf:f705:0:b0:2d2:d324:e44f with SMTP id r5-20020adff705000000b002d2d324e44fmr3171044wrp.16.1680683065808;
        Wed, 05 Apr 2023 01:24:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5bf:59d3:395c:4325? ([2001:8b0:aba:5f3c:f5bf:59d3:395c:4325])
        by smtp.gmail.com with ESMTPSA id f7-20020adff8c7000000b002c5a1bd5280sm14334275wrq.95.2023.04.05.01.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:24:25 -0700 (PDT)
Message-ID: <1086f8d17f0b736421d1632ced95933622ce4553.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perl-version: make PERL* assignments
 non-immediate
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Williams <patrick@stwcx.xyz>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Apr 2023 09:24:24 +0100
In-Reply-To: <20230405003850.384813-1-patrick@stwcx.xyz>
References: <20230405003850.384813-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 08:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179727

On Tue, 2023-04-04 at 19:38 -0500, Patrick Williams wrote:
> The perl-version.bbclass executes functions which can depend on
> variables potentially populated by native, such as `libdir`.  The
> sanity `native-last` suggests that recipes should `inherit native`
> last, but when that is done the variables like PERLVERSION end up
> as `None`, since `${STAGING_LIBDIR}` needs `${libdir}` which is not
> yet populated (by native).
>=20
> Switch these variables to be non-immediate, which then allows the
> `${libdir}` to be properly populated.
>=20
> It appears that meta-openembedded/meta-perl does not use either
> PERLVERSION or PERLARCH, nor is it used anywhere in `poky`.
> meta-security/meta-perl uses PERLVERSION in one recipe's `do_install`
> step.  OpenBMC's meta-phosphor similarly uses PERLVERSION in a
> `do_install` step.  Therefore, it should be safe to make this
> non-immediate.
>=20
> Fixes: openbmc/openbmc#3770
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta/classes-recipe/perl-version.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/perl-version.bbclass b/meta/classes-reci=
pe/perl-version.bbclass
> index 269ac9eb31..e4913dd502 100644
> --- a/meta/classes-recipe/perl-version.bbclass
> +++ b/meta/classes-recipe/perl-version.bbclass
> @@ -26,7 +26,7 @@ def get_perl_version(d):
>              return m.group(1)
>      return None
> =20
> -PERLVERSION :=3D "${@get_perl_version(d)}"
> +PERLVERSION =3D "${@get_perl_version(d)}"
>  PERLVERSION[vardepvalue] =3D ""
> =20
> =20
> @@ -49,7 +49,7 @@ def get_perl_arch(d):
>              return m.group(1)
>      return None
> =20
> -PERLARCH :=3D "${@get_perl_arch(d)}"
> +PERLARCH =3D "${@get_perl_arch(d)}"
>  PERLARCH[vardepvalue] =3D ""
> =20
>  # Determine the staged arch of perl-native from the perl configuration f=
ile

Most code seems to use ${@get_perl_version(d)} and ${@get_perl_arch(d)}
directly so perhaps we should just remove the above instead and use
these in meta-security too?

Cheers,

Richard


