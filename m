Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218D4C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 05:53:26 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.5577.1705989202424287455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 21:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QdPY5OY7;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-204fdd685fdso2886220fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 21:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705989202; x=1706594002; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC9wThRMSBhKPqsVirTTeeRQHNUeuWKmRIMNFjJAfdE=;
        b=QdPY5OY7csumytjPQMvBR+872PvEoNHJu7gl07jvT4y1wrrrLsoQvYFdk6W2EziE3F
         HNUNEiSTyzezbNarZuGq/iE57YqldNgvr5zQh8YtP5J7RZ1MmJXfbWysn5Ob112kDDcm
         dhXkLFULbAur5wifflxdbYxHyPKUSPN/0gKKyln5ZcvPniZc45mIlUFxSFlSzA3+Ji9N
         tpSwjzKFsUKrD922u/nA9ilZ5YSGVh3OUh7Hxxv5IKSdI4FVbVJfKBAC/odT1X2QNfZG
         tJbydoB3TthYTcPao8IPLtrVW45kfC1oBXl2aKyLs2n+HnzaV8d2p0lfAZFrFb4CIjHf
         rfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705989202; x=1706594002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rC9wThRMSBhKPqsVirTTeeRQHNUeuWKmRIMNFjJAfdE=;
        b=laMk+XtZV3BHS2Al1WPJBQiqQpqw+u3E3hDyrQZLWNVNeSKSEwGeTynd4lWSrGMhlb
         PevZCdetCrkrAmfxLP2m4vptR2Ms2UqFAjozkf6VI3AictAkbnydEZMCke4eo46FTRrv
         mNrslQGAj67TPD/ySuJnYL1QfOPTr+tO269x0FuT+2ESzYtofm4eA1HS+L4SC3+BVmKx
         USPJ3xGzB3rXlZDP2gVtK0AMhp7yNpoFGSFiTlx4FNJKjnuJYbAnlO69iyB6CChC7AK8
         Lw5wkRShZNBlprMs+0ANs/3977cVQ6GFf8NXsoxQ/REmeklit8Ycndw/vJqOkDbTGZ+R
         KeLw==
X-Gm-Message-State: AOJu0YyO5e/XC+SSjBOtvYMr99Z5Mu6mW1wkEg90GIBKgXKPUplyGCLO
	VS0xx0LYaA342pTPmIlb2dBEoo/V0lUx95Upr4zfKZovRSaCoogQiUuBzAO530lldld02/zU9gY
	yJVzjJtsENf4/OgtPo76GQZY3gFX5uwNIWsM=
X-Google-Smtp-Source: AGHT+IE/CHsM4zeRqawR/+HnpX5qmltIaQmyXjP5pAjajfvkE3djWXZKkfCxV3QdjOM83TURSSmXpGoMdiYBsjllWuY=
X-Received: by 2002:a05:6870:46a5:b0:214:75ad:c131 with SMTP id
 a37-20020a05687046a500b0021475adc131mr1220888oap.89.1705989201591; Mon, 22
 Jan 2024 21:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20240122075626.1216098-1-ashish.emailaddress@gmail.com> <4625.1705986948729329771@lists.openembedded.org>
In-Reply-To: <4625.1705986948729329771@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jan 2024 21:52:55 -0800
Message-ID: <CAMKF1sqGrxXqC9ACmevcufg=RubxLuR_mmJyZBD495JYn7gdpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils : CVE-2023-25584
To: Ashishx88 <ashish.emailaddress@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194203

On Mon, Jan 22, 2024 at 9:15=E2=80=AFPM Ashishx88 <ashish.emailaddress@gmai=
l.com> wrote:
>
> Hi Khem Raj ,
>
> Thanks for the input .
> Do i need to submit v3 with the space fixed ?
> Just trying to get idea w.r.t process

yes please.

>
> Thanks ,
>
> Ashish
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194200): https://lists.openembedded.org/g/openembedde=
d-core/message/194200
> Mute This Topic: https://lists.openembedded.org/mt/103882398/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

