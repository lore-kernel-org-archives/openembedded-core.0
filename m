Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CFEC41513
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 19:13:34 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.142963.1692126806838675487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 12:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZUYCRjl8;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe4762173bso9443137e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692126805; x=1692731605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6k/aUo216OcqQZIPc0MEm/lOtL18ltiB1zKXzOdvi44=;
        b=ZUYCRjl8TxVIfSZe8mFXiPKP+ry5edJSsQz/IVpBqratQ2Rhop0WcWCVbIPSBZmzlw
         uBtqoCiUl86+U3jat+vAyIsxnwlgw7WmyF3e5KFtFCY6mLXxARSLemfzNcNWQl8iOnG6
         mJa1vXJLZUkXHP5/UOidH28caZGKEBfdhklP6UV2Vn2uxKI6gCmWBAwSPH7n8LnkCsOq
         Nz6iFjegsWPLgawKL5G1mvuJJ8/3df9adATO5Arj0925W58FwDaeaiU3exnS904DnSFX
         lqVcqcd0Gkjr4j7DPOqD5MuPHpAflBmmnr14yUjyFPkhg8w8mbkzxLX+BIKk0YchG8PM
         8qkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692126805; x=1692731605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6k/aUo216OcqQZIPc0MEm/lOtL18ltiB1zKXzOdvi44=;
        b=hjrPylguTQQWijKUR8Yk02HZlavTrQsZH9QwMg3h3z93jzk/kb20nHVC/TnovHcF7S
         sLLOV7XVPxaZWXqaj58zw72ZBHfepQNNm5mRB+GAnfiGr6ec8DQhmjRnPtde9yMHXgbp
         DuG6S129JDG9GbDf2pj0sLwdyrPqwqOH969ykBPzuHLnp8sZbrjtlg9ZJe6wKvweRqc9
         uHPD0CddR3Rvv8dnvw6FSp55JGm+TSkBEzpn2cm9aRrY+WYkvAL0RCDyZWDIjtc8OTQN
         63N1viJg1qP1alsKzcNlPAYNWuIA1JylEfSbvYQffOjc48el8Tah9+us0P8c5X8dJVAE
         lXQg==
X-Gm-Message-State: AOJu0Yxa9eRVVXzNTG6AtTzrb8HepFCbyl8ym6Qc/SoDtawaVioktNLH
	xoYFIW+maeqC/sjW+dZ+FnCHrU94+dPPqHrYYGE=
X-Google-Smtp-Source: AGHT+IF8ThBRqceicKGS0s/GkshliwrYw7PsWYru7WQEnqd3UUzzLepi8DPYauQV+fltEWiYRRqE+KURozR1V/5khZ0=
X-Received: by 2002:ac2:5936:0:b0:4f7:66bf:b263 with SMTP id
 v22-20020ac25936000000b004f766bfb263mr8500667lfi.24.1692126804724; Tue, 15
 Aug 2023 12:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb_CCWG_Domp-goEZuViHtMy_y9-5v1GHE1jbohzEGoLUA@mail.gmail.com>
In-Reply-To: <CAK5yBb_CCWG_Domp-goEZuViHtMy_y9-5v1GHE1jbohzEGoLUA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Aug 2023 21:13:13 +0200
Message-ID: <CANNYZj8qfbMCoPcTq=BViDaa6vEzCUb6QbbOXihJoMGEdtn7Ow@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 15 August 2023 (WW33)
To: Stephen Jolley <sjolley.yp.pm@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 19:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186100

On Tue, 15 Aug 2023 at 16:52, Stephen Jolley <sjolley.yp.pm@gmail.com> wrote:
> The various systemd issues have mostly been resolved although the AUH did break as a result and will have to be fixed and rerun.

I sent the patch now - it's for yocto-autobuilder-helper, not AUH, so
when that's applied, AUH job can re-run.

Alex

