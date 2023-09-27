Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3619AE810D4
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 11:29:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.14879.1695814164632651216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 04:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EyMvrYoe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-405497850dbso88648275e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 04:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695814163; x=1696418963; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gqxGXyBoxjOW1V0Bp+NWYo0MCH5KHBkEug6D6FolJ/I=;
        b=EyMvrYoemB9Or56tlcOx3PBRTF3uNdorxeBc8rJnIA/UxIbEiEWKVgv2hJeKz5UbPw
         5bYr2LaJgN2yjs3XG+fMV2jhRtGo6Q4dYNpggOUO1qdyQAcsU4zhmwlHad6sC7c4Ci2V
         yG9/0EOoXw2il6UXt7BYkXFSg0cd9h9I+K5tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695814163; x=1696418963;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gqxGXyBoxjOW1V0Bp+NWYo0MCH5KHBkEug6D6FolJ/I=;
        b=RJSo8v1PdWpRSQr6ldil6ivWDXSr8kcTBBAiwaTxjES2kRY53yHGtNcGrEq166de1B
         259mg6wSJoIShga3IZFVN14t1iRkg7sJsFBydLVDl9O8Ae7y9eLP3gCm147iQXNb7YCU
         VBd1JAzZhL1bPJBzs324uifDKxUBTez1HPjfgmtUhegvp53jU34IOYUGVvfyQM8GzMCc
         5KLDvGdHhItrtqeH53lGz0x8zRMD0V3LiIRm7kUK23jF8wRI7xv4QbEViN38CDfR4DvA
         DOrWa+Wtu74MrM+mbddbdIjwrQlJjoa5EsD5IEsvGnsQDLpd2CFAJLtnNbe03Z5b0sGW
         vtyw==
X-Gm-Message-State: AOJu0Yx/OywrGwoE5FXL0CBtiTATJWxq3zXW44AmVfmDYrjGaGTfRYuq
	hdVdkR6kHDiQ14X7yETjtWB/2A==
X-Google-Smtp-Source: AGHT+IH2Vq9q0QLHyn50Yw7pykTXMCnt1ekL1ZiSaQP3KP25m5fELCGVvKnTLb+BRHOTQE0S/bSOzw==
X-Received: by 2002:a7b:cd99:0:b0:405:499a:7fc1 with SMTP id y25-20020a7bcd99000000b00405499a7fc1mr1709020wmj.40.1695814162882;
        Wed, 27 Sep 2023 04:29:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ab67:eb18:db89:ef9a? ([2001:8b0:aba:5f3c:ab67:eb18:db89:ef9a])
        by smtp.gmail.com with ESMTPSA id m12-20020a056000174c00b003233b554e6esm2529933wrf.85.2023.09.27.04.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 04:29:22 -0700 (PDT)
Message-ID: <aeeaf4fc2a39f988e4e155b2ed3540bcf504d2a6.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] gcc: depend on zstd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, kasper@krinvent.dk
Date: Wed, 27 Sep 2023 12:29:21 +0100
In-Reply-To: <724DEFD8-F579-4421-9D19-0086E4C7B76A@geanix.com>
References: <20230927104922.3734608-1-sean@geanix.com>
	 <172606da1e993e01dd23f3dd7490a13783390e64.camel@linuxfoundation.org>
	 <724DEFD8-F579-4421-9D19-0086E4C7B76A@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 11:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188309

On Wed, 2023-09-27 at 13:22 +0200, Sean Nyekjaer wrote:
>=20
> > On 27 Sep 2023, at 13.17, Richard Purdie <richard.purdie@linuxfoundatio=
n.org> wrote:
> >=20
> > On Wed, 2023-09-27 at 12:49 +0200, Sean Nyekjaer wrote:
> > > Add zstd LTO support for the nativesdk compiler.
> >=20
> > This is changing it for the target compiler as well?=20
> >=20
> > Perhaps also mention it brings it into sync with gcc-cross (assuming it
> > does?).
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
>=20
> Hi Richard,
>=20
> It looks like the target compiler(x86_64-oe-linux) already had zstd suppo=
rt.
>=20
> ---
> % x86_64-oe-linux-gcc -v
> [...]
> Supported LTO compression algorithms: zlib zstd
> gcc version 12.2.0 (GCC)
> % x86_64-oesdk-linux-gcc -v
> [...]
> Supported LTO compression algorithms: zlib
> gcc version 12.2.0 (GCC)
> =E2=80=94
>=20
> Or I=E2=80=99m wrong?

Sorry, I mean the on target compiler, i.e. if you boot an image with
gcc in it. I think it might be missing there. The compiler above is
what I'd refer to as the cross compiler.

I'd just like to be clear in the commit message what the current state
is and which ones are changing. I do agree we should bring them into
sync.

Cheers,

Richard

