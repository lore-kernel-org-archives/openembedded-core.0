Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A113CCA482
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 08:42:58 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.6903.1657615376899236351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e8wgaiIl;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id bn33so9037915ljb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xxrGOofkF8vqLrJNd0DEA5PK4AZFzx7KVbkC5beuWKg=;
        b=e8wgaiIlvAnh50CuwRp9eeBgcI+lRLFtLlNtBbMmvoUssIRZsYghwweFxTugDcQHsq
         SiiLBAk8STgi9CHr6r9Fqs7ZEjSdobfC5lBTv0/VH8wQ2Q3sZY+3OeTh+fAvlk5Kf9Ih
         IhWP9MEpVxWFpShKNsajxe4goLgR8KOQZ+xnGvLbis/v146iFRzw//eXZyUgKLKKGiJH
         nMLcas9tjvG7gdEULExLTNjTZR19RXxnzqneMftf2iBDG4dz56uIYg3Tx+lW8crC+Ek5
         r+Fm9NqXTnrCFjUGMkd8c58/bU1UmNi+PnXoAyJ2oyZyizeJhtzON7SYVRSU3o69nfX1
         NiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xxrGOofkF8vqLrJNd0DEA5PK4AZFzx7KVbkC5beuWKg=;
        b=EiUhB7ntWac9CVPjreZtLaPEUU0WKJ3J//27D6ZE7J2AHeFYw+SXZYhY+Qw7EUjieh
         PEttNq8baTE5YN5YsVvvK5UC9uVZWpgIejinsUqZpPClq/svULXf1ktsG3qQ2/FubBC0
         +LalUEFH6vKxI/JB9hL0QW5oQe/+edCXpbLh2dZhFc5WID9Vr6RzB8SDKj00Bi6bi7q/
         h+JsM3fjzj/KbPgTkLV1u2ADayZ9xhiIlvNM9fpcoy8M/rfAlCKZF7+0aE9ZM4PNX/GP
         Kz3tZMUzk2O21bDb1ePMW4AB5tcJlYth2LMIwEit4K26qYqMywNJ4cL8fJ9UPawt6AjU
         CvXw==
X-Gm-Message-State: AJIora+BBkeMmJq2gjVlbI+ySnDkLpomOtsRwxr8sSAqd62wmMVtZHm2
	yfajSGKrD9ty+8PVXLMnzIrzCo4s8bw6/XAJ0+M=
X-Google-Smtp-Source: 
 AGRyM1sB8gX6d2U4kPXYKwwCOuDEzotHMDF24ZsgE0CCP5zdHjDCgwd8WJt8xbUYQ1EX8KUztQIPFFaMSm/lz7AfGWg=
X-Received: by 2002:a2e:b7d5:0:b0:25d:5320:ebad with SMTP id
 p21-20020a2eb7d5000000b0025d5320ebadmr12029962ljo.56.1657615375116; Tue, 12
 Jul 2022 01:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
In-Reply-To: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Jul 2022 10:42:44 +0200
Message-ID: 
 <CANNYZj-t3jAs=uqb5FiZnYEygvgcbKwmEjy7iOhbTPHskuzFwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] devtool fixes
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 08:42:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167915

Thanks Paul, this was one of the most annoying shortcomings of devtool.

Alex

On Tue, 12 Jul 2022 at 06:07, Paul Eggleton
<paul.eggleton@linux.microsoft.com> wrote:
>
> A few fixes for devtool, mostly relating to recipes that fetch from git
> where S points to a subdirectory of the repo.
>
> Note: I wasn't 100% sure if it was appropriate to be referencing WORKDIR
> in patch.py; let me know if I should try to rework that.
>
>
> The following changes since commit db28cd0e1540e44db963108430205c8c0c817774:
>
>   gperf: Switch to upstream patch (2022-07-09 20:58:31 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib paule/devtool37-oe
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool37-oe
>
> Paul Eggleton (4):
>   patch: handle if S points to a subdirectory of a git repo
>   devtool: finish: handle patching when S points to subdir of a git repo
>   devtool: ignore pn- overrides when determining SRC_URI overrides
>   oe-selftest: devtool: test modify git recipe building from a subdir
>
>  meta/lib/oe/patch.py                    |  8 +++---
>  meta/lib/oe/recipeutils.py              |  9 ++++--
>  meta/lib/oeqa/selftest/cases/devtool.py | 51 +++++++++++++++++++++++++++++++++
>  scripts/lib/devtool/standard.py         | 29 ++++++++++++++-----
>  4 files changed, 84 insertions(+), 13 deletions(-)
>
> --
> 1.8.3.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167889): https://lists.openembedded.org/g/openembedded-core/message/167889
> Mute This Topic: https://lists.openembedded.org/mt/92326549/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

