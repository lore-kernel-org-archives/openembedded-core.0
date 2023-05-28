Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC60FC7EE23
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 13:41:27 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.29005.1685281283801071539
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 06:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=J83Wt95r;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so2693798e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685281282; x=1687873282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zSklaegKMNg5e5b0EgRAbMf+QmQk3P35nICrNeYmsVg=;
        b=J83Wt95rWFPEfu5x69t48gJR8MzoHFRRpbQnoR3KNSlorieS9G4w+ahEdCXuZc4dzu
         xPgFiHU24tPPrSDiuZbwkaU7eYr0WMQYKLBZIUgiwjxCCWU/tg071kmgZSD3lt0KBITP
         N++tGoTWG0L+vGxI2MPtW2Kh2urovQ5OTKNvKJdtxJre/i+D6xxRmtfMVWRyM+2lG/ir
         45UNB3eo4r3AYhUrFbNYriy1CjKAEs9xFVqd1c+0ntx/fyrcWkiEdhVapk6mUQbbbnk6
         UWZ475i2sjI1rrW2Yq+fVp2q9o8J9KjpLBQyAsIQ2MbZSghoqa+op3vy2bO2VTyekCaH
         kHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685281282; x=1687873282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSklaegKMNg5e5b0EgRAbMf+QmQk3P35nICrNeYmsVg=;
        b=fMKX/aAWLXpwPR7FHhH5SiJuEGANJQ6Ov1GccKsF+elCCeUVpgZEocxnJXuymNWXbQ
         yVPAJzbpVXlZMD/MiMm5xAdExKP+4LCESwH4hETD6KcUKhDVcGPlqPoe6d3GMUGBnKHQ
         /mimttYzXpnHb3myum9IeIFABjRrIKlqr6yteqRWn+dQFZg1ascAShrwIdXlMm7mi+ah
         fl6iuokW8HySMjAD5pvx0MrdvDmBIyGYSQ9O7clXbsZd6xssntLKGUvXp9s/vVe85KWE
         tItyr4A+Dk254sv8eLEV47DbRwBSe9m5m9F4SRva/ZG44NwFOcseFLrHVmpyywFdIZbf
         Xv6Q==
X-Gm-Message-State: AC+VfDyTy4X7bfjzWK8pmijfQvSAxGgwOdy40m6Mw4c43rLGUqYZ6kQW
	4dVz3GtR65/dofPF5TQ+eWfW41YgXVVlya+Ymi8=
X-Google-Smtp-Source: ACHHUZ6UEEdhmgar/vJRODiCaqJAsxEtV0+O1p8V8/XVlK4G2JdvjEcvgqlI+uS9Hccz7KKQH52bEB+o4Azcg4XkoOA=
X-Received: by 2002:ac2:4c85:0:b0:4ea:f526:5bef with SMTP id
 d5-20020ac24c85000000b004eaf5265befmr3410981lfl.28.1685281281907; Sun, 28 May
 2023 06:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230527133252.284132-1-f_l_k@t-online.de> <20230527133252.284132-2-f_l_k@t-online.de>
 <17635252DFD4EDDE.6918@lists.openembedded.org>
In-Reply-To: <17635252DFD4EDDE.6918@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 May 2023 15:41:10 +0200
Message-ID: <CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: alex.kanavin@gmail.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 13:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181825

Also, how is the native header used in the target build? Isn't that
incorrect in itself?

Alex

On Sun, 28 May 2023 at 15:40, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Can you please show how it looks like? We do have a test for host
> contamination via headers, so I'd like to see what happens exactly and
> where the test isn't catching it.
>
> Same for patches 3/4, 4/4.
>
> Alex
>
> On Sat, 27 May 2023 at 15:33, Markus Volk <f_l_k@t-online.de> wrote:
> >
> > crypt.h is otherwise taken from the host machine
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  meta/recipes-devtools/python/python3_3.11.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.2.bb
> > index 421a305e22..1ca4ad35be 100644
> > --- a/meta/recipes-devtools/python/python3_3.11.2.bb
> > +++ b/meta/recipes-devtools/python/python3_3.11.2.bb
> > @@ -72,7 +72,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
> >  ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
> >
> >
> > -DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses"
> > +DEPENDS = "bzip2-replacement-native expat libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses libxcrypt-native"
> >  DEPENDS:append:class-target = " python3-native"
> >  DEPENDS:append:class-nativesdk = " python3-native"
> >
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181824): https://lists.openembedded.org/g/openembedded-core/message/181824
> Mute This Topic: https://lists.openembedded.org/mt/99167320/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

