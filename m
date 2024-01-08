Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78566C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 17:02:08 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.2370.1704733326454616599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 09:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YpIgODIA;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cdf8b9502dso45766a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 09:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704733326; x=1705338126; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQvmvsObSpRevd8wpEnIDcTEgi8w85VyfQxUkA7AZAw=;
        b=YpIgODIAmC728jAw5Hj8gcrmDr/0zChTu41SJYH5kgDRW9QU4MthgROpGeSFeoxJJj
         he/1tJmQe/qQ1WYZSjQSuChAzmH2Qw0TUPUE3eygksQ/z+dXaue5jDtC+lU570as0I/Z
         f5vsElPBeqENITS2suLl8bdu5wu+F+fIzFB3NjtY5vYMD/VDan/uxUiVy1DiSc3L5Eyo
         /zaaoejmjvA0mHIof07CqWykVTuCVZh71jyGgk9maPskI3vzUFTg67XhLcDhqhAh4wRr
         mzD7wqif1zfq4RfdROBN4lQHycAJww7VzvHr4zSgq/yaFRkvAwIJxV+6gk1HBhKRGsps
         1vLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704733326; x=1705338126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQvmvsObSpRevd8wpEnIDcTEgi8w85VyfQxUkA7AZAw=;
        b=r0qDaG8kr7e/GFrMIe4HbORtRxP5MCAvTO+lO0teOmgaT9iG2IgMVruh+xpjV1SIwF
         9VF7EIXo0Jevqjd/XmBlbP1tEGeC+RimYeX6AYaZDguclV2YCi/L29nP+DGOM0kYrj1e
         tbt3Nu3Hbv3qMku9RurYk4PcrArbq4xPfv6C6TNBgpg0LFyLijwRe+XyF7rOA+U0WP9S
         o40mUtvPo2IxdhyMe6f5XAeX6IbWfKbVvFdr2nDLZRA4ZM6HD50Q2vaibpbXQxxnxSvU
         tI3nPkybWRegIQodeO/J5qDJrBOa9oQkGO+X4h+3tcs/mJuekbphaDLAu72kwotOVOK6
         MWsQ==
X-Gm-Message-State: AOJu0YzIPBurWr6zLVN/s7IRMbvmuqhMG33MrzfaQI/TDxlsHKYgPF4t
	qZyTdW6td1dF0juxhazAYnXV58yQ71DXX9Nca+M=
X-Google-Smtp-Source: AGHT+IG3FCnAjiCEmw2ElglJBJAIq3IH56PJc/EJauppAI3nXkU4iNlCMx5V78ynhOzIGjmhDTMIiVszMdmhia2zhAQ=
X-Received: by 2002:a05:6a20:68a4:b0:199:9259:aba0 with SMTP id
 n36-20020a056a2068a400b001999259aba0mr4795538pzj.1.1704733325817; Mon, 08 Jan
 2024 09:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20231226123810.495126-1-festevam@gmail.com> <CA+chaQfLcVr62n8xOCXJoc7TXM2Ut_qkMa_uM5OoscUQCyHnEQ@mail.gmail.com>
In-Reply-To: <CA+chaQfLcVr62n8xOCXJoc7TXM2Ut_qkMa_uM5OoscUQCyHnEQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 8 Jan 2024 14:01:54 -0300
Message-ID: <CAOMZO5Bn23X5T2t++H22VBYS9rF8SUinXFCQ7OXr5L7hG_J6xA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kmscube: Upgrade to latest revision
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 17:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193426

Hi Martin,

On Mon, Jan 8, 2024 at 1:21=E2=80=AFPM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> Hi,
>
> can you please set PV to something else than "git"? meson.build says vers=
ion : '0.0.1'

Yes, I can do that.

> The last commit from the new 3 is causing build failure on some setups wi=
thout GL/gl.h:
>
> kmscube/git/git $ git log --oneline ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9ad=
f4c..96d63eb59e34c647cda1cbb489265f8c536ae055
> 96d63eb kmscube: Add gears mode
> d93842d es: Update to prepare for gears mode
> b076d85 ci: enable MR pipelines
>
> Until "96d63eb kmscube: Add gears mode" it was using only EGL:
>
> kmscube/git/git $ git grep "gl\.h"
> common.h:#include <EGL/egl.h>
> cube-gears.c:#include <GL/gl.h>
> esUtil.h:#include <EGL/egl.h>

Does the change below fix (add virtual/libgl to DEPENDS) the problem?

--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ OpenGL or OpenGL ES."
 HOMEPAGE =3D "https://cgit.freedesktop.org/mesa/kmscube/"
 LICENSE =3D "MIT"
 SECTION =3D "graphics"
-DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/=
libgbm"
+DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtual/egl libdrm
virtual/libgbm virtual/libgl"

 LIC_FILES_CHKSUM =3D
"file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b309d4ee67b7315ff738127=
0dd631fb"

Thanks

