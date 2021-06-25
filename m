Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.585.1624646988722279513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 11:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tBL68u4E;
 spf=pass (domain: gmail.com, ip: 209.85.221.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id ay19so2291047vkb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 11:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IGMexqeQIozk2NFtJjYz4XyFiLkVKtOwPKfO6Q9Hce4=;
        b=tBL68u4EAr4TzS7MjlRjWXHoJ0YDSODvNh3GXx8JiF5HEtXD2Bd7EUKKhjSIwtoSOS
         iVuGKUzGEPpx0g1UIAWbpEIybmzYRR1bVdOV0Fy8lF6FgBXwg9X3nIlU0HFcW22uz+Zc
         y/BGNL6zoMvYxmw1v6kLIimJ4Wy77ZZRn/GOyNbQogHT7FtG8BtxYyQhXN1dM46ATtT4
         dLeNbdiv8ODzqBxBvapJx09Io3bciAmqA/K05VgNLOfCPGCGTu3EgIRrCdEl9XUfsAgj
         lEZatXwzKAt3x+sB3ScUo2hZh4k6D543W3oiDypDqHj5UzMg2BMcYFTfzMogtvQxQT2e
         HYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGMexqeQIozk2NFtJjYz4XyFiLkVKtOwPKfO6Q9Hce4=;
        b=a/q4vh8FLQX6244IufJinNKw+7Mu3CNRK1eQieuPbFQgxyuyoqheiB3evSqe7l2dc8
         mNBTDHGdpWbmMWIW8koCksU7lg16G+CscrPmn4O/473sFXmATXkoHLuZ3V6vee5vjVNJ
         kIrS+1TKupsLBg8nyB0mHG5LbL7T8SYAem85ujMNyyKpCnkI3yes9TroTFG3Q0h2PY/c
         OSr7q+9XpU1YdcIQ6KJMz8pchwCk1KBjOZRpmI2PZSCgr1dpsVGHICe6/dgq9nNTcLpk
         PqqvcQGa1fO5hshOqWP1u1ZyEOTpRPr4270mKskRXIdlQP/QnN3YD0F0RB5wadvuHY6U
         dB6A==
X-Gm-Message-State: AOAM531i3ypyDF/F0nQawxnauvLOenAbQU0NO1XVU48DOXhtzwViCaLV
	LMlvMC0phJdfN3ygJafiks5rePB4Q/gzPBxkNOM=
X-Google-Smtp-Source: ABdhPJxMo9ocY2rokN+HTx9CCbbRTW/YTCn9qJcB+BSMQAtFPzEBXZi8pmtAVrJ5UdQti516E/1pChwkgfjbLSDQopQ=
X-Received: by 2002:a1f:1854:: with SMTP id 81mr9558595vky.16.1624646987847;
 Fri, 25 Jun 2021 11:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
 <20210622112126.2026646-10-alex.kanavin@gmail.com> <CAAnfSTuUEK+huOm1WFyFEQctejRWi4pP8Tu6fwMuCmA9rk7s=A@mail.gmail.com>
In-Reply-To: <CAAnfSTuUEK+huOm1WFyFEQctejRWi4pP8Tu6fwMuCmA9rk7s=A@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 25 Jun 2021 20:49:36 +0200
Message-ID: <CANNYZj_Viti1hRqUuP5F10VeDz4MQe2ShV=GApfy173aO9FG4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/19] gdbm: upgrade 1.19 -> 1.20
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000989c1a05c59b9a64"

--000000000000989c1a05c59b9a64
Content-Type: text/plain; charset="UTF-8"

Yes, I think so. This can be left out then.

Alex

On Fri, 25 Jun 2021 at 18:36, Ross Burton <ross@burtonini.com> wrote:

