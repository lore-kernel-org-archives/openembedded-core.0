Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C17C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 11:40:30 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.69877.1679571623596302418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 04:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZlJYUfNF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso882165wmo.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 04:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679571622;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAuZACV5XvzDYw28gL1U3c753U+RvKSbsDsE2UBdOKk=;
        b=ZlJYUfNFRQkIbT0efXCZL9SrsUSnqHEhktRVuD+nuv1/HCAoAMvANu5uic1oRYBHWG
         s+X5eDI/2dDSwQE8nKyqc6r6YbB2eig1nL6goHqgNa3Q9uAMOmNyE/WKqz9/EoeV21lJ
         BNw01Qq5W56tqfL/rLwIqCsTbp5+ETnuPanvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679571622;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tAuZACV5XvzDYw28gL1U3c753U+RvKSbsDsE2UBdOKk=;
        b=pUz2CyCH6a5RQ+NRdW4ydooWT3vqdJRlSgqSbw5y9uvhQKL9K7pVjX55jA8P5Ofg/w
         w+EK/+0rYsTK7t2FNhJTKXMQPi7MbWTJseA3SsSJOQNQIV+77VMpodNDvcoaz++KGIcw
         1fTtuUaVaYsXKCQ8DN9VgDmkwtk+vxNNoJuEh6u4kIY48eaz7HuFxdmQkSCbK4BEYTt2
         M8rJLld95d9ZYsd44NHSoCeA7fnwk1NcCLaXq7vwxKj55VyXlUiAm3JKIPPDKuddI8gm
         YaeUVHBWE5Mxa9HwlNoaXb4buKHo0lG/2t096iZGTRSci2czwUhNru228Fn/K0ZoKyjN
         e+Wg==
X-Gm-Message-State: AO0yUKWmE+DS2PjwIhVikCaHWyeIOpDZQz1u3CUGSNNlwBF+WDGN3WSB
	VT/Q2q/lm9nc62WRZvbq4HxGdA==
X-Google-Smtp-Source: AK7set+G3cqKkxjHcmWeXW7ozlNF/1YSHP+LcT5CGl898+MPDcRzYu0Rf3xiXkq8YALd/9MOWcQEwA==
X-Received: by 2002:a1c:e903:0:b0:3ed:3457:4e82 with SMTP id q3-20020a1ce903000000b003ed34574e82mr2269658wmc.30.1679571621964;
        Thu, 23 Mar 2023 04:40:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1c6:d95c:5baf:6f61? ([2001:8b0:aba:5f3c:f1c6:d95c:5baf:6f61])
        by smtp.gmail.com with ESMTPSA id y15-20020a05600c364f00b003ee6c54b0bcsm1570870wmq.48.2023.03.23.04.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 04:40:21 -0700 (PDT)
Message-ID: <a8d4855315c091bde32979f928885320c1b5b3dd.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][langdale][kirkstone][PATCH]
 gcc-shared-source: ensure that S exists in do_deploy_source_date_epoch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Marko <peter.marko@siemens.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2023 11:40:20 +0000
In-Reply-To: <20230323110146.243968-1-peter.marko@siemens.com>
References: <20230323110146.243968-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 11:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178978

On Thu, 2023-03-23 at 12:01 +0100, Peter Marko wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> This include overrides do_deploy_source_date_epoch function
> and is additionally referencing ${S}.
> If ${S} does not exist yet, the function will fail because
> it cannot evaluate path .. from non-existing directory.
>=20
> Reproducer (verified in kirkstone):
>   bitbake gcc -c deploy_source_date_epoch
>   bitbake gcc -c cleansstate
>   rm -rf build/tmp
>   bitbake gcc -c deploy_source_date_epoch
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/gcc/gcc-shared-source.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recip=
es-devtools/gcc/gcc-shared-source.inc
> index cd2e341099..7c84ea088d 100644
> --- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> @@ -10,6 +10,7 @@ SRC_URI =3D ""
>  do_configure[depends] +=3D "gcc-source-${PV}:do_preconfigure"
>  do_populate_lic[depends] +=3D "gcc-source-${PV}:do_unpack"
>  do_deploy_source_date_epoch[depends] +=3D "gcc-source-${PV}:do_deploy_so=
urce_date_epoch"
> +do_deploy_source_date_epoch[dirs] +=3D "${S}"
> =20
>  # Copy the SDE from the shared workdir to the recipe workdir
>  do_deploy_source_date_epoch () {

I have a suspicion this was fixed differently in master.

The fix looks incorrect since it will just make the directory exist,
which will hide the error but won't fix whatever the race is causing
the underlying determinism problem.

Can you confirm the problem exists on master to start with please?

Cheers,

Richard




