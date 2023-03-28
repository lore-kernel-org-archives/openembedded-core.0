Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687FCC76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 09:43:15 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.62146.1679996584836025450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 02:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jdBKrDKw;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id e11so11814276lji.8
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679996583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tlu8zCVNJ2vXn3WBrN6R1ITxfnk4hfwOhsZ+HoBHIAY=;
        b=jdBKrDKwtwWZ/Gj7bXuPjdLiH4e/NexYsbBFiA33oPHPWT//dESzvK0HWkXswQ7qp3
         Au4skvVatfrqqtmyd8LSo1WH4ib8KUYWz0YTqofcAmk2aTRFUnnbf68BqNBFe0AAtfDk
         PE11CQvFCAJz3ufExz46M5K2hhzi7/AuAIEL7lUR4Sy6GGoNfL2VQq0NqgXnWrSEj5ad
         k3uWqqrQ7QcIw5mhTK23bZ2gvAEcT8TZj1TM59UTVgNNCoo0UUdPIRF7cQdTPUcZMBve
         juLMv3vdn6KprBAcsWLgzELoJHP8K9mCGdVK9zvnBY6JHBvcfxZRU07rnk5XRhalmFkO
         8uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679996583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlu8zCVNJ2vXn3WBrN6R1ITxfnk4hfwOhsZ+HoBHIAY=;
        b=SZ/UlUF04nlnyEO10jh9LVzu6nd1PaKl78oOYqi1BJ1/Etv6cSxfXcGvDihiAPWiEW
         SJorrHxUNDQk/ROSncEO7uvJVoqJoxnCmKhRk9b6vypyyzG+ptYcG6NrRoa/A4oFaKmB
         JCykk3qB2c6+srugr9TMa6U9CMJrPqZok249lQev5HlKzRDiBojPZJmfEvOG+6CxniRT
         abtvubOJNd7nTC9908nsHUvc1f+49nX2NXMTTQBLtLREM9sQ2mmylDXFGFnXynr4knI0
         OwGot5C7wBfvEIlGQaN4F2P+we9+P5EjoS7A8/PaxSZMg40xihZ0tfaNcRFJgQbehchH
         zIrA==
X-Gm-Message-State: AAQBX9dV7UKF/cAxnRRE1FzqjVIW0CBXZoXMXi2wA3Ul6Z7mspbuUNSO
	Dgo+FbRNXryeZb3IcKAb7EucJpKRurcKrsxNtiQ=
X-Google-Smtp-Source: AKy350algAgBBOfTxwQwzRpvA/MgQcgTwixnMcPQSYol5JCRAqPKTt/s9jKLFOvk7Z3AfkFDUNwByvGIvnJMlEU5Lws=
X-Received: by 2002:a2e:3203:0:b0:298:b337:c11f with SMTP id
 y3-20020a2e3203000000b00298b337c11fmr4515414ljy.7.1679996582977; Tue, 28 Mar
 2023 02:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230328080156.854975-1-f_l_k@t-online.de> <2023032809183607448ce9@mail.local>
 <BL58SR.DBJ9EGI95SX72@t-online.de>
In-Reply-To: <BL58SR.DBJ9EGI95SX72@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 11:42:51 +0200
Message-ID: <CANNYZj_iXKxNFn6MHBuXY4UoZLGeGsBYeV46x156HmL2TruD4Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH] import libadwaita from meta-gnome
To: Markus Volk <f_l_k@t-online.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 09:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179218

It can also help if you publish the complete current set in a branch
somewhere and refer to that in the cover letter.

Alex

On Tue, 28 Mar 2023 at 11:41, Markus Volk <f_l_k@t-online.de> wrote:
>
> On Tue, Mar 28 2023 at 11:18:36 AM +0200, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
>
> As you underlined, a build takes 5 to 10 hours, every build failure is also delaying work from others
>
>
> Now thats true. I didn`t send ot unchanged patches so far, because I wanted to avoid mail flood but if it will make things easier I'll send the complete serie again
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179217): https://lists.openembedded.org/g/openembedded-core/message/179217
> Mute This Topic: https://lists.openembedded.org/mt/97900769/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