> A ptest failed in perl with this upgrade in:
>
> gdbm_firstkey: Item not found at ../../t/lib/dbmt_common.pl line 52.
> Compilation failed in require at t/gdbm.t line 6.
>
> This might be related?
>
> Ross
>
> On Tue, 22 Jun 2021 at 12:21, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >  rename meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} (90%)
> >
> > diff --git a/meta/recipes-support/gdbm/gdbm_1.19.bb
> b/meta/recipes-support/gdbm/gdbm_1.20.bb
> > similarity index 90%
> > rename from meta/recipes-support/gdbm/gdbm_1.19.bb
> > rename to meta/recipes-support/gdbm/gdbm_1.20.bb
> > index cd2617b130..51f9d17e49 100644
> > --- a/meta/recipes-support/gdbm/gdbm_1.19.bb
> > +++ b/meta/recipes-support/gdbm/gdbm_1.20.bb
> > @@ -13,8 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
> >             file://ptest.patch \
> >            "
> >
> > -SRC_URI[md5sum] = "aeb29c6a90350a4c959cd1df38cd0a7e"
> > -SRC_URI[sha256sum] =
> "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
> > +SRC_URI[sha256sum] =
> "3aeac05648b3482a10a2da986b9f3a380a29ad650be80b9817a435fb8114a292"
> >
> >  inherit autotools gettext texinfo lib_package ptest
> >
> > --
> > 2.31.1
> >
> >
> > 
> >
>

--000000000000989c1a05c59b9a64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, I think so. This can be left out then.</div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=
=3D"ltr" class=3D"gmail_attr">On Fri, 25 Jun 2021 at 18:36, Ross Burton &l=
t;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">A ptest failed in=
 perl with this upgrade in:<br>
<br>
gdbm_firstkey: Item not found at ../../t/lib/<a href=3D"http://dbmt_common=
.pl" rel=3D"noreferrer" target=3D"_blank">dbmt_common.pl</a> line 52.<br>
Compilation failed in require at t/gdbm.t line 6.<br>
<br>
This might be related?<br>
<br>
Ross<br>
<br>
On Tue, 22 Jun 2021 at 12:21, Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/gdbm/{<a href=3D"http://gdbm_1.19.bb" rel=
=3D"noreferrer" target=3D"_blank">gdbm_1.19.bb</a> =3D&gt; <a href=3D"http=
://gdbm_1.20.bb" rel=3D"noreferrer" target=3D"_blank">gdbm_1.20.bb</a>} | 3=
 +--<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-support/gdbm/{<a href=3D"http://gdbm_1.19.b=
b" rel=3D"noreferrer" target=3D"_blank">gdbm_1.19.bb</a> =3D&gt; <a href=3D=
"http://gdbm_1.20.bb" rel=3D"noreferrer" target=3D"_blank">gdbm_1.20.bb</a>=
} (90%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.19.bb=
" rel=3D"noreferrer" target=3D"_blank">gdbm_1.19.bb</a> b/meta/recipes-supp=
ort/gdbm/<a href=3D"http://gdbm_1.20.bb" rel=3D"noreferrer" target=3D"_blan=
k">gdbm_1.20.bb</a><br>
&gt; similarity index 90%<br>
&gt; rename from meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.19.bb"=
 rel=3D"noreferrer" target=3D"_blank">gdbm_1.19.bb</a><br>
&gt; rename to meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.20.bb" r=
el=3D"noreferrer" target=3D"_blank">gdbm_1.20.bb</a><br>
&gt; index cd2617b130..51f9d17e49 100644<br>
&gt; --- a/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.19.bb" rel=
=3D"noreferrer" target=3D"_blank">gdbm_1.19.bb</a><br>
&gt; +++ b/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.20.bb" rel=
=3D"noreferrer" target=3D"_blank">gdbm_1.20.bb</a><br>
&gt; @@ -13,8 +13,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gdbm/gdbm-${PV}.tar=
.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ptest.patch \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;aeb29c6a90350a4c959cd1df38cd0a7e&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;37ed12214122b972e18a0d94995039e57748191=
939ef74115b1d41d8811364bc&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;3aeac05648b3482a10a2da986b9f3a380a29ad6=
50be80b9817a435fb8114a292&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools gettext texinfo lib_package ptest<br>
&gt;<br>
&gt; --<br>
&gt; 2.31.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000989c1a05c59b9a64--
