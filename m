Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A77C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 17:29:08 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.2182.1644254947338674196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=U3RQF4Av;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id og43so20190973ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 09:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=azq7pil+CpXRnhWr2JFFb1j4ClvIGiaHnqYmaQKoDJg=;
        b=U3RQF4AvSoPA6VZkl8Ovgf2AmAFngmvL5D3dF8MBAuTw8wbYhBCS8jG36t1IgbG1lp
         Vu1MGZIEYixQrHDXxD8Skg/pv93vEtyDM9kgqSlBCF3meQRArZslGbAqA5+AA0FyoUyF
         vpm+KVsSrWwfgSCKzJ0bD/C6DHleU/OCycGc/67aOCJXVdgbzOeOIMqCD0QBTeeZz+NR
         lAW1dBd/usoEA76HLIRHc+BVv/8NsHGwmT5C+b0lhlfSxbTLfyP3nM7WnYJYt+8OK+RB
         FQhE0sXGXNgLKU5gTkZMkFbm3AZc2t4IdOfq2WIuyy+W4mcha9wNh5yrHoXJPuI2Z/jI
         ZBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=azq7pil+CpXRnhWr2JFFb1j4ClvIGiaHnqYmaQKoDJg=;
        b=xqo40pdxSrdSxO/CyimpaT8B2inU9jSAl0MOrO1N6mIPNEBvjsla4mOA8UTrCj9vTq
         n75YfqgAeR7Nt/NAPjL6zegjjVAb9D88D+1WmfWMHUPHqvak41wJ96Bs5BbB0l3PCc0d
         rPTDbyJG5i1YO0oH+FyM0b4qLjmbSZ5KN+Ct7GcLz2R1TFhfot1Ui3JlhH5iyLiQnIj+
         XOHEHYYxt+C/ywDyaMGpJXuYYlleSJHLoHfiZiazf6n3Q+aHKBeuF8j8NuQ3JVOsORhp
         mfzBXwlT+jCyt0YOHOJ97EuheH8Rfy4KXiLXZNB4CLUjLY+v6MsJaOa7wRiEUvhUjiE5
         AASg==
X-Gm-Message-State: AOAM532RTN99X1dSmI43FThrOnMxris0w1NTKWwpve71MSR8VXUDwDZq
	NiriVMZC0tin0gwvTXQIJ9kDVozOp5Wl5btIgp4IYTTgrpD/J+Fg
X-Google-Smtp-Source: 
 ABdhPJxzylqRVwHybZsX6JIqKKBwZcv1+DHn/CM2kT8IlahZr40YRsSGBREe8/M5kL+Q2v7VfEDIVDP8jL+oAfzeKao=
X-Received: by 2002:a17:907:c14:: with SMTP id
 ga20mr586725ejc.243.1644254945163;
 Mon, 07 Feb 2022 09:29:05 -0800 (PST)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 7 Feb 2022 07:28:54 -1000
Message-ID: 
 <CAOSpxdbBsjWT_HGDQEQ8MZygKXuYje5nss_tCDSxt=FxRGuNpg@mail.gmail.com>
Subject: dunfell CVE "heads up"
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 17:29:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161462

I'm currently testing a number of CVE fixes for dunfell, so please
check here first so you don't duplicate work!

https://git.yoctoproject.org/poky-contrib/log/?h=stable/dunfell-nut

Steve

