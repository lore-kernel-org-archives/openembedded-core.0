Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C99C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 12:07:36 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.4013.1652875655881510271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 05:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ghx/fDlQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id p22so3208628lfo.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W0p3GJURCqVubKlaR/ApOM53oRE7WT9vOPSCyjcJBXM=;
        b=ghx/fDlQi44FpwGzf9uWCJKEIjYeyG2vDPKA/8vegWPjW5zJJTjDRZ3yZC7SRW9ECS
         HqJa3/XylIpUjbUEmYEyyRrwaCP9LukMjnJOVDJwXxEiBKxfxoZkno4QW5a0ZzypGqYe
         8HPM4QvpJ2KvVvh/VK8mAVwpT/hz2nLoHgRsYxuutbpWGIQsBX5IwecOBysIgzTIN/AA
         to/Hk/2bMBcOUF3Gn44/ePHqeLjAQotjFnisrdMqAglHakZQ+b1A95jYB2gv7fodNUMu
         3HILgaQeQtw/6VlkxBYY2IOdqFhmIr7n3Ij7UrRb/EvrojwoKZpwibdsF9vU3Dv/wfCO
         jpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W0p3GJURCqVubKlaR/ApOM53oRE7WT9vOPSCyjcJBXM=;
        b=zCX1EwyL0LDteGpc+aBl88BcSuJBm5EcoFbNPGqaUn4qEtQiQMq+z4Kl0TOuO2grjx
         gr+NYQKfgZu9QxRF98NAc0U1Pbym2g79oDdUQHd2cG9ouj6gCkXMypQu5OO4FieRGHHx
         OlVPw6dzrvfJBm6WqIw6YexI1Ag1Uk05pWMTPv4nPKTueMAu0KRsq7FQCNUEv3dXvK9M
         q20FjTBcSVhkR6JWZvRrE842SeMbiYuUm9wyJvFuB5XfP6XVveS+eMGAsNTVlBWbur9o
         QIk9X2SyfwtZxUvpXmMMO1W4Nw2O+aYaq5B/fuOQnkp5l+0l3ZJ+1UhzDMnsaf2zwMrH
         tB5A==
X-Gm-Message-State: AOAM533xI5nC8BG4MvbOlByGTVnPJGIcdnrlNchqbcvo4wsokh+J1Zqw
	KTI4HaDSjuENmuIQ/T04vFmsy8RlEHgMTQBXrOQ=
X-Google-Smtp-Source: 
 ABdhPJxN9V/+IXjnsyr7HIggLppLmYfrKtOqhqZrZBNQgUbykZ9ttyWbo+XqzT1bkAbG2WXYnOXPEWDAGZ9X9QhGMLA=
X-Received: by 2002:ac2:5b1e:0:b0:472:2c9f:5891 with SMTP id
 v30-20020ac25b1e000000b004722c9f5891mr19949298lfn.534.1652875653930; Wed, 18
 May 2022 05:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <6ldv.1652875317100283313.cW0Y@lists.openembedded.org>
In-Reply-To: <6ldv.1652875317100283313.cW0Y@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 May 2022 14:07:22 +0200
Message-ID: 
 <CANNYZj_TeF-Jt+yrsFjXV2TdCfjrkpvPUguVraUbAQgODU-+kg@mail.gmail.com>
Subject: Re: [OE-core] Wiki re submitting patches
To: mangodan2003@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 12:07:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165849

Both methods actually need some way to send email. So you need to
create an app-specific google password for that purpose, as suggested
in 'man git-send-email:
"       If you have multi-factor authentication set up on your Gmail
account, you will need to generate an app-specific password for use
with git send-email. Visit
https://security.google.com/settings/security/apppasswords to create
       it.
"

Alex

On Wed, 18 May 2022 at 14:01, <mangodan2003@gmail.com> wrote:
>
> Is this page still relevant?
>
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> I have just tried to submit a patch via both the email and git methods an=
d both fail. Google blocks the script when trying the email method saying i=
t is not secure and when trying the git method I get a timeout from the scr=
ipt for github, tho I can access github just fine in my browser.
>
> dan@melon ~/workspace_ssd/kas/openembedded-core $ ./scripts/create-pull-r=
equest -u git@github.com:mangodan2003/openembedded-core.git
> NOTE: Assuming remote branch 'gst-1.20.2', use -b to override.
> NOTE: Assuming local branch HEAD, use -l to override.
> fatal: unable to connect to github.com:
> github.com[0: 140.82.121.4]: errno=3DConnection timed out
>
> warn: No match for commit 38b9d17c45c15087d484559595b04c7b61fd8fbb found =
at git://github.com/mangodan2003/openembedded-core
> warn: Are you sure you pushed 'gst-1.20.2' there?
> ERROR: git request-pull reported an error
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165848): https://lists.openembedded.org/g/openembedde=
d-core/message/165848
> Mute This Topic: https://lists.openembedded.org/mt/91184410/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

