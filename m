Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07902C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 14:59:59 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.16505.1660661992886397029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 07:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VjrolhnT;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-32194238c77so158274037b3.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=n03LfrJZVFjztygo9ryWe3cLhp65lhYvBXdggl65Vas=;
        b=VjrolhnTJWLtccVK11wOYF9YR8H/H15aPj42Ss66I0SkYhie91TngqU0k+k+HA3QFV
         VqIRNgE9DNQ47pSulBjLrW4xiEuBqbEnwS3yHRfn0VoDgMQd6bg8nRNr22KFdfXLN6Oo
         lf2cEiDDoPI/8/3bFU+32gE56clsW+Vv43+N2i7/pMfO2b4YSLCB38vZUqtYaMS42MZR
         onqKowHT6QGjhPgYW54qPH9SQsw0GljuOO+qatIifVxUZ8e3sH70tlb4fvmsMM0K3e6E
         UjLMpVwL3VQYOdGsQG29s2rnS7uklS7IgRW69DysUmRVX90te0RMZncGRLTI/zCZQNQb
         bMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=n03LfrJZVFjztygo9ryWe3cLhp65lhYvBXdggl65Vas=;
        b=XpuYZCBWOQ71mW68UrOWHinGrFV0c3gLBstlH0A18x0/mZWuhmmOBtrBSTJHBI3ypL
         x4sqoHhJeHHYy4pT0UuVBT3tfoTqQP9Sc4y5l368oCJNIuk1sT6PKQ7i43DCiPUN0j08
         21S+2Qa3ewytwpBXpof9aHHGoR9ngFDbLBn2Eq5gciXG03mmAS5wtiAzbz7VwyM0jxqj
         nYq+89r94CMhON8i8tP0Sg1mq9EYl41GYHoRefI/ZNttaTFGmSO355cKnMq43iZ0riQA
         BEcJzMb1w8NDxRbgGTe/K5hwjk/BS/7YOysn5KbG9h6S6gP3kVL1Fvljstummmr5JKhr
         7eCg==
X-Gm-Message-State: ACgBeo3AGhqVKfN8jzWaeHeYI8L3kQdKMqNf5/u9HaD7Rv5HZzXOU/0Z
	N0z+s4nDulMSAhzEx2K8yp8SYw9CfFEe8xbJOY4=
X-Google-Smtp-Source: 
 AA6agR7MuXMrvGJN/bI1kgcuPGzjvvOOGjpkyA0rc3i34fEz2CnvI+Vu1G6HAe1J+/pjojfQ0OexBOQzKx+Wt34ANeI=
X-Received: by 2002:a81:b61c:0:b0:333:9118:4020 with SMTP id
 u28-20020a81b61c000000b0033391184020mr2537460ywh.282.1660661991876; Tue, 16
 Aug 2022 07:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220816033005.2700801-1-raj.khem@gmail.com>
 <20220816033005.2700801-5-raj.khem@gmail.com>
 <CANNYZj9wJFxRzEDQMpJ5CxRbx4Si5Se91YWn9bZ=TTr+NmCFgw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9wJFxRzEDQMpJ5CxRbx4Si5Se91YWn9bZ=TTr+NmCFgw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2022 07:59:24 -0700
Message-ID: 
 <CAMKF1spE3RHcRGtXYR48zWqJObxVPv0CRcGe6ZOF+genM75o7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] spirv-tools,spirv-headers: Update to
 1.3.224.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 14:59:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169440

On Tue, Aug 16, 2022 at 12:39 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This version isn't tagged, so where does 1.3.224 come from? Maybe it's
> better to leave at 1.3.216+SRCPV?

its not tagged but there is branch
https://github.com/KhronosGroup/SPIRV-Headers/tree/sdk-1.3.224
I am not sure if they mean folks to use this branch or perhaps there
will be a tag eventually. same is true for
spirv-tools - https://github.com/KhronosGroup/SPIRV-Tools/tree/sdk-1.3.224,
its not clear what to use.

but for now I guess I will leave spirv-headers as it is. Since there
is no SRCREV bump perhaps no need to
rename it.

>
> Akex
>
> On Tue, 16 Aug 2022 at 05:30, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.0.bb}  | 0
> >  .../spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} | 2 +-
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-graphics/spir/{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.0.bb} (100%)
> >  rename meta/recipes-graphics/spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} (96%)
> >
> > diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.224.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
> > rename to meta/recipes-graphics/spir/spirv-headers_1.3.224.0.bb
> > diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
> > similarity index 96%
> > rename from meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
> > rename to meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
> > index eb907326c43..cfea28a6efe 100644
> > --- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
> > +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
> > @@ -7,7 +7,7 @@ SECTION = "graphics"
> >  LICENSE  = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >
> > -SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
> > +SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
> >  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
> >  PE = "1"
> >  UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
> > --
> > 2.37.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169419): https://lists.openembedded.org/g/openembedded-core/message/169419
> > Mute This Topic: https://lists.openembedded.org/mt/93052351/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

