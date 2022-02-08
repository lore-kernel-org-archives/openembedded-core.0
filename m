Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6718AC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:59:05 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web09.13995.1644339544965481784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gZYST0KG;
 spf=pass (domain: gmail.com, ip: 209.85.217.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id f6so4108672vsa.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d4gvXraAr51pAN1YwPMZrHOQlNjYfdNTpA/WzQuHnBA=;
        b=gZYST0KGmdKDjkx9+8t1OUy+NdBzYgptfdZwcfqyI6EgrEC7sus0X0sSoKAm+KUrSl
         qs9VYcj77zTA/G0yA2q2ZuDX5e66VHg+Qmzy6UiBJmH2VCkTJdk8ZYyLG/pgi1sM9/Gd
         Mr7gVTtMdKLimm3NnUd8SPxS1LONA0X7ymY2L8nUragB/jcOF2G8QEZXa5kGKolSjX1v
         HbXXi7ICHBzGIHXAs1usQk8ulVncp9Fi32GanRYa+Iq+E3sKUIQNxneBSMXX3YvL7Ucp
         BXzfWAO5k2DOHNv++cDlN/YKUaAN4Xrj7sl+c/dJR2DsS4SjVfUdV3RANWOD+g7iMVnC
         qLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d4gvXraAr51pAN1YwPMZrHOQlNjYfdNTpA/WzQuHnBA=;
        b=Gk8CTzT7jfF8h9lPdxiy4ra9tI3lAbFjgXdMOI9kIo1tYfS6tAlc9980qKfmGbGkQK
         mSVe+3kQKcnKW8bp7kOKu8yU37aH1jMNrlwqWCxy28M8YV631AlH3Zm7Aae6yidqux8H
         +uB73y3esjsQTDvb2V02M0CwguMQstx+o6NQktLrAYd9eTjUUNF6M39/Y2Z6gOKP6JXU
         keqw2FItuSGHRE9UcTb6t90+xWdXKZBu6LvDMip1QL9mvk5hW8PjTmpCldJFgpKVlDPg
         Dvp8tZ6Ozq62J8QIhZ0bAmcWgFcnYwHccfvM6Y1RD2I8PhBU+NPYEBsC4Ov3xjUyyFHd
         HLWA==
X-Gm-Message-State: AOAM533WQQHyjvQpTKoRKF2CqpcBqlfOF/e7pREAfwYEa1A+Qwfm+k4d
	2wlGNOa7yjJ1W8h8lThK+HDkZ285KOmyi8VOkffutnI8
X-Google-Smtp-Source: 
 ABdhPJx4uzX4B46hCgW3URkcsRaB53Zq/NuadzuK6yA3jKs+ztRIVRlXZnXK5/i29J4DJ//WjvrzKSkeLqC6QYbG6Cc=
X-Received: by 2002:a67:a401:: with SMTP id n1mr1661807vse.38.1644339544077;
 Tue, 08 Feb 2022 08:59:04 -0800 (PST)
MIME-Version: 1.0
References: 
 <CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj9_bX2BLzXWM6f+OZL9dsjDrycc8TWrZkQMkW0MznYfgg@mail.gmail.com>
 <CH0PR20MB39480F83C8949247D7968800BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
In-Reply-To: 
 <CH0PR20MB39480F83C8949247D7968800BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Feb 2022 17:58:52 +0100
Message-ID: 
 <CANNYZj8FiA8==JdmsV-ws=q+0W8hQQRPM6o0+OsGrrjpRo+gXg@mail.gmail.com>
Subject: Re: [OE-core] gio-querymodules: error while loading shared libraries:
 libffi.so.6: cannot open shared object file
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006a394f05d784a2e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 16:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161524

--0000000000006a394f05d784a2e4
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Feb 2022 at 16:25, Bryan Evenson <bevenson@melinkcorp.com> wrote:

> I traced back and I see the gio-querymodules call is inserted in the
> postrm by gio-module-class.bbclass.  Based on the commit notes, the postrm
> and postinst steps are an optimization and are not required to succeed.
> Therefore I'd argue this should fail gracefully; just because we haven't
> yet seen this fail during minor upgrade attempts doesn't mean it can't.
> I'd propose changing the line:
>
>     ${libexecdir}/${MLPREFIX}gio-querymodules ${libdir}/gio/modules/
>
> in gio-module-cache.bbclass to:
>
>     ${libexecdir}/${MLPREFIX}gio-querymodules ${libdir}/gio/modules/ ||
> true
>
> I tested this change and it fixed my upgrade issue.  I still saw the error
> message but libglib-2.0 completed its upgrade successfully.  If you don't
> see any issues with this change, I'll send a patch out later today.
>

This change will mask all failures that happen for any reason, not just the
one you saw, so I am not going to accept it. The correct fix is to figure
out what would be the correct order of updating and why opkg isn't able to
perform the mass-update in that order.

Alex

--0000000000006a394f05d784a2e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 8 Feb 2022 at 16:25, Bryan Evenson &lt;<a href=3D"mailto:bev=
enson@melinkcorp.com">bevenson@melinkcorp.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">I traced back and I see the gi=
o-querymodules call is inserted in the postrm by gio-module-class.bbclass.=
=C2=A0 Based on the commit notes, the postrm and postinst steps are an opti=
mization and are not required to succeed.=C2=A0 Therefore I&#39;d argue thi=
s should fail gracefully; just because we haven&#39;t yet seen this fail du=
ring minor upgrade attempts doesn&#39;t mean it can&#39;t.=C2=A0 I&#39;d pr=
opose changing the line:<br>
<br>
=C2=A0 =C2=A0 ${libexecdir}/${MLPREFIX}gio-querymodules ${libdir}/gio/modul=
es/<br>
<br>
in gio-module-cache.bbclass to:<br>
<br>
=C2=A0 =C2=A0 ${libexecdir}/${MLPREFIX}gio-querymodules ${libdir}/gio/modul=
es/ || true<br>
<br>
I tested this change and it fixed my upgrade issue.=C2=A0 I still saw the e=
rror message but libglib-2.0 completed its upgrade successfully.=C2=A0 If y=
ou don&#39;t see any issues with this change, I&#39;ll send a patch out lat=
er today.<br></blockquote><div><br></div></div><div class=3D"gmail_quote">T=
his change will mask all failures that happen for any reason, not just the =
one you saw, so I am not going to accept it. The correct fix is to figure o=
ut what would be the correct order of updating and why opkg isn&#39;t able =
to perform the mass-update in that order.<br></div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">Alex<br></div><div class=3D"gmail_q=
uote"><br></div></div>

--0000000000006a394f05d784a2e4--

