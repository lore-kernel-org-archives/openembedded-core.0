Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB97D21261
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 09:05:53 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.44899.1729155952996249270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 02:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LR6bEkGP;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso7561461fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729155951; x=1729760751; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ums/f9EClgkvaVVozSbRH5f69FfV2RCFaqDMzGgFEmw=;
        b=LR6bEkGPabQ7OZwb/r9l1e6buxMlmf8lb3Cbq2IPoBPgAKaNh/FLqLyZVC/sPWkQWH
         ElgYj4RTpAIrjC3SdCrnVhY1AkegDFScsA+TaJg2N1PjvMN1anO7kKF2q7y+sPfjgU6K
         itdRdzRJ2LaS4mOMRXvogZD8NEq8/7UVWORzOjQYy9Qjnrz/XvYBX3eQTYzGIQiJ9EV5
         ZnaP6Zb9NqkCZPmXvUT8ct2ZyVzr6f/UqF1b4J+ni/EuGbv1ldq7Vp/KQXAY9GX6S9D1
         JCpOgHF+2ux5E9gvhouWAT2rzzrtjoFDUfxVFHc7VkAitt1m+b1H7NaF1HWDuCB9JIl2
         3n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155951; x=1729760751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ums/f9EClgkvaVVozSbRH5f69FfV2RCFaqDMzGgFEmw=;
        b=pIti8KXUp5B5XN38hx6I2JriKtdPyekScV++DJwoDAE68sAx/fkQySmfGgrCIsPWDo
         FrGFqbrzse3YSqNfQR3XDIS3PQBGxxVYSrmr0WYdfKjner/yfgLJ0Pio2qRHXcc7mKmw
         DPsqEIUIClr015hI/M56Tegql5swP7GufEUQv4esd2JPqeb4WvqBhSPZzkCkhf8mGdEV
         pGp6mBmXjqJNO5Dw/NIxHw5HWua28GjZqhjmgpKdKPX1eR7UJvxlNa0vh8jqRQnXK7zX
         g2vlJIhFma25dZ2uEjDFlx4I4E1aahNjCKz5O2KEptHc3HcsGh3QGcuz98VSJKY2L2Mb
         W6RA==
X-Gm-Message-State: AOJu0YxpQbjr1LenzHkfQtlqaOXMhc0uICc7bhlCv1c6x2/H+AiwO06S
	a4NaslmZMemCnbfno9xBmcLCaMNv/88xz6ouMhKPyz38CNMbvJ4MQk3f28Vy4avExDBHrXcMhzZ
	VsU94KDVGTemecX7AD7BJ4ULkcw4=
X-Google-Smtp-Source: AGHT+IFFWenn6nDHnh08KjuQDHJ+2ly5ciZPgwa4tF5cN3kPoKq3tNZ5WvT7IEz2dSL0MnxbDDxs2UqHlrS8CdS5E3I=
X-Received: by 2002:a05:651c:198a:b0:2fb:54d7:71b5 with SMTP id
 38308e7fff4ca-2fb54d7753emr70607001fa.22.1729155950903; Thu, 17 Oct 2024
 02:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728585736.git.steve@sakoman.com> <c4760d6a52011515b0f931d08f619c7e49e72158.1728585736.git.steve@sakoman.com>
In-Reply-To: <c4760d6a52011515b0f931d08f619c7e49e72158.1728585736.git.steve@sakoman.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Oct 2024 11:05:39 +0200
Message-ID: <CANNYZj9mNKK-6isfa_-kgnGw0i22kr=mLK=Lz0CxXkn=M8NzAQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 2/2] selftest/runtime_test/virgl: Disable for
 all fedora
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 09:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206009

On Thu, 10 Oct 2024 at 20:44, Steve Sakoman via lists.openembedded.org
<steve=sakoman.com@lists.openembedded.org> wrote:

> We can't support vgem on RHEL derived distros so disable this test for
> all fedora hosts rather than specific versions.
>          render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""

I don't think this is accurate. It's the other way around: RHEL is
derived from Fedora. Also, vgem module can be installed in Fedora, but
not on RHEL or rocky/alma (which are derived from RHEL). We do this on
all fedora build hosts, and virgl tests run fine on Fedora workers
then, at least on the master branch.

What prompted this patch specifically?

Alex

