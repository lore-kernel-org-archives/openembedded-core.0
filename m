Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545C4C0502A
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 12:09:39 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.58679.1661688577038909117
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 05:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K59UJNUS;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id k22so5610470ljg.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=E/zBKOktSSBvtwR8UQUL5GMVsg1wuQ3O+/dgSySH3JA=;
        b=K59UJNUStYEl/hjmFE9V86Ho9aC3AtEPHtkvMhnLQhAA/fVsUuuvsKS5PRdhMAadAb
         IWzZByz7iyW0S8ogYwGzo9tWgk0zKxVJ8dbAcH+mFdUDMqmKdCsQHiWYBWfC2JpxpGPc
         wunNTABQHQOZAUg2sHHxUUTTC8LOttsjfhd7IkDNmHW44YVvSqyQC+8lkqm6QrKstFTJ
         2dki/Kdp7xwpIArAE58A9Tl567iRs0BZgFj5/CM+nEUA4XDV299cIIPwmLncDjDdkLLt
         cKZjL4e/d4Ey5FPQQWtrvdX30T14CYIULKlOumNYo6ReL4DpRG8CIGTwQxtGO265FxSA
         ziwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=E/zBKOktSSBvtwR8UQUL5GMVsg1wuQ3O+/dgSySH3JA=;
        b=N4t5C74hBRN20MxFvgyUiHnG0IhhVohtO9fCQjcxWWJjaCJ8D6ZQ8C95CtTLLmn/dZ
         nywiupR4sX4288yJQLVUuMUaBBQrWdGIAtBw2Sw0vcOjIX8j9QBZudo61AV/oKVqpun8
         7+VZHiLrEeqEg4V0RPnZ5xbM1oq8uswXSBqYPn8p3OZeAumrnDvcAWhI/SfOH/AwFX4P
         xAeBNsP84tbrj23VHTJpYgoAkyUvfO6gv9KiWUAslvoUADrHk9xZHLuzHmFNRhxgAYMt
         J3tifSeeXCf1R0JhSj3YAcOrtSKo79dJKvzuwuxa+JztnJZsxMU/VdcDpTBHqSLr+YoZ
         8FHw==
X-Gm-Message-State: ACgBeo3+WptHRndrxkG07YN/yuas4x/3XZqCsM/Hf5jPyogCkbefCiLd
	fSal+m2cDPpyt4OkpieWil/wjxudrGFdeMF6OZI=
X-Google-Smtp-Source: 
 AA6agR65KF+vrDaG+aAp4gniiCvlOvnfAI8j0r/6Ow4wgjPPwix8vFcXwfvuCO8mZlmR7zQymODJQQjPdeptxnj5UVo=
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr4419436ljk.56.1661688575069; Sun, 28
 Aug 2022 05:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220828120237.1121A9623B1@nuc.router0800d9.com>
In-Reply-To: <20220828120237.1121A9623B1@nuc.router0800d9.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Aug 2022 14:09:23 +0200
Message-ID: 
 <CANNYZj-mwcsbjaotThF+pS3nOFJx2DiSd03pCzi2uA+-+23RsQ@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 28 Aug 2022
 02:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 12:09:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169982

On Sun, 28 Aug 2022 at 14:02, Steve Sakoman <steve@sakoman.com> wrote:
> New this week: 4 CVEs
> CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3521 *

I believe this is fixed in 4.17.1, so nist metadata needs to be adjusted.

Alex

