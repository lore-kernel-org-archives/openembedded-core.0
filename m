Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB25C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 15:48:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.730.1654184890056003635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 08:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DxbdvkB1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u3so6999788wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 08:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=3TKf5qbJuEZ734zQ9XolXHFa9JRvnW4AR13Vq0MB4J4=;
        b=DxbdvkB1bVn57w+1RCEtPt8JXJ+4XCDq2xDFCBm2IMYmP+I9i/98836sXi1wln7z6P
         l6c1XrioiOvQPyJU9SurBH/H0KimjodtICz91kHFhkN1omA0vio3JUThwWqMfFHtoqUt
         qVepPospkr8sc2YqH++fbl3MbJYiCLr9IN/CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=3TKf5qbJuEZ734zQ9XolXHFa9JRvnW4AR13Vq0MB4J4=;
        b=R7BhI6Cd+V9I2JoAR8fOPXd2ev/WcGV9idxq4Z+0T8zwyMvwB0RPzu5/BKB6yqu8Ht
         H+tPDcxNNlg16///IJNLb+H6bh5tacrnijCTMEV5V+9IwaR3emb/oj8JnmeG21ANHIwT
         1sVKLLr9jUcZjnrPPYAcLg4l7ttJqxIK5yilOyqGAF2Gk4xL5E8rkcbk2kLUc85PSMh7
         61mqqAEfI2rApbJ4gnG1g3+DSvCr+XairE1L6jQ24vIO7Ph0/ziUMTIdKcHQynP7Ocw5
         dUJoe99puuCR1f8JxV+OM8Rk1QMvUyEzcMlfEdBBOVSsECihNxUUh1oo//rQ5CpCW19g
         +s1w==
X-Gm-Message-State: AOAM532fU1REJMf+0iKrtg+n6YgYmlRHGtgFH+LqsRUacswI9ZHwJtYz
	QUd2X/fIyzw68oKVpzaSgie2DQ==
X-Google-Smtp-Source: 
 ABdhPJx3Ats0AitDpbsIUx9rkQCZyH/fMqxNlxufbdG6Y664QNTrW/G2YKP5oB38TL1vbyFIVldoyg==
X-Received: by 2002:a05:6000:1f89:b0:210:552a:644c with SMTP id
 bw9-20020a0560001f8900b00210552a644cmr4167801wrb.667.1654184888492;
        Thu, 02 Jun 2022 08:48:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:171c:95a:9d1d:26d3?
 ([2001:8b0:aba:5f3c:171c:95a:9d1d:26d3])
        by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c1c9600b0039c25ee5dbcsm3532221wms.14.2022.06.02.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 08:48:07 -0700 (PDT)
Message-ID: 
 <3514dcb4dabeb14175442ead4a79722206de3cbd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] mesa: upgrading to 22.1.0 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Auto Upgrade Helper <auh@yoctoproject.org>, Otavio Salvador
	 <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 02 Jun 2022 16:48:06 +0100
In-Reply-To: 
 <01010181200fed15-05d567d7-7de1-46c9-b0fd-ff60dba94727-000000@us-west-2.amazonses.com>
References: 
	<01010181200fed15-05d567d7-7de1-46c9-b0fd-ff60dba94727-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 15:48:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166474

On Wed, 2022-06-01 at 16:18 +0000, Auto Upgrade Helper wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *mesa* to *22.1.0* has S=
ucceeded.
>=20
> Next steps:
>     - apply the patch: git am 0001-mesa-upgrade-22.0.3-22.1.0.patch
>     - check the changes to upstream patches and summarize them in the com=
mit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>=20
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>=20
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler

This breaks runtime testing on x86:

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/5296

Cheers,

Richard


