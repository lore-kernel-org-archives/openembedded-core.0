Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CE1C35273
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.3409.1649405550212786384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 01:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hmAmyo7Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id d40so6199909lfv.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jCGBmBLi832+by9vW3bkakRpKxcqUuhE5ud12dbcPMs=;
        b=hmAmyo7Y+kfbGbBfOB1YPPy2ZZWaOJhOfik6RF3w3sQqCnvssHwIePFiwmibjJeszH
         W54sbUBzkx4iLxbdyJKPEu8ihZgJpAjJToVCyC0xzHC1unqrwNt5fK2/ueow6zfXsAGw
         30E+nW//G1tmX1Wk6ZUHLf8o02GM73fkD688iVhzzWL2Jg6FYsijIZBnMqugei7K+Vpj
         ptFCMwZz6kKlgHyiQ6HlyXIDHDaLyL+sGApXbEwAxksSnepg2iTIOj6fvHbOQZY2hDwp
         TDjmroKZwRVM3KJWk7mGQkWnlPJHJq+vhWdwm5gm1mSSjk9m9I2FHROpJu2RD27Af18p
         FbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCGBmBLi832+by9vW3bkakRpKxcqUuhE5ud12dbcPMs=;
        b=Pos/8EZDNoCPQXiWikEWKdTB4cnPmbhs9Gz2eErZNHVO5mZefiNlL31wCgzEnJvrFL
         4tGUtS/pkGSYzoaVyGhRH0XqBtid7VTN8w2DiRnEx1q2ParrwpHfFyTMpf0svC4DkG5L
         n9ji7fKHAU8MxG+R1DrwzSXcPkp6pxGVw1euzpAhlkTE4LrOE55L4W1AztLeJHbgxJ2l
         GmSdaI9F50XYUAdDbyvpOzjnfzQirRl/Hig7wZy8Z0bmqnO6wAt1K3ovkqpTmooTYYP5
         HrXb3vDwSSfDU6hxhjWQnnLR8H8szG/ToacY8bGb3YHaiIev+1lKS39y+/5A+PfGsIxQ
         niVA==
X-Gm-Message-State: AOAM531NeQhlcoxs7w4aKH3t0beVozvGK+D6rTo8kTDblpOXJFg7ttmF
	ljfl1FmEbMDDgmG9Qjeko+bB8z9HCmEcBgQdA5M=
X-Google-Smtp-Source: 
 ABdhPJyygIRy2tTt1VwasVZPXZHmfh5Q/68gEkpETyrIGAEwkwt4M4VtXFov8VezSqFmuutppLM/v57MxsKy2XqtQCU=
X-Received: by 2002:a19:ca14:0:b0:44a:23ab:90a5 with SMTP id
 a20-20020a19ca14000000b0044a23ab90a5mr11924352lfg.673.1649405548237; Fri, 08
 Apr 2022 01:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220407170029.3500874-1-alex@linutronix.de>
 <20220407170029.3500874-2-alex@linutronix.de>
 <c29a79f917c3f91a2661192102eb25868138c12a.camel@linuxfoundation.org>
In-Reply-To: 
 <c29a79f917c3f91a2661192102eb25868138c12a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Apr 2022 10:12:16 +0200
Message-ID: 
 <CANNYZj9nS_V2n5gwTjq4fr2aPDa_i-NG9dD=_5dzUFG_Q67HNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/17] llvm: update 13.0.1 -> 14.0.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164154

On Fri, 8 Apr 2022 at 09:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> There is something not quite right with one of the llvm changes:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5022
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/5043/steps/32/logs/stdio

This bit:
+ # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
+ mv -T -n ${D}/${prefix}/lib ${D}/${libdir}

On my distros '-n -T' is enough to guard against renaming into itself
becoming an error, but apparently older mv still errors out. Perhaps
appending '|| true' will do the trick, can you make that adjustment?

Alex

