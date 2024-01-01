Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ABEC4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 18:26:31 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.11523.1704133581552913000
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 10:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HEEZ/Up8;
 spf=pass (domain: mvista.com, ip: 209.85.167.44, mailfrom: skulkarni@mvista.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e741123acso6648663e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 10:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704133580; x=1704738380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ugh6SRavvipPc8tPJEf2jpIIiYXbC0vPhbXBO1hLb4=;
        b=HEEZ/Up809hW+D+VQVKsICX7K/onSYVPcp0wC6dIpJfUGch1Gt93Lp57dcVYO38t5D
         KR8i5SExmdX9CxRKQw8ZIvfcoQuN5d2M3RIKJ6yYrjyp3GLJAJ+D/cK6WlxBKDuinmR/
         EIBNSUGaH1bKnBnVe5ogFBhONtjudCXOS1RXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704133580; x=1704738380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ugh6SRavvipPc8tPJEf2jpIIiYXbC0vPhbXBO1hLb4=;
        b=l1BOI02i3NvLejEe40uPgrJS7tXq/iUiR+BTkpf2Cm6vm9z7lDo3/SjGNc1b8dN+qk
         mx47NAtK2VRgW74PqRLdvS1E6Ktruc/t3U+ofrSwzQJ6g9lc/Nquz5NGqxXJhhC7z/Pm
         yNPKafMl3UD7YEjVsXur8uiSFH/mloJTGvMAdlLHnErvBzeqqR3wuvbd3iPf1bjw5Xk+
         em+QVFI3xpR7+D35RQfeVJ13c341PVNHJ0mmiAiVd5p2GmYbU60XkuBevcTDUhCotgve
         C15KsamN8EdVaDHVr3k6N1tLUKNX84FHdEHPkOBgT5UuvY6eS7NSEL5+RahnJvjsJMCw
         0qfg==
X-Gm-Message-State: AOJu0YyfO6VSXtTcOQnPf9qlZfzWLjhYYfU+znkhmRhtyEJB+mEqZpMI
	Ik4xnr6izcgUfbmoLTyI9+/shd/cByl6VAvj23ZwCAH7njmdJg==
X-Google-Smtp-Source: AGHT+IFkvrqsJdknnh52eZZFqtS9vnMJw6pfTp5rNp3RrUS7qcGkkOMrqT0i/kGNJs7m/v+6U/sz4qObV5LyhBymjxQ=
X-Received: by 2002:a05:6512:2316:b0:50e:7cbf:7777 with SMTP id
 o22-20020a056512231600b0050e7cbf7777mr6248799lfu.79.1704133579384; Mon, 01
 Jan 2024 10:26:19 -0800 (PST)
MIME-Version: 1.0
References: <17A47110AD953EDF.18684@lists.openembedded.org>
 <CAKzga+y7yeFf95cP3qfkDpPTr0QXK+opNpCO0agT5EZu_EtdZA@mail.gmail.com> <CAOSpxdbCoxXa90ZskAAnJqHzofR7jN=PJ=f4udJRojDoLqimTQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbCoxXa90ZskAAnJqHzofR7jN=PJ=f4udJRojDoLqimTQ@mail.gmail.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Mon, 1 Jan 2024 23:56:01 +0530
Message-ID: <CAKzga+xx87rpLbCnAU4yaxfHr9DAOUBGQ75W8yEScxDxaQJ9RQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] tzdata: Upgrade to 2023d
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Armin Kuster <akuster@mvista.com>, Mahesh Mathapati <mmathapati@mvista.com>, 
	Jeremy Puhlman <jpuhlman@mvista.com>, Sam Kappen <skappen@mvista.com>
Content-Type: multipart/alternative; boundary="000000000000a63e3b060de684ce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 18:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193188

--000000000000a63e3b060de684ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Thanks for your response. Will it be possible to merge this patch in
dunfell-nut till Jan 02, if there are no issues with the patch.

Thanks,
Shubham Kulkarni

