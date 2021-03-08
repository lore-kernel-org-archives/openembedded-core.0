Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.472.1615243635049357920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 14:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YatssrtV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id f12so13150022wrx.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 14:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Vz4lcdvOkAGJv6RXppJD7lU7FCCuXfHK2eeMrOVEIgk=;
        b=YatssrtVcgm/g+0OYPJoqUG/EyBZD2to3yvvzx4RNXD7hDHUpH7kT3qxAHVutckrzl
         loTNQtUOEBG/FFtV+9eHyye0Be2WAHF8RZk8IqKlwLHWt7HE4pueZT+lMZM2vv13aK81
         E5z2/HjABiHvo3FHvWDqPTj4oZbvJ4uyxO/gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Vz4lcdvOkAGJv6RXppJD7lU7FCCuXfHK2eeMrOVEIgk=;
        b=b5WKJLnEJFxx2yhi/6eWM0nlpICXDsOktHbrf8rdbdF7xRo2JZJEdyJIY+Rs4gvQzD
         /0rY3DBYmXsJ27HLEpNATICCSErW/veEIToXdTXDH82D8CbJxBUwyqVr17/g61i3dtT1
         D5wyZTbp0gJJgotI4QJPAqrfbi3AlR81hThuFu++/Aez9dQ914kvJ8AYMLvTkMEOEnMm
         yv+VITmto9aSFc1ea+Sfyvt5+RPbCYv9pF2m8jtMerOeKBtCjGTJHolFkDlqOXWe0rrl
         QbIXh4gWSEcuxA0xiDkE4VX1Z11vJNViSp1YO9VcRcZNl0qT+zmy7ZLrANS/w19JJzRc
         lhGQ==
X-Gm-Message-State: AOAM532GsHrsVRBY7vjNG0uoBEqLyRRK4qvGHJFiqu+JYwkPlkcoPXsh
	hKTHpHvde1nwV8wvpflJqk1uGQ==
X-Google-Smtp-Source: ABdhPJzZhLPKJ2gt7QZvu6yzMUtEBv259Ts/AAsFVmS2M042NMWmHjcnofYXBx/AGW35oR25JqhC6g==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr24644356wrn.213.1615243633288;
        Mon, 08 Mar 2021 14:47:13 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from [192.168.1.6] (dan.rpsys.net. [217.169.23.60])
        by smtp.gmail.com with ESMTPSA id i10sm19644956wrs.11.2021.03.08.14.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:47:12 -0800 (PST)
Message-ID: <c4173a2a3bd58afdf3cc38fbb25d4b99e3d0a3d2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 18/24] procps: update 3.3.16 -> 3.3.17
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>,  openembedded-core@lists.openembedded.org
Date: Mon, 08 Mar 2021 22:47:12 +0000
In-Reply-To: <c6f58a09-04d1-16d3-e162-88e24a6c6814@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
	 <20210228153702.498275-18-alex.kanavin@gmail.com>
	 <c6f58a09-04d1-16d3-e162-88e24a6c6814@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-28 at 11:10 -0800, Khem Raj wrote:
> 
> On 2/28/21 7:36 AM, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   .../procps/0001-w.c-correct-musl-builds.patch | 44 +++++++++++++++++++
> >   ...02-proc-escape.c-add-missing-include.patch | 23 ++++++++++
> >   .../{procps_3.3.16.bb => procps_3.3.17.bb}    |  4 +-
> >   3 files changed, 70 insertions(+), 1 deletion(-)
> >   create mode 100644 meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
> >   create mode 100644 meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
> >   rename meta/recipes-extended/procps/{procps_3.3.16.bb => procps_3.3.17.bb} (94%)
> > 
> > diff --git a/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
> > new file mode 100644
> > index 0000000000..c92ad28e4f
> > --- /dev/null
> > +++ b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
> > @@ -0,0 +1,44 @@
> > +From 22f8d25567b8d64bdbab0fb0b4915b4362561d9b Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Wed, 24 Feb 2021 21:14:31 +0000
> > +Subject: [PATCH] w.c: correct musl builds
> > +
> > +No need to redefine UT_ stuff to something that does not exist.
> > +
> > +UT_ is already provided in musl but via utmp.h header, so include
> > +it always.
> > +
> > +Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/126]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + w.c | 9 +--------
> > + 1 file changed, 1 insertion(+), 8 deletions(-)
> > +
> > +diff --git a/w.c b/w.c
> > +index 9d07ac9..d10639b 100644
> > +--- a/w.c
> > ++++ b/w.c
> > +@@ -57,9 +57,8 @@
> > + #include <unistd.h>
> > + #ifdef HAVE_UTMPX_H
> > + #	include <utmpx.h>
> > +-#else
> > +-#	include <utmp.h>
> > + #endif
> > ++#include <utmp.h>
> 
> this would mean when utmpx.h is provided ( e.g. ) it will now include 
> both, which is a change perhaps to look more into, it might want them to 
> be exclusive.

This one is worrying me a bit as it does seem to change behaviour on glibc.
Was anyone able to look into it further?

Cheers,

Richard

