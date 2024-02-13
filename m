Return-Path: <padalkards17082001@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0E9C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 07:39:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.6804.1707809940477325107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 23:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJc9FpFR;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: padalkards17082001@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56002e7118dso730735a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 23:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707809938; x=1708414738; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bi6TcMd0X8djd1XmJ+m+kpsiagUD71IMz+4SgcRKLLE=;
        b=kJc9FpFRFF0lA4Lrp0UPto5Mf4l2HLYlAFrr/AnsQ9QGMuR4xBLzvxxyDfogKiBPWO
         GpU/5B3lNILpUe6zvyM7FTsdILG084Reiq7s9mGQN+oiDIRAIztGCJEcLf64V00Kq+kg
         O+5V2Obm9D22oad3lK2arn9OjOQHWU+liC0UACNH85TpYfN+mNvGHA9h/3uu2u43kF8b
         VfASY2SNrPp9CL1EQXzz4wVVx0WA30cWWZsdERfc9SDTtMcBObXYwXo5RDSVQDbnMjZs
         4uoj/mk4BbclZWosQeLIPleoDWzHM8z3sMqkWs6Cfu7LnQ6KtHnQKIM/XCi6VHCUko8u
         sXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707809938; x=1708414738;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bi6TcMd0X8djd1XmJ+m+kpsiagUD71IMz+4SgcRKLLE=;
        b=Cj/zOFTkyKP3hT46c3KxnatVPxeqRdnnf39pIB2oif0q5azJ16ZvTK/IT+cMqNUbEz
         YoqlDezYBb0e9H7JVptrsOpioHD6KfmaXUXPR1I9Sy5KCleEg+GXxVuSKc5+psbYfabk
         AU69ya6tsFQxNCWTZVxmCH+8e0h2RqW/gvCVCmKZG7GbpXD0etKtpAuQGr9Vj/CoGP+D
         sehZnrrgQxING0w27XwdzMEvzAUxXXqwQPCJAMa3uVbgA7h9IPEuD938yBQkv9JAy+Sr
         8jOQbJOgA3XovKngFxj7DTHwiwLGu2kHVFgDVPlQRccM37/I+p+fm6v5W6jV7ZjAWT4q
         GOvQ==
X-Gm-Message-State: AOJu0YztbdH0biTFQi077lTCehjQ/hrW/51sgYttBwCVkp4Xp8pyPAyl
	36Rws/5yea4Xm9soxB4XQmz1kf/f3bWhBixZAzf/De5i+eYOxpCxEIjboFIHR8z2C67VvMjIixx
	7/SjTqqJ8Pip4vSwdPv3wV+4gmd94OmAGQD67Jg==
X-Google-Smtp-Source: AGHT+IGkbSZrXqAuATiAsamzRnTPKWyk2AieWuSwxcZsVqtf/26fHqBud1/7j4/Ycc6yEqRJBDfxLBkDl77W3RJhtk8=
X-Received: by 2002:a17:906:b888:b0:a3c:bfcd:bd74 with SMTP id
 hb8-20020a170906b88800b00a3cbfcdbd74mr2753475ejb.76.1707809937956; Mon, 12
 Feb 2024 23:38:57 -0800 (PST)
MIME-Version: 1.0
From: Dnyandev Padalkar <padalkards17082001@gmail.com>
Date: Tue, 13 Feb 2024 13:08:46 +0530
Message-ID: <CAMqbpQJgABOp6XCiLg74QyVY=5wjU4wW_BC52-kJS4A=iC34Hw@mail.gmail.com>
Subject: Want to contribute in open source project
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b2247606113e7c13"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 07:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195368

--000000000000b2247606113e7c13
Content-Type: text/plain; charset="UTF-8"

Hi,
Want to subscribe to this group so I can contribute in open source project

--000000000000b2247606113e7c13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,=C2=A0<div dir=3D"auto">Want to subscribe to this group so I can contrib=
ute in open source project</div>

--000000000000b2247606113e7c13--

