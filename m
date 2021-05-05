Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3257.1620248986675856569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 14:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LgD9aa61;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id y124-20020a1c32820000b029010c93864955so4162582wmy.5
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 14:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=W/p5kgBL9gIKWG0KgZUCUQPPC125fJNBfnBTcUuD+tE=;
        b=LgD9aa61lTnA02E2V6ISzQAPzUF+gv4X/K6Q7VRJ0XIBxt2x/pUJxgwSt4/Rrc/V6f
         +Aby/Xf8Olo+FyTWYYOIRE5ZSxD2+BrxL6NfHVhKnqTso4QfEMloFb3i8CB3K4bs/wCu
         WfSgy8p4cmb8V7HaQ5L0/snoy/0kbpw4Wwm5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=W/p5kgBL9gIKWG0KgZUCUQPPC125fJNBfnBTcUuD+tE=;
        b=MeW+Z071z3e50KKHwbBJu+9m4z46FJVPfWRZR/CyvCoFhEK2JBwHdB9MhDoJ0nIA9Z
         ObMpYZYvhZMNNEP2qZdm2D3cPpaZXNPz0C58cddz1Gqm0EOzpa3z5a8tNrxyiZQi4ygy
         WHM2kL6kAOwMaM8vZSe6wW4sEJ4uCaisrGE/d1eymhOP4ezt5sN1gne7evZ1tgBfAHY4
         kspzaHML3i3IhigZBV2NQb8eSFF2C1IHUQJ2Nn9fVmn4MvdivaGvFm/1PNKTFOx7fmrc
         v4aedzwE0udeHqFSAToBtc2zZJ9mNd6C98fz1CrGtC+jpag9Aco9mOkmb73z6OhYn4YY
         kQbA==
X-Gm-Message-State: AOAM530uD8tL1JUbjAHHnK7psOZ4y4j8Z+xyk4gLpCXU58oQT9FrjpkV
	kICEbdk1Ee9sidGE1wS4Y9qU9A==
X-Google-Smtp-Source: ABdhPJzN5Imo9JTTcipJ45sSxuhO0rxaEA6RP5YXBKF1J0VNuUZ2QHOjErxa4LbE6lOCXh93MPzRGg==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr12156472wmn.82.1620248985091;
        Wed, 05 May 2021 14:09:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e? ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id g25sm7123992wmk.43.2021.05.05.14.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 14:09:44 -0700 (PDT)
Message-ID: <443c94b6db48ae6b7daae10b529b8ea420be4add.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 58/61] gi-docgen: add a recipe and class
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 05 May 2021 22:09:40 +0100
In-Reply-To: <CANNYZj9scBK7xAZpR1A3Fs9AiC8MT_EZHqszbGfiAkZSZgMYwg@mail.gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
	 <20210505151850.660512-58-alex.kanavin@gmail.com>
	 <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
	 <CANNYZj9scBK7xAZpR1A3Fs9AiC8MT_EZHqszbGfiAkZSZgMYwg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-05 at 20:45 +0200, Alexander Kanavin wrote:
> On Wed, 5 May 2021 at 20:05, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > 
> > > This seems to be the gtk-doc successor, and gnome
> > > projects such as pango and gdk-pixbuf have started
> > > transitioning to it.
> > > 
> > 
> > going through
> > https://gitlab.gnome.org/GNOME/gi-docgen#disclaimer
> > 
> > it seems that its still under development and not declared stable, so
> > I am wary of the churn it will cause.
> > I would prefer to wait until at least its declared prime time for
> > system wide inclusion.
> > 
> 
> 
> It is only built if you enable api-documentation, and even then used only 
> in pango and gdk-pixbuf. I'd say it's fairly well contained.

I did also have a quick chat with friends in that community and their advice
was that it was ok to switch now FWIW...

Cheers,

Richard

