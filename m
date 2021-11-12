Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A5EC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 16:11:49 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web12.17735.1636733508862528617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 08:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kts4UTQ7;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id p37so18161653uae.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 08:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=oMs6RhBMUJH7iifMibWW+Bu/lnRBt0kTP0YX3TiwACs=;
        b=Kts4UTQ76QSejffIGB0wN4SG6w+j+vRtYKbpK4g2ua2CUpK78hs7vWh83AjPGMxZ1t
         0qw0GuEMxGTmINBM+zWk4aYoPkc6JGls/TdsTtCzUgBdhCyYVU5MO6qFU0665tM2o1O2
         rLmxijiUGV8ExWEEuHyuLvhLVudiFXiGVpuyxb1DNU14WA6N/5ciDut1JVG89EzNaFbO
         FNbH6elikxwmSM0oc9q1IJIg08GMXBVAtFKHu3ygyZ3F/FuJOJ+AYK1CDBlHg8uYQIii
         v3W/zfFBtIMlvMrndyFPxDoJm9QobOfih1A35PrmJ0dkJg7Oa1GbEpaDHGzs7wsCpawt
         EqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oMs6RhBMUJH7iifMibWW+Bu/lnRBt0kTP0YX3TiwACs=;
        b=SxVlIEa/7OuUs5L60rm3fvx2kWssyjmLyu/N2RtQ3hAojPqDQYtZEZkyx+jbv6znJ/
         DSmw8AtPvhbCYXDrpbeN3GS00X9u0h84MXnxBTYy9sIqEUkJv0QUQOfAFgZp0zKxNs0u
         BKnJEnbaFo2CUHZfCyvHYfB7bp2NB2gEiYhturIVPt8QTWjsl3lcaNOKYifK6cW2Ncdr
         y0aiNOylf4NrCEHnGmUPraaYdUaqxz3TNqqkdr+NPw+F4a2/9iLKU4RLJ9RBGwTXnYBf
         hzY8hSO3xPT90Oecwq3Xqr9ZSuWELbS3OG9mI9v4YNF+aLrGVBjD8dKu29OaKdkLZja/
         NzDQ==
X-Gm-Message-State: AOAM5315tjsvahJw5lYXHRhTuo2OsMlG2YVnv81xWnQVPFqH7CUJZ+Cm
	EDXvhgYSfnh51bgbcFSEIR+mufur8c6UPE8Xy6YoT7EHmbU=
X-Google-Smtp-Source: 
 ABdhPJw68egQkFcuXMnDUEv5Zk4gutyB5WfiRRPvPpAI+HLHUfV/7lUpp7JuwDmFqi3BgjlqG6eRe/L0abtQKJmrMqE=
X-Received: by 2002:a67:ae47:: with SMTP id u7mr11777946vsh.7.1636733507915;
 Fri, 12 Nov 2021 08:11:47 -0800 (PST)
MIME-Version: 1.0
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Nov 2021 17:11:37 +0100
Message-ID: 
 <CANNYZj9wM6ECR7GeGqyQrLCOhHWEcjr_DFrWcBjjWWP4LK2FHw@mail.gmail.com>
Subject: logrotate patch - please rework and re-submit upstream (link to
 upstream review included)
To: Robert Yang <liezhi.yang@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000054d21a05d099b78c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 16:11:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158226

--00000000000054d21a05d099b78c
Content-Type: text/plain; charset="UTF-8"

Hello Robert,

I submitted act-as-mv-when-rotate.patch from logrotate upstream, and they
requested significant changes:
https://github.com/logrotate/logrotate/pull/429

I'm afraid that is beyond what I can do, so I'm going to close the
submission, mark the current patch as Inappropriate [link to review] and I
request that you rework the patch and resubmit it.

Please note that invasive changes like that are always at risk of being
dropped on version upgrades; submission to upstream first guarantees that's
not going to happen.

Alex

--00000000000054d21a05d099b78c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Robert,</div><div><br></div><div>I submitted ac=
t-as-mv-when-rotate.patch from logrotate upstream, and they requested signi=
ficant changes:</div><div><a href=3D"https://github.com/logrotate/logrotate=
/pull/429">https://github.com/logrotate/logrotate/pull/429</a></div><div><b=
r></div><div>I&#39;m afraid that is beyond what I can do, so I&#39;m going =
to close the submission, mark the current patch as Inappropriate [link to r=
eview] and I request that you rework the patch and resubmit it. <br></div><=
div><br></div><div>Please note that invasive changes like that are always a=
t risk of being dropped on version upgrades; submission to upstream first g=
uarantees that&#39;s not going to happen.</div><div><br></div><div>Alex<br>=
</div></div>

--00000000000054d21a05d099b78c--

