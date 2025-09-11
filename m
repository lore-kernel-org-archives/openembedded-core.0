Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D2FCAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 15:55:52 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.1091.1757606148973662574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 08:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SUjAInpZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70ddadde494so7561896d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757606148; x=1758210948; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8T0OOzM9GwdTw1f3RPd161asp3QsVRMspcDUNYssHdk=;
        b=SUjAInpZAQ+FQ1V8dKcmOa9UGTetnGnZDFnCiZ1gsqZOO64uq6r50PNDRRribdS9TG
         r7HbBug3ghsv0WhqeaUcKTLR8bIWY4jJeu9TGQjzcd3xCCuY0Wk+kXO15+9RRMi+A5MQ
         Y8Z9La8udnwUr/tC0+/yX85wqgmg4cYFYeHJMkhjTpJSxpWsEx7ytgo4BHnMNtrj8Z2A
         vf8igVNTONd494NwaRDE6kp6DNTzPPC4hgb/813NeFUfsQ3p2EpvsUpe/OwnQvX6Qb/2
         lCVidYKwDdTTodElLwRPxKZwoNI2dH1lP9PBzLISJzm0eGrMBrYFmJI7i2zshXTJ+eoG
         PtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606148; x=1758210948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8T0OOzM9GwdTw1f3RPd161asp3QsVRMspcDUNYssHdk=;
        b=QTT+ELILxDxzb5KHIar7NqFnHhg9z42Hpzq2KlZXN0CReYmtrlFXBvcBgjJTn41bIn
         Wd6PTOp5Ww6Zw4GRW5yUQxmdgpDFPSjGMYlBjIMmGfV8a7GSh8/hIAYPGBkVXDLbjO0g
         k+sGQqDDqhhAgm6wAZpCpd4AKbhQPU6tsZECXCdpkOL53aJHuMWbgKtG8NUUz2W+VSZ2
         bqR9w3PRfKWEDlI38gRc0Zv9PuWPUpWRJ9+IHFRJoIk2jm50UKOpUvcHOPPEgSLm+p+B
         O3IEo9V97KQB3y6bmdGi9HioMHX8GjxHWfXXLBovT3PPsENchm9DxPTKbVb3Yj32Y7BX
         itMQ==
X-Gm-Message-State: AOJu0YxkWvSolSjEYOcUMhTA1ueE61zsNogN4RCDLKhNsmwwMwzr955G
	dkBSza3xLXGSKGMNskkT4IyqTcKNzK5OXh1kKJZ3etJUE/gofnB+Jf+DBlJSoE4PyTIoqP56w4+
	TqC9ZZTmmsQx2quj3e0e/n+JBRhb/bvE=
X-Gm-Gg: ASbGncvLWPmMavy1Ir/5jPg5JDb5dle/dIAU7mhEOCzQB2Lsah7pIHiG9VBFE1Pr2R9
	oPF+FFxrLX+gOyHL04eFz57GNWkP4hAXjZBnPJjK8/eqMnexfX/AvTH9y3sRpU1uXCsf3RcAQNW
	v48iUV1c4gyLJhU7AkH2zdimlXANuTg+c0YQyE6vNNqAH19RD/DtSEOACy1PhsmGV5qNNmGrsyW
	72hgds+uxITZm8QPdTmyIOZN07uheGa6JbjYREnU8QTwsE3q48++1KqlkHvTMH3veozw5BEaJTY
	L2AgbmbRDHeic68pxfVBLYUA8MupPhcu4RMGC7rIpr6aN9npeg8=
X-Google-Smtp-Source: AGHT+IEVIxqe7iBITRfAR01PMwZ41q4fcqiIRgy5Q7V+0+yIURel+7leQm1rFsi6+ttWNXTZ3IZ5c2rFcflLFagTdwU=
X-Received: by 2002:a05:6214:234d:b0:72c:cc04:c3ad with SMTP id
 6a1803df08f44-7393ec139abmr249401186d6.39.1757606147766; Thu, 11 Sep 2025
 08:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250827064940.16074-1-r.gruenert@pironex.com> <ea6b3f3beb56b2cb5d2eb92562b6dc9990d94b1f.camel@linuxfoundation.org>
In-Reply-To: <ea6b3f3beb56b2cb5d2eb92562b6dc9990d94b1f.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Sep 2025 17:55:34 +0200
X-Gm-Features: AS18NWClDuC6H6rklrbeJGdUFvPy_FHzIJ-eQkHYCtZ1qQMNY2ayTjeSlNJcQjE
Message-ID: <CANNYZj-zOryfqALi42N7MtwSdEvJCfGhPwqQ82DDeNWgdP-oVQ@mail.gmail.com>
Subject: Re: [PATCH v4] scripts/runqemu: raise an error when bitbake was not found
To: =?UTF-8?Q?Richard_Gr=C3=BCnert?= <r.gruenert@pironex.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 15:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223284

On Thu, 11 Sept 2025 at 15:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> What is interesting is that your patches do pass testing. It is
> therefore possible we've changed things and this codepath isn't
> actually needed any more. That may be due to the qemuboot config files,
> which we probably didn't have when OE_TMPDIR was added.
>
> Either way, we probably do need to try and clean up this codepath
> before this change can merge.

There's another spot at the end of the environment getter function
where a failure to obtain the environment results in the getter
returning nothing:

            try:
                return subprocess.check_output(cmd, shell=True).decode('utf-8')
            except subprocess.CalledProcessError as err:
                logger.warning("Couldn't run '%s' to gather
environment information, giving up with 'bitbake -e':\n%s" % (cmd,
err.output.decode('utf-8')))
                return ''

If this code path has been executed this *might* explain why testing had passed.

Anyway, I think this is all horrible code, and the environment getter
should fail if it can't get the environment, for any reason. Then it's
on the caller to either not try to get the environment in the first
place (by checking for presence of OE_TMPDIR first), or handle the
fail.

I apologize that a simple usability tweak has turned into a total rabbit hole.

So my suggestion is:
1. Keep the current patch.
2. Add a patch that removes the above try... except block so that the
environment getter function does not return nothing in any
circumstance, and always fails if it can't get the environment.

We take that on the autobuilder and see what fails and when, or if
nothing does. Then we can formulate what can be removed/reworked
around the OE_TMPDIR getting and setting.

Alex

