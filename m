Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6037AC433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 10:49:15 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web12.57.1637232550249619333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 02:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W+6kwKbj;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id l24so12687969uak.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 02:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f7sCaqmbbsmek5xIy6dkEEVWAGV0cmd18AOpu6c2ctk=;
        b=W+6kwKbjLGxXOjTdLj9HQfBw+3nRsrwomOsXptKu59ye3rbZdkkTd2q79q4YAxfegD
         5Xfp25zqk4+yFDLmy9+R0zzC05W8ctgKscM+XEx8UwyQyhpc4c/Gti/TBLNFA7qs51zf
         lNE+wdh6uOcUFp8xniNx0OxUy7fNG/tgktzFC6npXBeaol1S130S81YYyeVka5jMK5RT
         hyoeXUI91iF+LyKmyQS1SjrbfRJyYjE7uneu47OelOhGJz2zpuQyOA41V4KNF+8VX18P
         PYYe+5bSbDp2lfek/21sfYDTZE4auWGKkpg164Qrelnk8Jyw/AqFLk/XuZBDOCJyTXum
         zDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f7sCaqmbbsmek5xIy6dkEEVWAGV0cmd18AOpu6c2ctk=;
        b=PIRVGNt8gganLQM3LGM18E8wY2GDA7v0f/RbiKoQVrc+/atVfsJ7SJGXRxS64qab3E
         JuJ0Z5/Bwl9iOqc06y8mrSvN4EyNjbG2hMWRYef/jNzlSqy7gd54kpyWDuOhq3iTtrzk
         1s7DjV8uxt8c3qdJHnus7yb1eKUDP7QIkFn1Hg/wVpR8fRswVaL7tGhS2BbIhq5PNMd1
         7UNqisGmWGE20vgxmQ8wsvHaopa9puM3iToCG13/5iGGQgVdJVGla3wMc969W7KA5g09
         lpe2l+6/C4hHUOnsjGkiy9Fz+f/rAdPIteLALprGD0lJfUJboyYqskcazFkpkjTjTIpV
         t0og==
X-Gm-Message-State: AOAM532KhQ2GpsUg9lvTGgdD9YIU1z2qjjRW1roosc9zwX3lRcGqgZkF
	qMePOTT99e6w+tGF1tknwG5t0TIWgGuk1HlP8Tk=
X-Google-Smtp-Source: 
 ABdhPJwdy3L+AXGdAN2tBnK53keaaaNQunWTh/GHzQFAjkjjCRzBoQz6FhksLDl4+GgroeoPraSs/g8wks4D58Np6gk=
X-Received: by 2002:a67:846:: with SMTP id 67mr1134654vsi.7.1637232549331;
 Thu, 18 Nov 2021 02:49:09 -0800 (PST)
MIME-Version: 1.0
References: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
 <CA+chaQeUB2ew1=odQPwXbsXDL62LoNw3aZOR8x69oeHrksPr5w@mail.gmail.com>
 <ba12a07c-68d7-294b-68f-213240d15f@crashcourse.ca>
In-Reply-To: <ba12a07c-68d7-294b-68f-213240d15f@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Nov 2021 11:48:58 +0100
Message-ID: 
 <CANNYZj9XtQEevUA1kMzSYQM+SQdPF8v5MQ8K=36ew7+CTyH3LA@mail.gmail.com>
Subject: Re: [OE-core] how to "prune" dead sstate-cache?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000084869005d10de8a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 10:49:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158472

--00000000000084869005d10de8a3
Content-Type: text/plain; charset="UTF-8"

It would be also nice to confirm that the script is in use by someone, and
functions properly. There's a ton of stuff under scripts/  that isn't
getting a lot of attention or testing.

Alex

On Thu, 18 Nov 2021 at 11:43, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Thu, 18 Nov 2021, Martin Jansa wrote:
>
> > openembedded-core/scripts/sstate-cache-management.sh
>
>   i just now found that script, and noticed that it is not documented
> anywhere in the YP docs. perhaps we need a short section on
> sstate-cache management somewhere in the docs.
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158471):
> https://lists.openembedded.org/g/openembedded-core/message/158471
> Mute This Topic: https://lists.openembedded.org/mt/87140377/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000084869005d10de8a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It would be also nice to confirm that the script is i=
n use by someone, and functions properly. There&#39;s a ton of stuff under =
scripts/=C2=A0 that isn&#39;t getting a lot of attention or testing.<br></d=
iv><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, 18 Nov 2021 at 11:43, Robert P=
. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Thu, 18 Nov 2021, Martin Jansa wrote:<br>
<br>
&gt; openembedded-core/scripts/sstate-cache-management.sh<br>
<br>
=C2=A0 i just now found that script, and noticed that it is not documented<=
br>
anywhere in the YP docs. perhaps we need a short section on<br>
sstate-cache management somewhere in the docs.<br>
<br>
rday<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158471): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158471" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158471</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87140377/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87140377/1686489</a><br>
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

--00000000000084869005d10de8a3--

