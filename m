Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28035EDEC79
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 15:30:10 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.1640.1694619008541921569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 08:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=R01cYoXW;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.218.51, mailfrom: jester@theyoctojester.info)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99c93638322so240984366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1694619007; x=1695223807; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6uNq0tSrIdlNJFlEX+ykup3oOGkTatya0fN05NpeQu8=;
        b=R01cYoXW0dFicRlTeNK3185RaePQmRXd5sOSYk5ynUUPi8L3rNZqqeezkj5vf/HqlM
         zxi7BOevli30s9d8hh8h06rOXKeL77Om+EVtFB6shVpafqtcyFVfdSClMO4UkYIneg2e
         ZOn8BKRGd452jcwob+OkMfz0o7zh/Zjno6qv51L7vHoPLNWr7ejSP9Sqa4XX0BM6tjuv
         IakCN7pK6pJf/1tMT7lAZtOe3q5CvoYYnuvCoYI4JoUFY9YSOfqsY0atn80laeMv2BvO
         BY4ytFeKS2HIml9hmPqZlsfRp5Vab17DhVchCtQNpGTDD4NITMlPTzYgcpbaf7DyZaAn
         Iz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694619007; x=1695223807;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uNq0tSrIdlNJFlEX+ykup3oOGkTatya0fN05NpeQu8=;
        b=ZNZuP1ddugHXwSbYdsxOvHdYgLu6klKu16OlwTBdV8Nzhhs1tjiW33ZX0k2iG3w8tk
         sx9GzjRoQbPGEHGLYOwfpmYW8VztR/OFlmoehru3tF9TihnR7FAdoKwDKY7d583eUiih
         X9RzDm+IhrkEVEo8eotxrRtCJu/vfCwmrvY0DtMqhV/iM3KMohYBHZLgRJ9MKJHoSThg
         G1w3kHcJk/cdU+j0zAdjyQt6J1+aPpWf32KVSnVZin9LKXdCiktyCR808HonrskfEDBM
         0mZVeWASrTjDWIVyPFJWnwhuDlHE7g3nAmpzuTuJxF0UoYVAXV1yteUE8LGJ/MBFTaBY
         hyeg==
X-Gm-Message-State: AOJu0YxYYsiFgkUMKh28tqrQ5VG3IhlzOlgUhR1zYk3aBgJO7hrikTh6
	Nbf0R+bJApEpMdh0j1OPJu4Nep4m4k+0MI2+BhS7jw==
X-Google-Smtp-Source: AGHT+IEt+1lixjQ+0HziwyrZjRB6GuT5GaeItgK31LYaCQW58pdCyEmSwZaRLwoJMxqdqmby0I09hwkGcUSshLSY0dI=
X-Received: by 2002:a17:906:cc0d:b0:9a2:86a:f9c0 with SMTP id
 ml13-20020a170906cc0d00b009a2086af9c0mr4449130ejb.1.1694619006526; Wed, 13
 Sep 2023 08:30:06 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Wed, 13 Sep 2023 17:29:40 +0200
Message-ID: <CAEt6Nwr7kzVktRnNM3TxfaNxNyrPzOC7URuTvsw7e2svH=GEFw@mail.gmail.com>
Subject: The YPS 2023.11 CFP is waiting for you!
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e9faed06053f3bbf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 15:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187607

--000000000000e9faed06053f3bbf
Content-Type: text/plain; charset="UTF-8"

Summer vacation is over, so what is the next thing to focus on? Sharing
your The Yocto Project, A Linux Foundation Project Kung-Fu, war stories,
use cases...

And the best place to do so is the Yocto Project Summit 2023.11 - the CFP
is already open. We are eager to read your submissions!

https://summit.yoctoproject.org/yocto-project-summit-2023-11/cfp

Deadline is by Monday, October 2nd 2023

Josef
on behalf of the YPS organization committee

--000000000000e9faed06053f3bbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Summer vacation is over, so what is the next thing to focu=
s on? Sharing your The Yocto Project, A Linux Foundation Project Kung-Fu, w=
ar stories, use cases...<br><br>And the best place to do so is the Yocto Pr=
oject Summit 2023.11 - the CFP is already open. We are eager to read your s=
ubmissions!<br><br><a href=3D"https://summit.yoctoproject.org/yocto-project=
-summit-2023-11/cfp">https://summit.yoctoproject.org/yocto-project-summit-2=
023-11/cfp</a><br><br>Deadline is by Monday, October 2nd 2023 <br><br>Josef=
<div>on behalf of the YPS organization committee</div></div>

--000000000000e9faed06053f3bbf--

