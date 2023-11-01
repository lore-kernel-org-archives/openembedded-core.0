Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E7BC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 11:13:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.4466.1698837208228781018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 04:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AKfbqDhO;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso10452893a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698837206; x=1699442006; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y178WTXCueQv377tmBsCqNGrK5QFzcGCKnUDoqeea2w=;
        b=AKfbqDhOJu338QXu+QjKy0ywXRNVZdkgfeeM/Q3b4OBCgQRh1DBpps3ymCysZ3U5PT
         D9N9/3afY34lDaaDLFvbK+5vfquNcePAfSRh8dZwDx8nx2Zvi6i0HsolkANF0TZdAUzn
         34fbQ/UsbmFawZegYO5hfcBq9sVPT1L3AqwcaTg33EYdN1zu2a2FpsmjY4gkJGfZLRDW
         N31OIFGDNlCDmCd5udAKsK7CTbBNer0uQWG7vu1FH+arp4FU0XY7WqeuzXqM0GKfXw/F
         gK6NH+u30Ab7V3ubEzxPv6Edpvf96REQJaRzXObjP2Bn+aooUTxZBsvh1dQ9QMrF/0iz
         8bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698837206; x=1699442006;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y178WTXCueQv377tmBsCqNGrK5QFzcGCKnUDoqeea2w=;
        b=EjCo1hUJStUKR2hzfh04XYkRbeIk+nBUVZ+ylRaz4XAjVeRcea++x0EC5n8xwC07BZ
         76LiUS5urES7iMrQ9Mhyikkz5fNCEaay/K80L5XpxO39gTwUgWWAGyelVAgiKK2msO58
         inq3XGOD+PRDTQyr63v6Hla+wXbcUWaPnBRrFEMWzc4yX5TdRgfyG3wdKD/FxMFbh1Rw
         p9Ua7cUmkew9K2ljnnggETKr11/d10NRcMDg1ZJvPHlDTmzKmMqa80vPBtaA7jbWK4ID
         YVc6NY20BjoCzpTXHjYj6hiZjT3j3iDDTnodXZymWCmIoOJybYCmW5uPOUvUQ0PrO1Xs
         IL3g==
X-Gm-Message-State: AOJu0Yw356JnOps/c89jZxPcfb3u6d4nN4uK1TCfMwfT9IxwzPzwqthH
	1y4ps7mtDqPQK37eCCEIb82TMrPZeO8=
X-Google-Smtp-Source: AGHT+IG1yaDQrjWCrLyXTgp5rBzEnGNtP8dsvWD7PzFqyJQhRBsApn6oaL1j7qMDjY3i2IavYY0gSQ==
X-Received: by 2002:aa7:cb0f:0:b0:540:9be9:a849 with SMTP id s15-20020aa7cb0f000000b005409be9a849mr12329480edt.1.1698837205874;
        Wed, 01 Nov 2023 04:13:25 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id u6-20020aa7d0c6000000b0053e5f67d637sm928181edo.9.2023.11.01.04.13.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:13:25 -0700 (PDT)
Message-ID: <0d11a9451215233af3188a8aa12ba2f1b7c85156.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v8 0/8] devtool ide plugin
From: adrian.freihofer@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 01 Nov 2023 12:13:24 +0100
In-Reply-To: <17937ACC0DB20D06.9717@lists.openembedded.org>
References: <17937ACC0DB20D06.9717@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 11:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189908

Just realized that my "improved" git send-email workflow automatically
sent the old changelog.

The changes from v7 to v8 are:

- Fix the test failure on the AB:
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5934
- Improve the docs (which I will send to the docs mailing list soon):
  - Findings from Michael
  - More improvements.

Regards,
Adrian


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189899):
> https://lists.openembedded.org/g/openembedded-core/message/189899
> Mute This Topic: https://lists.openembedded.org/mt/102316023/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


