Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0271EC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 15:44:06 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web08.9058.1641915844911378088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 07:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qqtE+XE6;
 spf=pass (domain: gmail.com, ip: 209.85.219.174,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id i3so48408674ybh.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 07:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hBU/kR95Y4N1jqgwhSgX+xXN70tfId5HTlf2GbHpTIM=;
        b=qqtE+XE6mPq7adaflvhH0ns4Q363F2lDLOENAcYITO0Pky+KtWIeeiztsQwkeEOofZ
         R7hHqah1ufN5vKN5SP5GPegEw75KsqYouE8Ef/8JqiXwsriVVqievdyJA+KOkbcI8p5z
         Io02+VO06BS8GIr1qEN6XSGX3yNPRt+IyqVlp6HiJyuE2COatQMkOP+klHNXfs+p6y7t
         R/7SgEWHg3EtTWfTjuRKsdshiCLDG4UtlTjv1mRKxiVMQsLg9SWGGkEI2jAeEi8eZRkj
         TMr8O1lvhuOWqwHdqFmUU01S4GtIb5cMc+5jo/vTfo3z9PYNdvoZ0WhH47ie9uPHuEGk
         pcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hBU/kR95Y4N1jqgwhSgX+xXN70tfId5HTlf2GbHpTIM=;
        b=vUel8E1yyPVAkG9CUoJxH+NOjp+Ik00RYNpjnfHX6vVXKtecSZpGDSW2/+vsJdJhk/
         z+rO4z82CNIRh5lNVhvCGsu0GpNZnnqxSlc1JNe10NVvnM3AYFabBpNQQzEAL8TG9Gwn
         SGZiWe+9dJf/AtcDjdEVKekZh4/mFyr664BpGNbNoIXDmpCVQvZoJm+DLyVgppD9LqSL
         pnCeNe+wRKqpvoAY06swpQVOWyRGhoYYsTxqGXVnmhE1IV9tNv0xoHykKgyVPiTHUpRD
         NsZ0l0C1ALM+3n/c0jYtouAUAsbsQ1H3AyNv0crNeirn4VfShagLmRL1dGo0ihePyooz
         /uBQ==
X-Gm-Message-State: AOAM532ZzgARtOldtgUxrzrpwPDcXgnxkcxLm1KPbzH2pJJPbKOAT2/7
	LRW8+S1C1hiVsqUiEEC8/28f9RA4ZnZYI6499/4=
X-Google-Smtp-Source: 
 ABdhPJwEoHG0JGeKmOH3QqXI+LFWJWKVK0lAzgW8aVAMx0d5BYZzylpBrrnX8cXjdXhmQdyhRxg0HHF/VAtaVjhxeLs=
X-Received: by 2002:a25:ae8d:: with SMTP id b13mr7702021ybj.255.1641915843958;
 Tue, 11 Jan 2022 07:44:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641911316.git.anuj.mittal@intel.com>
 <7e569186820163d731cbb14f8c25ce6a2cc45dc9.1641911316.git.anuj.mittal@intel.com>
In-Reply-To: 
 <7e569186820163d731cbb14f8c25ce6a2cc45dc9.1641911316.git.anuj.mittal@intel.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Tue, 11 Jan 2022 07:43:53 -0800
Message-ID: 
 <CAB=6tBT+drKV-5k=9WLx9HHhZux6Siv72ZxirGmiV6EeJzkYpw@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH 9/9] python3-pyelftools: fix the
 override syntax
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a15c9c05d5505269"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 15:44:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160415

--000000000000a15c9c05d5505269
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 06:33 Anuj Mittal <anuj.mittal@intel.com> wrote:

> An earlier patch cherry-picked from master used : for override. Change
> it to use _ for hardknott.


I have been using the =E2=80=9C:=E2=80=9D for override in Hardknott for som=
e time now. Why
is this being reverted?

..Ch:W..
--=20
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--000000000000a15c9c05d5505269
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Jan 11, 2022 at 06:33 Anuj Mittal &lt;<a href=3D"mailto:anuj.m=
ittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><div><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">An earlier patch cherry-picked from ma=
ster used : for override. Change<br>
it to use _ for hardknott.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I have been using the =E2=80=9C:=E2=80=9D for override in Hardkno=
tt for some time now. Why is this being reverted?</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">..Ch:W..</div></div></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div><b><span style=3D"font-family:monospace">&quot;Perfection must be =
reached by degrees; she requires the slow hand of time.&quot; - Voltaire</s=
pan></b></div></div></div>

--000000000000a15c9c05d5505269--

