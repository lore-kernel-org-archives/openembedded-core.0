Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24F2C433F5
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 20:02:32 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.9446.1653163345256542759
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 13:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A/MKdSJU;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id p4so18071445lfg.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 13:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QmENiX987i7BVG37LQTHq+hjruIxUQyOYMorlJXYFmA=;
        b=A/MKdSJUKOGgdTpzjRAIZAnHBklv4MhL8xo1jPzqXMC628BnIMI8WoUVw/bJcwnr4M
         L066tdSgVpXzobVQxuF0U7HDHmy6B+StqoNPJsr9jOTv/WqAN/yWf7VKw9MhxwQdv7hs
         nkdAtg69VpVXoxZuOpozWJRXEz8p6uEEBLhtRl2a+ibCQa1UfO31JDMR5KmiiV67ghAL
         eBjYJduhRuug5f9mnSPSSqL2BpFEngdtoLiCVNYO2NcVLSQpN1QAMUL0e2dJ+Q3sY2AK
         YQhD5ztK4Du1AFarkb2ztokmT3C1EUbj+8KadVOO+J/OTe3UeZ4me9gFi+5S+JnU/lqU
         kxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QmENiX987i7BVG37LQTHq+hjruIxUQyOYMorlJXYFmA=;
        b=Tf/pBe3HyIrnNMnNKmmKiy0gI6Y8kxsjD835nbQRgbfI+v11TZtflaHlvLFImamP+k
         g2jo/OWafE/elVUTJPtWbuUgcRHt0yr2WQebqzu8PCjFROGayoNNJbZyjflYZctiI20K
         +ApCKUazBdnJ9LvxQFyL0lWETvHfAwNANs5e351cu8cOycynKUTxhYJMH5FGXXQudOOo
         ceT8cETCyISDRg7lgP05UNHgMMLTrKGPjOQjeC98GZeFX7WVd5W1qzMzlFQF+3hKjRDB
         q/q1C3m7fcC22s9Ur47WY1VHKBJU/mciZUptxwfkUygSDCojxyEwpmwQdHXnSS10jduo
         U7LA==
X-Gm-Message-State: AOAM5319SecZrH/6kcHcbe7xkXYA1p/Z5PoU4fQcalMbrtgM/cYnd7VE
	dRZyA5MehbZ53EuWFSxUPQFW47k+N8TaoM5FqsQ=
X-Google-Smtp-Source: 
 ABdhPJzMjFtFoZ1hyTfyvs7Nmx26rqJrzJMo5BXXaip+oZ6aF19bMGQHvRMLMjRfn0vP9qUBkIlxOV17qxGMSo6njso=
X-Received: by 2002:ac2:4c42:0:b0:471:a8e2:198e with SMTP id
 o2-20020ac24c42000000b00471a8e2198emr11028258lfk.673.1653163343080; Sat, 21
 May 2022 13:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <L6Uf.1653156831053364784.vSAI@lists.openembedded.org>
In-Reply-To: <L6Uf.1653156831053364784.vSAI@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 21 May 2022 22:02:12 +0200
Message-ID: 
 <CANNYZj-Fv9gAeKdZgQ5ev393NYYKdZRN7TTPdf4A-aSzELJ9iw@mail.gmail.com>
Subject: Re: [OE-core] wic - Plans for support F2FS file system type for the
 partition?
To: Livius <egyszeregy@freemail.hu>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d1f19e05df8b15bc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 20:02:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165965

--000000000000d1f19e05df8b15bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If you can add support for it and send patches, that would be most welcome.
We don=E2=80=99t have a magic team of developers that take feature requests=
 and
implement them.

Alex

On Sat 21. May 2022 at 20.13, Livius <egyszeregy@freemail.hu> wrote:

> In OpenEmbedded Kickstart Reference manual
> <https://docs.yoctoproject.org/ref-manual/kickstart.html> there are no
> any support for F2FS filesystem <https://en.wikipedia.org/wiki/F2FS> in
> *--fstype* options. Could you support it and plan to implement? It seems
> to me this file system type can be the best for eMMC and SD cards and it =
is
> fully supported in Linux for rootfs, nowadays.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165964):
> https://lists.openembedded.org/g/openembedded-core/message/165964
> Mute This Topic: https://lists.openembedded.org/mt/91256476/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d1f19e05df8b15bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If you can add support for it and send patches, that woul=
d be most welcome. We don=E2=80=99t have a magic team of developers that ta=
ke feature requests and implement them.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat 21. May 2022 at 20.13, Livius &lt;<a href=
=3D"mailto:egyszeregy@freemail.hu">egyszeregy@freemail.hu</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">In <a href=3D"https://docs.yoctoproject.org/ref-man=
ual/kickstart.html" rel=3D"noopener" target=3D"_blank">OpenEmbedded Kicksta=
rt Reference manual</a> there are no any support for <a href=3D"https://en.=
wikipedia.org/wiki/F2FS" rel=3D"noopener" target=3D"_blank">F2FS filesystem=
</a> in <em>--fstype</em> options. Could you support it and plan to impleme=
nt? It seems to me this file system type can be the best for eMMC and SD ca=
rds and it is fully supported in Linux for rootfs, nowadays.
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165964): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165964" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165964</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91256476/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91256476/1686489</a><br>
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

--000000000000d1f19e05df8b15bc--

