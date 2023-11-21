Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB85C54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 11:12:39 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web10.37508.1700565152983385637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 03:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GU+mAtjG;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4ac20a9bb28so1905189e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700565152; x=1701169952; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WKywuHR71emfYNG3tKy5gIXWdTbwk16BnlHWHor0ypo=;
        b=GU+mAtjGvi9uCr/JOwTd80eqI/mxurgVQ4rSc4861ufHiKjTYF90eChD1gpNy/G8oe
         9Z8bIAEHv0Z3m7w+TE/b38umG0iSVkCpYwQfbmu59JlRMjTl4L1ClJkG/WVoroh/TsUu
         6MCTpeKbC/8eoFC9TVT3ENcUSdVAscc6lOLMjE+WHdjO2n44Uu6V6auo3CmQ+4L1Mx6K
         nWMs5e5oD0YrDdHPBetjyW7OQ8AjMAGJqBRmCjEPiTUOyzq4I+wCt6N10nYrOH+R/aJG
         Y2Bu+FtNyn3XbBBDm4ic3zj6qTB7YY+3HMFLQG8azalvxM59qs7+K7Hybk5eHg5663cL
         AFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700565152; x=1701169952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKywuHR71emfYNG3tKy5gIXWdTbwk16BnlHWHor0ypo=;
        b=PPPsQvLCKWr+cCaGANEy4B8KkgFUb2MBZGtPJUuCwNjyi6efngJl9wBANka1uvHKDH
         WCFY2CHYLvEvFIgYQjQqrvj2qmXIHceMGOJVby3iz82Zxa4rodt0oCj7W7R7fg6cAamk
         CW4JaB0/VrSBXVLxd10RUALOrgJVAyxyTSG6rnymi0OkkjDXXitUG6eEMb1qwyepeFxf
         KzKFuPbJ3VQcHJRmjorBm0GP2ZYu02nsUgJyw7tZiTOCqs/HdW3T16i4TeeYHv+Ag/nA
         p2lgEslQCTRmMnF8FUIgGDxsCrkhRMidWNbE1gKUmrHIJUivJclFlXL2NvVCxUmrm+K3
         be8Q==
X-Gm-Message-State: AOJu0YxqYklqIjwn6xz4qMR9rPwTtusm/ku0bd4tc6F8/ZhLKSnNJ2vN
	kXOuN5fTJmFm7I7UeqWGKdMhS+nvp0+UEpBsMN4=
X-Google-Smtp-Source: AGHT+IH623wrhYTChOGoTegJMC5NgU5YNX4Ya07SnJUCs7FixNqaOb52yoW61psjvEPu3o1d9gBLKNAnzd2g6KVgbgo=
X-Received: by 2002:a1f:da01:0:b0:4ac:8292:225f with SMTP id
 r1-20020a1fda01000000b004ac8292225fmr7621122vkg.1.1700565151943; Tue, 21 Nov
 2023 03:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
 <20231120144628.52664-3-adrian.freihofer@siemens.com> <17996456E4E8A103.7061@lists.openembedded.org>
 <CANPvuRkN=exsjS1EUiM-MKDc+HN_LT2vNrsOSYuBsnP4jmzZFw@mail.gmail.com> <d9c8d5ec4c8ae98f8b065501292fbe2d32fbbfe6.camel@gmail.com>
In-Reply-To: <d9c8d5ec4c8ae98f8b065501292fbe2d32fbbfe6.camel@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 21 Nov 2023 11:12:20 +0000
Message-ID: <CANPvuRnvgaH1_RMhcgSXcWen-+Dz6dv2RbqBNyMq0bsGQVTQMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cmake.bbclass: optionally support qemu
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cc91f8060aa7adb5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190964

--000000000000cc91f8060aa7adb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<adrian.freihofer@gmail.com> escreveu no dia segunda, 20/11/2023 =C3=A0(s) =
18:41:

> > >
> > > Are you sure this works in the majority of scenarios?
> > > Last time I worked on this qemu user mode failed to run
> > > multithreading applications.
> > >
> >
> >
> > Sorry, I was wrong above.
> > The issue was not multithreading but with the fork system call.
> >
>
> Hi Jose
>
> I was using it for running Unit Tests on the host before I deployed
> them to the target device as ptest. This worked well. It is well
> integrated with cmake and therefore also with IDEs. So I thought that
> there are certain use cases where it would be nice to have it opt-in.
>
> meson offers qemu-user as well (because of gobject). So if qemu-user is
> not usable there will be other challenges as well.
>
> There is also a MACHINE_FEATURE which allows to support it for ARCHs
> where it works well but not for ARCHs where qemu-user is known to be
> broken.
>
> I think it would be a nice optional feature.
>

I agree without any doubt on that part.

But I believe this doesn't work for applications that are using the fork
system call.
So consider this will also break any ptest using fork, giving the
wrong impression the test is failing.

Here is my attempt to add support in meson to run the ptest at build time.
https://lists.openembedded.org/g/openembedded-core/topic/89289917

Jose


>
> Regards,
> Adrian
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cc91f8060aa7adb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=3D"mailto:adrian.freihofe=
r@gmail.com">adrian.freihofer@gmail.com</a>&gt; escreveu no dia segunda, 20=
/11/2023 =C3=A0(s) 18:41:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt; &gt; <br>
&gt; &gt; Are you sure this works in the majority of scenarios?<br>
&gt; &gt; Last time I worked on this qemu user mode failed to run<br>
&gt; &gt; multithreading=C2=A0applications.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Sorry, I was wrong above.<br>
&gt; The issue was not multithreading but with the fork system call.<br>
&gt; =C2=A0<br>
<br>
Hi Jose<br>
<br>
I was using it for running Unit Tests on the host before I deployed<br>
them to the target device as ptest. This worked well. It is well<br>
integrated with cmake and therefore also with IDEs. So I thought that<br>
there are certain use cases where it would be nice to have it opt-in.<br>
<br>
meson offers qemu-user as well (because of gobject). So if qemu-user is<br>
not usable there will be other challenges as well.<br>
<br>
There is also a MACHINE_FEATURE which allows to support it for ARCHs<br>
where it works well but not for ARCHs where qemu-user is known to be<br>
broken.<br>
<br>
I think it would be a nice optional feature.<br></blockquote><div><br>I agr=
ee without any doubt on that part.<br><br>But I believe=C2=A0this doesn&#39=
;t=C2=A0work for applications=C2=A0that are using the fork system call.<br>=
So consider this will also break any ptest using fork, giving the wrong=C2=
=A0impression=C2=A0the test is failing.<br><br>Here is my attempt to add su=
pport in meson to run the ptest at build time.<br><a href=3D"https://lists.=
openembedded.org/g/openembedded-core/topic/89289917">https://lists.openembe=
dded.org/g/openembedded-core/topic/89289917</a><br><br>Jose<br>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Adrian<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000cc91f8060aa7adb5--

