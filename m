Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BB2C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 06:38:14 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.5135.1692859088095920842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 23:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FdPQCoCv;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b974031aeaso98922491fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 23:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692859086; x=1693463886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17L3UZRhgzz3O5Cq0laEvN147XxlAPlzu7CRNvwC1iY=;
        b=FdPQCoCvMKjPPGfGNvETZ0kCgX4VIRejOInQucCGpgV/w2jwfo39aSmu7EjJXgNmk4
         t2hS7przIX+nRR4VBQS/7i/FRR5EnPHKFUPK6mPdj8lSkK2LSp+Z0oTTnpUx5o1jp01Y
         qUA3dlNlQCHl9yTkkQJqFv+7vrt58c+wx/eINjrk1GBbsCTr6bvhLUaGzMGi/yB4S2+t
         2/jNkKcvrIERwnCXVQd9NZStEQ5fgzSB8emQG1jfBXSautMYpoFHOrLOM2duwlor8R/5
         hoelBftF6Ibo5q5Ur7lHILPlrv/bHj1nzq1forfvFmYG6AxNTNmqxFgnui33snLakZuZ
         tsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692859086; x=1693463886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17L3UZRhgzz3O5Cq0laEvN147XxlAPlzu7CRNvwC1iY=;
        b=LMoIQ1hNwLEWDYRW7qljIt3+wB00tKLWKfbJhVUMs1IOh7gZCh2DMlhLXZtNGAtyH2
         oYGormKsYep3zNIyOXC4wtJZsfyXZeg6JHiWtGu4Q3pFBYYaNWhWaEkpIroRd1aQ7WbT
         gYC2C11GID+xfl1zicry4uY+5cfF2jbOvfSziRg6Et3hYjNrF+8OwNgbE5KHmOsv+/Zq
         Go2HTxsoJZkLhf2nM7/sXGq1ANNm12FN9athEqIjKAQ1ZCCjXcUK1w9Vodx8GnqrbsPj
         iQG4rx1uONXafYt5DjPtwkvRsRFS157oFkHCfksWDJ4xGIRLoSNP8MF0xxb03vuLPvc4
         jPFQ==
X-Gm-Message-State: AOJu0Yyo3zAShNMmx8p/tf6WqxyHRIKIFhsahXb6BlfSozk7KaDcnZ8G
	rsMMAMHEMFm0hKeEq6v8I8XHcg==
X-Google-Smtp-Source: AGHT+IEX4eV5EpzqerItqUKBSqSbuNSS3KU8cINt34XNdQOlHacd2tnKf7E7dIKGuNM9HrXjXpiDhg==
X-Received: by 2002:a2e:b169:0:b0:2b9:ac48:d804 with SMTP id a9-20020a2eb169000000b002b9ac48d804mr11789144ljm.38.1692859086161;
        Wed, 23 Aug 2023 23:38:06 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id a11-20020a05651c010b00b002ba7ae1f52asm3605000ljb.0.2023.08.23.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 23:38:05 -0700 (PDT)
Date: Thu, 24 Aug 2023 09:38:04 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/9] core-image-minimal: increase extra
 space to pass df.py oeqa runtime test
Message-ID: <ZOb6zAKl0Yxg1zME@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <CANNYZj8iTJCVqdwaiiv1MM-dxWcXyS3JjHHN3KwnA8o2xx3v=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8iTJCVqdwaiiv1MM-dxWcXyS3JjHHN3KwnA8o2xx3v=g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 06:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186636

Hi,

On Wed, Aug 23, 2023 at 08:44:33PM +0200, Alexander Kanavin wrote:
> Either you need to use a different image in testing, or add the needed
> pieces to this image in the same commit, explaining why.
> 
> Adding extra space because you have a local, custom configuration
> where it is required is not correct.

Sorry I thought upstream would be testing core-image-minimal as well.
If that's not the case, then just drop this. Some other images need
to be tested instead, but I don't know which.

Cheers,

-Mikko

> Alex
> 
> On Wed, 23 Aug 2023 at 08:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >
> > testimage.bbclass requires that ssh communication with target works
> > and then it runs oeqa runtime tests with that. Tests like df.py
> > check that there is more than 5Mb free space on the rootfs on target. Sadly
> > latest core-image-minimal only has 1.5 Mb free space if
> > ssh-server-dropbear is added to it. Thus by default, core-image-minimal
> > is now failing oeqa rutime df.py test.
> >
> > Fix this by increasing core-image-minimal rootfs size by 5Mb if
> > testimage.bbclass is used which implies adding either
> > ssh-server-dropbear or ssh-server-openssh to the target rootfs.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/recipes-core/images/core-image-minimal.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > v2: no changes
> >
> > v1: https://lists.openembedded.org/g/openembedded-core/message/186423
> >
> > diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
> > index 84343adcd8..c04612bc15 100644
> > --- a/meta/recipes-core/images/core-image-minimal.bb
> > +++ b/meta/recipes-core/images/core-image-minimal.bb
> > @@ -10,3 +10,6 @@ inherit core-image
> >
> >  IMAGE_ROOTFS_SIZE ?= "8192"
> >  IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
> > +
> > +# a bit more space needed for sshd to actually run the tests
> > +IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("IMAGE_CLASSES", "testimage", " + 5120", "", d)}"
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186549): https://lists.openembedded.org/g/openembedded-core/message/186549
> > Mute This Topic: https://lists.openembedded.org/mt/100910038/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

