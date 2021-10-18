Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8ED8C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:14:18 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.36849.1634566458088210587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EV0gpYYV;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id c4so9326084pgv.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oQG8Yfkl9WrndjLQZonksNX1xmpZTiWVeH3OCvhMulk=;
        b=EV0gpYYVL1wO+xOghBlv8dM2MYYtOHcD0+V4bXvQn31NtToA29FnSmySGTtBcqqAfZ
         gtnOeHLu5jEHJXFtD4VZUDcN7oT5mTFGidOGnOnSyCqadQrsNQgCPfBg7pY+N2FsMNS2
         N0rOJgX/MofLa+MvASB52eidGIh6y2Zp80XD+COiNMEWtGbxOYX1SXP2kdrvWecHRRSL
         t7zypOOVYhvOINzperDBaRRF/xzh7Z9hZup0JVIvRDCaWshIKcRw7XmGjBNMzHaQgSAt
         cIOVZou/EGSEsIWtoHgKWcQ7OfQOuJcc3x0FsLfdh5US2F3DBgczzTFT0hEhkRjzsJfm
         qXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oQG8Yfkl9WrndjLQZonksNX1xmpZTiWVeH3OCvhMulk=;
        b=2f2FX4OKeKlm6mkBbQEJWOrz7ZIOs2a0QlTM77brrCzqdXa/Ww2tDyGlh7TUdkfeMj
         Fw2pj8hYSvlLQz7Lmsq15KvR1TORSDabmt9xCO9gJEf5Q+AHNgkR12gM7Fe200wSoeXf
         g9ucDpuN6Lo4SE9pFZwxs1gJlqfPcGsktL41R3SqYmWMUXQO/XgCyz4vsYNJTjJXgWsc
         PdW/TfIpzplvPhO+sev4O18bbPfmk/fNbI79dJ/EeM79/xyq4gHAOL39zyFz2MxTY4sZ
         CRB2H4Tm8Xtvqridm03m4KGIt/gM6b3trssLXxnRetgFTdL6GRI5P9rbdk6RoYAh6mX/
         +NbQ==
X-Gm-Message-State: AOAM532cIOu0qiO+MOqzzGYXo40Rw6Zx2qOoPumCmNnOiVciFQ3cGtk/
	K/8fGB/yXrql04LTP57kCcVY3Ni/au43Rj1NHIoDXFei
X-Google-Smtp-Source: 
 ABdhPJxaGHDScmJd/sNzNCeJXcPLYJ7dURsFBteXtiP4HpVE5Vd3gpWZIeaCGQCNCuogmOgLYJ/sXPZE4Sxp2HVGUrs=
X-Received: by 2002:a63:ed03:: with SMTP id d3mr24143507pgi.24.1634566457678;
 Mon, 18 Oct 2021 07:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Oct 2021 16:14:06 +0200
Message-ID: 
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001261b805cea12913"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:14:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157066

--0000000000001261b805cea12913
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 4:06 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Please do send this upstream, the patch looks like a pain to rebase (and
> there's no AB config to test it).
>

Feel free to do that, I'm not interested in webkitgtk at all - just wanted
it to disappear from build failures in world CI.

--0000000000001261b805cea12913
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 4:06 PM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Please do send this upst=
ream, the patch looks like a pain to rebase (and there&#39;s no AB config t=
o test it).</div></div></blockquote><div><br></div><div>Feel free to do tha=
t, I&#39;m not interested in webkitgtk at all - just wanted it to disappear=
 from build failures in world CI.=C2=A0</div></div></div>

--0000000000001261b805cea12913--

