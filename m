Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6724FC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 07:48:00 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.45657.1682322472230674653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 00:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DAehuc/5;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4eff1f7f34bso568612e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 00:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682322470; x=1684914470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ACVvG4DMX15TMkIbz+uUvNFG1GEv3a9VK2Z8nPe2kOI=;
        b=DAehuc/5K2VyDm6y4rHO5hiNtYYlVOeGhR3bp4wKsQt/hLUwh6zLr/HXONooI1kIbr
         3IxOGlyGdDtTadvfrFfwg72A44exO56UbXIC8OTrXaK9a3x6i1NL21EJsMHZRLZsfgL9
         hqR6QKP5eEKtYfXk0QKjJXCstLhCrE7rmjriEOZ1H5NQa65vLyUx8zNlUzTnKr/c1wKI
         CR+QEpUnsSDOCT9968AOCmijIl58rBRquQSeevbMqXh+VpqLTeltRPaXGNLfyWcBfXbr
         dtudOe6Kpv79/VcipQRFwFdGL3dY0lfjYbD/4wlUWLDhooJvGusTdzP8Cu45WmapeA++
         RTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682322470; x=1684914470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACVvG4DMX15TMkIbz+uUvNFG1GEv3a9VK2Z8nPe2kOI=;
        b=C9oqPdBU0X/pKsaFgnfuiwkiHThT5IB5SzzfyPzoihCMaYvsJ1ysK9468JtmbHfFsN
         Kuv4GeRSCpUKMAfg+0xhipcPmwbFCt64TZZWcTDXCwQBKCR4nv+kiRBIiQu6i/csT9da
         w0iJjzLpvKlcFhjaPmUxT8R1D9XWwO/VQ9FKU8sJoMFUqzyTug0wrBhiZ+QBTRc9icR8
         Y+l9JjcdD85y5t3rtEe5yPz8h4Pnzb0NHUhO6i3wnmkeV6WgpPKzq24BhrtwxoWF2g4u
         Q9a5gEy2ZMK5DAz1T2oMEI2jvuTv04r4BBp8W3dUaA3Kvww6sPZfCMAj9w5O+L6rqvKp
         uikw==
X-Gm-Message-State: AAQBX9cWAusizmtsXYEdE4mHihNHgl64EdCRuMda35nEjonAZF3xgssX
	mmWx+PKcZWoCuxNjUW40RSRsFe6u32xi7K1r7vQ=
X-Google-Smtp-Source: AKy350ZVM5ChZvJedh17Q0+fPHu7G3VAFBNvV2GYjjyBbDDEUms7B3rVmJVr55pEXkFyVavFnHWbmcmkNKWHm0nT4Wo=
X-Received: by 2002:ac2:4891:0:b0:4ec:8d97:9479 with SMTP id
 x17-20020ac24891000000b004ec8d979479mr2815334lfc.20.1682322468365; Mon, 24
 Apr 2023 00:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682178812.git.frederic.martinsons@gmail.com> <4f1ee72f98af8396292171efcf08d3db1efa44e8.1682178812.git.frederic.martinsons@gmail.com>
In-Reply-To: <4f1ee72f98af8396292171efcf08d3db1efa44e8.1682178812.git.frederic.martinsons@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Apr 2023 09:47:36 +0200
Message-ID: <CANNYZj_LnwyRXfAMmf059n4f3Vrxht3rrqN_BTBGxtXVa1GsDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] zvariant: add ptest feature for zvariant
 test suite
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 07:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180339

On Sat, 22 Apr 2023 at 18:00, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:

> +# zvariant is an indermediate product for the zbus project
> +# and so, it provided only a static lib (rlib) which fall only
> +# in -dev package
> +ALLOW_EMPTY:${PN} = "1"
> +RDEPENDS:${PN}-ptest:remove = "${PN}"

Only the first should be enough, why also the second? We generally try
to avoid :remove, as issues can be usually solved in better ways.

Alex

