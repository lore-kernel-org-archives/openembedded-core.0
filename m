Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80EAC6FA83
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 20:01:18 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.728.1663012875665494951
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 13:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BsZ3mxbL;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id v6so11909838ljj.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 13:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4LXOx/f1j2KqYInEFFm3xKMlpQe/XmH8PeU5Dc5RS6I=;
        b=BsZ3mxbLzBlkk699nEUepNdMuxGncQRIp9gxk3RVWvzJIzc4aPnknEMIuJR6go4+bq
         SbahB7gpaTXDCWCyPf4zgslo3ckZOgsLEnXD1ZnAWPGE7EkbCkFN+M7GJya2lX3FnOZO
         SHHsi7QfBcFlxBlgyS1B0llYSJSdkKMZuebqijf+E77sqJ6YXEqRZsKO1IAiNJXNoS9R
         zld8QVPbuHxVYZ61LXEQrMLx7aNb5Tyow2X8EvL//Wo7krfIg/ltPG7NpWANWhjLvJlT
         tXPGp3iES5rH69D8oddvoveECcE+27vcOQoN5h3PTb1NnX2boMKj6PDXq/3wmYVfH+Q0
         zstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4LXOx/f1j2KqYInEFFm3xKMlpQe/XmH8PeU5Dc5RS6I=;
        b=l1PbVLR+HfIAtdQajZ26Y0f0BEUSuBQaLeMeg7Sqfe6SMI306cVBO/TyiemrSV7dKy
         Zew71qWlSzQH3e5loF6wZNUHEiO2/2CCdSYlHR4Qh184iKSq86F1wKvLaFH4/dpi9AH1
         l8L+qcZaYDZtzGqE6szfw55If/bhg0hyKIlNY6anT86897Hxt7GD3pcLYD3fBNpAZfxz
         Sv6YsbjMzNlzMcmBi9VcHm4Tc6CuDB8l55R/txxp9hNlznr4Kp/+x5xiy13uJfMhSwo7
         ntu78NrcwmAMDMk7XDRt4jRKW/LBSIoJXW5tomkecNEeiQySI+iaiOx96G1BRG8DGner
         ep7A==
X-Gm-Message-State: ACgBeo1rrrMm4jTFXnphBY3or8Rdj9bUWo7tNETk+uhCg6shO5/P4/Hh
	78vyr4cpIpDeXpwN0VSnMCbgcReH7M+3Cp34/pk=
X-Google-Smtp-Source: 
 AA6agR4K12fK2x9PCkmaAtvO/Xgk8KczxiNpUV1JyAYL7tK26KOTV2NW/Ua1kQI0jiGmfvDaJPGcY5yUQZ377ZlkfnU=
X-Received: by 2002:a2e:a887:0:b0:25e:3174:fb67 with SMTP id
 m7-20020a2ea887000000b0025e3174fb67mr7825400ljq.337.1663012873538; Mon, 12
 Sep 2022 13:01:13 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdY3j8DAsOQGhG9w1BJi+2ao4sO_KLvbkxX70fwbq8BfzQ@mail.gmail.com>
 <CAApg2=RssQ94dKngx=5ph_QbyZsWnqS7LRJ9rg67Q6b6bZbMWw@mail.gmail.com>
 <CA+chaQcks8Dmpp0zgizGfqSsRbp+YxMMvsgmae6YutVP5mar4A@mail.gmail.com>
 <CAOSpxdbSd4RwWPmw3mDq6KBjrbhEqNhUpcH-hNCcKkMTLQQJ9A@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbSd4RwWPmw3mDq6KBjrbhEqNhUpcH-hNCcKkMTLQQJ9A@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 12 Sep 2022 22:01:01 +0200
Message-ID: 
 <CAApg2=TAFnSuPZ6OF6a-+nooqYB7d42VNjKCMFVLJaW4DdbS+A@mail.gmail.com>
Subject: Re: [OE-core] CVE raffle: collision avoidance
To: Steve Sakoman <steve@sakoman.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 20:01:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170545

On Mon, Sep 12, 2022 at 9:16 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Mon, Sep 12, 2022 at 8:57 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > You mean this list?
> > https://lists.yoctoproject.org/g/yocto-security/message/655
>
> Yes, I assumed everyone was aware of the weekly CVE list!  Did you
> have something else in mind?

Sorry for the confusion. I meant that exact list and suggested to use
it as a reservation list without manually looking into this thread and
verifying with the three different CVE emails.

Kind regards,
Marta

