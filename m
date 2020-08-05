Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.4766.1596625593800415575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 04:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dTHcB1Vj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id z18so36714071wrm.12
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=r0kqkI79n1YyN4Ardf/KzAmoh9F6dc+C1CYunMNnRL4=;
        b=dTHcB1VjzNaxwQGuSZhd/wFQDeu631oPp1Vzskpe8o10kKPCeXjHQg3JQvP/ymnab6
         HBkJInaf9MhB5YGi8GpH+YP9R1gzT9h1ksCm7ZJTivz66QZRIu8+LIRSBx5HBCXSowkC
         P1+R/3I9duE0K32TUVudCTKZPUjrzKPsuIUeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=r0kqkI79n1YyN4Ardf/KzAmoh9F6dc+C1CYunMNnRL4=;
        b=l2SLx3ijOj24zzV4yUhssdaxzpz+hwtLYG6pIueieFfQ0QnUIC2Em4ofcGnRFI6aqv
         znczC4A5DN7ifuz/iRgv6qooueMjoIcsYQ3H7a7+qGO5MNaI4qtV+0CNk72XcoOvPuqJ
         +LDgqWJvSvvApi6i3o81gvR9HmHoExIVDRiGn3xBKS9NZpt+iRa7w0r7CYiwAeV85TEc
         ny1ZMGfExugaVbCyEPeFhuJybstqZBBavVIgUxP3MNYRG3D1BydN2/JFqsX0kLfgZE8P
         w9Po6KSZjiPA4j25eI5RbYCq/jvFbTEkroQZmHksDzZiH/kUE7yUtITmDRvhx6K4y9Ah
         V1+Q==
X-Gm-Message-State: AOAM533MugWLjZvA4Adzv3N78sXbMIXJ/RAfkXBsvrbSQ4TZifgMupQ0
	8RiwoxMOWAKT+pNvJnQh7ywSZA==
X-Google-Smtp-Source: ABdhPJwnYOH76P219XsnjhZUBcT+WX8S35Nd0qklLazfMiZ03e5LHsHlmKHoED4wIGaFI33Tq3f4bA==
X-Received: by 2002:a5d:46ce:: with SMTP id g14mr2477261wrs.188.1596625592204;
        Wed, 05 Aug 2020 04:06:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id a11sm2621667wrq.0.2020.08.05.04.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 04:06:31 -0700 (PDT)
Message-ID: <3d609c832b9475706c45ace895aed899a6670542.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] kernel/yocto: conslidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com, "Mittal, Anuj" <anuj.mittal@intel.com>, Ross
 Burton <ross@burtonini.com>, Jon Mason <Jon.Mason@arm.com>, Kevin Hao
 <kexin.hao@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Wed, 05 Aug 2020 12:06:28 +0100
In-Reply-To: <cover.1594989620.git.bruce.ashfield@gmail.com>
References: <cover.1594989620.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-17 at 08:56 -0400, bruce.ashfield@gmail.com wrote:
> Here's my latest set of patches.
> 
> For 5.4: a -stable update, and -rt bug fix
> 
> For the build: a tweak to the config generation (as reported
> and discussed on the mailing list)
> 
> For 5.8 (aka the next reference kernel): a fix for devsrc and
> on target kernel building. With this tweak, I have all of the
> refrences booting and passing most tests on 5.8, so we are in
> good shape on that front. I'll be doing libc-headers testing
> next.
> 
> I ran these through the AB and local testing, no issues popped
> up, except a warning on qemuarm-alt in my last run. It was
> about a console login and didn't look related to the change,
> but I'm keeping my eye on it.

Thanks, I ran this combined with Khem's binutils change through the
autobuilder and your changes are likely fine but we need more work to
get binutils in. Basically:

* meta-arm needs to add the kernel patch for perf
* meta-intel needs to add the kernel patch for perf
* the hardware BSPs need to add the kernel patch for perf

I've added a few maintainers/people to the address list to try and sort
that out. Who is going to handle the hardware platforms?

Cheers,

Richard




