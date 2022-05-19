Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF41C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 12:29:49 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.6897.1652963378986120160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 05:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pqzXyfMJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id t25so8841926lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 05:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mESprZRHphaikvcuwK+rgzus7LhzGO+DmF0m1DWBInI=;
        b=pqzXyfMJzauuvBnjxYRK35UltEVad6nvpPTxAG+SN3Lgx9bioCTGUqgn4GjUyA5Kwq
         acrr6K/8rwZzaDzdkoGXL2WPE7DI14ZCb+c733LYpjySn2ajkXQe22IayaDAR92bQaCa
         Ljmj4VqFr/pKaNtFJdiDNCywsK41kiiWL91EGTq56mkC9mjSAnJZHXqGfEcLUuBl/jYh
         gBAP92VwzxHMxvqZIYvaFpV5UiTUV5vFU7C2dBjp+fYn+wZb8ixrT4qIr8sUG8k8lG9Y
         hw4XyQM11UWBakBh+uSqdLgfXiy+h4VAq/XxmEvn584Yk6AxXEzMN0g+/RQyX20URiGi
         EQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mESprZRHphaikvcuwK+rgzus7LhzGO+DmF0m1DWBInI=;
        b=cYUimk5aJeT3TlzlpmQSt1v76BGLNY3kLXFjiislUL+k5xY/PSCJeWqigxY3U3huqh
         YPTnhPy7yuUqgl8PXLg6oumrwnohUzd5wtJQQrDr9Wd0+9QHdJfbFjCzJugDGQ+uEyIk
         smkKBzZTSgMwsyqNinfjdttlGNTcsjZ7rkNsFjY8icekdB8RiGGJrSkKUSl18g/E9nmF
         o19JAU/v3QUpRa9vt0/y+CAza8my1d1f8T0ZnW/tXVw/rOGuMnqOZNhEUuInPN1Cr3Xf
         IWTBuqezsfrLDTwKXPpI/Ny4WCB/6ihj3lZlzNCOYcu0vxn5hHpa4bNkN2haHvMLowvm
         tksQ==
X-Gm-Message-State: AOAM5310JqKr/86EGX0fZJQAPVp/iNmnOaVA9IxPmfuIe2Zr4Yu0swyL
	Pq/5IfmAEuc3pOyDQBVPW0cHUeNXKqh8rco59yg=
X-Google-Smtp-Source: 
 ABdhPJw5gNvzyVGBlDEGAn8894dYuFzLVcEkaBuyUsAzbn/9nRVdLZWt+mudIX+UMe2LrO28Tt/Vpk2wHTbX0zpGUHA=
X-Received: by 2002:a05:6512:2353:b0:473:d801:6e3c with SMTP id
 p19-20020a056512235300b00473d8016e3cmr3270211lfu.26.1652963377135; Thu, 19
 May 2022 05:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220518123723.134317-1-mangodan2003@gmail.com>
 <20220518171247.2a7d0ab5@melee>
 <CAPxFgq2tqLtPeNZdjcp3LuYZ=Ou=MxBbx1We7+g=PErPhOGsZw@mail.gmail.com>
 <CAPxFgq345oM_htKTmSGTTb2qZ7sNp5GQQNwN28cP6SwM2jA2sA@mail.gmail.com>
 <20220519142217.4a4b2cb6@melee>
In-Reply-To: <20220519142217.4a4b2cb6@melee>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 May 2022 14:29:25 +0200
Message-ID: 
 <CANNYZj8DH=GqZW1rdhpa668=s4n-ZvCZCbU-e=aGJhmM3T5PGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer: updated to 1.20.2 bug fix release
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Daniel Squires <mangodan2003@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 12:29:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165884

Note that AUH also sends version updates twice a month to oe-core,
which are intended to be picked by anyone with an interest in a
component they want updated. If you do so, reply to AUH email with a
short note that you're working on submitting the update - we don't
take AUH patches directly, they have to go through a human, and that
can be any human. I'm the human of last resort :)

Alex

On Thu, 19 May 2022 at 14:22, Luca Ceresoli via lists.openembedded.org
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>
> Hi Daniel,
>
> Il giorno Thu, 19 May 2022 09:14:15 +0100
> Daniel Squires <mangodan2003@gmail.com> ha scritto:
>
> > just out of interest, where would I look to checked what's been
> > submitted? As I looked in master-next of oe-core before submitting it
> > was still in 1.20.1. Is it just a case of scanning through this
> > mailing list?
>
> Yes. Patches reach the mailing first, and from that they are taken for
> testing branches and eventually hit master. Apparently you have checked
> a short time after Alex sent his patch, so you have definitely been
> quite unlucky.
>
> No problem at all, these things happen. Thanks for your patch anyway!
>
> In the future please remember to use "reply to all" so that the mailing
> list receives the entire discussion.
>
> Kind regards.
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165883): https://lists.openembedded.org/g/openembedded-core/message/165883
> Mute This Topic: https://lists.openembedded.org/mt/91185012/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

