Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.7322.1591783327893269426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 03:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JAWEBlbp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id r9so1233324wmh.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0t11SyAQrUNxDQnzfAaDW2iS2E6U0JxEdMQHP1ZwncI=;
        b=JAWEBlbp8009maj2L5o052ODHeTOqcZYAUNvbnW2sw39Pjwssju1lYcIbXVeW14gq+
         77sjsUYOAM3D3jay1g2l54zVCrxGXv4w1OIjTXh1VC88Wnvwu64eHZyxbAmXTD2nomSq
         04GBM3GXwwndkIoNNnuAHcvvdETi8G0a79Bhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0t11SyAQrUNxDQnzfAaDW2iS2E6U0JxEdMQHP1ZwncI=;
        b=d0EcQB61sSrQwp/I+QFWTvrkjrQHeJQLq72MDqhEC7EdJtiZAD/hAg8ZeZWvkImflS
         dgGtbLUoGAdgI96qwBy7i6RKg4CeNRXWThn/tx5HG9Zczc7kcxK5s41o7faHG3bfAof2
         4R4GpoOFRWlSxuv4fR1MkS/I+muKDGNJ6gklDTA1gESO/ix97f90s1617HiBEUozFC4n
         gjDsXTtc5XXK5illKSYiJLlWdnTTR1yCp4gCUDxmqo5at2GS4fUaDuUgkdAv0S3+5DzE
         WLzA/UQV+v8BgBagyikgBnOQ1WWyYKHhPZuDqMH/u02LIiKsZZQkUUjISX3XEIS3uN7A
         74HA==
X-Gm-Message-State: AOAM530ccBElLErjBgAfEowOKtbSoEqyxb7uFon4r17HYZrN8zq6mjuh
	2H8NtC6CprtmsvhzOuvluPrcvw==
X-Google-Smtp-Source: ABdhPJwoBZhufcTuXJ87mgj0JVQ82wmnqucYe99CBZhG8k0q6QpIp9CPsdKjWYoNqGxu2ELOC7jMHw==
X-Received: by 2002:a1c:6155:: with SMTP id v82mr2418214wmb.25.1591783326260;
        Wed, 10 Jun 2020 03:02:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c6sm6274374wma.15.2020.06.10.03.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 03:02:05 -0700 (PDT)
Message-ID: <2eb71971c319f67daa079f4d5610128769366bcb.camel@linuxfoundation.org>
Subject: Re: [OE-core] devtool and multiconfig: Bug or feature?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Jan
	Lorenzen <jl@newtec.dk>
Date: Wed, 10 Jun 2020 11:02:04 +0100
In-Reply-To: <CAPybu_24rBzPU_wb2+j-G4HkMd_MtCTFNDuK36pefqbm9JeShw@mail.gmail.com>
References: 
	<CAPybu_2pgXgLsvdgLhn60emg5Qh8krRQRNKzQbB5LHfec_YUDQ@mail.gmail.com>
	 <46a2f1527c6b547df37ed040c30369975c188f90.camel@linuxfoundation.org>
	 <CAPybu_24rBzPU_wb2+j-G4HkMd_MtCTFNDuK36pefqbm9JeShw@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-10 at 11:48 +0200, Ricardo Ribalda Delgado wrote:
> Hi Richard
> On Tue, Jun 9, 2020 at 11:46 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2020-06-08 at 16:40 +0200, Ricardo Ribalda wrote:
> > > Hi
> > > 
> > > I am trying to use devtool in combination with multiconfig for
> > > the
> > > first time, so probably I am doing something wrong.
> > > 
> > > I have created a very simple multiconfig
> > > 
> > > cat build/conf/multiconfig/arm.conf
> > > MACHINE = "qemuarm"
> > > 
> > > And then I want to modify bash:
> > > devtool modify multiconfig:arm:bash
> > > 
> > > If then I try to run:
> > > devtool build multiconfig:arm:bash
> > > NOTE: Starting bitbake server...
> > > ERROR: No recipe named 'multiconfig:arm:bash' in your workspace
> > > 
> > > So I run:
> > > devtool build bash
> > > 
> > > But that builds for x86 instead of for arm...
> > > 
> > > Simply patching check_workspace_recipe does not do the trick:
> > > @@ -145,6 +145,8 @@ def check_workspace_recipe(workspace, pn,
> > > checksrc=True, bbclassextend=False):
> > >      is present.
> > >      """
> > > 
> > > +    pn = pn.split(":")[-1]
> > > +
> > >      workspacepn = pn
> > > 
> > >      for recipe, value in workspace.items():
> > > 
> > > 
> > > Any idea or documentation to follow?
> > 
> > I think this is something which hasn't been tested before. Its a
> > bug
> > but nobody has probably tested or fixed devtool to work with
> > multiconfig.
> 
> I have opened a bug on bugzilla, with a horrible patch that kind of
> fixes it...
> Lets see how it evolves.

That patches in master-next from Joshua fix up the bitbake side of the
APIs to support multiconfig so I'm hoping that brings us a lot
closer...

Cheers,

Richard

