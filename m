Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6FDC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 14:51:16 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web12.12636.1642690275373076617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 06:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ii/8Q4lM;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id n15so9755713uaq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 06:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qf+HFhodbKcbeoo4aYLQ57j1Y2nXK0eOj3wEmhyCJE4=;
        b=Ii/8Q4lM8o3lgHbJDzutUx739lQEMotT5idjsFf/sCj2+SczTz1/IaC0xzMXux9TuE
         eF8vcBzoaIUh/2iuM+lE1vg6imT+d3yn3acI69Wy5yxoV7Gj0FH+NzYoRzkI4I4CTbMf
         wE8+JzGK9kk90x0cTfskKgnN+oCKq9di5q1ahaG82eyQaBkoV3/Z/D4Npb5BtRyqD36f
         fizl/ey7+3dTpmroslH9hUJ4OJVA7/yGquZe/nI2r2LjRSaFre+h5ubU8lo/pVhCW2KK
         bwCkpF+HhMFkLiTxeqqDXtGVAQJA3be9QNKBVUrHh2/dUo16sQtkJcv99Tn1La+piGMv
         Jt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qf+HFhodbKcbeoo4aYLQ57j1Y2nXK0eOj3wEmhyCJE4=;
        b=aJ44WF9ggYYkogLQ6bESJnv669freGHybIm3uaTV+We49ua9vl/NVV4kq2qel6D5X6
         i09DI5Qx4iy3Eg678471lI6+DxoiqsyPa3ytO2mBbD7gMxLACQJeBvmrZjyzi3vM4YF6
         vEAiUSZqy5U0Yg5fl+NtCifXwfOV8MAz0LkOIq9D1pmyqZP8T1osxj7yk4QZ5DwY4vEO
         RaRJug8wbsk7BZv2tTabNpVtF/4rgRNUh4Gjqc6NkrZGehrVIeyxOWCRL4hiBZWwh/o5
         9ZK/eVbCxKurYfRN4uhljhG1k89FK6hmT2u3XCxvrxwusgs2VI1tZOxASM6IfJqPj461
         Coww==
X-Gm-Message-State: AOAM530eUHVybar3mEd28nE1RTfNxqoryCOX8pUCbkq2yOnLmLDmJeDQ
	5EVu2IOYvs9C1BuH4Itb2gpPyCxObh+lrBWzEKLOLJGT
X-Google-Smtp-Source: 
 ABdhPJyTaUqeVl8HEDrCMJqSuUkK0oOHz7wGEOkmh46+B8wBo3zddquGl1nx/AKGFs2EnlTHXlLmmN+N7ubn3FLYcMs=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr14603232uai.89.1642690274462;
 Thu, 20 Jan 2022 06:51:14 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAL6CDMGDmLQ+kQACFOO716ofrjBGUjH=SnBR+n7FYg8Ey3VThg@mail.gmail.com>
In-Reply-To: 
 <CAL6CDMGDmLQ+kQACFOO716ofrjBGUjH=SnBR+n7FYg8Ey3VThg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jan 2022 15:51:03 +0100
Message-ID: 
 <CANNYZj9EyaX0yzzf5BM2kwoQx_2TnPMUnc66P3afXDSa5QxzDw@mail.gmail.com>
Subject: Re: [OE-core] [oe-selftest] adding new tests workflow
To: Igor Opaniuk <igor.opaniuk@foundries.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004911ef05d604a2a6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 14:51:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160764

--0000000000004911ef05d604a2a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You need to set your sstate cache directory to somewhere outside of the
build directory. Then the sstate cache will be reused between selftest
runs. The default behavior is to delete the selftest build directory if the
selftest succeeded, but the cache will ensure  that no long rebuilds will
be triggered.

Alex

On Thu, 20 Jan 2022 at 15:40, Igor Opaniuk <igor.opaniuk@foundries.io>
wrote:

