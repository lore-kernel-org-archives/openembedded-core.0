Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DD9C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 07:39:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.95714.1680593939944569108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 00:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TkXkPFGZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d17so31716459wrb.11
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 00:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680593938; x=1683185938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y0ua5rtcfrlIUI8JtxzwMQWQe+UkudgPdSwSfjGKfT8=;
        b=TkXkPFGZfpPoKAOUcPFkQ+4wEvJ+mNmx3QswykMzIuaBOifh0G1F7lcmZpac8TvcaV
         39zugqmZWcd0iN4PWyomYtSWp/xkenB5mwEZ5BCkWGsTQ6dnTYTbf0GC5Lj/WQBAkKHV
         +RtOXdHAvWYxyq5TJWjlfOCzcHI9AfI1HAsz3ke+XvnNxTK/k+CUJUJwn4RoRFAWF8vK
         YPRauOd8gL4HUQ90sIvnT0w8ErExi0TKHuRLa4yiTG4keqd6yOWcMdA674xLeQBRUP4j
         oC/e3gW8o3AQrvaYtHAqmot9CdtWM2pzc3lU8A2Tun3riV0ZepFYiu/X21cnLy80KZol
         SLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680593938; x=1683185938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0ua5rtcfrlIUI8JtxzwMQWQe+UkudgPdSwSfjGKfT8=;
        b=WKCbtKGj4UlpyltM81mzVjgQ+SZayN46xVqq+vnik0iEA35o8ssUE5EytcSIy8hdtN
         3wOgOWTJBAzDDq2ziOswfAe8lAULJBzkNHOgDpz+zzOqt9uLbPpay5yFgNfEhazxhRV7
         N43FkHRZ2APymoXbojUNbd9O484osNykUELVTuUWKeNBHRVnajhr2QSRGYz7tJD/Fzaj
         w2AXH1tnuTUf/f4bPxqG/dSUyF/4MV8EX5cYRVhYaCsW+tfikxh/hLlkcdHOhDAkMEjl
         HwFdruZUNzX/7MHmnL/02Bs11teayNYY+W/DeyfWmIbFCS2OkW6AgxrDEeleJ6hWUJd7
         Kerg==
X-Gm-Message-State: AAQBX9ePuT9dVIVvnay+epGL9N8cGF+HcVqc8lipHF0EQ9MkbLz4ypWo
	EFPJAmCFMmEuSEzzq68gAB6GQQh9V8WbNbSG+Aw=
X-Google-Smtp-Source: AKy350bwzvbDDzBPchFDerXyIbeJ9YQ1U6aZ5dQrr2kAwjhzESNvI7wvqxKZmoZhKoZ4wX9RkVR18P4VZfOhGcrepj4=
X-Received: by 2002:adf:fb87:0:b0:2e4:cbfe:da3d with SMTP id
 a7-20020adffb87000000b002e4cbfeda3dmr286613wrr.1.1680593938170; Tue, 04 Apr
 2023 00:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <1680577746-26462-1-git-send-email-mark.hatle@kernel.crashing.org>
In-Reply-To: <1680577746-26462-1-git-send-email-mark.hatle@kernel.crashing.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Apr 2023 09:38:41 +0200
Message-ID: <CA+chaQfGEx0g_8R2omiD00YgVcXCYTN_8EHM_y-GeE=a680Hyw@mail.gmail.com>
Subject: Re: [OE-core] [master][mickledore][PATCH] sanity.bbclass: Update
 minimum gcc version to 8.0
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com, 
	Qi.Chen@windriver.com
Content-Type: multipart/alternative; boundary="000000000000b247a905f87dc456"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 07:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179674

--000000000000b247a905f87dc456
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 5:10=E2=80=AFAM Mark Hatle <mark.hatle@kernel.crashi=
ng.org>
wrote:

> From: Mark Hatle <mark.hatle@amd.com>
>
> With a gcc older then 8.0, meta-native will fail to build with the error:
>

mesa-native

--000000000000b247a905f87dc456
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Apr 4, 2023 at 5:10=E2=80=AFAM Ma=
rk Hatle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@k=
ernel.crashing.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">From: Mark Hatle &lt;<a href=
=3D"mailto:mark.hatle@amd.com" target=3D"_blank">mark.hatle@amd.com</a>&gt;=
<br>
<br>
With a gcc older then 8.0, meta-native will fail to build with the error:<b=
r></blockquote><div><br></div><div>mesa-native</div></div></div>

--000000000000b247a905f87dc456--

