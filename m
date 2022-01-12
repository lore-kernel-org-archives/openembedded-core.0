Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B792C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 18:12:00 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.963.1642011097465119014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 10:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kfQY0io0;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id o6so13342475edc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 10:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YXBkNiY7AIKQKIsHB+2HBGa8+y5DhuhsDH/IovQbPA8=;
        b=kfQY0io0kaxD3/xrOjXMiyVTfNAHdvy/rTS2/482R2EdU+XQAoTU3M/zalVbLuNetp
         K4BhD/ao+yGBs96ltGgMUH1ghRDdEKpiS84pSOFfRrF8W9b0jw4KRx4s0dZnYu0bc3Zt
         9QaLixLw2U9f4ofvn62op7A3rwUsdP4qtRQ1XVt3MW6mE4YIHvgHkaMU77kU6bGQ6723
         BHbRto8CRCc8bNde1tKtUf4gz1d9s55n5YglO7XjA5f6mu9KOdaPRUT2HqG0wUGovY48
         ynJSk19Rgm//LsJUubbrUD/fRWCeg0+zxwRkh2eJHW5PKl+JRMMA0B4orGKqofYh1uqo
         ee9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YXBkNiY7AIKQKIsHB+2HBGa8+y5DhuhsDH/IovQbPA8=;
        b=g7EWZaryTpuxLc+sRoeWRJPt5kou2unLyL767LmznVMowVDErh9/g0PEY1KvzFnTPV
         kmPw9OlqY7l5g8YeiRrVBq5QPT56WOkMnmR/DtJqQz2P5D8mHXDIBSpQLGJlFgbV9gTP
         ivQ2rVsrBTqahfzlaMKAkJ6pHBN6dKyg8CvoGAPgZ1R+3f/TIXWM0AlDKpb9EgczttFt
         EsAtuqKhuPIEIqOAKKCRRydX/njB5inRHUZLTTzdB8n36OdjCRzCvqRS/Ho+DAZ42K8f
         7deOJBJqc51k5s5xFI9/2HDqqj6G3+oRrTL818iR+mh4DhRULsfE2MpJR9aN2Xmyy6Yi
         OQag==
X-Gm-Message-State: AOAM530/TydV8F44/hRMcstqTMl4fP3r6a1W4bAFgeANhu708TvjWJ0u
	PJG/ld59jvnOEvRUTCA7q2wsc/0ISfETb6S4DEc=
X-Google-Smtp-Source: 
 ABdhPJz0j9/vEFX6OQACUxF72zlKGKOFDM/5cWmpKoVJuIfzO7hmizOs/wIX2KNdSxo+w25XHV22PfOihGdk310ooAA=
X-Received: by 2002:aa7:dd59:: with SMTP id o25mr775475edw.288.1642011095925;
 Wed, 12 Jan 2022 10:11:35 -0800 (PST)
MIME-Version: 1.0
References: <20220112172041.143485-1-saul.wold@windriver.com>
In-Reply-To: <20220112172041.143485-1-saul.wold@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Jan 2022 13:11:24 -0500
Message-ID: 
 <CADkTA4MdupvSrxKOQaePuH=Mc8kqrCUx33Yvk0VBAJTSbpyfEQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for creating spdx data for kernel
To: Saul Wold <saul.wold@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 18:12:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160497

Looks fine to me!

Bruce

On Wed, Jan 12, 2022 at 12:21 PM Saul Wold <saul.wold@windriver.com> wrote:
>
> This change set is ready for merging, I have tested with edgerouter,
> qemuppc and x86, in order to check different kernel types and strip
> options.
>
> This version creates a copy to be stripped and deployed in
> kernel.bbclass, if needed. The unstripped version is installed so
> the package.bbclass debuginfo / extended packagedata can be generated
> correctly. This is the data that's used by create-spdx.
>
>
> Sau!
>
>
> Saul Wold (3):
>   create-spdx: Add kernel work-shared source
>   package: Add support for kernel stripping
>   kernel.bbclass: use common strip()
>
>  meta/classes/create-spdx.bbclass |  6 ++++-
>  meta/classes/kernel.bbclass      | 44 ++++++++++++++------------------
>  meta/classes/package.bbclass     | 17 ++++--------
>  meta/lib/oe/package.py           |  9 ++++++-
>  4 files changed, 37 insertions(+), 39 deletions(-)
>
> --
> 2.31.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

