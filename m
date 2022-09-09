Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8356ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 11:20:46 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.13.1662722436870243724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 04:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fRJ8tp2r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso1072924wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 04:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=Ctm1slHRs2vReDoLGP9GO9QwP9JfFSS+5ot7OxI/5MA=;
        b=fRJ8tp2rhapfsRM3S5pqEydXvnMPtINn8vuVTEcmHt7VU3G+t15/IOYUykGt61bJMX
         OJr1olzLViHwb0VoonXyelTwD/75xxUT1q8rma0KUipFlG5AIqZral2jOWO3D3JaP5dM
         Tzas03/1vm/XAeMwrraKsU+DxJoe/wcW5DJAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=Ctm1slHRs2vReDoLGP9GO9QwP9JfFSS+5ot7OxI/5MA=;
        b=2dQSX7lfq6f1BAdZRIHu5pMLBrd0rwWTwM/yqg8B7mIEcMoCOzG/CEey0KKlFk75h6
         C7UdA76GpQq+IQkiRip1W6BpdLzvdGrTk6kObAy99XxY1CJnFnSkvZ2km7ZOsbRCdoYf
         asi3q6nJI7Fgw8pfV6MxqD7A3H6Nu4WuKg1U5cDUUC+iPyrmN+kAElZFCqaGEaf2U0Tu
         5a7po1WH5tXE65Fq9otmoskFx3Qn8jP1mjZ/GDci7uNdmWjnp046l3XGJmsaPXDDoPAl
         LPf++0jpE2g75kKiq2v0Q+pNrGe7hHiqPmgibVcKmNSJZNmLt8bNVVCyTiL2LE5TNH3s
         KjBQ==
X-Gm-Message-State: ACgBeo1Qp7Buj4pnOy2+p8uWvExNV954tjqTsRwAsazkHA6dP7rEhyDU
	y6bmUm81dbrjrdrBp5sedjN8mg==
X-Google-Smtp-Source: 
 AA6agR6wXWBKzuEZvWkeX7DbRtJG0Zs7C8hlGBt0sQHiAcu//McV9Sy2mi8TjJQ2lE+L8IRl/UILjw==
X-Received: by 2002:a05:600c:15c5:b0:3a5:b800:3c53 with SMTP id
 v5-20020a05600c15c500b003a5b8003c53mr5092681wmf.176.1662722435156;
        Fri, 09 Sep 2022 04:20:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992?
 ([2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992])
        by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a60ff7c082sm393937wmb.15.2022.09.09.04.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 04:20:34 -0700 (PDT)
Message-ID: 
 <1b7fce81bcc901c50f7a5042fb2bb94a81839896.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][honister] mobile-broadband-provider-info:
 update branch name in SRC_URI
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Fri, 09 Sep 2022 12:20:32 +0100
In-Reply-To: <20220909103754.3036413-1-ross.burton@arm.com>
References: <20220909103754.3036413-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 11:20:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170486

On Fri, 2022-09-09 at 11:37 +0100, Ross Burton wrote:
> The master branch has been renamed to main and now master no longer
> exists, so fetches that don't use a source mirror will fail.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../mobile-broadband-provider-info_git.bb                       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mob=
ile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broad=
band-provider-info/mobile-broadband-provider-info_git.bb
> index 4246f4dcbd3..3b170f4fdd2 100644
> --- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-bro=
adband-provider-info_git.bb
> +++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-bro=
adband-provider-info_git.bb
> @@ -8,7 +8,7 @@ SRCREV =3D "11f2247eccd3c161b8fd9b41143862e9fb81193c"
>  PV =3D "20210805"
>  PE =3D "1"
> =20
> -SRC_URI =3D "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info=
.git;protocol=3Dhttps;branch=3Dmaster"
> +SRC_URI =3D "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info=
.git;protocol=3Dhttps;branch=3Dmain"
>  S =3D "${WORKDIR}/git"
> =20
>  inherit autotools

The trouble is if I merged this, it would open the floodgates on other
patches...

Cheers,

Richard


