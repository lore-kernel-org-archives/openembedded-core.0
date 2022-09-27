Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE394C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 12:10:13 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.9911.1664280605360609625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 05:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FW1SeWyD;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id a2so15374342lfb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lzA+RdU6chYB1bTmsEAOES6ceun1gyYX39jtSEkbWwI=;
        b=FW1SeWyDZ7gERU0kbWbgAIEXGJjWdzQAAIkee70lsQsKxN3UEHKERw2JBsD54H6lL6
         sU2NF/QgqF2YaQKqMyplJVjlZNkPfoze0roPwVGsxVQ+BAHmPwNpYqcs30Qsxh6d1hrc
         0+PVJT8FIwdriVPfLpb7eb6ZoSDKdCXnvZ8giwsWJhMion/82mvIZNwT8+ZkhmAaok7Z
         CNEbbX3k4Dcxd7sZsx5sWhYGIIKosd3qk7B6a99t/rMhlweGjmYX3GnV06swSovn5o3R
         WtXL6D3b77TSzUfIQs+hMr7h+ACijlbVjjjz4k7Lw6KAL1LEE3hJX0+tb+1QziiELGIM
         Bldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lzA+RdU6chYB1bTmsEAOES6ceun1gyYX39jtSEkbWwI=;
        b=FnML7R5oJXhKfbjtpfzwdiRldiZrJBbGIqUFKs1+uVzZxNLm9MKBf7rZtnxoloXsO7
         s32NOqC7ZN6Su6Ya3o76SKoy6Hrq4tlYXrKGwVnSxVcpPdVr26t5VBViqdAvtdn2wnPp
         U7mcnexAtVImApJElP1HwKEMIH1azooOsr42qWMIiZH4l+VDgLAJOVTIj2YV+iyJJLeL
         EnA+LjO4MxZmV/P9+wizUtxVNWsuxU8c8iABzS/Cu7e7Q+3a6kLyVmiqEmoWQYxtcB4x
         6s18q8De2HJX7zjX2jLZKt7LlIKOHognsBjLvMubeRzqpZkgy7Vj1Dw9kIeD5oYiN2Ud
         upxA==
X-Gm-Message-State: ACrzQf38MwXUeh5veN1yFBNaf2OHKEY7jFP0OP7XmiK6Z3yJgQeRDTXb
	OlmVBwNktZ3dIkzBV5Z96h1zI4kDIGBWLdyqozo=
X-Google-Smtp-Source: 
 AMsMyM6VA+44UzNRoR/eP9GG061u0qVAmCLg0z0/OF6DDyqSNF8AfmAQskiD1d6QlwbDHbu1btqpIk/3pgtOfbrABMI=
X-Received: by 2002:a05:6512:3612:b0:499:aea7:8bed with SMTP id
 f18-20020a056512361200b00499aea78bedmr10311214lfs.26.1664280603249; Tue, 27
 Sep 2022 05:10:03 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAO5Uq5TDQOobAdyLJHwkr-zvKn4RHgzR6OzHWg-y3b4zYVLyRQ@mail.gmail.com>
 <1716DE108727C541.27263@lists.openembedded.org>
In-Reply-To: <1716DE108727C541.27263@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Sep 2022 14:09:51 +0200
Message-ID: 
 <CANNYZj_VSw5xRPNAmvttwubXxmF2ADd=4jBeJVJkSvewbx17VA@mail.gmail.com>
Subject: Re: [OE-core] Upstream checks and github
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 12:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171099

Patches are now in oe-core list.

Alex

On Wed, 21 Sept 2022 at 13:54, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> I just checked. Github has moved the lists of 'release assets' such as
> tarballs into separate 'include urls':
> https://github.com/mesonbuild/meson/releases/expanded_assets/0.63.1
>
> but this can fortunately be fixed by tweaking the regex slightly:
>  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> -UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> +UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
>
> I suppose this should also be abstracted into a class, e.g.
> 'github-releases', I'll get to it after I'm back from holiday.
>
> Alex
>
> On Tue, 20 Sept 2022 at 19:07, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > It looks like something's changed in what github is returning on the
> > releases page which has broken `devtool latest-version` for recipes
> > which get their upstream data from that.
> >
> > --
> > Alex Kiernan
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170947): https://lists.openembedded.org/g/openembedded-core/message/170947
> Mute This Topic: https://lists.openembedded.org/mt/93808689/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

