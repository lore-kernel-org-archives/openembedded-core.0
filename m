Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35DCC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 14:24:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.11369.1645194290490541556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 06:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DmlRwNwE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso6029068wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 06:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3CXhGkMmn7SXbuFA4TSAUlHySr8eeCepqAZ56J8X/Qg=;
        b=DmlRwNwEdqfCx4drAo0l4XYBPjKvW8bBf3Ibdn3iPGanEFMK9cxW2WU1Lgt6Ludw2O
         FDodU2YOYBxBHen+TwZqLGEOzlYa3TjN6mvuqLNfuM8FNz92H3/1aK7UyMl5OpSbS3ad
         bLfXV9y2IlQcWizyzJ590KLQYuYbsbAc/76BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3CXhGkMmn7SXbuFA4TSAUlHySr8eeCepqAZ56J8X/Qg=;
        b=KQ+UeVQh7EH+spLLrVgFzgt4VwLRcZLOX88A8yaUnJoqgN1TFPKMco0i/nUDtC80a5
         Gy/x0xEezaZnVM+RJPdULxkzCYlKgfxt7D1icp/O5ORlLvamNEK4ooTlFXqsX2SRmzMx
         cWkzATlP2q8fzZ66sFKd8PvxVg8mQdF+EA/jxxNMaDEPB0martw8bkFHrY9yCwyBpVLO
         Rll6+/tWwwgiJLW4VzTnvdIOR6FlNIzWA9MsI6iRVjeCBNB1t31TEaRg/e1X2p+gX3kO
         5hoyXkFDP8kkbgqjZop2bSW4qZHHW06SiN66L4vrIb5G6vizu2T6frNTR3xf3wbuuvxW
         iHig==
X-Gm-Message-State: AOAM531P9COL/U/Xc0EHVCrOOoL5W35gkkRK8zooA7ko5nwC40uNb3KV
	BtNvoVo1oQ3NPitL0oTThRjzsw==
X-Google-Smtp-Source: 
 ABdhPJzoLUXg0lm0KYPrRpUo4RByg3iOqflAWYkTQeMs7NMwglawmhjkZ1nq9ptXz8vg324gbV85AA==
X-Received: by 2002:a05:600c:3b85:b0:37b:baf8:f542 with SMTP id
 n5-20020a05600c3b8500b0037bbaf8f542mr7479244wms.26.1645194288729;
        Fri, 18 Feb 2022 06:24:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bc9:59b:7021:269f?
 ([2001:8b0:aba:5f3c:7bc9:59b:7021:269f])
        by smtp.gmail.com with ESMTPSA id
 bg23sm5969189wmb.5.2022.02.18.06.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 06:24:48 -0800 (PST)
Message-ID: 
 <e33918ce0c2ae29c0103feeba968dfc12e197db7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [oe] INCOMPATIBLE_LICENSES and WHITELIST_<license>
 usage
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-architecture@lists.openembedded.org, OE-core
	 <openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List
	 <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Feb 2022 14:24:46 +0000
In-Reply-To: <16D4E6E0715A89F5.27450@lists.openembedded.org>
References: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
	 <16D4E6E0715A89F5.27450@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 14:24:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161940

On Fri, 2022-02-18 at 14:13 +0000, Richard Purdie via lists.openembedded.org
wrote:
> On Thu, 2022-02-17 at 15:01 -0800, Saul Wold wrote:
> > I am working on a proposal to re-write how INCOMPATIBLE_LICENSES is used 
> > and processed to possibly include a COMPATIBLE_LICENSES variable as 
> > well, see PeterK's email [0]
> > 
> > I am trying to determine the usage of WHITELIST_<license> which would be 
> > used to override a license that might be listed in INCOMPATIBLE_LICENSES 
> > variable.
> > 
> > Randy and I have done a quick and dirty survey of a 100 or so layers 
> > (thanks Randy) and could not find any real usage other than what's 
> > currently in OE-Core for WHITELIST_GPL-3.0.
> > 
> > If you are using WHITELIST_<license>, please let me reply with your usage.
> > 
> > 
> > [0] https://lists.openembedded.org/g/openembedded-devel/message/95166
> 
> We need to be mindful that we need to resolve this to unblock the other language
> changes and feature creep here is potentially problematic. I do think it is
> worth trying to improve things rather than blindly allowing the horrible syntax
> in this variable to continue though.
> 
> The test case we have for this currently is:
> 
> WHITELIST_GPL-3.0:pn-core-image-minimal = "bash"
> 
> so I'd wondered about an alternative of:
> 
> INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash:GPL-3.0"
> 
> which matches the current functionality, removes the issue that the name of the
> variable is unknown without iterating every possible license name and makes it
> clear where it is applying to.
> 
> I don't really like INCOMPATIBLE_LICENSE_ALLOWED_RECIPES since:
> 
> a) it is long
> b) it refers to recipes when it works against packages

Just as a warning, the code is actually confused. The base.bbclass code assumes
it is a recipe name, the license_image code assumes it is a package name.

All the more reason to come up with a standard and resolve this. My proposal
stands but we need to decide if it is a recipe or package name that is listed
(or both?).

Cheers,

Richard