> Hi everyone,
>
> I do have some questions about a standard workflow people usually
> follow when adding new test sets to meta/lib/oeqa/selftest/cases/.
>
> When oe-selftest is invoked for example this way:
> oe-selftest --run-tests wic.Wic2.test_offset  --machine random
>
> It usually creates a new build dir, then as far as I understood it
> builds all available recipes (~30GB of build cache) for a random
> machine.
>
> When I try to invoke oe-selftest again, it prints error message that
> build dir already exists:
> 2022-01-20 16:27:50,892 - oe-selftest - INFO - Adding layer libraries:
> 2022-01-20 16:27:50,892 - oe-selftest - INFO -
> openembedded-core.git/meta/lib
> 2022-01-20 16:27:50,892 - oe-selftest - INFO -
> openembedded-core.git/meta-selftest/lib
> 2022-01-20 16:27:50,893 - oe-selftest - INFO - Running bitbake -e to
> test the configuration is valid/parsable
> 2022-01-20 16:27:52,524 - oe-selftest - ERROR - Build directory
> openembedded-core.git/build-st already exists, aborting
>
> So there are two questions:
> 1. Are there a way to avoid building full set of recipes, if I really
> want to run tests for one specific module (ksparser for example,
> --run-tests wic)
> 2. Is it possible to re-use existing build directory for that and
> expect bitbake to rebuild only recipes that were changed?
>
> Thanks and looking forward to suggestions.
>
> Regards,
> Igor
>
> --
> Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations
>
> Igor Opaniuk
> Embedded Software Engineer
> T:  +380 938364067
> E: igor.opaniuk@foundries.io
> W: www.foundries.io
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160763):
> https://lists.openembedded.org/g/openembedded-core/message/160763
> Mute This Topic: https://lists.openembedded.org/mt/88559673/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004911ef05d604a2a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to set your sstate cache directory to somewh=
ere outside of the build directory. Then the sstate cache will be reused be=
tween selftest runs. The default behavior is to delete the selftest build d=
irectory if the selftest succeeded, but the cache will ensure=C2=A0 that no=
 long rebuilds will be triggered.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, 20 Jan 2022 at 15:40, Igor Opaniuk &lt;<a href=3D"mailto:igor.opaniuk=
@foundries.io">igor.opaniuk@foundries.io</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi everyone,<br>
<br>
I do have some questions about a standard workflow people usually<br>
follow when adding new test sets to meta/lib/oeqa/selftest/cases/.<br>
<br>
When oe-selftest is invoked for example this way:<br>
oe-selftest --run-tests wic.Wic2.test_offset=C2=A0 --machine random<br>
<br>
It usually creates a new build dir, then as far as I understood it<br>
builds all available recipes (~30GB of build cache) for a random<br>
machine.<br>
<br>
When I try to invoke oe-selftest again, it prints error message that<br>
build dir already exists:<br>
2022-01-20 16:27:50,892 - oe-selftest - INFO - Adding layer libraries:<br>
2022-01-20 16:27:50,892 - oe-selftest - INFO - openembedded-core.git/meta/l=
ib<br>
2022-01-20 16:27:50,892 - oe-selftest - INFO -<br>
openembedded-core.git/meta-selftest/lib<br>
2022-01-20 16:27:50,893 - oe-selftest - INFO - Running bitbake -e to<br>
test the configuration is valid/parsable<br>
2022-01-20 16:27:52,524 - oe-selftest - ERROR - Build directory<br>
openembedded-core.git/build-st already exists, aborting<br>
<br>
So there are two questions:<br>
1. Are there a way to avoid building full set of recipes, if I really<br>
want to run tests for one specific module (ksparser for example,<br>
--run-tests wic)<br>
2. Is it possible to re-use existing build directory for that and<br>
expect bitbake to rebuild only recipes that were changed?<br>
<br>
Thanks and looking forward to suggestions.<br>
<br>
Regards,<br>
Igor<br>
<br>
-- <br>
Best regards - Freundliche Gr=C3=BCsse - Meilleures salutations<br>
<br>
Igor Opaniuk<br>
Embedded Software Engineer<br>
T:=C2=A0 +380 938364067<br>
E: <a href=3D"mailto:igor.opaniuk@foundries.io" target=3D"_blank">igor.opan=
iuk@foundries.io</a><br>
W: <a href=3D"http://www.foundries.io" rel=3D"noreferrer" target=3D"_blank"=
>www.foundries.io</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160763): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160763" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160763</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88559673/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88559673/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004911ef05d604a2a6--

