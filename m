Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B69E71D47
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:02:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.19782.1695999725110890352
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 08:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=lCW8OSDU;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.218.43, mailfrom: jester@theyoctojester.info)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9a64619d8fbso1942399666b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1695999723; x=1696604523; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BdwrQlTuOb8F4lf3fkeLYTdpeOkE1WDGQgVtyQUKdZo=;
        b=lCW8OSDUY9SPjkeX428SLTGqhV4ZEFVgGU5g4nn3i0BuBntuVA7RBPaAoPlx5LTB1B
         plupXkBgYcZq0p9f7rZq7DaO1lt/W2CVb0y1HfTXvwiEBTxkUmVf2zi21x/BlEK5EPxa
         qApytXKE5N2ylQy0GPMlwv6i5lbggMXZEL2CnH4wIJPYzHljjEIdaLO8Tbi34PHu2lo3
         kmY1tozAGBbpM/Dt96rw8gALlvzeHg36Rv7BBCnAIgnrADN2vWzVMRikSJUN0Vst1O75
         +xTG3w/QLioaAezGoRVNlMMafBadenb9o0hTSsp3ZxBVKtK06Zl8RuLu5FYi1DszDilP
         t6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695999723; x=1696604523;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdwrQlTuOb8F4lf3fkeLYTdpeOkE1WDGQgVtyQUKdZo=;
        b=FS0481hspXGz4V+eY7pXrpO3ah1BGak8hs652kMYsg8o1wNMCYHWBluG3kkqBHvbZ9
         StpyQA8xh1ZVHYyKufJkTqU9EWzx7GIyVH0RIKbx7WXLvezdjE3V05ueo/z7s7PNnsii
         PlDglZ8LvySNSNbtr7SFLOO0FBMFmp/omAZrQCmvsw7M6AzA5BMVXUIpNaFGN3BMzKEa
         v+WG33a/SO4FHdSzH3SRAUs1fYGQyXA1VcgBFASYECZlWEMxi5QGaN8Qy2iouF6+ttmj
         3nwQl/K0kBFxg5+brKzTwh+SggndW3pt/QAFlHh7tFSw6rgkfqFOSPWM82ON/SXgybd2
         rVZQ==
X-Gm-Message-State: AOJu0Yw1DDyBt53oE0T9TdDEhUri6MJzZjjvl96YKluUPy8u6t3KO9/U
	tdJ6ZdS2ccSW4Vy1iCdirOa7hvCaNMBi475KisNDmA==
X-Google-Smtp-Source: AGHT+IGNhOUDDwUAo0YxGSBbQ8skUjOk0ZoJPD5Kw2A6ruqbmLoAs+NEHyEA92SN5tCJlv3ahR+DARMVCmSldR0+CBE=
X-Received: by 2002:a17:906:108f:b0:9b2:b71f:83af with SMTP id
 u15-20020a170906108f00b009b2b71f83afmr4218132eju.20.1695999723031; Fri, 29
 Sep 2023 08:02:03 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 29 Sep 2023 17:01:37 +0200
Message-ID: <CAEt6NwoJUjoLFKhXsDWp53qh9Wm2YZAB9YHVZrGGAL+1goxKCg@mail.gmail.com>
Subject: Yocto Project Summit CFP closes Monday, October 2nd
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000007e74c060680b50f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 15:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188408

--00000000000007e74c060680b50f
Content-Type: text/plain; charset="UTF-8"

The countdown is ticking! At the moment the CFP for the Yocto Project
Summit 2023.11 is still open, but will close on Monday, October 2nd, 2023.
So made sure to submit this weekend!

https://summit.yoctoproject.org/yocto-project-summit-2023-11/cfp

--00000000000007e74c060680b50f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The countdown is ticking! At the moment the CFP for the Yo=
cto Project Summit 2023.11 is still open, but will close on Monday, October=
 2nd, 2023. So made sure to submit this weekend!<br><br><a href=3D"https://=
summit.yoctoproject.org/yocto-project-summit-2023-11/cfp">https://summit.yo=
ctoproject.org/yocto-project-summit-2023-11/cfp</a><br></div>

--00000000000007e74c060680b50f--

