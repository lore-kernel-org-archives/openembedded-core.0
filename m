Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FFAC433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 12:45:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.7709.1652445913360833710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 05:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZtpuPehY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 129so4759139wmz.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 05:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=CZUjtU+tHCR12owp+/QXpdyfmGtRL81xK4R/J1z8O0Y=;
        b=ZtpuPehYzI4O4e1jQ8TOb3ka0aObE21xzyyrdawfl8tGMfGCJx6rJSatqXNvGdrLaZ
         ilQRLBaaKUmtunwiHPLbK8JRkArx11uNcUxQZbJ/OQxx7pL5jem3T0yuERtLa8/1+EY2
         aGWx6iKBxcSngCtQZCpd6SD2CoL/iuCI/nsI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=CZUjtU+tHCR12owp+/QXpdyfmGtRL81xK4R/J1z8O0Y=;
        b=uhgKFQcIRguusJD5rTbIIqre210EVENCctLnM+tulsRWdiXIPOogyPfZmzT4TCm1CG
         3AI0VELzl0pCwr+zfDUOhWK8FU5E5jYnAzi4ZdD65yCUMu6spZLP5Z3lK8FP1xlG7fck
         7BvX9Q8etzdA0jBKyWI8CBK7sJpW8VAbniNYw5wBJ2TIs/YFKLqw7we2vFvygUjvGDAI
         i7+ZkDiPxIPLkif+D/3oYu/0gxL6WUdFIhEkGaBBEF9Eu+f8J3ioz2+WfF/JXTlqS6kP
         0c+1LdK/UVuNTrQD97gQdS0F35bUvwNSorg1NHJ/kIzZHtlIEo9nqa0d/9IkcuagaLTk
         pItA==
X-Gm-Message-State: AOAM533l1Rt/D2fvK0Eq5yuLcpDgmf65vx2wDgVodKvGF0WATe0MiI+i
	uSDVxwUqhhaqiik3ag5jYMfJEw==
X-Google-Smtp-Source: 
 ABdhPJx7iaazzOaJCwbCa+rVQDC6HkfvorkhsrW8kTUeUD2np51UIqLUM/FDtXnEW9ZQXZb339kK1w==
X-Received: by 2002:a1c:f604:0:b0:38c:8ffd:dbb6 with SMTP id
 w4-20020a1cf604000000b0038c8ffddbb6mr14965159wmc.43.1652445911775;
        Fri, 13 May 2022 05:45:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a1e1:9ec5:5b27:abc8?
 ([2001:8b0:aba:5f3c:a1e1:9ec5:5b27:abc8])
        by smtp.gmail.com with ESMTPSA id
 w6-20020adfe046000000b0020c5253d8c5sm2113890wrh.17.2022.05.13.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 05:45:11 -0700 (PDT)
Message-ID: 
 <215dded4d396c69a484a5404d07499b45af819d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: ptest: Add lib32-glibc-tests PROVIDES
From: richard.purdie@linuxfoundation.org
To: Pgowda <pgowda.cve@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Randy MacLeod
 <rwmacleod@gmail.com>
Date: Fri, 13 May 2022 13:45:10 +0100
In-Reply-To: 
 <CALY49869zPf6F8UELEue+9BvyToT=W=hGqSRtazXZW+zPO5c=A@mail.gmail.com>
References: <20220502080851.40753-1-pgowda.cve@gmail.com>
	 <20220502223054.3aa3ecd5@melee>
	 <CALY4986U078AV7xgvpCr+Ev7sQDNW1RQymM=iPDgfN1-r29zuQ@mail.gmail.com>
	 <CALY49869zPf6F8UELEue+9BvyToT=W=hGqSRtazXZW+zPO5c=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 12:45:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165558

On Fri, 2022-05-13 at 17:58 +0530, Pgowda wrote:
> Hi Luca,
>=20
> I have checked it again at my end and it seems to be working fine.
> The error is related to "setup NFS mount on target" and does not seem
> to be related to the patch.
> Can the patch be included again while running oe-selftest and checked?

No, it doesn't need to be checked again, it is breaking oe-selftest
when used to test target machine glibc.

The change in in the glibc ptest recipe and the failure is in
"glibc.GlibcSelfTestSystemEmulated.test_glibc" i.e. in the glibc tests
so there is a clear connection between these two things.

We need to work out why it breaks it and fix that. Running it again
doesn't help us at all.

What you really need is a way to replicate the failure. How did you
test this locally?

Cheers,

Richard



