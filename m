Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5F8C3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 07:24:15 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.2862.1722842652937574083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 00:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SI4OtXVu;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so14430761e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722842651; x=1723447451; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ov24qPdaxxkPaXWQGLRdWcSsIkauoQASizFv5AuBvRE=;
        b=SI4OtXVuCi+B1LBEDj7ZoFMvaM/6fBlWWVqNbS5KlM3H8RZhtHT8/uNEQwP74TXy6h
         X7vFqu1ruQuo4wElJZHSyDiTS8BdicFIIJoJ/S2oBpUs9mMKkrBJGpAw0goTELEm00dh
         rPXS5Ynv4D5BUYovORvzyVyOH3R4u+fF74v93aWsvlqm7XNShf6siH0R2JMQSvqNOfty
         jxGZomYmioM6zpRWEl0NktsMatwhNCVKyZw5l6TGhFwuwK5hWhxDEa5vLNiOkCG6BQwi
         1fNlQ5D45SB5nmQzd+Q1mu5jmZh9g4E72N1w2/ApFg/qeXJpbla4tIMs7sGmweohPpiQ
         /ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722842651; x=1723447451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ov24qPdaxxkPaXWQGLRdWcSsIkauoQASizFv5AuBvRE=;
        b=Kw988DR0ns9//jkBHPB0i0g0SjYIFhvaWZ++ykav9WMO7gMephVg0/GFwbBDqppDwB
         c0KyUln6LqLY2TgSLY345qr6JYM2y2oxBHHteM7I3wRPlHh1Ovk5PMRQPFEMGllRMNBB
         6uUIlzN+5bqIAQqAdGjC6985BP2SsLvD6TyC2marWTbkiy6wPwxR6waBo+rZIBn6Do7B
         LYw1IeYBE5ecK+0gM3EbbwTpSH8lgU/WpWpmdq4FeOvyEE/jQfiy8mvATBlmBZEcF2p4
         JVDcrH0XWoTFTTDirk3BRvuIkCuG7riG27iEqwH2+4WOIaJUVpax0u8mpb4W5zzwDtfo
         1pSA==
X-Gm-Message-State: AOJu0YxzZNNY1LlH1WDjdtn/D67nGQvWnEXQOKPzWdiHsDsmAUGZdiEk
	UI+HBQnrxpShSWVSr6PdpMtgQ5xZsfMYgfWHN4JNsB96v2YHnqXQD2tiBk97qyrKI8hEcgIkUxa
	kIWKnG7TG+nZOhNlkCEvEAFvePqk=
X-Google-Smtp-Source: AGHT+IGCF7tOI2F81kQf+GL9y+6XFcqCQBA7VoeIfICc0DrHfz9k5B82gP4EqcnG61CnNKULYLio+W5sKxxYeFLKjQ4=
X-Received: by 2002:a05:6512:2302:b0:52f:d69e:bb58 with SMTP id
 2adb3069b0e04-530bb39b7d5mr8035950e87.44.1722842650193; Mon, 05 Aug 2024
 00:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <B3Uv.1722841655976313720.1Alc@lists.openembedded.org>
In-Reply-To: <B3Uv.1722841655976313720.1Alc@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Aug 2024 10:23:58 +0300
Message-ID: <CANNYZj95DPMKjmsfPLNSrZ_T7adK9zOQyTzGgn8sy5pHptAE7A@mail.gmail.com>
Subject: Re: [OE-core] Systemd Upgradation from 250.5v to 256v in Yocto Kirkstone
To: jahnavijha14@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002b3316061eea9071"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 07:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202985

--0000000000002b3316061eea9071
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You need to first publish the layer and steps to reproduce the problem.
Otherwise it=E2=80=99s a guessing game.

Alex

On Mon 5. Aug 2024 at 10.07, jahnavijha14 via lists.openembedded.org
<jahnavijha14=3Dgmail.com@lists.openembedded.org> wrote:

> Hi,
>
> I am trying to upgrade systemd package to 256v. I have systemd 256 versio=
n
> recipe files in my custom layer. But while building ( bitbake systemd) it
> tends to always take the previous version of systemd that is 250.5. I get=
 a
> warning like this:
>
> -------------------------------------------------------------------------=
--------------------------------------------------------
> NOTE: Resolving any missing task queue dependencies
> WARNING: preferred version 256.% of systemd not available (for item udev)
> WARNING: versions of systemd available: 1:250.5
> WARNING: preferred version 256.% of systemd not available (for item
> systemd)
> WARNING: versions of systemd available: 1:250.5
>
>
> -------------------------------------------------------------------------=
-------------------------------------------------------------
>
> What could be the issue that it isn't taking the latest 256 version bb
> file during build?
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202984):
> https://lists.openembedded.org/g/openembedded-core/message/202984
> Mute This Topic: https://lists.openembedded.org/mt/107728261/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002b3316061eea9071
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You need to first publish the layer and steps to reproduc=
e the problem. Otherwise it=E2=80=99s a guessing game.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 5. Aug 2024 at 10.07, jahnav=
ijha14 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;jahnavijha14=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
<div>Hi,</div>
<div>=C2=A0</div>
<div>I am trying to upgrade systemd package to 256v. I have systemd 256 ver=
sion recipe files in my custom layer. But while building ( bitbake systemd)=
 it tends to always take the previous version of systemd that is 250.5. I g=
et a warning like this:</div>
<div>----------------------------------------------------------------------=
-----------------------------------------------------------</div>
<div>NOTE: Resolving any missing task queue dependencies<br>WARNING: prefer=
red version 256.% of systemd not available (for item udev)<br>WARNING: vers=
ions of systemd available: 1:250.5<br>WARNING: preferred version 256.% of s=
ystemd not available (for item systemd)<br>WARNING: versions of systemd ava=
ilable: 1:250.5</div>
<div>=C2=A0</div>
<div>----------------------------------------------------------------------=
----------------------------------------------------------------</div>
<div>=C2=A0</div>
<div>What could be the issue that it isn&#39;t taking the latest 256 versio=
n bb file during build?</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#202984): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/202984" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/202984</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107728261/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107728261/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002b3316061eea9071--

