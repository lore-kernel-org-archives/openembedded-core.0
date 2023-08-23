Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD56EEE49B4
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 12:04:36 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.9762.1692792268672930405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 05:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20221208.gappssmtp.com header.s=20221208 header.b=oh+RKAZq;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.208.47, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-529fb2c6583so5012246a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20221208.gappssmtp.com; s=20221208; t=1692792267; x=1693397067;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q3UoWQwdlaTIz45OY/yTNDZ38oqkeDSp1TacrZrx3Lc=;
        b=oh+RKAZqysa/ngHD99NabNSDz7/PLoKQts3574AbOl/KQCL21v7HqxCey3cy35E/QJ
         aahOs/viCyZrTmUBr+ZVdaB3QFVR2GeH1y8FbKWkX1iQUPA0zHBvsWK6n0fpzQifVkLz
         qQZRmeuUTr3jgpsdFf5+FA5H1wwo1yZgFAGpVxrs5Lq3Sqr0DbhZrPvcTdvRBczcajhC
         8Nn2TZ+UYtrX9t2uKP1I1tyA/Iia9KlRzv1O4TrcgApqDkviEKTSX95tnCN2fvfQ0GS2
         fwyGqbClGXDxUoWktpRGC6uAYIPxvMBDD6UzMD0KHLE8hn0i+QFoWRBpaFRNVkzGxAkh
         jXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692792267; x=1693397067;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3UoWQwdlaTIz45OY/yTNDZ38oqkeDSp1TacrZrx3Lc=;
        b=kS2wGbSNp3XuSC3O+LxXODzivN0rn9sgjO6V4L0M5KeH1PpnmASAqdVZlmHDox2LqN
         jxLP8P7fVS7bFXuKQ0TK+YiAHSgecmrcSRFq/Koq1ykuuPB6cdcWne2KYFsLxU4zLURX
         gTDwdXo6EoZe9vPTw57eg8Op+NLQU7GqUHlFjXy00aC+e85eVsWGJbOwqUayxBafawUy
         vQdqjty02h1C4NocQj+SHCSeJXfPhGZ71tSnFel5REEiWvjpDC82iXJnNpFLUtezrtPP
         0Hi3+GmzE2gxb6241r+BoVKJbZvcYHgWqsdv3BbE/2oqey7J3da2SdQNzEQxD5Y4KDZL
         yZQA==
X-Gm-Message-State: AOJu0YxsGHLkZxb+yrhpYDzCQwLuCfOIZzrSgm1raAU5hzOD5a285DS8
	Rrt77Fxm9FvWIANbHYh6H1gPNO+N8Ql+2wNYXJz5wg==
X-Google-Smtp-Source: AGHT+IFNoKTvHYLZgisPSn1puoYV+bWanAdH9sUYiuAAbfkInu9Lh2JKz3VS3/q07j59AWsGau3+yyWT9q2YkP1qMGU=
X-Received: by 2002:a17:907:7818:b0:99b:d178:f051 with SMTP id
 la24-20020a170907781800b0099bd178f051mr10132203ejc.64.1692792266623; Wed, 23
 Aug 2023 05:04:26 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Wed, 23 Aug 2023 14:04:00 +0200
Message-ID: <CAEt6Nwpy3-b0aMufb7pbTpJqQnXFe+egAUP6M2MMJmtMvWOp9A@mail.gmail.com>
Subject: CFP for YPS 2023.11 now open!
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bb1f18060395e93a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 12:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186573

--000000000000bb1f18060395e93a
Content-Type: text/plain; charset="UTF-8"

Its sunny, it is summer, you're just back from vacation? Nothing better to
get into the flow again than writing a proposal for the 2023.11 edition of
the Yocto Project Summit!

We love to hear about all your Yocto things. What you made, what you broke,
what you learned, what you created.

The CFP is open now at https://pretalx.com/yocto-project-summit-2023-11/cfp

Josef on behalf of the YPS organization team

--000000000000bb1f18060395e93a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Its sunny, it is summer, you&#39;re just back from vacatio=
n? Nothing better to get into the flow again than writing a proposal for th=
e 2023.11 edition of the Yocto Project Summit!<div><br>We love to hear abou=
t all your Yocto things. What you made, what you broke, what you learned, w=
hat you created.<br><br>The CFP is open now at <a href=3D"https://pretalx.c=
om/yocto-project-summit-2023-11/cfp">https://pretalx.com/yocto-project-summ=
it-2023-11/cfp</a><br><br><div>Josef on behalf of the YPS organization team=
</div></div></div>

--000000000000bb1f18060395e93a--

