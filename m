Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4949DC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 16:15:48 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.3056.1698768938420540990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 09:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ocN+FnDH;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9adca291f99so867410166b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698768937; x=1699373737; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q3NhMuMf6ZIia3/mHet1kd3ibF2PcScKRrU2h1d1iY=;
        b=ocN+FnDHe9+AcOi0K6fC8ueLG12BQqJ4toJBigcuBqQIbQUhgCNy3RpVNqOObxPGa6
         RagbOHMQ17WqXXRAqDe+Xgfy2JjwAPACJ497E0K2YLEM56DXKwtl9lS1TyAlPlNCAc8i
         tGHw+Py5yJfHJjuONO4GfzlHsTeYZRupUf5z4GE/HHiMJ5aYJWR/K10VGs3pWDhoBKk4
         fs802+OpKvpz/yp3olsOGW1gwVhEs2DNGepqfGukbZ4m5UK7MY0VQZDR7U3qYtEjiXck
         JNjlWQAmfiV9IffX3G68KxYH5mqQPpREb1FOWiFnnjEssd814RfpWlwd+n03D1bOVymI
         m87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698768937; x=1699373737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Q3NhMuMf6ZIia3/mHet1kd3ibF2PcScKRrU2h1d1iY=;
        b=Uzl4jyk3jG8unawnTVcgPFleQ2Tqwym/gP6Qhr2JjKKcNTL8KA3ErSCmt04AQ4qFu1
         ZFnQ6KcDQKjALSJLkDL+nWNJOkK8UMG5MaiZeKRuMcFqiqu+qNKg0xZ7fJ5FHtT8a1Pp
         33RW0B/7x6LVtp751sOSPbN6cxVsNkTtzSZaesL15rw+GZdaU/0U3dVNPfYIzOn2V2mf
         pKfYC94rSLYGDomXAr0ayu28/6kgrOQz0UW57S6BFuKgebRm/MsA3N4f3tizo7YG0goq
         6qdqCuagXRqzSLwbZ7DagwlX/iDU0AYa61CYnlROMuStN0HIxLfUeKMmvl82tPe8wScX
         NEeg==
X-Gm-Message-State: AOJu0Ywxzp4d8Tf5q6FuRLnmoMmIaqrvRUHGaPunOcvSDl83wQ3f5Awc
	BCgXT9i3OXTi982DWcBx9b5Kt7XR1P3GGlrnye81Kg==
X-Google-Smtp-Source: AGHT+IGVFCbtnZqL5NFOR1MgmXvyvYM1Pxjxp7zYol/EZOtE8bwW2vUQrTQyEt+dnZM2pOSt3b+YylzD3FVrWEaevYI=
X-Received: by 2002:a17:907:9495:b0:9bd:d405:4e7e with SMTP id
 dm21-20020a170907949500b009bdd4054e7emr10875028ejc.6.1698768936397; Tue, 31
 Oct 2023 09:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1698766338.git.steve@sakoman.com> <b547b30fb6a4cf5c2cf8f31e34802cc154560980.camel@linuxfoundation.org>
In-Reply-To: <b547b30fb6a4cf5c2cf8f31e34802cc154560980.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 31 Oct 2023 06:15:24 -1000
Message-ID: <CAOSpxdaxnsSyUckHKCaYpz3AVO+sHSO5_QtoBtJiQSzGNdYzKA@mail.gmail.com>
Subject: Re: [OE-core][mickledore 0/5] Patch review
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 16:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189864

On Tue, Oct 31, 2023 at 5:55=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-10-31 at 05:35 -1000, Steve Sakoman wrote:
> > Please review this set of patches for mickledore and have comments back=
 by
> > end of day Thursday, November 2
> >
> > Passed a-full on autobuilder:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6123
> >
> > The following changes since commit e9ca1405b732720ff72d379e0262a78bfd2e=
7d53:
> >
> >   busybox: Set PATH in syslog initscript (2023-10-19 04:34:38 -1000)
> >
> > are available in the Git repository at:
> >
> >   https://git.openembedded.org/openembedded-core-contrib stable/mickled=
ore-nut
> >   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstabl=
e/mickledore-nut
> >
> > Peter Marko (1):
> >   openssl: Upgrade 3.1.3 -> 3.1.4
> >
> > Xiangyu Chen (4):
> >   grub2: fix CVE-2023-4692
> >   grub2: fix CVE-2023-4693
> >   shadow: Fix CVE-2023-4641
> >   linux-yocto: make sure the pahole-native available before
> >     do_kernel_configme
> >
>
> Some of these are not in nanbield :/

I guess I better start working on nanbield too then!

Steve

