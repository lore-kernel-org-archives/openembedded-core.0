Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.16509.1614375858070036724
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 13:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pE9fiUon;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id b3so7696410qtj.10
        for <Openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 13:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=uN2FqhLVJG9XhjTLjfNxNLqYkxpgTZS1Z10eos+KGLw=;
        b=pE9fiUonBee7Poz2lqLtDHugsX0SDwufebYlWrY2L359tO4+JBA6gJWLIGrg3lKHoy
         hAmbBcTCZSsrx9MJpXbkvi+dfWcuxZnJvToT0tuWvbC/wTXMSC+uduIMrDbOeMuz02VG
         xsFFpTncnTStTHgSe884jgXe+Jw+1aqtWSQpZ4A8FBmNul7GSThkmoK36fq7uVXp/gUL
         7pr2lq+f2MYUA8JszppkJkPjHNvXAfuwIC3MtQO+ItHKhH/2SxeGbvjpLDizK5KT9CKZ
         3Z2Ph2KGli2xEKJ271eQJ8uECrx8crXYHMICQxYks49SOfBltRNCMJopVpkZg2yl4H4x
         O+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=uN2FqhLVJG9XhjTLjfNxNLqYkxpgTZS1Z10eos+KGLw=;
        b=Q/Z0khBPFGoCvcovafVKLfX9eSqCJyM5fl6rnYFBUWuavvc4I+Sc60Uc4INCdg9U0v
         WWY1JdkRpgzEA+opFAE1W5eKx8HAhL3CkX/cvs1pB0iPvwYVbu/TbXdughmC0KzZn25C
         aQj/oPZr2OASqf0uM3J6uuQtFbDYgpiDQ8zb4pW76/xxd0Qqp/M13RSpreTLOrK2tNia
         a/sPUhK5wxSiqhSak6PldHG4vEXRiihN4OQSqNf5UiKfIK+EILMnZU/gSIP7/qwOuqhE
         aIG5Q/Fdp/44ACsUi+UScn7JZ1ao8kD4o8gvKUbNPP3cTkttAnGUPmwzbKD3yLYS1dKn
         nJtA==
X-Gm-Message-State: AOAM533PhLzh4n1S/PcjQIepmt9s7nwB4M9U4v98Qm99ih/CpW9DRZSP
	ma2QLq0dDiI0WPAoMvswWXM=
X-Google-Smtp-Source: ABdhPJzTwzoHnfXozOsu5L7uMPIQOgAjDmDSHqey/2+aB0yFtYKNvVE7ouYdRtiQ3i+GjK/zi1lrYA==
X-Received: by 2002:aed:3165:: with SMTP id 92mr4552928qtg.233.1614375857125;
        Fri, 26 Feb 2021 13:44:17 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id h27sm7264328qkk.49.2021.02.26.13.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 13:44:16 -0800 (PST)
Date: Fri, 26 Feb 2021 16:44:16 -0500
Message-ID: <20210226164416.GB3368366@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] systemd-container: sort RRECOMMENDS alphabetically
In-Reply-To: <785033d6a9db81dbc5e4241451d103c5e226f8b9.camel@linuxfoundation.org>
References: <20210225213848.2744615-1-vdidelot@pbsc.com>
 <785033d6a9db81dbc5e4241451d103c5e226f8b9.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Richard,

On Thu, 25 Feb 2021 21:47:24 +0000 Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2021-02-25 at 16:38 -0500, Vivien Didelot wrote:
> > Sort packages in RRECOMMENDS_${PN}-container alphabetically to avoid
> > subjective sorting and ease future additions.
> > 
> > Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> > ---
> >  meta/recipes-core/systemd/systemd_244.5.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
> > index 70700820d7..aaed047e63 100644
> > --- a/meta/recipes-core/systemd/systemd_244.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_244.5.bb
> > @@ -447,9 +447,9 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
> >                          "
> >  
> > 
> > 
> > 
> >  RRECOMMENDS_${PN}-container += "\
> > -                         ${PN}-journal-upload \
> > -                         ${PN}-journal-remote \
> >                           ${PN}-journal-gatewayd \
> > +                         ${PN}-journal-remote \
> > +                         ${PN}-journal-upload \
> >                          "
> >  
> > 
> 
> These look like ok changes to me but they're against an older version of
> systemd, we currently have 247.3 in master. Would you be able to send
> against that version please?

Oops, I based my patches against latest "dunfell".

They do apply cleanly on latest master though (containing systemd_247.3.bb).
Do you wish me to resend them anyway?

Also regarding patch 2/3, I placed "tar" in RRECOMMENDS because one can use
machinectl without the "import-tar" subcommand, but one could argue that this
subcommand is broken without a version of tar supporting --numeric-owner,
thus could be a candidate for RDEPENDS. What is your view on this?


Thank you,
Vivien
