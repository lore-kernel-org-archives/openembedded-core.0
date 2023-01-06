Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07C3C54EBD
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 18:17:08 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.530.1673029018961758967
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 10:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P5zkXEoh;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id jo4so5235008ejb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 10:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E8VIYpucQw+s4msAx5TqqZyVx/RhLPlEtBfpYl8/2sQ=;
        b=P5zkXEohuiHHkPg1/SCQrQ5/iUxYWV97o4lZLjIvNSldirTNK4FLyMwM8vivY9XH+c
         v/GKCFFsUQaaW7r+2ybloklp5HWR60ong7WGWNFsRteNhsNMFXEipY9MbnU6xUIijkl8
         SE7/hSym0iyYx3VJxtWqbdNYaxRuiRH5Ng5HYr3mYLsL6Z9v4e9pGICQ5SCJKA8/wofl
         TDwR14pxcw63JnR3bGs1Pw7BW/p+bgbiUoNDPFL5/6pk5RuVyy4pfeiDCt48xBsAlzhU
         257zgI31n4jv8iv8mQgT3T4L0KMEoeltCmVtGwmTYWyRnS5bJ6WTHD4Be3e/e30r55XL
         yDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8VIYpucQw+s4msAx5TqqZyVx/RhLPlEtBfpYl8/2sQ=;
        b=plC9sZ4T0uPUkUOc1zggVWt8FZvf+Kdj5cKp2/erRUeoDmI+HThMkfElRtyfnLCRJq
         iCy3ek3FrrNriJ+45bTpfBrVwthJKKmRjL8pil69/trNqjz9Hh9Cn2uK7xS+1CnBS0sM
         y2F0x9qDNiyhjveY1IibatDoJwrJxO6O0EyX6lUxSl0yhiMbh818vOUZA1eue+xYOV+u
         B0oVG8grc/2dJy7rtfL22BSLXF6dKUJZpDlX6mwm/EnKiBfmhz9NYn9NRdepo+oJsZAA
         GyoTtE8YcN1mrMxefoKhJEYDsMyPy7VIEkhEqeZPMrpEr2Z6Q5ZPtnF/PM0RP3AsBLw0
         p9Yg==
X-Gm-Message-State: AFqh2kp4H2+q34u7PqVy2Lx8q60ozoDkluud1DNwQCUnm3j8uKFXDwki
	RvW+iywOtDGioHD+VP7mf8kiKr9gI0zLAjn5BLI=
X-Google-Smtp-Source: AMrXdXvv9zEVuCglYAdxMfn4KA+9kkMx6g9ibPQ0IZdIXj3ymoGTxrof9OB0/wokilnfeqGkqazhLNDaRHlEHINqSaQ=
X-Received: by 2002:a17:906:5048:b0:83c:7449:792c with SMTP id
 e8-20020a170906504800b0083c7449792cmr6296600ejk.19.1673029016999; Fri, 06 Jan
 2023 10:16:56 -0800 (PST)
MIME-Version: 1.0
References: <4769387.GXAFRqVoOG@linc>
In-Reply-To: <4769387.GXAFRqVoOG@linc>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 6 Jan 2023 12:16:45 -0600
Message-ID: <CAJdd5Ga1z4n3HktwMqDyTBH3ts71R4oaeZ51YRgOMuj6D0RBxA@mail.gmail.com>
Subject: Re: create-spdx and sstate
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 18:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175610

On Thu, Jan 5, 2023 at 2:32 PM Paul Eggleton
<bluelightning@bluelightning.org> wrote:
>
> Hi Joshua / all
>
> We've been having an issue with the create-spdx class if we share sstate
> between two configurations - one where gcc-cross-<arch> has a dependency and
> one where it doesn't (specifically, one where the abicheck class in meta-
> binaryaudit is inherited and the other where it isn't; that influences
> DEPENDS). The result is that if you build the configuration with the dependency
> then the one where it doesn't (in separate build dirs with the same sstate
> cache), image_combine_spdx fails because it can't find the SPDX data file for
> the dependency as it was not built in the second configuration.
>
> It seems that create-spdx looks at BB_TASKDEPDATA to get dependencies and then
> adds BB_TASKDEPDATA to vardepsexclude, thus the dependencies changing does not
> cause the task to be re-executed. However, I assume a variable dependency on
> BB_TASKDEPDATA might be impractical, thus why it was excluded in the first
> place. Do we instead add an explicit dependency on DEPENDS? I'm happy to come
> up with a patch if we can determine what the correct fix is.

I think that sounds correct. The class does do_create_spdx[deptask] =
"do_create_spdx" to ensure it picks up all the dependencies from
DEPENDS, it would make sense that it should also have DEPENDS as a
dependent variable so it reruns.

It is a little weird that none of the tasks upstream of do_create_spdx
changing from that class are causing do_create_spdx to be invalidated
and re-run.... but maybe that class is doing something a little less
normal

>
> (FWIW we're still using dunfell, but I don't see any changes in master that
> alter this particular behaviour.)
>
> Thanks
> Paul
>
>

