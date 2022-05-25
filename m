Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4E6C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 21:10:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.12264.1653513009507857114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 14:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oylXdaFs;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id j25so7308961wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 14:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Y1iWlq7DtPYzwcpEjR9BVRx2SUJ4mQ+qHM8T7RkxBM=;
        b=oylXdaFsbK/0FgN8WhD5EGwdo9/y/kmA271l2O6USfFtizfnOEOYw/Vb1zl5A+mbM0
         ZkxMl51KRKukB3QSRX/guhTKUXiG4iOqXWNAmHTA9VVgyZwLfS2FMz3vJABTbyZXANmF
         24Qc78T99nTOQ7w8wRcTw0vSMLw6uIcINTCyTBfVljwnZkY2i1f7IVY14j2F8BFGWs84
         mE5lbBnEPDTDlE+tXz5/1LeacuQ7m7Ec4+veoUIviQ8gRZUjBV1iONi6BpgByAIWtY+P
         0Cjqc15fC8YPRlKQriWRLdfEkIfinXTNyhpsr92vYY9OBfGpehXSCTFOkYCZc7S2C49/
         FeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Y1iWlq7DtPYzwcpEjR9BVRx2SUJ4mQ+qHM8T7RkxBM=;
        b=kY9uGOiJScvw31X+JEj/8xQDUECdypKOISgV/2wvUceKbLV7BTc0Zd+v283AvY3VjN
         GuSLfE7PgddqgZXlMZD1l3Tr/NA65yr4wbDkxUh8OF++2x8N7XfymMa7Tm5IdRKb7Hcx
         7L68E5/vmuZL2H953sYFkMBFxdpVY4FdkJ+CYxUzggQu/g0cXuziwlvi3o8scVpROI7f
         eDymh/OKhWDhbyUJm4gtbXH06+jtE1sXiy5WibUXG+hitOLgHhfYQaonFqKscvFSgmPa
         q1HcK9VMAKtk1Stt111jV4wtJCFZvBoHqCPq2GN87idCjnNMikMi5z6/cY/Iy15mhJz1
         13Hw==
X-Gm-Message-State: AOAM530/v1NdEFGdOnrTVfobNYEa/rC/oCBXZxkWBtPQ4Op5w9VyMZd4
	bIDqXo8SSIKui7/LKqn15XUbB3qSYtr22Q2vES4=
X-Google-Smtp-Source: 
 ABdhPJzRyQ/I7OvPQLiPQ27Mj6xkPPyDbw/gikm3skSbc0SIvWNATRVq1ySgxq8nS1/iZJ1LNiMELvYpwHY75GLrRPs=
X-Received: by 2002:a5d:6141:0:b0:20f:c66b:209d with SMTP id
 y1-20020a5d6141000000b0020fc66b209dmr9152367wrt.27.1653513007978; Wed, 25 May
 2022 14:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
 <20220525184852.3999906-2-Martin.Jansa@gmail.com>
 <CAMKF1soDveFJZnqf2jBXT4YJGED=KuB_HrFFgVGDdWGGxrFgVw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soDveFJZnqf2jBXT4YJGED=KuB_HrFFgVGDdWGGxrFgVw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 May 2022 23:09:46 +0200
Message-ID: 
 <CA+chaQepaRi-yHG=WSo7kpNHReg9Max64_33iikv4=TAbJNWrg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 2/2] gcc: backport fix for PR96204
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000078dcac05dfdc7f4f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 21:10:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166173

--00000000000078dcac05dfdc7f4f
Content-Type: text/plain; charset="UTF-8"

On Wed, May 25, 2022 at 9:43 PM Khem Raj <raj.khem@gmail.com> wrote:

> Can you also ask gcc bugzilla for gcc-11 backport ? so we get it into 11.4


Done, in bigger build I came across similar build failure in chromium now,
will double check if it's actually caused by this change and if the 2nd
commit linked to the same gcc PR fixes it.

Steve: please ignore this one for now.

--00000000000078dcac05dfdc7f4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, May 25, 2022 at 9:43 PM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Can you also ask gcc bugzilla for gcc-11 backport ? so we get i=
t into 11.4</blockquote><div><br></div><div>Done, in bigger build I came ac=
ross similar build failure in chromium now, will double check if it&#39;s a=
ctually caused by this change and if the 2nd commit linked to the same gcc =
PR fixes it.=C2=A0</div><div><br></div><div>Steve: please ignore this one f=
or now.</div></div></div>

--00000000000078dcac05dfdc7f4f--

