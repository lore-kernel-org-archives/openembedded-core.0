Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEE4E706F0
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:41:08 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.11456.1695285663126050124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 01:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nz5L3Tuy;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b962c226ceso10907221fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 01:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695285661; x=1695890461; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ag7PGaaP6mjkV9WWVExJ0GsDFlYR1PFF9hKwYkcwKeU=;
        b=Nz5L3TuyUu/lxsMh9jusbtVgxWy0C/8qj5ge+EbPdphdwzOqEPHu9MIVUa1xSpQLKB
         D4eA+phHvM38nlwR5t6OINn5bJ63CHcVvsN1qqhTk/+n7I+kVWaNQM3AeuOcgFyQwirV
         GtxsOLILb03/zaZGEK1jazfQqwbeEE9xjP3eI+4i6nEQf+TVy/kYll22dp6XH5FguiRl
         mVn6Lw034PfKNauDE8tRZ93kxc3OVEfobgW7yGlXzC55ZKo1ooKhYUsWkcgRGW2KdUHx
         AfiLq7Qp3iLSYNAUq3soPH4CzjCc57UAF5HNBNRnWoceqctP8JszmZpof/DXJhkOQJxh
         EYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695285661; x=1695890461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag7PGaaP6mjkV9WWVExJ0GsDFlYR1PFF9hKwYkcwKeU=;
        b=tvv/Dm7ZfPSk+0GeXMPrfsJi5no/J2783hlkDDD3F6JDuKqijrwpUVRHjUC0taUiO7
         LXKL6/e4UDA8nKdtszURgrzAy9f2vUPfh5Q0m9r9sJxdSp4xvMMu+O1zlM0mD9NNg9Hx
         TD5J1JKpei45dqc9jxhXKn21P/fy4Huh18XofGl3+jnv+fYtfOzA281X1tMWh89AHW8n
         EMoAgv2jQHVzADwLGXc/MWnVeRyciCy3HOUIej5pWMXNJJEzX5VJN2ktxuewL9sxYyXa
         HkMynY2PynmC/BIH7FCxHrOl8WeC2tjWOoZJWYYbDjAcBFC3euDiD5DGDzy5tZmd2IeK
         +N9A==
X-Gm-Message-State: AOJu0YzYxVuDUze0+Z7VZcvEKkfPU2xiG5QE+ry3g+OUdXPi9oSIONo1
	wRBufQc+fmOZ65v20lHKbeIU+CHO0Q7ef2tOH/g=
X-Google-Smtp-Source: AGHT+IFJKO/YVt6MCkg2wYKmPBcZnkQD4qb8H0NXlOXx0sK/JcYjIimLhU8JpMBPWxjvJffKBZIT5CXKvYAmjdtutSs=
X-Received: by 2002:a2e:9189:0:b0:2b9:e53f:e1fd with SMTP id
 f9-20020a2e9189000000b002b9e53fe1fdmr4272226ljg.34.1695285660922; Thu, 21 Sep
 2023 01:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230921064727.1260198-1-kai.kang@windriver.com>
 <CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
 <f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com> <VGUB1S.EQNLFG4U297D@t-online.de>
In-Reply-To: <VGUB1S.EQNLFG4U297D@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 10:40:49 +0200
Message-ID: <CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Kai Kang <kai.kang@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187982

On Thu, 21 Sept 2023 at 10:34, Markus Volk <f_l_k@t-online.de> wrote:
> Maybe it is somehow related to ${prefix}/share and replacing by ${datadir} would help?
>
> This fixed an issue I had with gnome-themes-extra
> https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=ab1f6ee8bf4835fabdf02cb0e30b20e4ff11e5fb

Things diverge much earlier:
-  'adwaita-icon-theme/do_write_config':
'cdb1f880efd08a498798793a1cbc51e48272a71b2ec48b71f263b7af9c8b8ca9',
+  'adwaita-icon-theme/do_write_config':
'690686d4d2721c21520f4736e3718e414f70366bea48b2df805b37a6a5193a1b',

Something in that task is contaminated by target-specific value.

Alex

