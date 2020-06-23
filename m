Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.1733.1592952986610486529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 15:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YsDz9NHT;
 spf=pass (domain: konsulko.com, ip: 209.85.219.68, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f68.google.com with SMTP id h18so214237qvl.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=BzWDxeVnqNzKG2rmo8BpSqH4dxYj1PIpsESsWKQYXjo=;
        b=YsDz9NHTB0eztt/m1EZuXNU6YNTnw/UaeBaABzA0MJUuAt7DDpx1/wrE4mywya8sYL
         FiLbaH81TVjtaPNiNjMpsNNuKGuR0Yg1N1BpR3MxWqmV0wGoazc3eIBxDjnVyYfxKoNP
         ac1nH7VcmV0z1k0sVGx+YGZ55Vh0V+b0fScqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=BzWDxeVnqNzKG2rmo8BpSqH4dxYj1PIpsESsWKQYXjo=;
        b=dB9XVUe4ixGtgAjHFWMFZLYcpa75u3rFAK9xCiUJzH+FKIXoeZVPsUzFtktavQMAoK
         7WyEv1KLl+FqVfiaHMrYV/VzC8Hwvo9bOYHLElCYhVuR1Etltt3UeMBEb0XyhnwKpLiw
         j6XSdTHFbbSPfOqhtEvlQenTgqmPumaacHUbGCyc+7IoNj+P2gJusFgxc7fJXeS1gfV/
         JCVUNjRUJJmdzQQys2bjOxWdjh7PLJoWrp6eBWMNeO4FhxYhj8zjXPp1O27x+9FNvhMy
         rb4m0BV+vfc9VZr8ET0Y4G5Fly/GLyBqqewMqH/rnoVWeDiqvDrA8yXOL97PiRyTGGNH
         LQaA==
X-Gm-Message-State: AOAM533npNUqLwo9oxQDJabauc4KmtKZNOFmDoLQHz/dYxpLsQRavfDQ
	gxt3gvwrH3SEGE0sxRKNkKEzaw==
X-Google-Smtp-Source: ABdhPJz/81wUrpJ4pAy2kjHTHvJEoH0lYK7vIFm4Cb2Y+6OTbxtwnXo763jrFvmpzLIVnkF9I5qqBw==
X-Received: by 2002:a0c:f991:: with SMTP id t17mr29042893qvn.123.1592952985787;
        Tue, 23 Jun 2020 15:56:25 -0700 (PDT)
Return-Path: <scott.murray@konsulko.com>
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id n64sm1657676qke.77.2020.06.23.15.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:56:25 -0700 (PDT)
Date: Tue, 23 Jun 2020 18:56:20 -0400 (EDT)
From: "Scott Murray" <scott.murray@konsulko.com>
X-X-Sender: scottm@godzilla.spiteful.org
To: chris.laplante@agilent.com
cc: Khem Raj <raj.khem@gmail.com>, 
    "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>, 
    "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
    "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Yocto Project Status WW25'20
In-Reply-To: <MW2PR12MB2474BE8BA49651369970014F8B940@MW2PR12MB2474.namprd12.prod.outlook.com>
Message-ID: <alpine.LFD.2.22.394.2006231849410.2920@godzilla.spiteful.org>
References: <067a01d6496d$5f46d9b0$1dd48d10$@gmail.com> <MW2PR12MB247418580E300A77C479C1698B940@MW2PR12MB2474.namprd12.prod.outlook.com> <5267904d-6871-40aa-af46-6cc7f5249d09@gmail.com>
 <MW2PR12MB2474BE8BA49651369970014F8B940@MW2PR12MB2474.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jun 2020, Chris Laplante via lists.openembedded.org wrote:

> > > Does anyone know what the intended audience is for the Developer Day
> > presentations? E.g. would someone who uses bitbake day-to-day but perhaps
> > doesn't edit recipes benefit?
> > >
> >
> > I would say look at the schedule and see if there are talks of interest to you.
>
> I did, but the schedule says nothing about the level of the topics.

In earlier developer days there were two tracks, one for beginners new to
the project, and one for more advanced topics.  The last couple have just
had a single track that splits the difference with talks that target
users with intermediate or above experience with the project.  If you're
familiar with the basic concepts of OpenEmbedded / Yocto Project, I
suspect you should have no problems.

Scott

