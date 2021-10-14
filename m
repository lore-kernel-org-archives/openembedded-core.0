Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DECC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 20:14:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.322.1634242447310502023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 13:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cZ2iu6Xq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id r7so22410238wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 13:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qVEPsLm0VcXNNf19u+Zy9a1erHruSaadxPn18lnX6dM=;
        b=cZ2iu6XqfhXEVig6BgzWUZVRn/ZsPhOo+GbXXAnO9rwiSdebdbboQQ0ssAzqhlVdcn
         KZsbUWHNq0liIfJG6C3LOTKMRqKalQfjZ0rmWNpcJzHtqqgjJ7ZyCcKy/+FQmIRDaUWN
         ceKU0TKqCCYtaJED8JYDc0tUzHdi6duIPHAE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qVEPsLm0VcXNNf19u+Zy9a1erHruSaadxPn18lnX6dM=;
        b=T4VPeQmBkkBm/2sge9+MRkZ2ks72OUkaqjfLAombgxY411pbCbbReaq/EVmoxg+Khh
         cuTPzBfKDDTEFrFFdrGjJz/IIwa5+QTdzFwITx14RmloR56AYzQI709nj2OMULT5Y3j5
         DzwL6xnyu/3rltR5r3IIeVr44/I2ReP9wUYJMHJyb8MgFAPEZaBQHlRtAH+0Z6eRcKsZ
         yoytIViCIst7ZfHxvdSwVtXzoh+jvsHUdba+0+M4KkfKTM9KO+dgaQSmwgnlSXnnSgdF
         F7WHcROUDPsFCCdS15fjucf6FqGCkxI5qK4F6r2unE8KY6oq7zEPohzEXFzxzHZRC2xu
         5guQ==
X-Gm-Message-State: AOAM530FNenWtZfpg6gAWANNMj6YFBBibiwqZ9cBhb/zFS/XQ5/nppd3
	y1sEl0Q0OkA5iqGAgK/+SCF06g==
X-Google-Smtp-Source: 
 ABdhPJwM9WGpsl/WfqK35XkHOdiVdeRmYY664SxZQAD+7RXsfRnPV6Dn2uZAkyfFqejSV7lJdb/CTw==
X-Received: by 2002:adf:ca10:: with SMTP id o16mr9048152wrh.212.1634242445639;
        Thu, 14 Oct 2021 13:14:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1?
 ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 q204sm9133682wme.10.2021.10.14.13.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 13:14:05 -0700 (PDT)
Message-ID: 
 <a306cbe3906dec3c26e720f557d06d3aa11070aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/2] license: Allow treating missing
 license as error
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 14 Oct 2021 21:14:04 +0100
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
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 20:14:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156971

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

I think a new series I can replace the patches in master-next with would be good
please!

Cheers,

Richard


