Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D6DC46CA3
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:29:42 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.70182.1701343778505421942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Auis8/ya;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a00b056ca38so112086766b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1701343777; x=1701948577; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9md1//GIMdEG9VOeD/8yFIy/NFTNSAL2ATP+hKqLf0w=;
        b=Auis8/ya26K9SYINLQeSfzwDjhVsvzo572BBFg3BImiJBxY3NdIhm3ME0HGlOW4ZKc
         p6AKhRO3JS0tuQtLFL7v8ZlpTsXksSFONB7KpVJ3Mbsz0f7MdrY8o4pMArt26WwJXO79
         hw06AJRZmDhFQziuloaZwgP5wSJGefoo+Djbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701343777; x=1701948577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9md1//GIMdEG9VOeD/8yFIy/NFTNSAL2ATP+hKqLf0w=;
        b=VB4nTmF/BJxGOjse07B4c9Ebw1sYYIIvTZhg6vbmzKEYGt1sRK9jRtdfNj9kdUsdh4
         SR39sYKFhXoyavo85LkhYEzNX0NqrE/OPkcmKIhzOUUH7w9GebeaQsJ73Yn5GnJwH3Qt
         Nl4mEKa6c6aheaNkvyaarWFA0gM9iOR38MKJvbU06+aa2nVV4VzDC7aOKZFAbJjfFK0J
         KcHF3AgUh7sVL4nFBbo5TU2hMK+mmuGWkBmiXU3mB3aMa6mEqeC3D6EC11FLwyUdsdOI
         72GhapaDbVqblcPrFWFIKJku3f9vPb71t4AwIBJmzs8rl9hCU2xfpubgB1VeH0yOoYBQ
         4O0g==
X-Gm-Message-State: AOJu0Ywd8vdvwKk0eZzUOqCCqOlT+l2ggdzXVadZHeAWuWsAwilh/oI4
	iU5l5OgxSUhRgl0pq9520/B+YXoal/spAmb3zphoWgkpwqK++CdOJHg=
X-Google-Smtp-Source: AGHT+IGqDIoKkhkL4taWPiNLATxjp/YUi8CsiQbe3I9hCq0L9aqJEMGk9OcfsR+FFlvl2UsyN70/M0ckMtcZ/aARopM=
X-Received: by 2002:a17:906:2d7:b0:a18:7f88:af01 with SMTP id
 23-20020a17090602d700b00a187f88af01mr1201017ejk.32.1701343776795; Thu, 30 Nov
 2023 03:29:36 -0800 (PST)
MIME-Version: 1.0
References: <179C617DA6240870.31732@lists.openembedded.org>
 <CAHUKmYZEOc+xkE2xCbMhUea2QDVZQ4u08sDoQPigD_pJYcFKDg@mail.gmail.com> <aebacb803aa1f3addc1c425a465ab75d3a415dc9.camel@linuxfoundation.org>
In-Reply-To: <aebacb803aa1f3addc1c425a465ab75d3a415dc9.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 30 Nov 2023 12:29:26 +0100
Message-ID: <CAHUKmYYukx7QYzUgQ1pDiAuBj43r1ceNweH8VQd+=hZPppiwqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb/systemd: enable minidebuginfo support conditionally
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000758775060b5cf765"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 11:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191499

--000000000000758775060b5cf765
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, thanks for your quick answer. I'll try to turn it into a
DISTRO_FEATURES and write a test for it then (I need to check how tests
running on the target work in poky. I'm not sure can test systemd-coredump
without target easily).

Etienne

On Thu, Nov 30, 2023 at 12:21=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hi,
>
> I saw some of this discussion on the systemd-devel list so I'm happy to
> see patches to sort out the configuration on our side, thanks!
>
> On Thu, 2023-11-30 at 12:15 +0100, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > Hi all, I sent this patch to start the conversation, but I guess
> > PACKAGE_MINIDEBUGINFO may have to be turned into a DISTRO_FEATURES
> > before this can be merged.
> > I tested this with core-image-sato after enabling systemd in
> > local.conf. I then started:
> > $ vi
> > In other terminal:
> > $ kill -SEGV $(pidof vi)
> > $ coredumpctl info
> >
> > Before the patch, I didn't get a call-stack with symbols. After the
> > patch, I get a call-stack including function names inside
> > busybox.nosuid ("read_key()").
> >
> > This is a very useful feature for debugging and/or bug reporting, so
> > I think it would make sense to make it easy to enable via a
> > DISTRO_FEATURES. I was just not sure why MINIDEBUGINFO was not a
> > DISTRO_FEATURES in the first place, and whether you would be willing
> > to enable systemd-coredump via the MINIDEBUGINFO DISTRO_FEATURES.
>
> I think we should make minidebuginfo a DISTRO_FEATURE and then key all
> the tweaks off that.
>
> I was looking at your patches and thinking we might want to enable
> minidebuginfo in poky or perhaps OE-Core by default too.
>
> A test to ensure this backtracing works and stays working would be
> really nice too! (whilst we have the context in our heads)
>
> Cheers,
>
> Richard
>

--000000000000758775060b5cf765
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, thanks for your quick answer. I&#39;ll try to turn it =
into a DISTRO_FEATURES and write a test for it then (I need to check how te=
sts running on the target work in poky. I&#39;m not sure can test systemd-c=
oredump without target easily).<br><br>Etienne</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 30, 2023 at 12:21=
=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
I saw some of this discussion on the systemd-devel list so I&#39;m happy to=
<br>
see patches to sort out the configuration on our side, thanks!<br>
<br>
On Thu, 2023-11-30 at 12:15 +0100, Etienne Cordonnier via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> wrote:<br>
&gt; Hi all, I sent this patch to start the conversation, but I guess<br>
&gt; PACKAGE_MINIDEBUGINFO may have to be turned into a DISTRO_FEATURES<br>
&gt; before this can be merged.<br>
&gt; I tested this with core-image-sato after enabling systemd in<br>
&gt; local.conf. I then started:<br>
&gt; $ vi<br>
&gt; In other terminal:<br>
&gt; $ kill -SEGV $(pidof vi)<br>
&gt; $ coredumpctl info<br>
&gt; <br>
&gt; Before the patch, I didn&#39;t get a call-stack with symbols. After th=
e<br>
&gt; patch, I get a call-stack including function names inside<br>
&gt; busybox.nosuid (&quot;read_key()&quot;).<br>
&gt; <br>
&gt; This is a very useful feature for debugging and/or bug reporting, so<b=
r>
&gt; I think it would make sense to make it easy to enable via a<br>
&gt; DISTRO_FEATURES. I was just not sure why MINIDEBUGINFO=C2=A0was not a<=
br>
&gt; DISTRO_FEATURES in the first place, and whether you would be willing<b=
r>
&gt; to enable systemd-coredump via the=C2=A0MINIDEBUGINFO=C2=A0DISTRO_FEAT=
URES.<br>
<br>
I think we should make minidebuginfo a DISTRO_FEATURE and then key all<br>
the tweaks off that.<br>
<br>
I was looking at your patches and thinking we might want to enable<br>
minidebuginfo in poky or perhaps OE-Core by default too.<br>
<br>
A test to ensure this backtracing works and stays working would be<br>
really nice too! (whilst we have the context in our heads)<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000758775060b5cf765--

