Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543E1C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:30:19 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.10951.1700047808865468979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 03:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A/VEYKmh;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-507962561adso10350994e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700047807; x=1700652607; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SzJy2P6t9UPlyRpZE9bsvljbm1Dt5GgaOV+C4Onqi4o=;
        b=A/VEYKmhkWFEF1vfDs+7FLMU/Sp3ossFh16+mFS7JqNZcuX5Wl7N08oUQnJlike4pE
         6B/ppQybZ/oYvhUteWCPKAvBPmJn18FS8ifvBL05RE4tVUtsWjF/er/V8kw5+j/FRonB
         HCYCp/MsirWGpxm6854uiSPtyAgm/FAxfwpJsZH0/3S2BpzazGIEt3lgtm25GuIYA4b5
         Y/BgZCShOpoC0gqUI0hdw74a6jRhfHdJjefpNWeL+1DQTRmc54ZccBWepBa1g5YOHx/g
         PtfaF6H+WAqpSxOWx+ExaxPeqJDDp/45mxjHeUOdTeWAhOGU5mxgMSAbMSEiuhc9e4OD
         cS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700047807; x=1700652607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzJy2P6t9UPlyRpZE9bsvljbm1Dt5GgaOV+C4Onqi4o=;
        b=eRelb2P02kVlnsEYmw0/zZQK4aUY3DrBtyA7HuC7VfMYaawwMKA4OiGJa8ynKqjMoX
         8Yq0nmYBCYbU99oZsiUFCoDO7D+F9oTt/B2nuuMfZVIxXxEj0+pWV1ubLHtepRbiXZWB
         LevioNgzZBqv3bvwT3oUBB0BLi8+E4NfEJoHU+3UQ90M4utUmyC38Av+BEtvMHXHWlLr
         p8HFI7caEhaY1IgblzLFzI5bgcLgkISkTa9wGYn5kIxud60UU38IwBKw6xxLJKo5xIvZ
         bKgftOhcIg0od8A21mwFUbVoGdHkKavZucyj8sEESJxavVD1FewXg7FWXrD2akKNzSr0
         XXuA==
X-Gm-Message-State: AOJu0YyeI8elo3+PAfp/QiKsMQAOEHlJPXoa6wul3tDD974be0rJOu/e
	pqx+sSTOunMqKkvLaz6HEqag0buAwfpnGB0ET3w=
X-Google-Smtp-Source: AGHT+IFxQc2ME6kHzyvBLv8BgRzFiiTu81OxKiirWQWbdnYVOvkcJ3JheNNKemOTMfbNOq5qeeXKvN84BNhJsc2MkQk=
X-Received: by 2002:a2e:9f49:0:b0:2b6:df71:cff1 with SMTP id
 v9-20020a2e9f49000000b002b6df71cff1mr3941663ljk.52.1700047806669; Wed, 15 Nov
 2023 03:30:06 -0800 (PST)
MIME-Version: 1.0
References: <a0951c4-a5cc-15e0-91a8-f51fb5be8ed5@crashcourse.ca> <0E9B17AD-8CA7-4C05-B2ED-1B976D1FC4DC@arm.com>
In-Reply-To: <0E9B17AD-8CA7-4C05-B2ED-1B976D1FC4DC@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Nov 2023 12:29:54 +0100
Message-ID: <CA+chaQdV+EQhy+otrcuo2HkTwEDaf2ToK4McnJPL7gE0M=0L7g@mail.gmail.com>
Subject: Re: [OE-core] how to INSANE_SKIP duplicate installed files?
To: Ross Burton <ross.burton@arm.com>
Cc: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009e2a49060a2f3987"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 11:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190588

--0000000000009e2a49060a2f3987
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> If two packages install the same filename and they=E2=80=99re both pulled=
 into an
image then that is a fatal error and you can=E2=80=99t avoid it.

RREPLACES still works, doesn't it? Not that I would recommend using it in
this case unless it's the whole RREPLACES/RCONFLICTS/RPROVIDES combo.

On Wed, Nov 15, 2023 at 12:04=E2=80=AFPM Ross Burton <ross.burton@arm.com> =
wrote:

> On 15 Nov 2023, at 10:13, Robert P. J. Day via lists.openembedded.org
> <rpjday=3Dcrashcourse.ca@lists.openembedded.org> wrote:
> >  i swear, i once did this but now i can't find the solution for
> > allowing two recipes to install duplicate files. of course, the right
> > answer is to fix the recipes but a colleague just wants to get his
> > build to work so what is the quickest way to do the dangerous thing
> > and allow overriding installed files?
>
> Recipes can create the same file, but they can=E2=80=99t be installed at =
the same
> time.
>
> If two recipes install the same filename and they=E2=80=99re both pulled =
into the
> sysroot via DEPENDS then that is a fatal error and you can=E2=80=99t avoi=
d it.
>
> If two packages install the same filename and they=E2=80=99re both pulled=
 into an
> image then that is a fatal error and you can=E2=80=99t avoid it.
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190584):
> https://lists.openembedded.org/g/openembedded-core/message/190584
> Mute This Topic: https://lists.openembedded.org/mt/102602347/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009e2a49060a2f3987
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; If two packages install the same filename and they=E2=
=80=99re both pulled into an image then that is a fatal error and you can=
=E2=80=99t avoid it.<div><br></div><div>RREPLACES still works, doesn&#39;t =
it? Not that I would recommend using it in this case unless it&#39;s the wh=
ole RREPLACES/RCONFLICTS/RPROVIDES combo.</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 15, 2023 at 12:0=
4=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.bu=
rton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 15 Nov 2023, at 10:13, Robert P. J. Day via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> &lt;rpjday=3D<a href=3D"mailto:crashcourse.ca@lists.openembe=
dded.org" target=3D"_blank">crashcourse.ca@lists.openembedded.org</a>&gt; w=
rote:<br>
&gt;=C2=A0 i swear, i once did this but now i can&#39;t find the solution f=
or<br>
&gt; allowing two recipes to install duplicate files. of course, the right<=
br>
&gt; answer is to fix the recipes but a colleague just wants to get his<br>
&gt; build to work so what is the quickest way to do the dangerous thing<br=
>
&gt; and allow overriding installed files?<br>
<br>
Recipes can create the same file, but they can=E2=80=99t be installed at th=
e same time.<br>
<br>
If two recipes install the same filename and they=E2=80=99re both pulled in=
to the sysroot via DEPENDS then that is a fatal error and you can=E2=80=99t=
 avoid it.<br>
<br>
If two packages install the same filename and they=E2=80=99re both pulled i=
nto an image then that is a fatal error and you can=E2=80=99t avoid it.<br>
<br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190584): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190584" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190584</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102602347/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102602347/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009e2a49060a2f3987--

