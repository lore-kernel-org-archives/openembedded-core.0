Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.14528.1591279602681095355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 07:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MdwqtieE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id j10so6240906wrw.8
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=L2MuY0VgBVVv3LhJ6TOVJBCYOb8qbF0GPGrETDXocw8=;
        b=MdwqtieEsUjZ3PT3FmeYsuCSqKc/s3JdihOXpLLE6DeR2831GlmMXWMRxw8SEhvz7P
         KoiCE4uUOc8KoiLQ2G1k1yeXmZS6LbTwy63fpn1PQfm8knyvlYt6IUEZzWS/BMcyBvnn
         FtuyT55U665/criQ9Effp9fh8HyIiTcnzeq0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=L2MuY0VgBVVv3LhJ6TOVJBCYOb8qbF0GPGrETDXocw8=;
        b=RU5bQTHszJckhY/a0Lui0w+En1GDiemXaW1LfMCgyi7O6u3zzlDr3u9pffmCx2gOMh
         nK919uu7oJuw0DruWbS0xoa2jXCg58/HDnJjgpniG2qYNZLI7L6BUH4MPQ815yVVbrn6
         hrfnzvJsqKinuaDqrmnGh9YF4yClG1ybmyPn68KVqHKMo/kRKgq+yHP0TM5mHZidGBoQ
         X5Yg3DQQsWs6hF3OGSDBOrjZy2+sPDgEuyLZp5d60K2vSIWObmNjgLyZv1MQ3ShhzPb9
         T+N60MjUdJwIehh+uCJenrMdbYTlNFVFCCFrZ8YNyIpIXOI5YZO3UZKkt2GF2jLeA+Fl
         if3g==
X-Gm-Message-State: AOAM531Bir7hL1BSi+LJB106ur++cg2ZHJ3zt+KQQRSrJq6ZquLqkTl4
	mg2+ucOQi6NY44HRrU3L0SeVqQ==
X-Google-Smtp-Source: ABdhPJyz+80OlKvLf7vKNC1+LbIu9lnc+tQTKr/MFnY//Z934fYsupdnfwnNvuDMORTv0N/p8x47YQ==
X-Received: by 2002:adf:df91:: with SMTP id z17mr4521021wrl.273.1591279601136;
        Thu, 04 Jun 2020 07:06:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v66sm4053349wme.13.2020.06.04.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 07:06:40 -0700 (PDT)
Message-ID: <3d2ee2081773b4e98fa078976cae17d88bf31ee0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][warrior] pseudo: Fix enum typedef
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Andreas
	=?ISO-8859-1?Q?M=FCller?=
	 <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Jun 2020 15:06:37 +0100
In-Reply-To: <20200604135728.wce5jsupc6bgwmvi@qschulz>
References: <20200604120349.17455-1-schnitzeltony@gmail.com>
	 <faaa5a2d120eacab6825cf079e92aa220dd7b151.camel@linuxfoundation.org>
	 <CALbNGRQDVCm4zDJ6NPw=+-mQ8xibCDh+pqjToPcrnXRvJcYOkg@mail.gmail.com>
	 <421c9a5c69b54bfb41734e58b89dc66bf9e84c0a.camel@linuxfoundation.org>
	 <CALbNGRQyxDXcyKUA3zFYfwRFivLWbqrYyoGSKr4CWRz0Vjo1YA@mail.gmail.com>
	 <20200604135728.wce5jsupc6bgwmvi@qschulz>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-06-04 at 15:57 +0200, Quentin Schulz wrote:
> On Thu, Jun 04, 2020 at 03:49:28PM +0200, Andreas Müller wrote:
> > On Thu, Jun 4, 2020 at 2:47 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2020-06-04 at 14:18 +0200, Andreas Müller wrote:
> > > > On Thu, Jun 4, 2020 at 2:11 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > On Thu, 2020-06-04 at 14:03 +0200, Andreas Müller wrote:
> > > > > > From: Jacob Kroon <jacob.kroon@gmail.com>
> > > > > > 
> > > > > > 'pseudo_access_t' is a type, so use typedef.
> > > > > > 
> > > > > > Fixes building pseudo with gcc 10 where -fno-common is the
> > > > > > default.
> > > > > > 
> > > > > > (Backport of OE-Core rev:
> > > > > > a7d519f742aadc9110c2401f359254210a784f6b)
> > > > > > 
> > > > > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> > > > > > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > > > > 
> > > > > Does warrior otherwise work on gcc10 hosts?
> > > > Not yet but I am working on it.
> > > 
> > > I think to make a decision on whether we plan to support gcc10 or not
> > > we'll need to know the scope of the changes. I'm starting to worry this
> > > would be a bit too invasive, particularly as warrior is about to enter
> > > community support or EOL depending on whether there is a maintainer.
> > > 
> > I see. Problems for me - job's hat on - are:
> > 
> > 1. we're close to release a product based on warrior (and a new
> > colleague of mine has just installed Fedora 32 with gcc 10 - that's
> > why I ask for it)
> > 2. my tests with dunfell were - hmm - not running out of the box exactly.
> > 
> > So we should decide to upgrade to dunfell. That is what I use for
> > private raspi-images an am very close to happy.
> > 
> 
> Dang, I was silently but closely following the discussion hoping to be
> able to apply more or less the same patches on top of thud. Same issue
> as yours, colleagues moving to Ubuntu 20.04 with gcc 10+. I guess it's
> docker time :/ (there'll always be that one client that will not want to
> upgrade to newer releases).
> 
> Or maybe we can support gcc10 on the community branch once it's EOL (or
> doing the job ourselves..). What seems to be the big worry about
> supporting gcc10 on warrior/thud? Just so I can explain why we should go
> the docker route instead of spending time on making thud (and we still
> have krogoth for some...) build with gcc10 and maybe start working on
> upgrading those we can to newer releases. Basically what are the
> expected big hurdles on the way?

Your other option would be buildtools tarball for the f32/ubuntu2004
systems.

I could see a case for backporting the buildtools tarball
installer/wrapper for those older releases as a way of fixing these
issues.

Cheers,

Richard

