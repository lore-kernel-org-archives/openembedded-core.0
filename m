Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3133C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 15:04:38 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.16585.1660662274610301964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 08:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EDe5hbwz;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id l21so10825337ljj.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XxB+8U5GDpmy1fkHwjRDJUg3U6GxjzzXn6+N//3+ma8=;
        b=EDe5hbwz7Sr+i+cvR/6bCSPvvRHpLuXD2/Dpe8Y1OA2JJ3vniU6xxYyWNMxQssqD7g
         QVlK58LjvFXb6PbZKBuSGhMxhE8L/KUszKugbyU0auQ6oHMkyMVlaeWgFFQXrK8KDOve
         +IDZE+d5YUvAbVlIRbk4k+isaqHk5w3H8w3gDM19Uc6xdSuvIZb63wQUktz1KnhAApiL
         hIR8hpTC08rf6nUjQ1mk+qHykwWdbnSmG/PhcT78iSTbuPd9mvhkJ8CXqPDFqWAJPShC
         Qh9im+ToVB2YbmsKHskE6JFkKM/eR9mVoly0awXhUZPThRivmLzPwvOyBDxjHw+HTD7B
         XdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XxB+8U5GDpmy1fkHwjRDJUg3U6GxjzzXn6+N//3+ma8=;
        b=c6rFNA2tACntHIykYL/lVYUQXW3ezYyMLYwNV6hpsG14QZ/J4NTqpKVs/9G0wAWBVv
         rrCcpzSMGbc416v/bYlBPJeYcu+lI8d4SnEjkNs2eD2S9mDR8u/KdVyN80vH6MFd1LlU
         gHkt2AZ+YsLJuVA1RGsWRw1JhyN3PiG/BjkfnprLWMdU9CSvIBbB4O1Ebn/PLUq7nj5i
         GwsZ2+bnqcEWgXKu47WkGy8f4RNf2EsefOkxxgps5URhZ5Cqz7zst78BBRtaqPX7vUNx
         J1n/hlcYpeear8Abx4aa7GnZ/NG57dHmYW95xUQfSL/y6ZleQCGHQZ6zY+Ucza4xBLSR
         GHaA==
X-Gm-Message-State: ACgBeo3+H08Hzh8d5uTEHSlJ8GM7tOkbnEpHHTPePdh+V1yqHxSEH7kc
	Kt89HwGU41QONHD8sRJrOoukXPzl3vTHL4TtA5k=
X-Google-Smtp-Source: 
 AA6agR5MZHtQfaaBxdKJWTNu2u+hTGO+Ej/2GJCuVJUt7flCbLwQQH4ywhsT9Auyhu9GitMZqTc+B4kt53j7auEyH84=
X-Received: by 2002:a2e:3a09:0:b0:25e:4212:5628 with SMTP id
 h9-20020a2e3a09000000b0025e42125628mr6200364lja.68.1660662272656; Tue, 16 Aug
 2022 08:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220816033005.2700801-1-raj.khem@gmail.com>
 <20220816033005.2700801-5-raj.khem@gmail.com>
 <CANNYZj9wJFxRzEDQMpJ5CxRbx4Si5Se91YWn9bZ=TTr+NmCFgw@mail.gmail.com>
 <CAMKF1spE3RHcRGtXYR48zWqJObxVPv0CRcGe6ZOF+genM75o7Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spE3RHcRGtXYR48zWqJObxVPv0CRcGe6ZOF+genM75o7Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Aug 2022 17:04:20 +0200
Message-ID: 
 <CANNYZj8UZnOAnFnTWL=6a8saP7ZMWYaKPd9TVVyHMeC2tgevzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] spirv-tools,spirv-headers: Update to
 1.3.224.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 15:04:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169441

sdk-x.y.z versions are released in lockstep across all vulkan
components, so I believe there will be a tag eventually. Until then we
need to use a smaller version, or just cherry-pick the needed fixes.

Alex

On Tue, 16 Aug 2022 at 16:59, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 16, 2022 at 12:39 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This version isn't tagged, so where does 1.3.224 come from? Maybe it's
> > better to leave at 1.3.216+SRCPV?
>
> its not tagged but there is branch
> https://github.com/KhronosGroup/SPIRV-Headers/tree/sdk-1.3.224
> I am not sure if they mean folks to use this branch or perhaps there
> will be a tag eventually. same is true for
> spirv-tools - https://github.com/KhronosGroup/SPIRV-Tools/tree/sdk-1.3.224,
> its not clear what to use.
>
> but for now I guess I will leave spirv-headers as it is. Since there
> is no SRCREV bump perhaps no need to
> rename it.
>
> >
> > Akex
> >
> > On Tue, 16 Aug 2022 at 05:30, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.0.bb}  | 0
> > >  .../spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} | 2 +-
> > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-graphics/spir/{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.0.bb} (100%)
> > >  rename meta/recipes-graphics/spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} (96%)
> > >
> > > diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.224.0.bb
> > > similarity index 100%
> > > rename from meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
> > > rename to meta/recipes-graphics/spir/spirv-headers_1.3.224.0.bb
> > > diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
> > > similarity index 96%
> > > rename from meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
> > > rename to meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
> > > index eb907326c43..cfea28a6efe 100644
> > > --- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
> > > +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
> > > @@ -7,7 +7,7 @@ SECTION = "graphics"
> > >  LICENSE  = "Apache-2.0"
> > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > >
> > > -SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
> > > +SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
> > >  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
> > >  PE = "1"
> > >  UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
> > > --
> > > 2.37.2
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#169419): https://lists.openembedded.org/g/openembedded-core/message/169419
> > > Mute This Topic: https://lists.openembedded.org/mt/93052351/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

