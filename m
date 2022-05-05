Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE34C433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 20:03:10 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.1384.1651780985430463421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 13:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20210112.gappssmtp.com
 header.s=20210112 header.b=MP33By30;
 spf=none, err=permanent DNS error (domain: theyoctojester.info,
 ip: 209.85.167.44, mailfrom: jester@theyoctojester.info)
Received: by mail-lf1-f44.google.com with SMTP id d15so722310lfk.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 13:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=i/DsmikAqm3Am1WxZmFfMVhprng8W9HLFHgozuGDcwA=;
        b=MP33By30Rf+4fNd6C8CQZmtMmDLS3UgTPngDZPx6bYZ7Fe2ATunGsIBtawfF+/2XEa
         zAW3MoaFXEcsayR2Ad00QzR/nEy9/yFR9TnsGf+Hmu/bC5f5TMCBA7Eg3QXBEZ7NxoQz
         d2po4W88or2FJ4MZl0rt1GQonsrK1tsqQx+c0Mf4SzbSsEDlFsiqBuPxeXRJSBNxHtAC
         CEfkwFe8qaq0AgLnrj7OpyhHGD3jryXL6I8s4NEa6GLyFCGyMzy9oM3Ro17d4TqJC8fX
         5gV08A+5BfbIfIvdJIxd5t8FaSjpyYbkcIo4TvXVvI0slD/Fc+ZJ3RHP6NV4+B5GkTUg
         p0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=i/DsmikAqm3Am1WxZmFfMVhprng8W9HLFHgozuGDcwA=;
        b=UnMPNw+hd7PUlQxhhOi88ciCrMOVZMh9WKOQI798EQXoNK/hEQLUfYaEuMl8YG0Qei
         49/2OcnXWw9sVvdrBYKtIL9LdwxbzCBNJI00xWu/71UA6bN4SlQCwIRYkZ1t4S/CqnaO
         5gQ+H5XQ7vXbPGk0Li80q9qQSfkJHFBC3i9RG3Glp43MzJAEHTgrbMxHnViVCGLE9hF8
         aP+NzgHLj8AwpnZoDrB2KMzlXQ60Lnhq6ZdMbFNcHRH7eBD0CpQTYgRkW31qGwENeUC0
         ZWrbTbXtZdUMm6ZEWRZEofI7/t2j9YeEoT6tGOB2w7464t0i5jV6nfIaUYBYg9jjM+jI
         gGpw==
X-Gm-Message-State: AOAM532gwWNU6wWrbSb0Dj/s44sKb9kSY/fkNcVb3tyRWataDfLM1b3j
	1JRpfLPiPqX2aIOXxRDXzyO2OpAWJ+v8I+vXwt7SPE0p0YtDFQ==
X-Google-Smtp-Source: 
 ABdhPJwZ3HdISYh6ggvoOXW/CS3N1ScGVAUeB7VR3SpwS7nYReq6VOVIxDrQYqBlGVfV7IaxR+tUQfOcD/QFzQC+jwY=
X-Received: by 2002:a05:6512:322a:b0:472:7d2:1114 with SMTP id
 f10-20020a056512322a00b0047207d21114mr6680lfe.105.1651780983459; Thu, 05 May
 2022 13:03:03 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 5 May 2022 22:02:37 +0200
Message-ID: 
 <CAEt6NwqjJEPLbo289eLzRq9541cvDiutGTKdbmOrE-vOtinR+A@mail.gmail.com>
Subject: OEDvM 2022.05
To: openembedded-core@lists.openembedded.org,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Cc: board <board@openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 20:03:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165311

There will be an OpenEmbedded Developer Virtual Meeting (OEDVM) held
on Friday, 20 May 2022.  This will be the day after the Yocto
Project=C2=AE Summit 2022.05 concludes.  The scheduled time will match the
YP Summit's start at 12 UTC/7AM Eastern, and run until 20 UTC/3PM (or
earlier if we run out of topics, but then will most likely turn into a
happy hour).

The event has been added to the OE Calendar
https://www.openembedded.org/wiki/Calendar

We have added some topics that should be interesting to the larger audience=
 at:
https://www.openembedded.org/wiki/OEDVM_2022_05

We are looking for "moderators" for the currently listed topics.  This
entails helping to get the discussion started by presenting 1-5 slides
on the topic and problems currently being experienced.

If you do not see something listed you would like to discuss, please
add it and put yourself as the "moderator" (and a rough time estimate
for discussion).

As always, if you are not an OpenEmbedded Member (but are interested
in joining), please attend OEDVM and you can be voted in.

If there are any questions, please feel free to email me and/or the
entire OE board (board@openembedded.org).

Josef, on behalf of the OpenEmbedded Board

