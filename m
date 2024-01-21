Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF36C47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 20:13:25 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.55960.1705868002711952013
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 12:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JIZqpkLs;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2107b078e3dso1102069fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 12:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705868002; x=1706472802; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqYpg+9rbSVfmvCxzy9gakeKu5i3wXLWJ174WGZaCYE=;
        b=JIZqpkLsdGv07MifHHmBHDLoczSDtiLTBxJsHSak99I9W+X3ZFa5w/lUZQxYwgxgOV
         tBAiZnnqmwfSdtvcocHT77WfEQtGRDw+BZZx4hjxdIMd/1pEXoVrl+cO02oDiTcKxX9W
         rL+NZBnHlBeePG0ED5Eei0z/x6tQQssxmMtRDRbs71PfhtFSMqYJV7sVETNosXgosdCk
         qcBEAZxgeHzyDi2Orrt58ml3M56TTzMSskT6GJa0K1navqRzORAX1Wd62rZxAXB4fp0H
         wsejnZHBUw29O6XBns8PspwRIRClzoWVUw10bbbaqfiKm6AqFEL8XgEeykqRgLrGoxjE
         ZdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705868002; x=1706472802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqYpg+9rbSVfmvCxzy9gakeKu5i3wXLWJ174WGZaCYE=;
        b=RiCEPIohjFPPn7NWDXluzfjraFQRSNZzTOQ7hhVdZBFOfosKIP9yRqDQFMGkr00bZB
         yx3Ab+xlImCiDpUd1KuGmOcD55QfpBwUaCVqzQ029Hx4ZOWhRmI7kgJbHomRzk212XXZ
         rtRhnysy/uJvHmkdCd0YG7rsULojLPKgzDRFgffliKy4jo/KYJ3x5dV35jX/YR9Hu6GD
         G/dEkZ9bDlfWmUI744MQlT7xmKHh/Cc5PbkO/x9u/x3l230S+TR+//HJyWGw1qdveER1
         mGP/HJmVkCcvy0a7aHwlrpp2bix71WwXMJ+lfMuNTyqKVGb8wM86tvTZUT0ni/QGjV3b
         7hzg==
X-Gm-Message-State: AOJu0YxduASmBux1kHgivvt0NndRWY7PaYVW3s5vQf5zD6nFj6VF6zxr
	V+ybw9Z1rT5SMOQ70vrcaei7GnW+OqxTlgFK11jmF0YK8482TKst+nJF0z9caJLGKETz4AakOSc
	u1Ltae7iSl2qp2GPPUDfLs3gq7vs=
X-Google-Smtp-Source: AGHT+IGwmomiqCQy7cGLS3ukd1aD5VwQR9T7p+QHswthei8HvsWHVNf+BB20yzPS0CPZCGcsA0rJbRACcOChV3l3N78=
X-Received: by 2002:a05:6870:3911:b0:206:120d:a63c with SMTP id
 b17-20020a056870391100b00206120da63cmr2041068oap.89.1705868001867; Sun, 21
 Jan 2024 12:13:21 -0800 (PST)
MIME-Version: 1.0
References: <cSDk.1705855396440281429.AFnV@lists.openembedded.org>
In-Reply-To: <cSDk.1705855396440281429.AFnV@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Jan 2024 12:12:55 -0800
Message-ID: <CAMKF1soqwT4AagZ9mZ0J2JHAH9fwWdScNjYfeNyRiW3WLpr0wg@mail.gmail.com>
Subject: Re: [OE-core] Inputs to share CVE patch for binutils CVE-2023-25584
To: Ashishx88 <ashish.emailaddress@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 20:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194105

On Sun, Jan 21, 2024 at 8:43=E2=80=AFAM Ashishx88 <ashish.emailaddress@gmai=
l.com> wrote:
>
> Hi Members ,
>
> I am trying to submit an CVE patch  CVE-2023-25584 for binutils
> This is my first patch in community so apologies if any basic info is mis=
sed
>
> Can members please help me for
>
> 1) Do i need to share only specific CVE patch with community
>           or
>      Patch with updates meta/recipes-devtools/binutils/binutils-2.39.inc =
&  CVE  both files being updated in same patch
>      (Currently this is what i have created )

Process is same for submitting changes for project be it a feature a
bug fix or new feature.
you prepare the changeset and then send the patches ( and cover letter
if multiple patches)
 to mailing list for review. This is a good guide in developer manual here

https://docs.yoctoproject.org/contributor-guide/submit-changes.html?highlig=
ht=3Dsubmitting+patches

>
> 2) Is there any known place where i can share that i am looking at this C=
VE so we save effort duplication

Usually, its a good idea to send email in advance to inform the
community about your work
that does have some advantage but when patches arrive on mailing list
thats mostly when we
know of someone did the work for sure.

>
> 3) Can i share the patch as attachment here or i need to send via "git se=
nd-email" only.
>     Currently i am facing some issue with git send-email  at my end

Most maintainers pick them from mailing list or tools like lore or
patchwork. So git send-email
has had good results of sending patches intact. So using that might be
a good idea.

>
> 4) I have validated the patch for (langdale) :
>     # devtool build binutils
>     # devtool build-image core-image-minimal
>     # bitbake binutils (after  cleanall )
>     # bitbake core-image-minimal
>     Is there any other test i need to do to ensure the sanity ?

Thats good. You can always mention these activities in cover letter,
thats very useful
information for reviewers and maintainers.

>
> Thanks ,
> Ashish.
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194093): https://lists.openembedded.org/g/openembedde=
d-core/message/194093
> Mute This Topic: https://lists.openembedded.org/mt/103869223/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

