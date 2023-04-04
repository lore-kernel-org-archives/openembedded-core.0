Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D440C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 14:17:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.102895.1680617836769200170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 07:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EXzV6lnj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso21923139wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 07:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680617835;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5wHnat5MhI9tOAIy4UOgAva1sz9zzCXV1j1JWZpATLo=;
        b=EXzV6lnjXtgrHlT5TZv8QrxmsXaDdBtEi382NozdSzyLIPuKkyVa8125r0r+8srkdV
         vop9zXBsONIWEbNK7fIW5l96nws7+lVBF85BpqSeucwsevhrSBp9uw0oMcfIDw3n+nZf
         WVgK/kSa3n/UnVuPNDvGg3NYGTwURx13uUbP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680617835;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wHnat5MhI9tOAIy4UOgAva1sz9zzCXV1j1JWZpATLo=;
        b=b+S5bEJkuJMjSlznYDINYlUPYgJXsG68iMKeRzFL4zSMhesy5gVv3mQvDs9hKb7hrQ
         hhFuGLzR1249HdDK/aILoCdm67w6pXrZCVaFgG7FA/4qgIxA43fMFToOR0PHGoK7WyHa
         9d4Rpae2rO8dzY9O00hB4kuBe5pJh+GxRBSJowq0fTcMzb5keiLepKhkdOFaKa2Ke/mW
         Q0tXmxR9OAB65oavD/efO45pDhBm31ZDgMk1XHYdKL/GJGGBvvOjLWLwCZ1WlHNGsu8W
         5+EaeTtP4aQlMGDuJhIYAr+W34Rd35TVpLv4ncV/Rx4BEUfWLiuB3YuQapJpqNcR0sk4
         7Ptw==
X-Gm-Message-State: AAQBX9cGGBntyPvZ3X0sfgvKC3kH6kXwUrf2jjVBiiHkEPiicywqTmlW
	QRbhF/S0ZOnXKbpsCkGxGOcq7oex/Sf92LMazkc=
X-Google-Smtp-Source: AKy350YfM55HGItjnoQlG4fQImLmbzY8gZNWheznmAgilqFv/3yv0F8RRNRVwr/EmJVYLPvY2WSTnQ==
X-Received: by 2002:a1c:f707:0:b0:3ee:9909:acc8 with SMTP id v7-20020a1cf707000000b003ee9909acc8mr2241582wmh.32.1680617835190;
        Tue, 04 Apr 2023 07:17:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d451:665a:3597:602a? ([2001:8b0:aba:5f3c:d451:665a:3597:602a])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b003ef6f87118dsm23109832wmq.42.2023.04.04.07.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:17:14 -0700 (PDT)
Message-ID: <b0fb4536b693be4e8f1e564a8d6d8ee9031c9ec9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH V1] lz4: Add ptest support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Cc: fnstml-fujitsuten@fujitsu.com
Date: Tue, 04 Apr 2023 15:17:14 +0100
In-Reply-To: <1680602399-5469-1-git-send-email-qiutt@fujitsu.com>
References: <1680602399-5469-1-git-send-email-qiutt@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 14:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179693

On Tue, 2023-04-04 at 17:59 +0800, qiutt@fujitsu.com wrote:
> From: Qiu Tingting <qiutt@fujitsu.com>
>=20
> Add a ptest for lz4.
> - It is taking around 25 min to execute so added it to PTEST_SLOW.
> - It contains two case: test_frame, test_fuzzer.
> - Below is the run log:
>   START: ptest-runner
>   2023-04-04T08:28
>   BEGIN: /usr/lib/lz4/ptest
>   Starting lz4frame tester (64-bits, 1.9.4)
>   Seed =3D 485
>   Basic tests completed
>   All tests completed
>   PASS: lz4/test_frame
>   Starting LZ4 fuzzer (64-bits, v1.9.4)
>   Seed =3D 7154
>   Overflow tests : 64 bits mode : no overflow
>   All unit tests completed successfully compressionLevel=3D9
>   Overflow tests : 64 bits mode : no overflow
>   All unit tests completed successfully compressionLevel=3D10
>   generating low buffer at address 0x1000
>     65536 /  65536   - all tests completed successfully
>   compression ratio: 54.326%
>   HC compression ratio: 51.129%
>   ratio with dict: 34.335%
>   PASS: lz4/test_fuzzer
>   DURATION: 1518
>   END: /usr/lib/lz4/ptest
>   2023-04-04T08:53
>   STOP: ptest-runner
>   TOTAL: 1 FAIL: 0
>=20
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>

25 minutes seems slow, is that with KVM? How much of the time is in the
frame test and how much is in the fuzzer?

We should probably just run the frame tests and skip the fuzzing as
we're interested in integration testing, not random tests!

Cheers,

Richard



