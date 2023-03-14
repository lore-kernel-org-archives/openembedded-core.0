Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94759C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 19:01:26 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.3547.1678820483446547342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 12:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xQmnymAs;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id r11so14529522edd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678820481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5aTAuXzu0uuN6lTmbUvv9CwZf4D+PMlKUYoNsqKQ3M=;
        b=xQmnymAsB0zFisvdygrmB1gDDmKOCfwv+/IveFfOKxywaOtsoQG6/WJPH/cNo+aGLv
         ivLCbpHUxsXSpLaxxdBrkSNCpzX8ZQu2lsspiwFlN2ueKm7Gk4NOVijlUdK/QYVT87mF
         MBoQiW60DmzJfxG4AweI7zomwFNE0bNH1uEH2XRy54g2IUSLqsBSo626cm0L5vyY/wY+
         tAgiQ2TB3ITAalXrP7ZPifCwzPTNM/dVkFWJwLtPobz9bwi+gGyqe50uDANnlIOYnO9O
         i8AOW9ATsCXJyjeIBd04L7LnFe7sULpg89rKpxO8UOQWR+FGHjDiMIc2zTid3YoDMpi0
         NuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678820481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5aTAuXzu0uuN6lTmbUvv9CwZf4D+PMlKUYoNsqKQ3M=;
        b=E872bxa/oiHODmS5rOLMntQZ7PYkoDr17UOA9zL+L8Hj7tF1KFIrASzUtAnsED3Suh
         3ZqnFRUckBIdME1JOzJyil3wwobwPHocMk8jBRc+nsrqWXA6OIkWUIAcD9gIkNeOme3t
         wss9Kyw3ocXSiZxjR5IxUm5j+dmt5CfdDxwfHdEm1HMIzP1paiACyx56wcrE4EO7hhGY
         2Wjk7dbMlhh79HnGJ0bS60C17nSmdp8M2HInIF2ERVoceV4R+tklWj8Iqib+wfJmavgV
         RLu3NUJ5KcL12x8pmnfMsCLskkj36hA9ebGkm4g/uwC69C1EKUGwiqsVbVrZt/yjYoaA
         EYpw==
X-Gm-Message-State: AO0yUKUq8jfBccKdRfNa61BxRVNHgZ/6eRA9SD8e71YchPMq1l/Zrs92
	ueFxNl7MfSdHlP+jFlZF6ZbEtfuPmUfAjZNetAVTGw==
X-Google-Smtp-Source: AK7set/g6qcABQtTW/e+znoqxj7/8QfRP11KGpxKgKDOQPmlcSm4+Wxrw9vtKlLHiHJLG3Y7mqxywi1Vpf6L0JGa+uw=
X-Received: by 2002:a50:d506:0:b0:4fb:482b:f93d with SMTP id
 u6-20020a50d506000000b004fb482bf93dmr94982edi.2.1678820481532; Tue, 14 Mar
 2023 12:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <e5d0e2eccdf802d4b257e63600d86f2baf050d73.camel@linuxfoundation.org>
 <24423.1678792770883856052@lists.openembedded.org>
In-Reply-To: <24423.1678792770883856052@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Mar 2023 09:01:11 -1000
Message-ID: <CAOSpxdYcFBnAOYqRN+wpF7UnrigJLL8LtO+OteAiyBSgOnnS2Q@mail.gmail.com>
Subject: Re: [OE-core] base-files: any reason hosts contains localhost.localdomain
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000071983b05f6e0dae6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 19:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178516

--00000000000071983b05f6e0dae6
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 14, 2023, 1:19 AM Jermain Horsman <jermain.horsman@nedap.com>
wrote:

> Would it be appropriate to backport this to dunfell too?
>
> If so, should I send in a patch? I'm not entirely sure what the general
> process is in these cases.
>


The correct procedure would be to send a patch to the mailing list for
review. If there are no objections I'll add it to my test queue and see if
any issues emerge on the autobuilder.

Steve


> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178481):
> https://lists.openembedded.org/g/openembedded-core/message/178481
> Mute This Topic: https://lists.openembedded.org/mt/97522170/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000071983b05f6e0dae6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 14, 2023, 1:19 AM Jermain Horsman &lt;<a h=
ref=3D"mailto:jermain.horsman@nedap.com">jermain.horsman@nedap.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Would it be appropriate to b=
ackport this to dunfell too?<br>
<br>
If so, should I send in a patch? I&#39;m not entirely sure what the general=
 process is in these cases.<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><br></div><div dir=3D"auto">The correct procedur=
e would be to send a patch to the mailing list for review. If there are no =
objections I&#39;ll add it to my test queue and see if any issues emerge on=
 the autobuilder.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Steve<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178481): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178481" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/178481</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97522170/3620=
601" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/97522170/3620601</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.c=
om" target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--00000000000071983b05f6e0dae6--

