Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24422C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 14:39:55 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.105685.1671028787818410954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 06:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bTf+FnG0;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 1so10822888lfz.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 06:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=35l9t6RFo8ZrlREZOecRjuF0HgbV0fWXb+4l9gizoe8=;
        b=bTf+FnG0eWKlDhWKfLiRb5TEbpbT/i27yrXBv+Ohi22ckt/QXeVkAYlMHz8vdFURd5
         fUwBXZ79rhzin5Z4eb/+BQqbQ0vVao8MisUiez3p+iE2yFcF/e53htYJk3oSJDP/RwF1
         X1efe7ZtSBddxVoT8969y29CI1INpVrk1js8jbJ24NkHSTCPf1v/5YXol8pUYDYfo/jw
         YkKFU3B2GVH2Ct1B5BydM/b/4wc81cRYg+/qDdgtM+eWskEfaJhLRN9eD1mwNLT5luOG
         aBz0MrxC1gSuTu2NJKZCEDB8D39NTtfSnl7B8Wv9yt52XubEEJDq+wXD9u8wLNDkHZjd
         QdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35l9t6RFo8ZrlREZOecRjuF0HgbV0fWXb+4l9gizoe8=;
        b=17Rqt64x+Vh15nhPpT/m/8+tOJOU69YdOXO4MT9KfRfeTg+lcs14jF6dbAbdF4wCc+
         /BIQwo+6i4hK9C5N5IRanKmiXIbWVdsMyk8/Oh12ufejQxwyBketN3iG0Mq7MhhtSW2n
         laKVbMMGHylS4XoHEV+xx0Ld40d2+dspcbbYKSIL8MQjlh78u9S7TghkvwER3DH24o3w
         v/k9U0Qn6n2d6qPCd2BCooNJ8nj9PdDTDc646XfQ9xsoKtjQ35sDsg/KBaeY1pdji7Rn
         Tm2KTFn0i9d7ohbBJsx4LVRvseR8RU9PMNHziLe1F84zV3gujLG2/jaqeddcVfkDY+Yu
         qySw==
X-Gm-Message-State: ANoB5pnzX+ErJUohSrFvCP5Xft6ylJ2uq7ktvq3KPbdmPB3GrlLDYEUy
	oSseS6SCzK1SDMn0sPNmt/eSrEeHYx+b5dCheDk=
X-Google-Smtp-Source: AA0mqf6RTNPxkTO5f8A6RXDaRxUJQrEvqU+MFyGQRvMSrrVuhj6+pZkNDdyWZyOUwV0DcY+Rl0iLrZISfkJMnTkDFVI=
X-Received: by 2002:ac2:44cb:0:b0:4b5:8584:5715 with SMTP id
 d11-20020ac244cb000000b004b585845715mr5625118lfm.327.1671028785802; Wed, 14
 Dec 2022 06:39:45 -0800 (PST)
MIME-Version: 1.0
References: <1730AF3E5FBC5760.9432@lists.openembedded.org>
In-Reply-To: <1730AF3E5FBC5760.9432@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 14 Dec 2022 15:39:34 +0100
Message-ID: <CAApg2=TPX8EjoO1MMXoVNbYKccXidu741xWqSLqaFpAjMAA80A@mail.gmail.com>
Subject: Re: [kirkstone][OE-core][PATCH] efibootmgr: update compilation with musl
To: rybczynska@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002ff19305efcab5be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 14:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174556

--0000000000002ff19305efcab5be
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 14, 2022 at 3:29 PM Marta Rybczynska via lists.openembedded.org
<rybczynska=gmail.com@lists.openembedded.org> wrote:

> Since the commit 005b6aba89eaf1b79fdd7565dd028fdd9bbfcc7d
> (efivar: add musl libc compatibility) efibootmgr compiles with
> musl too. Update the variable to take that into account.
>
>
Langdale and master versions will follow in a moment, they are building now.

Kind regards,
Marta

--0000000000002ff19305efcab5be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 14, 2022 at 3:29 PM Marta=
 Rybczynska via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Since the commit 005b6aba89eaf1b79fdd75=
65dd028fdd9bbfcc7d<br>
(efivar: add musl libc compatibility) efibootmgr compiles with<br>
musl too. Update the variable to take that into account.<br>
<br></blockquote><div><br></div><div>Langdale and master versions will foll=
ow in a moment, they are building now.</div><div><br></div><div>Kind regard=
s,</div><div>Marta <br></div></div></div>

--0000000000002ff19305efcab5be--

