Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E5FCD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:03:12 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.6564.1695124983034229536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 05:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TTQ1P8df;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2bfb12b24e5so89124611fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 05:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695124981; x=1695729781; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hSjI/7GWL8G7T4pLtsw0N+9EL2t0LdEVvt1l4Q8wSZk=;
        b=TTQ1P8dfCQQe6dd7UPUSmoTKrYH44k3/OxC1O4hUPyURVmZ4+E+JsyHy/wOHdCU0yE
         IsZIh7K9k2Pokg6Eyq8AsoCSqXNK/7JHCEK7uxgY2p6TDdHQyQFZ1ltEM9nEocSjWF8j
         fDW18V9LaQybT2QdIK/GNiVgDY3c+Y0V0mIIAJg3ylFtLX03p3aC4T+xGCxRwDARDTH0
         d17l0saoj9+pfP7j0Z30PYmq/7n9r+K8tVYe7pKg8wxfLrpJWEmjVrBUxw3jWlhppScZ
         7XTzO8igrXPfk/zzRIv2jaGlHZ4jjFbzMORF6MvmRh7bKrhkMxMB0bUNKdb+Pr8IW15l
         LBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695124981; x=1695729781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSjI/7GWL8G7T4pLtsw0N+9EL2t0LdEVvt1l4Q8wSZk=;
        b=CkuOFLQIOpH4LJqVZTioT8vx5tWqMcKqnX/Le3/OqMr+hceWR8MbZF3aPIjdbir44D
         g0l+HwlgzJOWFHY/jhoWuOLfpH0luFdq7ew0/MTIXRcLR4ZkNG/AM/oSiXGyFbSf38PB
         vWf7sdfS3ZLaBroGFNdr/qysLTmLksNroQah8mMmE0/ICJXo9fcIohlZQf00L9A5QMlY
         jiU2ZgYRFLS09aCqj/VLa99YEuU+gYOY5nN5Px9n6qlO290GfKbunN1qkYuaY5RWRZHW
         HlFdQMO+XEkIX8YAyki0fIuO8EEAgV7ENYFn0yxRNWeICWxJYQxVYkjSU7XedWnsq3L/
         mthA==
X-Gm-Message-State: AOJu0YxPcDiForsnLda4cKN9BRZdjqtQNfsWWwuKzdappeoe0aYctaFk
	FMIsLzlATSbU7Y53aueBsBjR/Vyx9JBFdBJciUc=
X-Google-Smtp-Source: AGHT+IFzXguzRhG31zQ/f7y6A4AD9YFS6v48myxicNdxvXxCVsIzhwrCQckJsKT7FsAV6tF+gpSYLQmihpm7V+Zr9Ew=
X-Received: by 2002:a05:651c:78a:b0:2bf:ea78:c3b with SMTP id
 g10-20020a05651c078a00b002bfea780c3bmr7924906lje.9.1695124980793; Tue, 19 Sep
 2023 05:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230919114941.1819808-1-f_l_k@t-online.de>
In-Reply-To: <20230919114941.1819808-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Sep 2023 14:02:48 +0200
Message-ID: <CANNYZj_+k_AjWNXMK-uPFpH3uNL_aYFeCkXw=+3UCUKnmnGMcg@mail.gmail.com>
Subject: Re: [oe-core][PATCH] vte: upgrade 2.72.2 -> 2.74.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 12:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187857

On Tue, 19 Sept 2023 at 13:49, Markus Volk <f_l_k@t-online.de> wrote:
> - gtk4 is enabled by default. gnome-terminal is still a gtk3 app.
>   disable gtk4 for now to fix configure and to still be able to
>   build vte without opengl

recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb as well is
gtk+3 only, and gtk4 port for that is unlikely to happen. I guess once
gnome-terminal is ported and vte drops gtk3 support, we need to find a
different terminal (rxvt or indeed gnome-terminal).

Alex

