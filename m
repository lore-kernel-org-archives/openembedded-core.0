Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C249BC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 01:01:32 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.61014.1638838891671451977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 17:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=YU56b7pd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id p4so13073882qkm.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 17:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=AWyXIP1f4fnIPmsuJ1WoTtPg0cN6nJR9DhEYRPY506w=;
        b=YU56b7pdjHKE3o1wov9YnSySvrYS9yKHjkkHsdAYjsJhWgYOA+7ecFO/4FsXBPmqQR
         HGL1cfP0PTq3VBEbuuvEMJbGaHbQy3squ1PMyXHeIvjjGGz39ZUuRDd1HHu7CtHO0bib
         AFEVKfLLhnyfZffUaok/KHOeM6S7NlQGtOA4gofz8JLGd0AZD/rmfTADtLwpW+LlMoui
         eHPNGUnedhT+dRsMjIxGIPVhPH/Ks8dSDayCL7p4I/yBQm7npXCITkwdHVsYPX2WusZ+
         vlnE1x8pBmuPacOUuwYOaeOVaAaKgPtDlsrgZLJX2qwALTT0+1CqZ2R8GMA3Epq7OfEw
         slEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AWyXIP1f4fnIPmsuJ1WoTtPg0cN6nJR9DhEYRPY506w=;
        b=ZKmKSeBTWhaxTzIY0c5XOftJOPdZT0yv++NcBXJEOXthaYkFdgRUVQHk3JKj8MXI8R
         8I8wgdqQpq3LjzFDCvTN/KAEuWL46k685oo4S8qy69IWsV4+6MZ19zoZ4AtwMSKHw13v
         JtGrBHPpMLp7CyiJn1+0p6MPEpEl7WRss72FJ9nGJsQ1x1YH9wMF/eMmPkFOQj606q1L
         NLQnNSNEToua3BPfokMUDVNgPYzAnttxf02qeC3Ep6RhuVHvsK+iNlp5y64xyUAuVdp4
         mrGfcOBJn78lVzE4qEDw0yrIKTOOREgDQQqGmvELtXAbPctS183FAQQBsXPrkcYcWTBu
         k4Ug==
X-Gm-Message-State: AOAM532ADj85bGVsWK0DUAlVzCQMOXqCRvXvNzQP3wOdyhyehGmIfZ++
	vbFOhv6FAXRfVEEPntRZ4hIrXAs/nBzRfFVmbG7Cpw==
X-Google-Smtp-Source: 
 ABdhPJyaUUshKHLzsiPOOmHKe4wP+Xa8uwdy986tcd8cihgLLhU8ZUk4WwDCW6CnS/sU2eQpfUTT0bkLzOIVtfwBG9E=
X-Received: by 2002:a05:620a:4622:: with SMTP id
 br34mr37816049qkb.504.1638838890715;
 Mon, 06 Dec 2021 17:01:30 -0800 (PST)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 6 Dec 2021 20:01:20 -0500
Message-ID: 
 <CAPoiz9zni1rhmpFP+YOeseYyaT7BJGE_oZjYbDicWiYo5x0_eA@mail.gmail.com>
Subject: Help with Inclusive Language in OpenEmbedded/Yocto Project
To: yocto@lists.yoctoproject.org,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 01:01:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159279

This email is a follow-up from the session held on Friday at the
OpenEmbedded Developer's Virtual Meeting (see
https://www.openembedded.org/wiki/OEDVM_Nov_2021)

The session was not recorded, but the slides can be found at
https://docs.google.com/presentation/d/146ueVVTMeA8JI43wqv5kFmdYEygqqmfGH0z1VRL2bDA/edit?usp=sharing

The outcome from the discussion was that inclusive language changes
are something that we want to accomplish in the kirkstone release
timeframe (with an exception for the "master" branch name, which will
be handled at a future date).

There has already been a pass at collecting the needed changes at
https://wiki.yoctoproject.org/wiki/Inclusive_language

This is not as simple as a find/replace of offending words.  There is
a desire for backward compatibility or to provide some kind of "you
want X, which is now Y" (which complicates things).

The intention of this email is to see who is interested in helping
out.  Once we know how many people are available and what time frames,
we can plan out a roadmap.  So, please email me (or respond to this
thread publicly) and I'll add you to the list.  There will then be a
follow-up zoom call in the next week or so to plan out the roadmap.

We will document the roadmap and everything else on the YP wiki page above.

Questions and comments are welcome, but not interested in debating the
necessity or timeframe of this task.  It has already been decided.

Thanks,
Jon

