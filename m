Return-Path: <abe.kohandel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67EFC83F01
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 00:27:35 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.3848.1693182445908170217
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 17:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=odWteteD;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: abe.kohandel@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a7e68f4214so2165626b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 17:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693182445; x=1693787245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uuZyqX+kgyoZwqtGvYgDQevyr79CHqn5RakwiaFDdXw=;
        b=odWteteDoGvPafAjnlEng/UEQSXGSD+I6RyAEBaCYb+BKJd9UahscWPMN0jd3vf6fF
         0QIZmAQlCujmYZMhGWCOsNNSbFGlr6KDVYxDc1C1Fm3t9zWV1YCgc0z+B373hQPMgl6f
         YPZS3HG3mOm5WjsFBQzA93L9SmZ9Sg/aLlIaHKCB1XEWRIiqsDMre0mkpq4rA8+7VUkJ
         js2Ins3+cpYDwu0QsEA5B9jkOwCeeafuj6WJS1vN7rA9Y6rdiPs6gV7rpQpcQrHlmqU6
         idK3Q0vamsYiZX8ERyjX1oCYH6Y9TPWkRbP2S7YrHfIWlEmvo7OjqVON4hr6P2IbZFtw
         Ozuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693182445; x=1693787245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuZyqX+kgyoZwqtGvYgDQevyr79CHqn5RakwiaFDdXw=;
        b=Le7PORyk94KJ1g3zrndQjTJFNdzlp8Jf0XslS7k52o7vFo2CFqqIa7J8zueeLDxR0Q
         dpx7kBJPKcolM3OMaOQBbBTyFW4kdfn3k5/Cp+XAPygCoJVWs44OHBrXf3sIdPFpl/Q2
         5M/wPLG/bwrMUfB6ub6q0SYHsHH+x0YyzdjrMHqPp1nONCEQpqs+Qo4mnOa0nFzEnMtt
         gKIdxHmYoZd4LepGZknooH6/BZ0hst4tnMCxfgYnlwL+osy0JzAjI5Sg2wTGJgVf2lNG
         B0SxLJd/FHG+T9OhciQKp5x2qxg7vOYfaIHs5kNoZMbEMytPnXcJ9IfNM3eQCmaOcLYe
         D0Rw==
X-Gm-Message-State: AOJu0YzE/GGB5GZVfp99JMZi/VcsXe2UDL+GIk1gb+BEXElI9UJ0oBZ5
	GpspcDUABvK4PLwM6/Lunk8=
X-Google-Smtp-Source: AGHT+IEYsgUowAehUjFAAXTfy4OdnyXTBjcIhX5es1GctCCLXSeYQk/dH0HZcCmPLQIfpEFnGGUUUQ==
X-Received: by 2002:a05:6808:218c:b0:3a3:ed69:331 with SMTP id be12-20020a056808218c00b003a3ed690331mr12804373oib.6.1693182445165;
        Sun, 27 Aug 2023 17:27:25 -0700 (PDT)
Received: from lemp11 (216-71-201-106.dyn.novuscom.net. [216.71.201.106])
        by smtp.gmail.com with ESMTPSA id q25-20020a62ae19000000b00686f0133b49sm5413217pff.63.2023.08.27.17.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 17:27:24 -0700 (PDT)
Date: Sun, 27 Aug 2023 17:26:42 -0700
From: Abe Kohandel <abe.kohandel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [kirkstone][PATCH] libdnf: resolve cstdint inclusion
 for newer gcc versions
Message-ID: <ckyvfc4wjtue6jrh4tnqgl4wt6sjyhgvv4hjdtcl2dvrkuj334@fosw6b5z5bju>
References: <20230827221021.1349269-1-abe.kohandel@gmail.com>
 <CAMKF1sp2tQ1uu7jHJ8teiMdtHzn6fOZCpiQHyjBEtpFivyDOtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMKF1sp2tQ1uu7jHJ8teiMdtHzn6fOZCpiQHyjBEtpFivyDOtg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 00:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186811

On 23/08/27 03:42PM, Khem Raj wrote:
> On Sun, Aug 27, 2023 at 3:12 PM Abe Kohandel <abe.kohandel@gmail.com> wrote:
> 
> > Depending on the host gcc version, libdnf fails to compile due to
> > missing cstdint inclusion. The issue has already been addressed
> > upstream, add the patch to resolve this for older versions of the
> > library.
> >
> > This commit is taken directly from the libdnf project at
> > https://github.com/rpm-software-management/libdnf
> >
> > Signed-off-by: Abe Kohandel <abe.kohandel@gmail.com>
> > ---
> >  ...58-Don-t-assume-inclusion-of-cstdint.patch | 56 +++++++++++++++++++
> >  meta/recipes-devtools/libdnf/libdnf_0.66.0.bb |  1 +
> >  2 files changed, 57 insertions(+)
> >  create mode 100644
> > meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
> >
> > diff --git
> > a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
> > b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
> > new file mode 100644
> > index 0000000000..51fa141f79
> > --- /dev/null
> > +++
> > b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
> > @@ -0,0 +1,56 @@
> > +From 779ea105564b6d717300af2fcb02a399737a536f Mon Sep 17 00:00:00 2001
> > +From: ctxnop <ctxnop@gmail.com>
> > +Date: Mon, 15 May 2023 19:30:16 +0200
> > +Subject: [PATCH] Fix #1558: Don't assume inclusion of cstdint
> > +
> > +With last versions of gcc, some headers don't include cstdint anymore,
> > +but some sources assume that it is.
> > +
> > +Upstream-Status: Submitted [
> > https://github.com/rpm-software-management/libdnf/pull/1602]
> 
> 
> This pull is already merged at this time so status should be marked
> Backport
> 

My apologies, this is my first submission to this project, v2 submitted at
https://lists.openembedded.org/g/openembedded-core/message/186810

Thanks,
Abe

