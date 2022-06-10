Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35DCC43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 17:19:30 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web09.29773.1654881561704850555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 10:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U/y5bzsD;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id s10so5876813ljh.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Tk87vMe09iuyK4LxNRT45ltFJOfhFAXE2yNhRXnYgZo=;
        b=U/y5bzsD9Dff+15RLKZrocsrZeyMg/9uFd2VPPkLFIAuFtyFbKIBcpWqdvcNLfALJ8
         +U/bZM2lPEjilgxGz2WRtC/aC4s941F1G0jZgHgadKrYrMAQtu+LLOkEuu/gHSEbqGm7
         4vHOtLEYuOY/5K6Vv2TlYGPA3yGhbc4xeGvcbRz5YdjqPVDRPgeAazkzslNv563tUxmo
         k73OdL+QLo5rDXARDgDMnNbFjBP+ChOfIDWTLFf0Q+wjZVCX+e3aPk2YLtpJFzeyk362
         jvS8qLuM4hBJ2I1l+Xw4pLZwLFLQFQgLXUeY8uN013534kSGJwQ6DpUwJ6y7+QIwTlz0
         AO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Tk87vMe09iuyK4LxNRT45ltFJOfhFAXE2yNhRXnYgZo=;
        b=NYXTuVDOBi7K+8/JIX61VEeYQAQIsGCANqETkB/zTT5Ea9CovXI3CQ0r2jJgCgyiS1
         6r090+TuJQVwK+RazpbZLOKCOfv+cby3HgQ2piLv30B3J7WnEBH7q7VuPqKR9kdqNshE
         y8Yi5CARSUoDSUKtuAZTKy1IjcrzWVobrANIkNUHjdZPpIgb7c6szvnjkdLIByzv5aEq
         xBgsTCSdQbriybkmiGrOgFP6OePekrrfAV4VfpAIVwWKKWnHuFdHKDNGI/pTfUTVaxmD
         bGRrfhu8xBSk/ssCFBOUwW2u1LnEcMIkUcSB0pEsYgMVzkVgU13XzPsYf5Nt7UqR7g/X
         wXKA==
X-Gm-Message-State: AOAM533h03/YGejrolS28SalaVNxAzK3rW5IJBey6SdwR+jMd9xYcUOE
	x3enw6aUC/UjBZ+5JeFCfXed/Z4VYuT8mjgTPcY=
X-Google-Smtp-Source: 
 ABdhPJxJq3u23YqYuSRqqPXsvTKPRSQfn7W2n72lW4cnEU42WffedaVzAILkQCGNSbIC2i8Xowgz2sfv6LzqNM6zLOo=
X-Received: by 2002:a2e:9ac3:0:b0:255:772d:f806 with SMTP id
 p3-20020a2e9ac3000000b00255772df806mr22712643ljj.56.1654881558557; Fri, 10
 Jun 2022 10:19:18 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANNYZj_-fR3=Hj7UayvQpYeMUstP+imD6S645=eGBHWS=oGejA@mail.gmail.com>
 <11399.1654879388178215858@lists.openembedded.org>
In-Reply-To: <11399.1654879388178215858@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Jun 2022 19:19:06 +0200
Message-ID: 
 <CANNYZj_G0vR8nME0euHGLD0mODGA6nUiDEHQ3gE6KZng9_DC+w@mail.gmail.com>
Subject: Re: [OE-core] [honister] test and patches for xwayland support
To: Sebastian.Suesens@baslerweb.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 17:19:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166812

You need to check which user and group weston runs as, and any needed
directories should be writable for those.

Alex

On Fri, 10 Jun 2022 at 18:43, S=C3=BCsens, Sebastian via
lists.openembedded.org
<Sebastian.Suesens=3Dbaslerweb.com@lists.openembedded.org> wrote:
>
> If I start weston as root user, weston starts like expected.
>
> When I start weston over the service /etc/init.d/weston start
>
> I see following error message in westen.log, when the system come up.
>
> failed to bind to /tmp/.X11-unix/X0: Permission denied
>
> The folder has following rights:
> drwxr-xr-x    2 root     root            40 Jun 10 12:04 .X11-unix
>
> If I change the rights to
> drwxr-xrwx    2 root     root            40 Jun 10 12:04 .X11-unix
>
> then it worked like expected.
>
> What is the right configuration for .X11-unix?
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166811): https://lists.openembedded.org/g/openembedde=
d-core/message/166811
> Mute This Topic: https://lists.openembedded.org/mt/91664874/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

