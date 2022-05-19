Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6FBC4332F
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 12:07:49 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.6730.1652962058704718186
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 05:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DC6+IYsU;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id h29so8763469lfj.2;
        Thu, 19 May 2022 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/XBRn3AIfxz5pw7DJiJgMrLrK0y0OTdpPFrwDtkXQk4=;
        b=DC6+IYsUjqk9jT+aD/30KeiuINgRSWrFyKvhg8rlJRXBcDu8FCq9+bg4PQgZO7R7+w
         ZIQiOp213MLYGqxNVlINZP6wwJoLYJ+5BDsqTjgStEpdl96Nx5VzEe04yBjbdnDo9U0o
         VDh5NUGVzNBWn31gTFVSmKq+w/BHzshdmiUCYBlDxI5m7F8/rl/dwIvZmcMJdKzV6n3D
         DEU+SjquvqZmKzp80LAv036Upb1LnZeJ/iV/4FssbXoaNJLSUx1RJL7JETtlIBW/57pC
         JyfBmNKtsP4Ux7FglLMKq5+104Q9EeaQt2Ah/cvvmxaLszlydr9ydk4GDcZPVCN+a+Uo
         uIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/XBRn3AIfxz5pw7DJiJgMrLrK0y0OTdpPFrwDtkXQk4=;
        b=6LU4sxfcPPoUEPX3uAPz+0brfJ6OEAzTVC2YefYTu5oChV2JIp5K0ym1UtXa48c1ur
         MZVPaAd0vOfszkz5hmYibIWX0cUroRKIf6Sg4yNk65sr6bEll/+iWJ5rHeDXY+0l1hAb
         VOukdIWwJ79sTwiVFzl/PV1iVJFpCFLzZKCcOEju9y36NAg6qWymNgAURyi3u5FxX134
         FpEc6NxSRVCoj8VJYCd7mlR/oyXLmJ2rFDR9Ona5yv1cS0OpxKv3tYU/NxrNkARQZVkn
         /ee5t+Cj6bIcO4qC2G5I7SoNXCsJnIZWdJ40t84UKGFiTGvWlCNyXVGjba/ekISt7qW2
         DQxw==
X-Gm-Message-State: AOAM532+Ct2Pamb4pXM7GciS8GTPicV5AAYjHKhG9ZZQkoAgTHg1vZRL
	s37DOKDM/9eMLmjvrFvdQViqVT4DvOiGYBjvOu4=
X-Google-Smtp-Source: 
 ABdhPJwPmS/rmxuL00kQpZCcdPHQ8bZs1rDxTek7uvMxkM27yR5Wzlf/tdl9n3ZpEkvhFxUYKb1IufXaxmRW/0ltXLI=
X-Received: by 2002:a05:6512:3047:b0:473:cf43:6d8f with SMTP id
 b7-20020a056512304700b00473cf436d8fmr3272718lfb.380.1652962056606; Thu, 19
 May 2022 05:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <b9999975-f517-eb6e-e0f0-881558fa38ae@balister.org>
In-Reply-To: <b9999975-f517-eb6e-e0f0-881558fa38ae@balister.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 May 2022 14:07:25 +0200
Message-ID: 
 <CANNYZj97fyH=5BLGc5yRJnZOkteOsWpbh2m7RkAL83GQH8tfkA@mail.gmail.com>
Subject: Re: [Openembedded-architecture] OpenEmbedded Developer meeting
 reminder
To: Philip Balister <philip@balister.org>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 12:07:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165882

Hello Philip,

when would the time slots be allocated? It doesn't look optimal to
leave this to the last minute, as people need to plan their day.

Alex

On Tue, 17 May 2022 at 03:53, Philip Balister <philip@balister.org> wrote:
>
> We are finalizing the agenda for the developer meeting this Friday (May
> 20). The agenda has some topics carried from prior meetings and some new
> ideas we will cover at the bottom. We would like to get additional
> topics that matter to users and developers. Please review:
>
> https://www.openembedded.org/wiki/OEDVM_2022_05
>
> and add your ideas for topics we should discuss. Members of the
> OpenEmbedded board and Technical steering committee will be around on
> irc in #oe on libera.chat.
>
> Philip
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1545): https://lists.openembedded.org/g/openembedded-architecture/message/1545
> Mute This Topic: https://lists.openembedded.org/mt/91155434/1686489
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

