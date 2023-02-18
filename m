Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599EBC61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 04:32:09 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.6749.1676694728601269039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Feb 2023 20:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m6uu7/mC;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id q1-20020a9d7c81000000b00690ed91749aso84942otn.7
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 20:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U33QMvt5JLuRKvyg5AbCL9PIu8pOxTRZoHnSbXQLPZk=;
        b=m6uu7/mCVr2nuivAMwpGQsiBbvx9Kp554X2Xcj9s6ZxTQocQfZaM72zhFLnN7xHT2z
         Rqd3Tm4nr4JI7ocCKokcBLoHEedk7TIRgA5LGIKGE3wC1i3gbiBmptHgbx/uViz6t1N9
         XL+Ga3d9UzHPGCjHjkoamNcMu1yZ/wGXcRgFPDP6G2JdIoJDdQQxthNNIR5B4ZNbgD3j
         xgMlrcrvRJYh1bRiSC26Pg9uRTh+GY3JOfYTnBURrFycQtnEHf6sE6oUR1/LNksDrxd+
         pbJbwy1ti8V19qw7lsaJ1n0s/SwncQQWd6A46AkfIQhWfTbKaQXwhI3rqxAE4lkXDx8w
         nkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U33QMvt5JLuRKvyg5AbCL9PIu8pOxTRZoHnSbXQLPZk=;
        b=av8jDk6JoWa11yIacR+YCw0eDz7QxASqwURiX0BKFVCIaeeNuGQNSSCIroHdplp2jD
         PP24IRcuo3JfHMZFsI05x6uSOioZHjKb4q2Pv4U+XW4OBkvt83/sZupbes9rW5v8apq6
         T+ZoxJY73bl+lKi89NthlcrMpPCKUJAjzTDP7H2vOhu/pN0FJw7yn6dVVYSbZWNoW1eL
         A6OA3lrJRWwiynzYFHa0t58stZC5YsGBNCk9ybcOBqYC3zchuhzOid6/BuA/GqdlFV9n
         HWkxL7jFDzq5A4/nKM1IsEpnAeec3FRhE2JAx/6+e2gNCanKnoSVJ3BIyD3XxwAdMkRZ
         IfDA==
X-Gm-Message-State: AO0yUKUWiVI3QgbORNhZfVbPXXFO4mK7XUAx6MsJAOM34jDgTy4PZqkp
	jA2CttR6+Goc/m5wBjTlFcLDrEIlWdzG7Th2RAU=
X-Google-Smtp-Source: AK7set/FyUSKlPns9A+JtC+XNOiaJytozwN25r2CD1ziIHqqjSVH7hiTSbrl0Mkvl4Dg/pXgzzBT8MWKQtcBEVkr1Pc=
X-Received: by 2002:a05:6830:3749:b0:68d:3fc4:a1e6 with SMTP id
 bm9-20020a056830374900b0068d3fc4a1e6mr609480otb.1.1676694727827; Fri, 17 Feb
 2023 20:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20230215132454.4114658-1-dmitry.baryshkov@linaro.org> <CANNYZj-MLR_2AmeWe_1s=AOdy2zX1iQSvpGva0Jt=RELkAxcxw@mail.gmail.com>
In-Reply-To: <CANNYZj-MLR_2AmeWe_1s=AOdy2zX1iQSvpGva0Jt=RELkAxcxw@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Sat, 18 Feb 2023 06:31:56 +0200
Message-ID: <CALT56yMHMGWBk0fQPp+=hFDqkV2rW-qjGDrH+SVL=jD9UPKBLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: provide support for packing development
 and testing tools
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Feb 2023 04:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177316

On Wed, 15 Feb 2023 at 15:32, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Wed, 15 Feb 2023 at 14:25, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> > +# dependencies for tools. libconfig is optional, it is a part of meta-oe so it needs special treatment
> > +TOOLS_DEPS_FREEDRENO_LIBCONFIG = " ${@bb.utils.contains('BBFILE_COLLECTIONS', 'openembedded-layer', 'libconfig', '', d)} "
>
> Oe-core cannot build things differently depending on whether other
> layers are present.
>
> On the other hand, it is fine to refer to dependencies from other
> layers if the corresponding options are disabled by default. You
> probably want to have the option for freedreno tools separate from the
> option for freedreno driver.

I tried to represent the fact that the dependency is optional. It is
possible to build useful tools without libconfig, but adding libconfig
dependency enables the fdperf tool.
Of course I can add an extra freedreno-fdperf PKGCONFIG entry, it I
understand your suggestion correctly.

>
> Alex



-- 
With best wishes
Dmitry

