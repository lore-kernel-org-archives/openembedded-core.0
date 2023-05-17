Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A367EC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:20:08 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.44616.1684311606877232178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EirxLG4Q;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f14468ef54so672500e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684311605; x=1686903605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Os6xDS8T6YtliRbL654Ffp8+qqPvdd1HKbSzzfhP8nA=;
        b=EirxLG4Qo1WEHnhqhxfKG7KuyEFc65vkvAzQXHGMiHLR55mUXNrFMumudR/lHUr2tN
         x4/bLFhe5Eiz/4x+cFDJX6AktdD2s5YtnvGvWV/CML3+1NWkvwtBfXW5WWCoNQo+jPQT
         eDq/tMeUVbxTb7DGHKOzIkl9U0Kc7a1fpJooSuEb/OfUEiQJNyD/wcpiPE8djFmmH0hJ
         OO0uo5yq628U3SPnRqgtPELUQjN/CmTGl/lPXR/zRJP6SS3CoB0ms6fNczzlYBusdUvg
         J+p2kuvXGCRINcYIr2Cd99Hf+lxUSFhdANpFZcxIzG131IDa9hPrl5CII++t84ul5GXC
         ZMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684311605; x=1686903605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Os6xDS8T6YtliRbL654Ffp8+qqPvdd1HKbSzzfhP8nA=;
        b=FhmJ6KB0JyLBwVR3Duo5Yg5s1ExkEDZhE4owFV9/eeEeFeSye1RKKXbrmuyPOGq+aB
         2TFraNIjp4GRGIrTTFugnPdh7UGfqnWm4ZdXjvSd8DZAJHpMaWzY4YIcl8sFG3iwroE8
         nrp+r/YWVg7IQHGuFKNvwIP19ltbLK54caDHegDIJcGdD+oVewFT7m2sctyy6PjgtZse
         jRKsGmMJ7aonhdT7xrt75q0uBX6g0oZs94RKVXnGaewNH8flXCDhXX63emVGZLRzf7nX
         zmSBYwdikM8myOXUwD5I3KWKWPtGzPPgVgLxAIAcADWVXnw+pcwAvjk8tgfMPqpoHNAy
         o4tA==
X-Gm-Message-State: AC+VfDxlfkxmjTo0jYRMba5NaTh5DjyeLDmX0JxVCnzkPRfq4B9ApORs
	z93SBckXK+sFIIJ7zGy+aWUnbGSKqJlq9UxrKrM=
X-Google-Smtp-Source: ACHHUZ6bAJUC8aryYBhc0CB/LGCNKWt02VTQZKwuWYrauDiAE54h7RcRmiuOl1dDijLRDYcz2VGX+NGHWijQh07v61U=
X-Received: by 2002:ac2:4252:0:b0:4ef:f06e:eacf with SMTP id
 m18-20020ac24252000000b004eff06eeacfmr7072130lfl.27.1684311604590; Wed, 17
 May 2023 01:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230517081542.412-1-florin.diaconescu009@gmail.com>
In-Reply-To: <20230517081542.412-1-florin.diaconescu009@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 May 2023 10:19:52 +0200
Message-ID: <CANNYZj9UPH2R1y36BdmbkOpSVNCdzEQXdS_aoO3Yfjj7RXVuyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: change GitHub mirror
To: Florin Diaconescu <florin.diaconescu009@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181472

On Wed, 17 May 2023 at 10:16, Florin Diaconescu
<florin.diaconescu009@gmail.com> wrote:
>
> Change from github.com/mirror/ncurses to
> github.com/ThomasDickey/ncurses-snapshots (which is linked in the
> ncurses FAQ http://invisible-island.net/ncurses/ncurses.faq.html)

...

>  # commit id corresponds to the revision in package version
> -SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
> +SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"

This cannot be bundled together with the SRC_URI change without
explanation. Please split out into a separate patch, if it is even
necessary.

Alex

