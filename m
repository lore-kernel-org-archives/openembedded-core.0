Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E241CC38A02
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:29:29 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.6918.1667204961340345843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OahDUKxs;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id b8so15880932ljf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 01:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aeZuKtethnmkM7us/wBNBaxw0EiuH9EBKVTKWYuSRtw=;
        b=OahDUKxsoFvtLeCjWn+J4hM9fUvlPN9K6aQvEEuLKC/LfZ0aEWiKRRnUr+GXokRMkf
         hoD4nc72p/+pNCGEGnSBaMVTtgDWI7G3E4WO3eg48fuwd2ZcnSmqsASPJJfYGqhzFDe/
         hdVBKiJ89Ed1AokRFcFtyhci21LsruW4n6rXRSXo88lNBXDt0RV17np+UIu+fV13CVmH
         Mx1dQv/an+4lgPQ4G/x8XT27f8HHCultmFXFGiOpSah6CdyU/utckL1pVPzbSTGnHMcl
         iQdO3mxlKVIV2XRHPhPmCes7dkV7IlwNjnydeuBcQi7JKnrwWIG7QuOze7KTd6pZKvcN
         2rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeZuKtethnmkM7us/wBNBaxw0EiuH9EBKVTKWYuSRtw=;
        b=fDRh70g5/Ffka3KpQHCFqJqmz+RdmGni8yqapTw5IK7cfxaMwZ3NHY06hWUq3mNjcY
         lLf2DAIPiaQDaAVHRk9Fh5p5veaW2TluKZVJwHPQtKJPVplo/xFQkshvmafLz9E/6/xG
         kzQyNYB/JEHlTU9bP1Zb+7OCL70B64smlXAS9rt05OiCMdnTxLYVM9iUgHg0q5PHJrQm
         zTM+8l3pCNhSSvYAGGYkH/sJJukDFNM8RqirfC8BjXdftMdHx2j+zvCoM6lJCxeCpmmY
         Sz98hLIjknOjZi6enY7HPNLqtMff+xtNPr7wEFRTeIC3SFlPFZz5fTyqzd4YmVUQiLd0
         WbOw==
X-Gm-Message-State: ACrzQf0N0rfMVnlByu6JhGCP+V6inEB6gcbtpY+z7S+tWyw9GGIKWiKT
	9WZVGwbMuYS2ptDiRmn9zDriijS7uY0que94hr4=
X-Google-Smtp-Source: AMsMyM5rjf5/AGcih1hqWEimpQXd8K52oj4284NCGNfPhheE5aDt1E27W5tzz7tVZRXXa2+tWUS9t69nKOqC2IbuG2A=
X-Received: by 2002:a2e:3202:0:b0:277:351f:714c with SMTP id
 y2-20020a2e3202000000b00277351f714cmr5106346ljy.33.1667204959653; Mon, 31 Oct
 2022 01:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_SNB98B4WgHjY8nGP-N1LCHg10c+SJZGY-1w+AXMa3Yw@mail.gmail.com>
 <20057.1667204868038925740@lists.openembedded.org>
In-Reply-To: <20057.1667204868038925740@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Oct 2022 09:29:08 +0100
Message-ID: <CANNYZj9jgh4Q0uNJ=ZWFqQwmQbj6eVqRY081F7r=k=W9A1TUQw@mail.gmail.com>
Subject: Re: [OE-core] Public: Re: [meta-oe][PATCH V3] bc: Add ptest.
To: Yan Xin Kuan <yanxk.fnst@fujitsu.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 08:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172295

In that case, the benchmark for the test was not performed correctly.
You need to use the kvm parameter.

Alex

On Mon, 31 Oct 2022 at 09:27, Yan Xin Kuan <yanxk.fnst@fujitsu.com> wrote:
>
> runqemu was used, but no kvm parameter passed.

