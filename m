Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD41EE6450
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 10:10:02 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.17145.1694772595434706521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 03:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZhqtMHAd;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-502f20ace96so1183559e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694772593; x=1695377393; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pjNr/p/LRKmUoKuqyMnE9FPtpbfPzNaCm7TCSSwyNHI=;
        b=ZhqtMHAdtn17ajzTc7e9OdQnjk4yZZAez9WpvH2M65JK8L8ZQtoS1fuUlVuJkDWlLg
         LwahZCIHRhv2CfQzN7lB5rq5RrrIx790KE+zEB0YKKh5uL9zTXl5cLG/s2Aia2sYZjaK
         x/XsKIgBYnPTu0QEqRjWvL4sd7USQkB/LsbJ9cZFQoM5ayx1hPUYcw+wMJmMUU/jL8PP
         XHFwuutw/MrjWSXieiGAgLRUYveX1w4EHk5Ma/pT5E3o21TUF4Kvwi4BKqIksxJ8WhfC
         DGuAQDSHB3ItX+qgde7SZg/eUT2Pw4ksw/sLD+yYNSVfEZMWm/mkxX1P+pptGYk0B5B9
         Zybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694772593; x=1695377393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjNr/p/LRKmUoKuqyMnE9FPtpbfPzNaCm7TCSSwyNHI=;
        b=gw6EvJhmPpxr/KIwaVdTm5emyNpnwQ9SbWU7wOMXixee2GqsSCvJUYe1C+rxVANBPt
         wTd4mKTREQNq38G+Hvt1KhEstkIp1+ZRt4WxtpQkSwWd+2utlCw96oafF/8EDMEgIpZG
         bCsK/ARBGl7lb6fFMddrmXYQe5nSu3eZOGilDb0tThYUaTCTpEMg/HLEWCyyGL7Kfold
         lgA/CWkAt7IYtBtqKvOyg/MMtwwSve46H2E/m/7eylC/4FTSKP9D3pdaGvshK/8aMFN6
         obeo+ptQaaK2mjBONJaJNANopQz81k75hhz/+JUI9yoNdh2D481WakKJ1wQb3zYHY2p/
         3glA==
X-Gm-Message-State: AOJu0YyuF1KE5/1An4KtSazCOYJ+iETUJVQLLluTd6cUWhQG3q5nk2Oc
	R59IS5W96SPoQfJiFeXdTHk8mU7ybCBZ3cQcUH9REdFy
X-Google-Smtp-Source: AGHT+IHwjkmbbFt5YwV40TAZBpdasOYebJrS9qyM7Sp3kj6xc+vWDU20lysnAJ7/dH7mqb1F6dy5qBO4rbwlOS2nd2I=
X-Received: by 2002:a05:6512:e99:b0:4fb:7cea:882a with SMTP id
 bi25-20020a0565120e9900b004fb7cea882amr1436542lfb.3.1694772592924; Fri, 15
 Sep 2023 03:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR0102MB31362AE02753F5A7490559CAFCF6A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
In-Reply-To: <VI1PR0102MB31362AE02753F5A7490559CAFCF6A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Sep 2023 12:09:42 +0200
Message-ID: <CANNYZj_6f4C5fDBxnJt2NJ4hqJVUeJ2zJTjPeuJhANsB++Tn9A@mail.gmail.com>
Subject: Re: [OE-core] dbus patch 1916cb6 in master branch, but not in kirkstone
To: joerg.sommer@navimatix.de
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000605e18060562fe3f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 10:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187663

--000000000000605e18060562fe3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You can simply make a patch and send it. Put kirkstine in the subject
prefix.

Alex

On Fri 15. Sep 2023 at 11.54, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> Hello,
>
> the patch =C2=BBdbus: Specify runstatedir configure option=C2=AB [1] is i=
n the
> master branch, but not in the kirkstone branch. Is it possible to get it
> applied there, too? Whom can I ping for this?
>
> [1]
> https://git.yoctoproject.org/poky/commit/meta/recipes-core/dbus?id=3D1916=
cb69980dbe1de79c3809f50280567e85792b
>
> Kind regards
>
> J=C3=B6rg Sommer
> --
> Navimatix GmbH
> Tatzendpromenade 2
> 07745 Jena
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187662):
> https://lists.openembedded.org/g/openembedded-core/message/187662
> Mute This Topic: https://lists.openembedded.org/mt/101376323/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000605e18060562fe3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You can simply make a patch and send it. Put kirkstine in=
 the subject prefix.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ale=
x</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri 15. Sep 2023 at 11.54, J=C3=B6rg Sommer via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;joerg.sommer=3D<a hr=
ef=3D"mailto:navimatix.de@lists.openembedded.org">navimatix.de@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">Hello,<br>
<br>
the patch =C2=BBdbus: Specify runstatedir configure option=C2=AB [1] is in =
the master branch, but not in the kirkstone branch. Is it possible to get i=
t applied there, too? Whom can I ping for this?<br>
<br>
[1] <a href=3D"https://git.yoctoproject.org/poky/commit/meta/recipes-core/d=
bus?id=3D1916cb69980dbe1de79c3809f50280567e85792b" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.yoctoproject.org/poky/commit/meta/recipes-core/dbu=
s?id=3D1916cb69980dbe1de79c3809f50280567e85792b</a><br>
<br>
Kind regards<br>
<br>
J=C3=B6rg Sommer<br>
--=C2=A0<br>
Navimatix GmbH<br>
Tatzendpromenade 2<br>
07745 Jena<br>
<br>
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley<br>
Registergericht: Amtsgericht Jena, HRB 501480<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#187662): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/187662" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/187662</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101376323/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101376323/1686489</a><br>
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

--000000000000605e18060562fe3f--

