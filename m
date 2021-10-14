Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23566C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 21:48:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.1518.1634248090431025382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KZo/uz6a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id t2so22797199wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iHhTTUdDpYcxjnzrXNccOW4mdTnfpUn6vwjqb1FkKN8=;
        b=KZo/uz6aavA+st/+IHQheRTM4XOSWEpiKddpAMLPQj263MRZ3/N6kZ9R1R0q0hrUKS
         yc9c9QH+nE3/jdAXal0ywhDa+0mlI6NH+7HpCtbU+ndXDG3iXBZlYsUcd/QaSazWJ5Bx
         Brj5MQ7lu0wj/8/3S2gkm1e95ZMZ+o9qswmRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iHhTTUdDpYcxjnzrXNccOW4mdTnfpUn6vwjqb1FkKN8=;
        b=sP8LyQyG1SjQsYMko2RZD+8YopgmzFqlFtZS3LvoL3FUcIOam670KInyNyI+pqyhmQ
         BGtxD8svHhVXd6XgoWq06Del/7nkrZ0vDZ+BkxUhafKbEPmrC977IKJGVRDGZ8JCh7zk
         UHiVkaqXT8ErQpPzzn//DK7HOPzwjYqFtw8oxk77i/ag9ZKJ2auHCFviBqZM7hBJxtNj
         txv01MRVVqKb7JDvdVwmwHhiHuZBpaFXibyAN9YzppZGgwCmpxRt8XWtvYZtmMKCbNZf
         1mPbqQz+Snsa0PG9/R2PG9hnIfOGjp+QdQ/fd3Wz/UYtfanPb5YLYJ37oaMwJBXaRjm7
         Yotw==
X-Gm-Message-State: AOAM533ru7C7UWe5GcKzKg5QhZ1HNjQOmeSkpTrsUZ7S/GjdelckWweG
	dDJlfWCOFF2opnCaVYQB2YWLXg==
X-Google-Smtp-Source: 
 ABdhPJzU5sS/TUNaT60YMimqVdyxmFEpJTtuydu1KxmbedITta9WD9SVR+vAo+gNeuep8FR6swhm7Q==
X-Received: by 2002:adf:a15c:: with SMTP id r28mr9687274wrr.287.1634248088833;
        Thu, 14 Oct 2021 14:48:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1?
 ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 143sm9283919wma.37.2021.10.14.14.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:48:08 -0700 (PDT)
Message-ID: 
 <9ba1f7ade04de4af7731cfd85bb0484ff0aae63e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/2] license: Allow treating missing
 license as error
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 14 Oct 2021 22:48:07 +0100
In-Reply-To: <YWhkR02QRrR8ubaE@mcrowe.com>
References: <20211013104805.646626-1-mac@mcrowe.com>
	 <20211013104805.646626-2-mac@mcrowe.com> <YWhd8iAnlEd/XuR6@mcrowe.com>
	 <ba53cc97609bb6c79f513756760292a80e08612d.camel@linuxfoundation.org>
	 <YWhkR02QRrR8ubaE@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 21:48:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156975

On Thu, 2021-10-14 at 18:09 +0100, Mike Crowe wrote:
> On Thursday 14 October 2021 at 17:54:18 +0100, Richard Purdie wrote:
> > On Thu, 2021-10-14 at 17:42 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > On Wednesday 13 October 2021 at 11:48:05 +0100, Mike Crowe wrote:
> > > > Use the same WARN_WA and ERROR_QA variables as insane.bbclass to allow
> > > > individual recipes, the distro or other configuration to determine
> > > > whether a missing licence should be treated as a warning (as it is now)
> > > > or as an error.
> > > > 
> > > > oe.qa.handle_error isn't immediately fatal, so track the overall sanity
> > > > state and call bb.fatal if required at the end to ensure that the task
> > > > really fails. If only bb.error is used then do_populate_lic isn't re-run
> > > > on subsequent builds which could lead to the error being missed.
> > > > 
> > > > It seems odd for the license- error classes to be listed in
> > > > insane.bbclass but implemented in license.bbclass. All recommendations
> > > > for somewhere else to put them gratefully received.
> 
> [snip]
> 
> > > Patch series v4 coming soon.
> > 
> > I did have to rework it a bit as I also ran into a few issues and was just
> > trying to get around to writing them up.
> > 
> > I added:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=9e980f1a71e8b6af5ff6da9b02fac0f8bfd9d4fb
> > 
> > which means you can drop the imports.
> > 
> > You can use the nonlocal option to help the "sane" problem:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/diff/meta/classes/license.bbclass?h=master-next&id=110fa545ac84e560691c7d9e0d1e6e8f70c66980
> > 
> > The autobuilder also shows issues as some of the functions you moved are
> > referenced in other classes. The patch became:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=110fa545ac84e560691c7d9e0d1e6e8f70c66980
> 
> Thanks for doing that. I thought I'd searched for other occurrences, but I
> must have not done so properly. :(
> 
> > I was also just thinking we should probably add a new function and add calls at
> > the end of the tasks like:
> > 
> > oe.qa.exit_if_errors(d)
> > 
> > with a definition similar to:
> > 
> > def exit_if_errors(d):
> >     qa_sane = d.getVar("QA_SANE")
> >     if not qa_sane:
> >         bb.fatal("Fatal QA errors were found.")
> > 
> > and then renaming QA_SANE to something like QA_FATAL_ERRORS and exitting if set.
> 
> That sounds like it would neaten things up greatly and avoid the risk of
> accidentally failing to make the error fatal. It ought to mean that many of the sane local
> variables can be removed too.
> 
> Would you like me to provide new versions of the existing patches or add
> new patches on top of the ones already in master-next?

I had half a patch for this last bit so I pushed it into master-next. I also
merged by oe.qa import change.

I'm happy for you to take over from here and rework the patches into whatever
makes the best sense for a series now we know what we're aiming for? I think
there is a more cleanup of the "sane" variables that can be done beyond my quick
patch.

Cheers,

Richard