On Sat, Dec 30, 2023 at 9:03=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Sat, Dec 30, 2023 at 4:37=E2=80=AFAM Shubham Kulkarni <skulkarni@mvist=
a.com>
> wrote:
> >
> > Hi Steve,
> >
> > I have sent this patch to upgrade tzdata to the latest version "2023d"
> for dunfell branch.
> > The mailing list link for the same:
> https://lists.openembedded.org/g/openembedded-core/message/192913
> >
> > Can you please check if this patch can be accepted in the dunfell-nut
> branch of oe-core-contrib.
>
> I can take it now that it has been merged to the master branch.
>
> Steve
>
>
> > On Tue, Dec 26, 2023 at 10:44=E2=80=AFPM Shubham Kulkarni via
> lists.openembedded.org <skulkarni=3Dmvista.com@lists.openembedded.org>
> wrote:
> >>
> >> From: Shubham Kulkarni <skulkarni@mvista.com>
> >>
> >> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >> ---
> >>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-extended/timezone/timezone.inc
> b/meta/recipes-extended/timezone/timezone.inc
> >> index 2960bfefe3..75f13cfc94 100644
> >> --- a/meta/recipes-extended/timezone/timezone.inc
> >> +++ b/meta/recipes-extended/timezone/timezone.inc
> >> @@ -6,7 +6,7 @@ SECTION =3D "base"
> >>  LICENSE =3D "PD & BSD-3-Clause"
> >>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43fba"
> >>
> >> -PV =3D "2023c"
> >> +PV =3D "2023d"
> >>
> >>  SRC_URI =3D"
> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;nam=
e=3Dtzcode
> \
> >>
> http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;nam=
e=3Dtzdata
> \
> >> @@ -14,5 +14,5 @@ SRC_URI =3D"
> http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
> >>
> >>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
> >>
> >> -SRC_URI[tzcode.sha256sum] =3D
> "46d17f2bb19ad73290f03a203006152e0fa0d7b11e5b71467c4a823811b214e7"
> >> -SRC_URI[tzdata.sha256sum] =3D
> "3f510b5d1b4ae9bb38e485aa302a776b317fb3637bdb6404c4adf7b6cadd965c"
> >> +SRC_URI[tzcode.sha256sum] =3D
> "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
> >> +SRC_URI[tzdata.sha256sum] =3D
> "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
> >> --
> >> 2.42.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#192913):
> https://lists.openembedded.org/g/openembedded-core/message/192913
> >> Mute This Topic: https://lists.openembedded.org/mt/103372051/7032091
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> skulkarni@mvista.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000a63e3b060de684ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,<div><br></div><div>Thanks for your response. Wil=
l it be possible to merge this patch in dunfell-nut till Jan 02, if there a=
re no issues with the patch.</div><div><br></div><div>Thanks,</div><div>Shu=
bham Kulkarni</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sat, Dec 30, 2023 at 9:03=E2=80=AFPM Steve Sakoman &l=
t;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Dec 30, 202=
3 at 4:37=E2=80=AFAM Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvist=
a.com" target=3D"_blank">skulkarni@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Steve,<br>
&gt;<br>
&gt; I have sent this patch to upgrade tzdata to the latest version &quot;2=
023d&quot; for dunfell branch.<br>
&gt; The mailing list link for the same: <a href=3D"https://lists.openembed=
ded.org/g/openembedded-core/message/192913" rel=3D"noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-core/message/192913</a>=
<br>
&gt;<br>
&gt; Can you please check if this patch can be accepted in the dunfell-nut =
branch of oe-core-contrib.<br>
<br>
I can take it now that it has been merged to the master branch.<br>
<br>
Steve<br>
<br>
<br>
&gt; On Tue, Dec 26, 2023 at 10:44=E2=80=AFPM Shubham Kulkarni via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> &lt;skulkarni=3D<a href=3D"mailto:mvista.com@lists.=
openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org</a>&g=
t; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com"=
 target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mv=
ista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-extended/timezone/timezone.inc | 6 +++---<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/re=
cipes-extended/timezone/timezone.inc<br>
&gt;&gt; index 2960bfefe3..75f13cfc94 100644<br>
&gt;&gt; --- a/meta/recipes-extended/timezone/timezone.inc<br>
&gt;&gt; +++ b/meta/recipes-extended/timezone/timezone.inc<br>
&gt;&gt; @@ -6,7 +6,7 @@ SECTION =3D &quot;base&quot;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;PD &amp; BSD-3-Clause&quot;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc679c9d6b02b=
c2757b3eaf8f53c43fba&quot;<br>
&gt;&gt;<br>
&gt;&gt; -PV =3D &quot;2023c&quot;<br>
&gt;&gt; +PV =3D &quot;2023d&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D&quot; <a href=3D"http://www.iana.org/time-zones/=
repository/releases/tzcode$%7BPV%7D.tar.gz;name=3Dtzcode" rel=3D"noreferrer=
" target=3D"_blank">http://www.iana.org/time-zones/repository/releases/tzco=
de${PV}.tar.gz;name=3Dtzcode</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://w=
ww.iana.org/time-zones/repository/releases/tzdata$%7BPV%7D.tar.gz;name=3Dtz=
data" rel=3D"noreferrer" target=3D"_blank">http://www.iana.org/time-zones/r=
epository/releases/tzdata${PV}.tar.gz;name=3Dtzdata</a> \<br>
&gt;&gt; @@ -14,5 +14,5 @@ SRC_URI =3D&quot; <a href=3D"http://www.iana.org=
/time-zones/repository/releases/tzcode$%7BPV%7D.tar.gz" rel=3D"noreferrer" =
target=3D"_blank">http://www.iana.org/time-zones/repository/releases/tzcode=
${PV}.tar.gz</a><br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://www.iana.org/=
time-zones" rel=3D"noreferrer" target=3D"_blank">http://www.iana.org/time-z=
ones</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[tzcode.sha256sum] =3D &quot;46d17f2bb19ad73290f03a2030061=
52e0fa0d7b11e5b71467c4a823811b214e7&quot;<br>
&gt;&gt; -SRC_URI[tzdata.sha256sum] =3D &quot;3f510b5d1b4ae9bb38e485aa302a7=
76b317fb3637bdb6404c4adf7b6cadd965c&quot;<br>
&gt;&gt; +SRC_URI[tzcode.sha256sum] =3D &quot;e9a5f9e118886d2de92b62bb05510=
a28cc6c058d791c93bd6b84d3292c3c161e&quot;<br>
&gt;&gt; +SRC_URI[tzdata.sha256sum] =3D &quot;dbca21970b0a8b8c0ceceec1d7b91=
fa903be0f6eca5ae732b5329672232a08f3&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.42.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#192913): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/192913" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/192913</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1033=
72051/7032091" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/103372051/7032091</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:skulkarni@mvista.=
com" target=3D"_blank">skulkarni@mvista.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000a63e3b060de684ce--

