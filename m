Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E135DC32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 11:54:41 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.5409.1663761274342221340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 04:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vtwvmweb;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id a10so6758477ljq.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8jxQJE87bjxjmonbBpxPEZ18ZLO68A7qgxYvRZ8/UUY=;
        b=VtwvmwebcGei5NmXfFXU7XzizzCgfkQLAAlE9FbsoySwfI7PqRnPPP2Js9n0R7JVku
         osQfm3WArZ8CoGQ7pHTrr0MkUByRNRCeNb3gl1q1bwWa8BpT1Wtq/Z6eoI/x/Kw+GWjc
         R3YJgeBcjc2Gk6Puhc6naZvNWkn4A/HcQv9a/eLZpfcHtOOzSrd2uJVwfGB+jyZwaSxa
         2HeeCsOCpHmnDDfGab+t3xZ9AE5yEi1z2iVJkqEN5DeWVBTOGVBfn0ebsxLh5PJ+O/kA
         SmYIRK5LCsaCHgKo7ZwdLOBFAIQ7T1VqiC3yYSaQU6+tiB314l1YeLw2JuBcy1d52sMw
         4gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8jxQJE87bjxjmonbBpxPEZ18ZLO68A7qgxYvRZ8/UUY=;
        b=WnQjPXD2ldWmeiWqzpUn8xI12luedH0P2rAAgz44ttfuzShHZZ4tL4zuCxKQQ/sCZO
         s4MmjStvMLkLzOWHn1ZcXzeFcIjZb8RKqzRTJ0CEKC74XDATnZwMpVnvlqC8WwA20I2J
         0DfMd3P8M1X5O7njJ5A5BCJae6Zk6V9swAeh8WcMT4xsWrlh+5sNk7DpQDPl09/zIHSA
         WFZ9IPQxPpDAEQpMke618ECv1UuLP0ZIPQssKha4SU/iaL0tSBR/IXmp6RID0QPwnNvi
         HR8Q7O2fDdLTcCmKVLgUn5F9Fg4Po2AeTYdksCFDHYvbYfknpTQZMBAOMCQOsjFp2yy1
         i/nw==
X-Gm-Message-State: ACrzQf2Fd6FROZ9K8XVsdossuU0DaLO86XOm9ILmj8k+9pNT+hPp/JcX
	3h9aZxP4THLEjAHQ1m6+r+csd+cB6TNFOXmR7QM=
X-Google-Smtp-Source: 
 AMsMyM7sXHJstsseazAUHuiVP4tsUGUtQJWNsZxQU1UbtrVnMzuBktG8ZT7OLAiAwjNGD38em9kqnLL+jDysXy/elms=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr8513448ljb.257.1663761272184; Wed, 21
 Sep 2022 04:54:32 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAO5Uq5TDQOobAdyLJHwkr-zvKn4RHgzR6OzHWg-y3b4zYVLyRQ@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5TDQOobAdyLJHwkr-zvKn4RHgzR6OzHWg-y3b4zYVLyRQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 21 Sep 2022 13:54:20 +0200
Message-ID: 
 <CANNYZj-sc7ESFMdcvr3E8N1EoKg4PZVhPxG2LO9gMo72H61H7w@mail.gmail.com>
Subject: Re: [OE-core] Upstream checks and github
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 11:54:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170947

I just checked. Github has moved the lists of 'release assets' such as
tarballs into separate 'include urls':
https://github.com/mesonbuild/meson/releases/expanded_assets/0.63.1

but this can fortunately be fixed by tweaking the regex slightly:
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
-UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"

I suppose this should also be abstracted into a class, e.g.
'github-releases', I'll get to it after I'm back from holiday.

Alex

On Tue, 20 Sept 2022 at 19:07, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> It looks like something's changed in what github is returning on the
> releases page which has broken `devtool latest-version` for recipes
> which get their upstream data from that.
>
> --
> Alex Kiernan
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170904): https://lists.openembedded.org/g/openembedded-core/message/170904
> Mute This Topic: https://lists.openembedded.org/mt/93808689/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

