Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6DDCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:50:31 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.5350.1755769828073239258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f8u3Hvnz;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70a928cca6aso4848796d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755769827; x=1756374627; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=imskiUeyPUI7o2OJ7eqsAeNI+O8EI5OMsdEvNQTQTjU=;
        b=f8u3HvnzpbgienvPyWiPRaaA/+HPNFZwwOqmYALOQzrQP8wuUmiBXj3ERPkyxaRrNT
         6wDEiu+tsoDQ6XeLq0O88H+EyQTE73E7OfSgQCZOZH3rPGjZ4IaDRxXeAEhgjWmFwR26
         kNyBsMzPD/S/SCBlnC+0swhcScPcUSYK1G1YoZIn60rWQrIlOwlp9+nSaXOpYpwFp4F1
         kjb4l7Vm1U5gNN+laKOqK7JoLUWuauckwDb41GN1vxxLDH8tmQC9w2R9IYIQ7X0cpmDg
         i7dCjSzHeSCfd3r8GV2YJWjUgGGJfOccRAGQzpt06aDGIQvbxqgcLSbM22JyDW6udU/c
         JQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755769827; x=1756374627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imskiUeyPUI7o2OJ7eqsAeNI+O8EI5OMsdEvNQTQTjU=;
        b=GElwR2DJJwoENKLZw8RgFKo9yLsaMfCXH4EKHeG0cnF5/Y6Fr2chVYSFlVoHcn8TX/
         rfZ4boROCdkVhz+PZYHNzhfIhnemb7Q6l2Ke1Yad2J4zdY8OPPOlLtAiRaTUP/KWfPw+
         tl8LhqRI4502brN5NE/DVm6wKa9zVqL6Qo8UE3nPqVAsFi4WBPpBCNT+V0xZ0N7l74b7
         u0KVl6TPyY/ETG9ilINxSMKhY9QOroX57gYb9pboXXsgPTMa7JOYQNK8NBtdE119aQhX
         8oQLgIDLrsJgWCfXwJuJbtXjhEx1gWUHu6ZI2DMHjkpb3OjaOI1SFUPLJ1rhtCjcRRNx
         Jk7A==
X-Gm-Message-State: AOJu0YxpJRCrFyusEiGxkgg66vmVR7Y4auxawrMcBy3Ekjb6qHuI3IsM
	K+zf1J8nSMe+KRBRImt2qszHL1q5IN7TdoNKjMnhRCFQ7OPFmm5j8v/RIX0H1eIVK/OdUlr/ztH
	Fpo0vPkPA5t+4TIQvZHtK3VATzWMUR9w=
X-Gm-Gg: ASbGncsrvHJXb3aiKw8aBG/40Rgp3Ou92HNobkv4/7Mqbn+W++OFeomHzJqgz1kWexm
	cb0tJDS8aWGlzWwqAwhAIubQb2iV8vhKXrXXFXonMLyB72Ac7rERB47fQVFrFLS+f/QwlKfHkIJ
	c8+dzrL31v7JJot91AwIcif6T/Wu8YsSy9rudc86FWmPIuSDfVgt2ei38dfPnzBnCN3LMq+0UXc
	aC08+Is33yclM7BKrvt6tYiLaiLwRHQOuBWDwi0DriVBYC4+B93
X-Google-Smtp-Source: AGHT+IFIRWvQsNbNXZgav2hbEQa27s28y4wj2QdD/uv/lWCHcsJ3hEwwVcPwcw47LJS2dQWK87YynwCzxJMK85qSE/E=
X-Received: by 2002:ad4:4ee9:0:b0:70b:b06f:3d47 with SMTP id
 6a1803df08f44-70d88e0a5fbmr16374186d6.1.1755769826895; Thu, 21 Aug 2025
 02:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250820061959.22598-1-r.gruenert@pironex.com> <04b5dbc353cf8c22eedc924d17bfcf0c64e6cae2.camel@linuxfoundation.org>
In-Reply-To: <04b5dbc353cf8c22eedc924d17bfcf0c64e6cae2.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Aug 2025 11:50:15 +0200
X-Gm-Features: Ac12FXxh702ekJAh98VaWE00Yc3dWsWjzx_wzU6BTwmr77QCHKSCxAe9P5pFaxw
Message-ID: <CANNYZj-H3DgPmBg7P-gVEXVBy_zEDdr=WkmbCEWvnS7t3HA4jA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/runqemu: raise an error when bitbake
 was not found
To: r.gruenert@pironex.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 09:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222225

On Wed, 20 Aug 2025 at 22:32, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> >          bitbake = shutil.which('bitbake')
> >          if not bitbake:
> > -            return
> > +            raise RunQemuError("bitbake could not be found in your PATH. Did you forget to source oe-init-build-env?")
> I'm wondering if we can detect that and/or put this error message onto
> one of the later error paths to hint to the user the issue?

I took a closer look at the usage of bitbake in runqemu. Specifically
what needs to be done is:

- take the above snippet
- move it just before these lines in run_bitbake_env():

        logger.info('Running %s...' % cmd)
        try:
            return subprocess.check_output(cmd, shell=True).decode('utf-8')

- and only then change the 'return' into 'raise RunQemuError'

Can you please send a v2 of the patch?

Alex

