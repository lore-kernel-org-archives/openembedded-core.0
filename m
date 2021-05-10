Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.31046.1620650918713839657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 05:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HAzsnyji;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id h1so5184447uar.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pMEUlQ/3lp+R9etBLJBlEwAZdaW6f7R9oJexaaJ+hl0=;
        b=HAzsnyjiQvtXu2tvkgRBAY/7I0e8JeXcIXbkZSpwQkqEWRStQvFq2WNUpMpXigElei
         yhd9qRk8AnxVVzswSOsSpcX/ZhZG6mK0jQ9KajNNMYUU2POHnrFnKd9IFGNADVfXvsv4
         eQDLdc71Xuko699qS1BBI6Jeh3rWMdmC49SowltkqaDsIR/NxexWy5zOkTd7k7I9LLv9
         lcyfik5rkyC0N+SoGttCL8GMtPRokggytE8xrpnE/hlRNMLbCkBngSrFT15spxecCBpG
         CMv202vLnH9IA5rBb20yrFLkp/Rhlmfc9a8V5/CZaHqNYVXJtAx+s0m3wqdu9x9qNXD6
         0FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pMEUlQ/3lp+R9etBLJBlEwAZdaW6f7R9oJexaaJ+hl0=;
        b=fVtnOZTZ+Uw6KtirU11glQqIyszhTYvt2lOgPG+vGsyyM4hG3DtAoZQDp76zdhgDwk
         ARQj2y91sxKMvbPtljXxQJokYtQaP0/xXhGEuWZKAtmvn6v+r1vhkIOR5nuGBh/VXTen
         m99J+msy2kM50cDhgbhVR6XoodF8NUlxCgSdxyxxjTezM93C5ysq8g/HaMIUHcMj27Z5
         peJDnr54+0eRwWPnW2KpHx4ubLcleUKmuLJM+GEdZqjbX2YLti8X4Gxsf030ev2aC1Ss
         Z6xrvjp86i4QHoJ7jt2VyER1+OCcM3rNDiMG4O2DpBSYQhQTacGIIRmOgjFmEhNUghKc
         9a3Q==
X-Gm-Message-State: AOAM530go7WD4aG1nNRV5JyMgFbCcXy207X9UeBR0/r+B+XhpI3AbHfF
	79VUioK6DRTOwTc120EC1ecI5m8SyKAu8yjKJ4U=
X-Google-Smtp-Source: ABdhPJya6XkYZ+0wvmypo6kbwOewdhbxB8UWm7N7kTK4wW+VJSzYK0/dq4ZPVshF+iTpUn760s/6eDV8ljuCu5IssSI=
X-Received: by 2002:ab0:4e0b:: with SMTP id g11mr1030989uah.22.1620650917882;
 Mon, 10 May 2021 05:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-22-alex.kanavin@gmail.com> <CAMKF1spN4wQfxxiVoMmavZ+7v+gKzyU9H0wK4YAJWNV9qv7RVw@mail.gmail.com>
In-Reply-To: <CAMKF1spN4wQfxxiVoMmavZ+7v+gKzyU9H0wK4YAJWNV9qv7RVw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 10 May 2021 14:48:26 +0200
Message-ID: <CANNYZj8wm+JPZMOUCWtTHuE4jzSQNZKz+61u9fB6rgiXVf1DZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 22/61] ffmpeg: update 4.3.2 -> 4.4
To: Khem Raj <raj.khem@gmail.com>
Cc: Trevor Gamblin <Trevor.Gamblin@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000043ef5705c1f9324f"

--00000000000043ef5705c1f9324f
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 May 2021 at 20:25, Khem Raj <raj.khem@gmail.com> wrote:

> >
> > Drop mips64_cpu_detection.patch as upstream
> > has changed the code in a way that's difficult
> > to rebase.
> >
>
> Trevor was working on it and he has being trying to fix it for mips
> case as well. So lets leave this to him
>

The new version builds fine on qemumip64 (I will adjust the commit message
to mention that), so unless there is a specific way to reproduce the
failure that this patch was aiming to address, I don't think this should be
held. It's master, not a release branch.

Alex

--00000000000043ef5705c1f9324f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 5 May 2021 at 20:25, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">&gt;<br>
&gt; Drop mips64_cpu_detection.patch as upstream<br>
&gt; has changed the code in a way that&#39;s difficult<br>
&gt; to rebase.<br>
&gt;<br>
<br>
Trevor was working on it and he has being trying to fix it for mips<br>
case as well. So lets leave this to him<br></blockquote><div><br></div><div=
>The new version builds fine on qemumip64 (I will adjust the commit message=
 to mention that), so unless there is a specific way to reproduce the failu=
re that this patch was aiming to address, I don&#39;t think this should be =
held. It&#39;s master, not a release branch.</div><div><br></div><div></div=
><div>Alex</div><br></div></div>

--00000000000043ef5705c1f9324f--
