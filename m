Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB84DC54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 11:21:39 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.99854.1674818491242821119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 03:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ncRNLWCQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id x40so7601954lfu.12
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 03:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WHdtcIbU29mwxfchiS3QZFoRaN5u7TBH6xDtpXbKwog=;
        b=ncRNLWCQDnuLcB958P33oWKTGn8VvUDx0/TJj4kJtfImKQMO0vgTU+kHJ5HI7BNZMU
         EfHPZI4iWOQAo16XRzp3mtQA/aZsZqH/aM+uVk5KvBexnQST9BZyW8RHSh52AO4z9Anz
         tFsknYZaTjzDWq2TurzcXi77Th4Tyc3l78qFNEqynxpFcRJBraXKpWc8bhXg/hRNubQp
         /sigZ4qaSfQt2RsrEdyFT9N/xb5rSmQ2z6J6A0WjXzxtUpc1TdMRTQ39XKUJF/dfLD1R
         DYNncbyISOjo3UuJ2oId/8Xaq/QqfyZBoRVsMZG/ZXrUknLkoXoywsZ/gJcXVAFI3KXG
         HjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHdtcIbU29mwxfchiS3QZFoRaN5u7TBH6xDtpXbKwog=;
        b=eZrQ7peGr5XwWPrWRO91UtWVf1JVOLZbmUVDF93JybErFsinV+V68nV7A3cYRAW/CI
         nTdZ04a9BRLo+BULtvjePvigkvHLGYxBiOmRJLhER06vhGpyemg8225FaXJjw00Iqf91
         +kIxaYVjfV4+Q2Cni8bUSG/b7npW1H/drXAK+El+/QLCRMxE7tl7y+4eP7Q53frI+o7E
         QhOULrgFXT8iMvk8tJxsxG+fG+rvss1WR0fvwuXNXYG/yE3LBY8PezPmK+DkvYZ3vOEK
         DPmDi9EluBAyiNQ0JmI6oZAh/PrTzrm46ylJFIpzd61kUmANAUEnibvgxrkMRFf9uUjk
         CLag==
X-Gm-Message-State: AFqh2kpoiMgTqMMRvnrFOxaF0642BK9U8YKaQIDZ2KZ43lpSkJ5nh4mi
	s/fwZ4w71keVOaJOfHyWGoTxDt0ToFxIjs9tNkU=
X-Google-Smtp-Source: AMrXdXsvOAslOVjAdmUlrDB1w3/2Jv2UN4P3Ewm61Ar6VVaoOasJkZp8gXVcMEC4NjpeYyVY/1md9fNHrL1Zd6jyKIw=
X-Received: by 2002:ac2:48b9:0:b0:4d3:b528:99e8 with SMTP id
 u25-20020ac248b9000000b004d3b52899e8mr4773204lfg.2.1674818489410; Fri, 27 Jan
 2023 03:21:29 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj82XYYS6b_iEo1SiyBNckAskZuFHfjF_0beLansgO+pAA@mail.gmail.com>
 <20057.1674818345646306595@lists.openembedded.org>
In-Reply-To: <20057.1674818345646306595@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Jan 2023 12:21:18 +0100
Message-ID: <CANNYZj-tWBQL=37FBcS+8Bq523LUD+zDdmOrp=9VmpE3w_pmNg@mail.gmail.com>
Subject: Re: [OE-core] Proposal to add recipe for varlink library #poky
To: adinath.mhatre@philips.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001feae905f33d11b0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 11:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176440

--0000000000001feae905f33d11b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Meta-oe is probably better then. It doesn=E2=80=99t meet the criteria for c=
ore.

Alex

On Fri 27. Jan 2023 at 12.19, adinath.mhatre via lists.openembedded.org
<adinath.mhatre=3Dphilips.com@lists.openembedded.org> wrote:

> Since Varlink is an IPC alternative to dbus and its doesn=E2=80=99t have
> dependency on wayland .
>
> So, we don=E2=80=99t want to include meta-wayland as we don=E2=80=99t nee=
d.
>
> We have asked meta-wayland author regarding same and he is ok with moving
> varlink outside of meta-wayland.
> Upstream libvarlink recipe to poky/meta-oe =C2=B7 Issue #4 =C2=B7
> MarkusVolk/meta-wayland (github.com)
> <https://github.com/MarkusVolk/meta-wayland/issues/4>
>
> Regards,
> Adinath
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176439):
> https://lists.openembedded.org/g/openembedded-core/message/176439
> Mute This Topic: https://lists.openembedded.org/mt/96563314/1686489
> Mute #poky:
> https://lists.openembedded.org/g/openembedded-core/mutehashtag/poky
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001feae905f33d11b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Meta-oe is probably better then. It doesn=E2=80=99t meet =
the criteria for core.</div><div dir=3D"auto"><br></div><div dir=3D"auto">A=
lex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri 27. Jan 2023 at 12.19, adinath.mhatre via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;adinath.mhatre=3D<a =
href=3D"mailto:philips.com@lists.openembedded.org">philips.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><p style=3D"margin-bot=
tom:1em">Since Varlink is an IPC alternative to dbus and its doesn=E2=80=99=
t have dependency on wayland .</p>
<p style=3D"margin-bottom:1em">So, we don=E2=80=99t want to include meta-wa=
yland as we don=E2=80=99t need.<br><br>We have asked meta-wayland author re=
garding same and he is ok with moving varlink outside of meta-wayland.<br><=
a href=3D"https://github.com/MarkusVolk/meta-wayland/issues/4" target=3D"_b=
lank">Upstream libvarlink recipe to poky/meta-oe =C2=B7 Issue #4 =C2=B7 Mar=
kusVolk/meta-wayland (github.com)</a><br><br>Regards,<br>Adinath</p>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176439): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176439" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176439</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96563314/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96563314/1686489</a><br>
Mute #poky:<a href=3D"https://lists.openembedded.org/g/openembedded-core/mu=
tehashtag/poky" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/mutehashtag/poky</a><br>
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

--0000000000001feae905f33d11b0--

