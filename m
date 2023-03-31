Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31598C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 22:38:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.9277.1680302297664270432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 15:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LwciSZX/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so10992746wmq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 15:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680302296;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nHl4OO4YJLLo2S1sY+5xjlDFisp+ZB8TwVRsj8kMVwg=;
        b=LwciSZX/Q4sODf5fuV56VHRwgODd0su/4+SZg3x0fzGq0M9+76s7bE/Icl/Ifvg2oA
         E6YQuRnwpMxUSzv8jmbE8Wrf81V9xyPIgwTsO5r5x5uMzNjQsMGheRcSN1tjbvjXcmN4
         ZyAwP6mA4ar9UrughylaHlxaoBQHKGpgoQFkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680302296;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHl4OO4YJLLo2S1sY+5xjlDFisp+ZB8TwVRsj8kMVwg=;
        b=6kRSZgFKxeu9QqPL7Li37HY4IegXtQ3Xx26VBouU0Um5DQXv6DyDkAkG1J+1l7yYvn
         i3gwuF9bLtRsQk0Ly4T1+riO0a377rwWVONLesrtM05uGlMpPLcrXuLc57HToDW5gM3i
         SQSSWsEYCr+GlNrA2QJHquE7JlNhgU/6amjCxPugwRPKSmPTxb4xwFMFOyES75eV8rDu
         +t1gf0TX4Vdz4KsIR+VNsbODoY1MlqBHFKPsL4MdQMgJ35lcFEv4UaTpd2GhBdsFsPmt
         Mb4M4BJL////z9BdFPogNo4hMkwn4C3p0ZqWJwew1cUOEW7594J4TwBkzIFa4qtKeDaX
         2PGQ==
X-Gm-Message-State: AO0yUKXkVPry4Ly/UGMdqJEyk0nm8kjKNjkiuTrEPDLB4tziIxOMBnfT
	9v+Mi5vLJPtCF49F4uVH7HKeFQ==
X-Google-Smtp-Source: AK7set/PfjiQxKzU+ORMZ3D3V/ZeohkIdeI7voaUspzHui7viKggPbQV1M6E3FKXxSzuTqiefm8oUw==
X-Received: by 2002:a05:600c:cb:b0:3ed:66e0:b6de with SMTP id u11-20020a05600c00cb00b003ed66e0b6demr22306972wmm.22.1680302296080;
        Fri, 31 Mar 2023 15:38:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3d2:bb2b:b7e5:a8c4? ([2001:8b0:aba:5f3c:e3d2:bb2b:b7e5:a8c4])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bcd0c000000b003eb966d39desm4039910wmj.2.2023.03.31.15.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 15:38:15 -0700 (PDT)
Message-ID: <a6235a98d5aa6f23872e670f7f089cb651c76065.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 7/7] insane.bbclass: add a RECIPE_MAINTAINER
 check (oe-core recipes only)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 31 Mar 2023 23:38:14 +0100
In-Reply-To: <20230331052636.978578-7-alex@linutronix.de>
References: <20230331052636.978578-1-alex@linutronix.de>
	 <20230331052636.978578-7-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 22:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179457

On Fri, 2023-03-31 at 07:26 +0200, Alexander Kanavin wrote:
> Absent maintainer entries are as well a frequent source of friction, as t=
hey are checked
> only in selftest, and so aren revealed until autobuilder runs.
>=20
> The selftest is retained as it also checks for obsolete entries in mainta=
iners.inc
> (not possible to do in insane class).
>=20
> The insane check also looks up entries in a different way than selftest (=
from actual filenames),
> and so additional lines in maintainer.inc are needed; I took the opportun=
ity
> to adjust and clean up exception lists in selftest to match.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/insane.bbclass         | 12 ++++++++++++
>  meta/conf/distro/include/maintainers.inc   | 16 ++++++++++++++++
>  meta/lib/oeqa/selftest/cases/distrodata.py |  6 +++---
>  3 files changed, 31 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index 64ad76c48e9..dacbd431e53 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1499,7 +1499,19 @@ python do_qa_fetch() {
>              else:
>                  oe.qa.handle_error("missing-metadata", "Recipe {} in {} =
does not contain a HOMEPAGE. Please add an entry.".format(pn, fn), d)
> =20
> +    def test_missing_maintainer(d):
> +        fn =3D d.getVar("FILE")
> +        if not '/meta/recipes-' in fn:
> +            # We are only interested in OE-Core
> +            return
> +        # PN or BPN are not suitable as they are tweaked to match class =
variants, and it's not possible
> +        # to map them back to the actual original item in recipe filenam=
e.
> +        pn =3D os.path.splitext(os.path.basename(d.getVar('FILE')))[0].s=
plit('_')[0]
> +        if not d.getVar('RECIPE_MAINTAINER:pn-{}'.format(pn)):
> +            oe.qa.handle_error("missing-metadata", "Recipe {} in {} does=
 not have an assigned maintainer. Please add an entry into meta/conf/distro=
/include/maintainers.inc.".format(pn, fn), d)
> +
>      test_missing_metadata(d)
> +    test_missing_maintainer(d)
>      oe.qa.exit_if_errors(d)
>  }
> =20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 682ec2cfdfb..1af6ccdbb71 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -62,9 +62,12 @@ RECIPE_MAINTAINER:pn-bash-completion =3D "Alexander Ka=
navin <alex.kanavin@gmail.co
>  RECIPE_MAINTAINER:pn-bc =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-bind =3D "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER:pn-binutils =3D "Khem Raj <raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-binutils-cross =3D "Khem Raj <raj.khem@gmail.com>"

This is just wrong, there is no recipe named "binutils-cross" once
parsed and the pn override (which should have been called recipe name)
is set to that.

I appreciate what you're trying to do here but adding bogus incorrect
metadata isn't something I want to encourage.

Cheers,

Richard

