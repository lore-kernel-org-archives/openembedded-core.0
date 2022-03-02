Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5093C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 23:05:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.4599.1646262332835344333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 15:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GY6fMPNI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j17so5148273wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 15:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FQA23ID2ZIfIMiuZBqSPinH6V0CTsbsPV1JDW5wvEtI=;
        b=GY6fMPNI15OH6XojlOskNqFTI/bsI02t4PZcS5+cjfMu7ZfuRIIVlV5FnPmMa9uC0w
         dM9kkG6RevfV+O3aY3V4H8aRuEtSrP/UVMuPNckkz0fxMnA6nbJcFFh3LFMfv+K8vjyV
         2+FHHY3N28c0Be4dBMqLpl7ztTDnr7l9DjwEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FQA23ID2ZIfIMiuZBqSPinH6V0CTsbsPV1JDW5wvEtI=;
        b=WW5nBPv01Sc+9dCC4B+tW93ECVYg4hOyV/2Q6QPk8yqn9OkolrCBUAAC6EL4PtN517
         1p/EpxTEuW7Uubdbu83qPQL8dA3awcI0ZSqsr7H8IUeBj8sJp0r0oCCQhBWqgYgInfpt
         MJmGMQ3PtDw1Ia/yrPT3AetglNN8UxcckLeyIHBFnjP5X2mR7BNGU13CUJZNp2RJRqst
         5Z7vlBmIBBgCEWjHKyUJ5/MBNBjJipFcnZ/klrlJhN4kGCP0rUVYIC8/DaZ/HPFMIG8S
         Ss+10kwSD2+R3YcWaZHZCcVvBDJThbgkGEWTvOwegqyp5y1XmYC8d0tL6LtMOOqrSPSW
         CNNA==
X-Gm-Message-State: AOAM531KTwi8ukBrJeXlZInAl/MBzzO6r7J59v5IaksIUJu70aXHeHY/
	nGpTAdTiK3bhZLefI4anp2wRV3KZOeceqxVd
X-Google-Smtp-Source: 
 ABdhPJxvl6QxUoUsXmZS/kPu62H5vG+kazxuvEWrpGXSo/XCysVemxP6YCjmnUoze/qM05OUybGdQg==
X-Received: by 2002:a05:6000:d:b0:1f0:154f:cee with SMTP id
 h13-20020a056000000d00b001f0154f0ceemr7134987wrx.437.1646262331468;
        Wed, 02 Mar 2022 15:05:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1?
 ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 d6-20020a5d4f86000000b001ea8119512bsm280331wru.55.2022.03.02.15.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 15:05:30 -0800 (PST)
Message-ID: 
 <997e00f33cb607ad96e0c9607dab46a4872ce98f.camel@linuxfoundation.org>
Subject: Re: [OE-core] staging: FileExistsError
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 02 Mar 2022 23:05:29 +0000
In-Reply-To: 
 <AM9PR09MB464217F0B4A5828BA8092D4AA8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<AM9PR09MB464217F0B4A5828BA8092D4AA8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 23:05:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162629

On Wed, 2022-03-02 at 21:55 +0100, Konrad Weihmann wrote:
> An interesting behavior struck me once more after a long long time.
> 
>   *** 0002:extend_recipe_sysroot(d)
>       0003:
> File: '/layer/layer/poky/meta/classes/staging.bbclass', lineno: 584, 
> function: extend_recipe_sysroot
>       0580:                    if "/bin/" in l or "/sbin/" in l:
>       0581:                        # defer /*bin/* files until last in 
> case they need libs
>       0582:                        binfiles[l] = (targetdir, dest)
>       0583:                    else:
>   *** 0584:                        staging_copyfile(l, targetdir, dest, 
> postinsts, seendirs)
>       0585:
>       0586:    # Handle deferred binfiles
>       0587:    for l in binfiles:
>       0588:        (targetdir, dest) = binfiles[l]
> File: '/layer/layer/poky/meta/classes/staging.bbclass', lineno: 158, 
> function: staging_copyfile
>       0154:        os.symlink(linkto, dest)
>       0155:        #bb.warn(c)
>       0156:    else:
>       0157:        try:
>   *** 0158:            os.link(c, dest)
>       0159:        except OSError as err:
>       0160:            if err.errno == errno.EXDEV:
>       0161:                bb.utils.copyfile(c, dest)
>       0162:            else:
> Exception: FileExistsError: [Errno 17] File exists: 
> '/build/tmp/sysroots-components/x86_64/some/path/to/some/deeply/nested/file' 
> -> 
> '/build/tmp/work/x86_64-linux/some-recipe/1.0-r0/recipe-sysroot-native/some/path/to/some/deeply/nested/file'
> 
> This happens in rare case when doing a differential build o a recipe 
> with hundreds or thousands of native dependencies.
> 
> The file mentioned is pretty much random and it's unique (no duplicates 
> among all the dependencies when it comes to filename+path).
> 
> So far I helped myself with ignoring this error by adding
> 
>          except FileExistsError:
>              pass
> 
> to staging - I wonder if anyone else ever seen this behavior and what's 
> the best way to deal with it
> 
> What comes to my mind is
> 
> - ignoring it - but then no one can be sure it's the right file
> - falling back to the OSError/EXDEV path and copying over the file requested
> - a 3rd option
> 
> Any thoughts?
> 
> (Just to be sure, this happens like once in a thousand builds and only 
> on differential builds)

My initial thought is that is a horrible work around and we need to get to the
real issue.

The question is where is the duplicate file coming from and why.

Also, is this dunfell or master or something else? There were issues that were
fixed in these codepaths after dunfell.

Is there anything significant about the kinds of files this is being hit with.
For example are they generated pyc files? We have see that issue before. Is
there anything significant about the path lengths involved? It is hard to tell
from the information provided.

Cheers,

Richard






