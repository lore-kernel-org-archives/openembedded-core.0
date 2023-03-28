Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5D6C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 08:32:55 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.61272.1679992368848310072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 01:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WlXDbzDT;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id c9so4341975lfb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679992367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fiZZINOdNbDi+1t1nFHyC2jyUXxnKEFkzQ8WW10o9PE=;
        b=WlXDbzDTT1XPV2PNTFK4o0hr7zUzCm/5AaasnBxOguz4DCpYEBZCVzw+g2Cuc4lCKN
         6ud7vGmkLKO9kDlXNvZBdA/YU4Gh0o2TBoW6dW/Ru3qTdrulFXTzeNsvbYiaoAZTjJNq
         +6DuD2KO6WpY59bGlLmgySI6I7c1O5QU7U+l2bEyQYmEbUzqHGfOwA0kmEdbIF88xJGy
         /YXU0Q5HQ5YgQNWv8huaOhHvBt1sjx10taR39DrNm3hv98ftt297vfgtpe6rSIxeWluT
         zLKWvYwlkU+1hdIUa8WfHvKp1cesWps9aycYAU0WorfgS39WOb2YxKcF9ADI5fFdb/ua
         82yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679992367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiZZINOdNbDi+1t1nFHyC2jyUXxnKEFkzQ8WW10o9PE=;
        b=XIfj2O7MwlaQlTpYMSj3VhZFB6cg45ha32q7HzRbzgNKN5DbiGbl83DmUbBqEbsawQ
         D/xzMBXY4z/eIjUSOihObbp/xAI3LhczuSER0BV9mztpY4emM/U35EGILpd78OlI8W7i
         ojAsMB0SOklOazEZkceT//HXbQYNrKKPTCi80WLCBPhsLqr6sEOW8v2w4wPlqr7/vtHT
         CNAJiALTJtgdiEwAC7xfkah3dDHrhJLC+7E3JtAo8IyEuWjS9hO1HsAX6g2CxAhKBmAg
         iT1b7K7kZaRYb6sBEOWtAvvlxAITY5iU5UwMJ+8l/heKmejd9PT3VGHfsgqRI1JqJSnf
         Fw1Q==
X-Gm-Message-State: AAQBX9fSC6MHDkpKeqQQxvkgOwuO8175KKFMQGxB6+kcP+UN3ThHosUQ
	JzYQo8KMzZsjkg4SJRwsRF6s7cRV1Ji+bAgFs/U=
X-Google-Smtp-Source: AKy350aAuwKL//FEf+g0wYw1nrH+2mNM0BImtqIoDPUQA5MH0ur+H3fO/waeT/KxrFr3yIwmsp9jR2ELLJK8ceP3DRQ=
X-Received: by 2002:ac2:522e:0:b0:4ea:e2f8:5ed6 with SMTP id
 i14-20020ac2522e000000b004eae2f85ed6mr4130652lfl.11.1679992366885; Tue, 28
 Mar 2023 01:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230326164557.27827-1-f_l_k@t-online.de> <20230327194727d709fd64@mail.local>
 <CANNYZj-JeJ0xr=+bCFqxfe7cHfw6oCjYLkgn0u=6gftrwyTicw@mail.gmail.com> <af438a29a2fbf4063fe8fdda59969e0b893ea8b1.camel@linuxfoundation.org>
In-Reply-To: <af438a29a2fbf4063fe8fdda59969e0b893ea8b1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 10:32:35 +0200
Message-ID: <CANNYZj_BFx8N8s-ZruJaFGVmdhNsHfz_xUh88RArPDao-yZ=5w@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] webkitgtk: update 2.38.5 -> 2.40.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: alexandre.belloni@bootlin.com, Markus Volk <f_l_k@t-online.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 08:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179211

On Tue, 28 Mar 2023 at 00:28, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > And probably split maintainers.inc into respective recipes, come to
> > think of it. It'll hopefully draw more attention to how many do not
> > have a maintainer.
>
> I think this is probably more obvious all in one file.

I'm not sure about that. I feel no one ever looks at that file, until
we tell them to fix an entry in it. But people do look at (and make
changes to) recipes all the time. The first step towards solving any
non-technical problem is making it visible and well-known.

Anyway, that's orthogonal to shifting these tests out of selftests
(and fixing patchtest), and we can address these issues separately.
I'll try to get to the patchtest.

Alex

