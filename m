Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90380FA3744
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 21:55:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.2012.1667253323571932142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 14:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WS85nCvF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id bs21so17870422wrb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 14:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eGdyxQ+Q9aHzfaVLnIUFcRuWuCsAK5wsajGaoy7jNeE=;
        b=WS85nCvFWsYQllSfTY35BVHJSrBR+sa10NZ2iW8WZUi8ca2MQn2DbBRY7yxw2Imi/R
         028Q72H5tV9fRzYUwYUMbFajhGNt49YXnylf6Zi/4L36GCZQZCQLJJ8fAGEhXVcR31XB
         pKTSWOP8tCe9dbqmxXWwobfwsbTR4D9fQnehU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGdyxQ+Q9aHzfaVLnIUFcRuWuCsAK5wsajGaoy7jNeE=;
        b=kz5WV5ZDAtwM2fCSGN5/HRGa29UB+gyCN7DZ0T2v++mJLNK/o0HegFTt9vxd2SZASC
         aqi2OcU2Skcer8kQJrSuem2L2EPHdmU4nNU0W1qeJM/xRigw0S/k9HuMLQXm2jBes/0D
         ccgkulG/94RjbGOHk/iWBRsoFrigmrp211kFct9VmF3HnUtupWs6F2A+rWDkb1xkcMOL
         RglP+A+uIN4sm9FpcXdTofgKYehkHW1H/Gcc8TJORkaOhiAMrwfZXQyb+qtGqae9IUtL
         1alJmxe3zCh1eCQGfeflz9jGF7ZrtY9KJmmPVZpAnTSi55/Zs/Uc6ZT0LIuFlAG71h3s
         jjHA==
X-Gm-Message-State: ACrzQf3Qy60ppblWcjlbuY2CNfkhOGyY4zV7RPZF05z9u9VujAnF0hRb
	z8emADACt7cG6H9GNwLdCwIdTWqLZe6R5Q==
X-Google-Smtp-Source: AMsMyM5nE7XucAQADsPseFfWbicT7ZN8sZeU3kExoQeWigrhPgVr7v+aoye4mAYnjev06VUekB+zlA==
X-Received: by 2002:a05:6000:1549:b0:22e:519e:f39d with SMTP id 9-20020a056000154900b0022e519ef39dmr9433357wry.703.1667253321899;
        Mon, 31 Oct 2022 14:55:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f2d:d8cb:afb2:98f4? ([2001:8b0:aba:5f3c:7f2d:d8cb:afb2:98f4])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003b476cabf1csm6230394wmc.26.2022.10.31.14.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 14:55:21 -0700 (PDT)
Message-ID: <cb0b4ef0e5b5d7665e4182e17f48006ab32dbd65.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 12/13] go: submit patch upstream
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 31 Oct 2022 21:55:19 +0000
In-Reply-To: <20221031114719.2725967-12-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
	 <20221031114719.2725967-12-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 21:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172343

On Mon, 2022-10-31 at 12:47 +0100, Alexander Kanavin wrote:
> Note: it will not be reviewed until RP signs the google CLA
> (link in the PR).
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/go/go/filter-build-paths.patch | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/go/go/filter-build-paths.patch b/meta/=
recipes-devtools/go/go/filter-build-paths.patch
> index a1aa37c2a4..a036f177e0 100644
> --- a/meta/recipes-devtools/go/go/filter-build-paths.patch
> +++ b/meta/recipes-devtools/go/go/filter-build-paths.patch
> @@ -8,7 +8,9 @@ embedded in the go binary so that builds are reproducible=
 regardless of build
>  location. This codepath is hit for statically linked go binaries such as=
 those
>  on mips/ppc.
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Submitted [https://github.com/golang/go/pull/56410]
> +Note: RP needs to sign Google CLA for the PR to proceed.
> +

I did sort that, I'm not sure I quite wanted to get into a larger
discussion on how to do it properly and to rewrite the patch and run
more tests though...

Cheers,

Richard

