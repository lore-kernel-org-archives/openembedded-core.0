Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.9964.1622882310373557268
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 01:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iRlbMUkH;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id g18so11848716edq.8
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=aZyYiy8/3dAvVLDwwVn/xxSI6EzTA7SH5UZ6zC8Yb98=;
        b=iRlbMUkH7k9wGzF9MQtOcUoRETNJ4+MJVw1WqxZNFj1eOLZIYMceDjyIbgxUaUJ7u0
         HOlaj72NfZP3HlgobxPx+WNYLu2n3WHbUTmgIesetU6nsexHf0rwROoXOHHse6SyQ3jV
         B5WoO/TqV4e1leAZ5E46fi5z1hmHkglPJG0xFocbhvN+8aPKYR0qjFFz3m/yWaATpmGk
         hKEJk0K2jKMz9Yo2NNdqsW00iY51/JCId0qS4dAtuw4lZfkoSXLwLAE4MPNyuy6gm0e5
         1M8d4wqEyJ5dGN82Obi1SAAcpZDbZWYSgQlntSLDS/lTzmgNP6/wj7HPsHNobnh3r33c
         dSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aZyYiy8/3dAvVLDwwVn/xxSI6EzTA7SH5UZ6zC8Yb98=;
        b=RJ6i+kjf3mZAQOdJB/ZOw3fW8RwORN+fW3QD51lanGCS6RIBTOsm58s9/MjFMKjSLd
         9468ODKCKCMLv4DsM434dCFqmV0aB8/Ubl3kAvXELcHeqtALYf8V6kKJ383K+R9wTGsW
         lGQfUj/2Oq65LKP9lrfgfiZOo0nfOFySvRJEDQIZQt1/x66mhC2so0MT96oN7lpp6S4L
         U9us8i42OHYKsfS6+MnqAszxPG9TMT9dW21ika3yD/ZCGfN9E76JyXORSlQ9o13iPRRq
         7baVqAVi2ugbwSiFWD579UWzBDJ2XIAhS4W3MNc9TGx9l3uyWXxTQ5teyuF9aPN2UpOv
         8Mbw==
X-Gm-Message-State: AOAM533vHVrhsOFFENKf0TysxVTA/nv3C3YQW0GcB+QypCjv2oV2h/eC
	1yHI+1JAJtbqvMRcVkJZT+4=
X-Google-Smtp-Source: ABdhPJx3xgwfvz34PNXcAdbbREFOPZ1KKd0m/wgWsakjwzMjpYa0oE/18cztPA68hOt8Jej1TtX2sg==
X-Received: by 2002:aa7:c547:: with SMTP id s7mr9022750edr.239.1622882308374;
        Sat, 05 Jun 2021 01:38:28 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id h6sm891491edj.91.2021.06.05.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 01:38:27 -0700 (PDT)
Message-ID: <f55293fdc6d774eb27d155d779c702f65a70cf23.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] meta-skeleton: add a ptest example
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sat, 05 Jun 2021 10:38:25 +0200
In-Reply-To: <CANNYZj_hsuFNQ7gC3txtGfW5A-X7_G9BCN54y9oAyhDj9_7Y1w@mail.gmail.com>
References: <20210603172149.100248-1-adrian.freihofer@siemens.com>
	 <CANNYZj9HDXbUm=3LJ3tio4JMKQ56vrMGiYVkHBy9hCNOf=a4Lw@mail.gmail.com>
	 <f33e8c790fa4ef0364b91b91a514dd0ec308a008.camel@gmail.com>
	 <CANNYZj_hsuFNQ7gC3txtGfW5A-X7_G9BCN54y9oAyhDj9_7Y1w@mail.gmail.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-06-03 at 22:00 +0200, Alexander Kanavin wrote:
> On Thu, 3 Jun 2021 at 21:53, Adrian Freihofer <
> adrian.freihofer@gmail.com> wrote:
> > On Thu, 2021-06-03 at 19:46 +0200, Alexander Kanavin wrote:
> > > Rather than construct an artificial example, is there an actual
> > > existing ptest in oe-core that can be extended to do this junit xml
> > > stuff?
> > So far there is no test which creates xml reports and I don't know if
> > oe-core would have interest in something like that.
> > 
> > In general, a minimalist ptest example could be quite useful. I get
> > asked about it from time to time. However, I see your point that the
> > example is somewhat artificial. What do you mean if I replace the xml
> > with a simple "example report" for example?
> > 
> 
> 
> What I'm getting at is that I'm not sure if this should be in oe-core
> if nothing in oe-core or other public layers actually benefits from
> this.
> 
> A much stronger case would be to enable these reports in some existing
> recipe, then extend the ptest infrastructure on the yocto autobuilder
> to make good use of them.

Right, my goal here is primarily to support application development. 
But we should not consider application development as a "weak case". It
is probably the area where most companies using Yocto put the most
effort into embedded device development. Yocto should therefore provide
the best possible support. 
I don't know if there are packages in Yocto core that could benefit
from using JUnit or similar reports. I also don't know how this would
then be integrated with Buildbot. However, in the industry I see mostly
test frameworks like googletest and auto-builders like Jenkins and
GitLab CI that support rendering such reports.

Regards,
Adrian
> 
> Alex


