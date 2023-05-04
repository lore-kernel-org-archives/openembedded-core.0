Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9BBC77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 11:45:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.47588.1683200716956377574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 04:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=SmTl7QTa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f315712406so60017315e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683200715; x=1685792715;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Alpt1NpPPpwtn6EU3EJ1z0wiFhqjK0aTnuOaosxAw0E=;
        b=SmTl7QTaTwA9FonaXfxaUVTGtpkdT9pdlv0KDHEb3nCUDIRzv9796zcZis2iQ0nsqQ
         1aBU5R70UzPtg5GlNTqzGNB/GKl/8mdZ6A25nIPjmFHR2B1L1u7xG/Ipn3qHfHvlz26p
         cCMJSW+oPO1tUvkN0eenxwsF8t+GJW1AAnc5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683200715; x=1685792715;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Alpt1NpPPpwtn6EU3EJ1z0wiFhqjK0aTnuOaosxAw0E=;
        b=j4g20BG5M4//iKCwJvhzvSl4Az/1iQ7iT95us+rLi4tw4l8e3hw+baJWJ+s7XUMTH9
         X4ieuhaxlMWy1PvvdeyUKFPjGzlK0UKIhwYfaYEV7j3VaX0qfO4YApXR/lkbegZziPxz
         HFVv/ZqcYV80UU6Zqcz3oy4BFr7I+OcOdgxRUbUNMK2LkI8XXR9HX9pNRAsd168ln94P
         M+Ozvll9zHR9UNMch51zaxG8pE788a/4/Fh6xPw3orvOTWBsuULlfi66iOX+otv0tkuY
         PYLn+RaEKopoa14T5SZOo6wbExv2Jah8sUOAEC/L2kn+0U8oriWWgbiMrK46JXcDmBxP
         agpw==
X-Gm-Message-State: AC+VfDwpmSjm/QwlsAmhIjW47AtmUK4/LAoMFEHOWaAFcHL4GKYRHV1x
	JOVIECbzX7K5kStlZTgjY2OcdJw/GRpz2W+JoRU=
X-Google-Smtp-Source: ACHHUZ6SIaAXCRHxJBwJQvOKE5EJIC6qJCaQyRZ81n5wgO14DNucQTo08D8vmrWlBPBez9kJX1plPg==
X-Received: by 2002:a5d:5689:0:b0:304:7bbf:7c1e with SMTP id f9-20020a5d5689000000b003047bbf7c1emr2180459wrv.4.1683200715438;
        Thu, 04 May 2023 04:45:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6749:5fda:5dc0:e535? ([2001:8b0:aba:5f3c:6749:5fda:5dc0:e535])
        by smtp.gmail.com with ESMTPSA id a24-20020a05600c225800b003f349d14010sm4749989wmm.38.2023.05.04.04.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 04:45:15 -0700 (PDT)
Message-ID: <7fe7561794aa4df74db87f013fc376ece2299888.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] kernel-fitimage/uboot-sign: support
 64bits address
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 04 May 2023 12:45:14 +0100
In-Reply-To: <20230413103109.5604-1-jamin_lin@aspeedtech.com>
References: <20230413103109.5604-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 11:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180867

On Thu, 2023-04-13 at 18:31 +0800, Jamin Lin wrote:
> v1:
> kernel-fitimage.bbclass: allow users to change address-cells
> to support 64bits address
> uboot-sign.bbclass: allow users to change address-cells
> to support 64bits address.
>=20
> Jamin Lin (2):
>   kernel-fitimage: support 64 bits address
>   uboot-sign: support 64bits address
>=20
>  meta/classes-recipe/kernel-fitimage.bbclass | 6 +++++-
>  meta/classes-recipe/uboot-sign.bbclass      | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)

Since this adds new variables, could you send patches to the
documentation please to document them?

I did also wonder if there was some way we could combine and share some
of this fit image information since we appear to have two variables
with different names encoding the same info here :/. Maybe that is
something we could fix or improve in a later patch?

I'm kind of living in hope we can simplify some of these different
places to share code ultimately.

Cheers,

Richard

