Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3C4ECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 15:54:45 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.13453.1661874882388636267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 08:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CjN/rnNN;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id q7so16120651lfu.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=pTLqPfDDNtfIY0s3OFqcRVCbSx3buQ5mGrxVCUHNxQs=;
        b=CjN/rnNNqkhgmlokqXhoagqcJ4IHmHJDFsPcJNO+m+MYRMZ5QdGrilsaxXreD/7UXF
         Oh5itVIWmIxUp1bMtw//uTs9reT3c58ZJIQh5qgGnNtlbpO4OaGJVvdnFOzO2aICnAJi
         q9JsWbL86kCYoSt1P0kHcFRdgbjDutz41ANE/vIzaeIp4I5/V7ftVvQAaXV18prPNA5f
         saWFj1LtkyjcTy0R3bVb3WA0Siak4uILyRvncT1ER/3wriqb2Wxeg3XwXwsjsH+rE04A
         OT5tPiB7bSb28mstJ9+q2JLcFc0fCtDPjRfInGsQQmJM5oCSmwhjUpfPH1lAjQV409Vr
         nE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=pTLqPfDDNtfIY0s3OFqcRVCbSx3buQ5mGrxVCUHNxQs=;
        b=a7B+8SX01SRiJmOIATmjIuZtN4laQ9ac+TvqR9pPt3U11WP3X9kncBXM7+0Rt5r+em
         y0Zvz6HGKTMQNMGoilcj9w1Es+aKBi7ruwELp3olgU3BFktNfY8pMlmJnfl2w09VaFnn
         R8jXLOrM+gZv2Q9+DWoNPRlh+hWQD5/RBE4JQnqFloQFkGlqRThK5K8mlCn9fCNMTzJq
         WL/qXTaRXNBsVaI2S3mUezJM3vDuaiPILutfSllvwQSIBHlWJ/OzNLV/f7lniRGf7O8V
         /Ax5YbJAxHf+mpoaHyBv99mDM8ECV2V3NhExcIEACZEGcFJLd43kaGrYMwUogxnY96Jz
         scrg==
X-Gm-Message-State: ACgBeo3a+kdOh6LadFZtSFWew4sy9SmQ6Bgy9pQnmxupENnh4Qk01DnH
	+r/Yxsgl4zXM2w6qk4O9UKecgk2E4xtZjLbWmUQ=
X-Google-Smtp-Source: 
 AA6agR6sTTqNVfqAGbN7abDH5Uv8Nl6oqB+vgbiBUdWbGepwRmrLex7zOvrLjspJHuAYrfzOxV/JKlMMJB2D8rkLU68=
X-Received: by 2002:a05:6512:2511:b0:493:50c:ec3 with SMTP id
 be17-20020a056512251100b00493050c0ec3mr7685557lfb.665.1661874880244; Tue, 30
 Aug 2022 08:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <003301d8bc7f$c2feb310$48fc1930$@gmail.com>
In-Reply-To: <003301d8bc7f$c2feb310$48fc1930$@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Aug 2022 17:54:28 +0200
Message-ID: 
 <CANNYZj-NE9s+b9Yny9+5q6MFGY3fT5RpWX76Sx6p-yFRGty1tw@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 30 August 2022 (WW35)
To: Stephen Jolley <sjolley.yp.pm@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 15:54:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170075

On Tue, 30 Aug 2022 at 16:49, Stephen Jolley <sjolley.yp.pm@gmail.com> wrot=
e:
> layer setup changes didn=E2=80=99t test successfully

The latest patchset has no known issues.

> o    perl builds hanging indefinitely: https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D14902

I will look into this. Findings will go into the ticket.

Alex

