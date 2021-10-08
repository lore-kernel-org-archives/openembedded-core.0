Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F55C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 11:59:34 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web12.8110.1633694373404426722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 04:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aXCXuBgd;
 spf=pass (domain: gmail.com, ip: 209.85.217.44,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id l22so7791689vsq.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hcFd/4m7Q/l+wWLWvonmA/8RrlojzudTwcJ+sGiMxWg=;
        b=aXCXuBgdUsm7h7JLYJmRewDhhSS+5XGjYwVYbwYAP/7+oAj49TuqLyYj7ttsW546eq
         ubSOVz2RiJEiM2cGffOss6i/JZHqOb9C4EC6Fzaoxy+vKu0WkD1w1pmKvG1WoDxs345t
         CNok/8hoywpGnOoyedShjzxX9pa6RVJ0MXqEp1iw+1dYQBIW2y6maeunNZlk3Qynvpg8
         per+tUdx/tAGs1isA7NrWfS93yzuw63mXGisRsGD8ijtYNZ83+P1gXQVoZhca32F9S5i
         xFbhemSIPUwxIVsuiZATALEwSdlGJiDTyB+IelCZd9jNxyL6H64GUnZerYwDpzHesXB+
         Z/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hcFd/4m7Q/l+wWLWvonmA/8RrlojzudTwcJ+sGiMxWg=;
        b=Jk9lpCqHxgAnk/adFHui5uC29Sq/G/dVe9DLz0tNKnDQgNTkvEdBY6lnmYmdZDqWdR
         f5RyQY3/BhqLxq3G2vh2658RaF4oFLrPn/lJXZ7YyoYRKE0sM6AiP/U0hcYmPJ5kNQQd
         ZSCQ5OBVzpYq0PFczu0vVV/NWeX/reYu0gvnLJV2yDEsuVpqcskkuJJ5HlVRjb7eLQ8M
         oSDy64dokisLdmZPsgrzCulpPiWkNSuC2yG9AbI+cAi4oenkWJPVKUs4yw3nRaozaMJl
         kgSVEZv7h2lU8Rq9EaPsi7WtXcVGEXTcoGbFY1QhX3Vm4yQ7UcDA4lEMMJgujOJPnyJ7
         yWIw==
X-Gm-Message-State: AOAM532G8FfWAosBhsHBA6cyitlZ6kbFo9HrklGoabNNNkY1+/yPQb1W
	9rdv0Uvb2lNRMQfIYe+rMkfomnAzE4j5nnZxGwQ=
X-Google-Smtp-Source: 
 ABdhPJxRHQ8bMLOCWVmLc2xF/5GnoF6ElIvIw3OcK+N8OrARzpG6oRoVYpWtZWsjKdaWidRxE99rdDX/XAUDnYtPU50=
X-Received: by 2002:a67:d11e:: with SMTP id u30mr9795614vsi.58.1633694372555;
 Fri, 08 Oct 2021 04:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211008083758.156759-1-pgowda.cve@gmail.com>
 <7c45856599d0602f115788604a07b0105cd762aa.camel@linuxfoundation.org>
In-Reply-To: 
 <7c45856599d0602f115788604a07b0105cd762aa.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Fri, 8 Oct 2021 17:29:22 +0530
Message-ID: 
 <CALY4987+J53GmzMtgzma=J1AtjvV+k3WwOrHgfDF-J2cr18rpw@mail.gmail.com>
Subject: Re: [PATCH] oeqa/selftest/reproducibile: Include rust packages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Randy MacLeod <rwmacleod@gmail.com>, alex.kanavin@gmail.com,
 umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 11:59:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156778

Hi Richard,

>> https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/764

Thanks very much for sharing your inputs and comments on the issue.

I could see some more builds where rust exclusions were unused:-
Some of the example builds are:-
https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/757
https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/755
https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/751

Can you please let me know about this inconsistent behavior?
I will try to check the issue based on your inputs.

I tried to build the reproducible with and without rust exclusions on
many poky sources.
Could not see this error on any sources ranging over the past two months.
More details on the issue are shared at:-
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14525

Thanks,
pgowda

