Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A828CD11DE
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:23 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.49254.1710951017567049026
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ig3vAtTc;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: joel.winarske@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e74aa08d15so55604b3a.1
        for <Openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710951016; x=1711555816; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CAjBYrH/fgWijAQQLDTC+ivN10C355Q5QJougCCuJ6Y=;
        b=Ig3vAtTci8GRlYXI97Hz0bLzM40HTyYmpN7A02SmKVEv5FkV9znF7qFFveHjtgT/Af
         r+rvRbnoHT8v1dab7W0uflEtMK/YKhIVj/tsr4NJZYb3q0LxbpnOvtO1o78Q2aTkvOzE
         K8Wz68V1hlIUSckgxsqTRVtk9koIbVR3GkG7gbNmj+FIiNqgLceE6AJT58mr4lW7keyq
         /xPD7bYCtde6PpoI8QD/ZThPGKP2zf3n42jwABKOb4y97J8VbKGLVfzIayMVhN/bNNMY
         3h7uk90iz+0qunmWoUkfrRn2li9ybcPzBuCX95IyKFGltMceoZtEllDNcYcX8t+7848U
         B23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951016; x=1711555816;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CAjBYrH/fgWijAQQLDTC+ivN10C355Q5QJougCCuJ6Y=;
        b=gwB8iK9f6XtatSmfw+QA4U22WFnotVkyckl9+ECUq9q+JJkJPqhej9p5DNiI04QgSd
         ymLHTYDb2w4mvZYt/O7ff8HZZHR6SLLdi1z8QvM4n7PvaZT5mvZUlb7PY9FWpAIO/ixc
         oElaLGw+QxE1fwcjkBj9L+BM7cFtgHgcOLiSNizIyCepX4oeCaLiOXJl95xqCc0j+xAT
         v3KZEXpZq5Vlbmt3tKmSIxU1zM42b+gJSUCoGzfT6jG1hko5UV4BPvGIKJrXsnsHU1/K
         e9fziM7PLfHWkVMlsbdqnVsiqp1JSSvYH2tsTh4+a9+M2maGqT0kpoVUSJU4DjLwCmYf
         yqHg==
X-Gm-Message-State: AOJu0YwRWX0Z4u5CP7uK+lRnDGjnlrX7H17yx5CC9KbDeuLSiuDROI0T
	J6aJv9zwNPwZa6439Rg8Z0Sz6xB7XhoHFqfCvvKmfGCQeYWlvS4P23WQmrDnml/cPuXnH7tRonH
	qWUhz1fX18kwK77hXzxiSBZj5qq1+1UbY/yBeVw==
X-Google-Smtp-Source: AGHT+IHyxv0n5+Fu2nmrnuTzJxq0rzVb0bhuShHUw8BG0FusQDwFPSTb3I80I9j5ZfLAOxji7bZKdqsCC+2Tve9cFS8=
X-Received: by 2002:a17:90a:c212:b0:29b:ab13:5c2b with SMTP id
 e18-20020a17090ac21200b0029bab135c2bmr5812621pjt.20.1710951016395; Wed, 20
 Mar 2024 09:10:16 -0700 (PDT)
MIME-Version: 1.0
From: Joel Winarske <joel.winarske@gmail.com>
Date: Wed, 20 Mar 2024 09:10:05 -0700
Message-ID: <CABKMkPKN__Jh6jvc_CfHtwp3HGbRsBJ3YxHxGb1RPPN2WWqRMw@mail.gmail.com>
Subject: [master] riscv: libcamera stack smashing detected
To: OE-core <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008f7c94061419d378"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197371

--0000000000008f7c94061419d378
Content-Type: text/plain; charset="UTF-8"

In master there is a problem running the libcamera "cam" app on a RISC-V
device:

*** stack smashing detected ***: terminated

If I remove the patches in the libcamera recipe, it builds and runs on
target without issue.

libcamera bug has the details:
https://bugs.libcamera.org/show_bug.cgi?id=214

Joel

--0000000000008f7c94061419d378
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In master there is a problem running the libcamera &q=
uot;cam&quot; app on a RISC-V device:<br><pre class=3D"gmail-bz_comment_tex=
t" id=3D"gmail-comment_text_0">*** stack smashing detected ***: terminated<=
/pre></div><div><div>If I remove the patches in the libcamera recipe, it bu=
ilds and runs on target without issue.<br></div><div><br></div>libcamera bu=
g has the details:<br></div><div><a href=3D"https://bugs.libcamera.org/show=
_bug.cgi?id=3D214">https://bugs.libcamera.org/show_bug.cgi?id=3D214</a></di=
v><div><br></div>Joel<br></div>

--0000000000008f7c94061419d378--

