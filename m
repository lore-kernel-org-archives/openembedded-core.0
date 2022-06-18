Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C93FC433EF
	for <webhook@archiver.kernel.org>; Sat, 18 Jun 2022 20:54:51 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.2838.1655585688165347173
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jun 2022 13:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GqcpOmv9;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id b7so8072995ljr.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jun 2022 13:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWxM1irP+bkv/U7lGoWu7f777AKpWNDHS05W9sLd17E=;
        b=GqcpOmv9+tY6lTvKZM9U8HNQ9qrEoPX8egukk35S+FgIhEV3BI5nuxH5Ra3UYKULWj
         3Q4ghiWs/5iPABag3CrcFg5OJRaRKmw+Jc2JlsDJ68HNvwnWYM/dTpVknywILHc5HLlb
         yoz+gsKsJ9aUJeAkbDxWCRcI0JIZ/vsZ/Gz0dT+2JBg2ZIkLCukDW2RzqkVlIMfASjkA
         5TKU/nxdGVz651IvuhLRxnGg53o9MUoSuKB2er+yIE8oKv9e3GWyeoXDgaVIniEH5DJf
         nj/c9GRdF2eFOnCtiKGMt1dU80f0yQ80mJR5ITg4RmlkqgK7EWtUHMwLeTqchSO1VGPV
         g5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWxM1irP+bkv/U7lGoWu7f777AKpWNDHS05W9sLd17E=;
        b=w8iMqeRqL4EMqFdPY4kAeEbUf513a92j1M6fF9Et95l/Xcd5iaNHKpylBL+LaX6m9F
         rgF5CXZUf9AqYjEg1G6FMfg+SnVTIjvUvJm0zNcKHEmWri4KLWUwvO//TyX2TdrvlMEF
         bOUGYehinD5vxAuZJhLZMa7PUcvW5zmaiNyvYKvJO66CcpHoj6Ge3BxlIOJqH7HCRNaU
         csjcXD0IBEnTGchgMX98og2z0ge6vEPUx1ja3OKrYc/p2A+ekaEgmDO/cDxBi6I2tJvn
         j+TFxiDdOR/pxlj3SckdE0N6RZhKP2bVojyx4YD60XfwuiURr2cMhO8nK+j3xDEZupZ3
         7hHA==
X-Gm-Message-State: AJIora/MQok4YZJCSocbtzX+55YwQe9VSFkH01S8ec82qLlf+TJWBQSH
	LKQ0RfMj3nHK1KjnyUV0GuZX8/x+WaUo30Dj9BM=
X-Google-Smtp-Source: 
 AGRyM1ujybU6uARQa+IhoXUb/nZgutlfv/rtLbn1bFp10o3GDE18BPJPKPTjSVVAV0y7NkwViTSRu8I/PBrYTL/NQx4=
X-Received: by 2002:a2e:2ac1:0:b0:255:6d35:6726 with SMTP id
 q184-20020a2e2ac1000000b002556d356726mr7978577ljq.41.1655585686197; Sat, 18
 Jun 2022 13:54:46 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0101018167766164-801a0ad2-878a-4227-8a83-56edb97227ce-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018167766164-801a0ad2-878a-4227-8a83-56edb97227ce-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 18 Jun 2022 22:54:34 +0200
Message-ID: 
 <CANNYZj_gJRaGsbm-Lb=eVZqYD1u=N4Xqe0edEz6DfTunT3hRWw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-jsonschema: upgrading to 4.6.0 FAILED
To: Ross Burton <ross@burtonini.com>, Tim Orling <ticotimo@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jun 2022 20:54:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167031

python3-jsonschema has replaced setuptools with a "modern,
well-designed, legacy-free, and now well-supported packaging tool,
Hatch", which oe-core does not yet support:
https://github.com/python-jsonschema/jsonschema/commit/f61f3b7a73c14409178921bf4ce23050bf90560d

Ross, I think there's been some work to enable that? Can you carry it
to completion?

Alex

On Wed, 15 Jun 2022 at 15:05, Auto Upgrade Helper <auh@yoctoproject.org> wrote:
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.6.0* has Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
>
>
>
> Next steps:
>     - apply the patch: git am 0001-python3-jsonschema-upgrade-4.5.1-4.6.0.patch
>     - check the changes to upstream patches and summarize them in the commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --amend
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166956): https://lists.openembedded.org/g/openembedded-core/message/166956
> Mute This Topic: https://lists.openembedded.org/mt/91775634/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

