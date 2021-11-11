Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB26C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 17:45:59 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web12.2942.1636652759104148015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 09:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XzlVbO2i;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id e2so13492135uax.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 09:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3g8Hd0QCRvUoFlzDpnsx19YdaXUe3jmOt7oIBbuhS5g=;
        b=XzlVbO2iOSNVt7N35oeeThXTHQIE1PxYGWMmX6rwupcAcQtk66HCQNcLSlGMYtbD4/
         8yD+MUPi12s2Xw8qKfFz8lhSWfnEfD8aAI7YGzJV+0VhfQyU06txAfQWvPeNbbBzltUg
         0+1UzHTDyStKafGagbKciPQ/8YxwQbg5xo+jVBmKy1Ay/FdN0m8tBcHYBVOU58MyuB28
         sQJRyDfqaNSdfXSTzvzxWD0igxItwicazNUm1wgSqXgpyLzyQI4njGo+V9W7gwjtde2y
         HyE9U8jTFVrqlpqWwgl1qPEqiLeQQlWPOzRH8hulTqOq5MxGi5s9ITTBcZqGTEYFRNXE
         xGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3g8Hd0QCRvUoFlzDpnsx19YdaXUe3jmOt7oIBbuhS5g=;
        b=HmqdvOzpYxNnHNI01S59zBgmSfUsH+LCYgBC0vYMdLQmbxHp30qj5ZtaNPZbz9MjvA
         L61dRFPFB6Pk08ajc2X6rHjEbbxeKQ+kXhebXUz9cyHschXuS55livES2cyiqWrQ5Z4H
         ZLHLk1tJdi0R0TMW5/qWuW4rLHwQYM7tMaaJ2dCLhcPX9ZR2uuTZeMZfeF/ZBbfwTjEl
         f3ShQcBS1mlonYPmnDRI0kOOcKqJhL/bdtw4kaZhOZc4zsYZiU1s7v2kqSYEPLEA1Pv3
         qasKYs3ZwlLknJghgqsxh24Fr0gtID53n+SXfJQF2IfAFjHXQYs8d95b3PnjPjSI+ycV
         t15A==
X-Gm-Message-State: AOAM531PePqAJhhEjUbhCVTqiFS4TssCNlNxMtep0Xx290jn7ikaU1NW
	I6y5Tu0cecPoJoo2p9FA7trWjcD4xlGKOXAYSjM=
X-Google-Smtp-Source: 
 ABdhPJwh0a4twioBzVelUo20nM3X4VveMFZf1cax9rCtkRN4O65afDqcMlyihk7zKjiZmXiT7QDZFl8OOZHkYFwQUL8=
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr12588273uaj.89.1636652758236;
 Thu, 11 Nov 2021 09:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20211111170650.3112950-1-anibal.limon@linaro.org>
 <CAAnfSTs0RK0KnKiQgJF6F83d4QrMs+Rj2q4-bJzenwLx0MVffQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTs0RK0KnKiQgJF6F83d4QrMs+Rj2q4-bJzenwLx0MVffQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Nov 2021 18:45:46 +0100
Message-ID: 
 <CANNYZj8oBXJDN2r9y7L-u6FW=FdfKntKDW8SBjR4L+Bfh5V0cQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] recipe-graphics/waffle: Add depends on
 cmake-native
To: Ross Burton <ross@burtonini.com>
Cc: Anibal Limon <anibal.limon@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000046812105d086ea4d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 17:45:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158197

--00000000000046812105d086ea4d
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Nov 2021 at 18:40, Ross Burton <ross@burtonini.com> wrote:

>
> But why does the Meson build want CMake?
>

Maybe this?
https://gitlab.freedesktop.org/mesa/waffle/-/blob/master/src/waffle/meson.build#L238

Alex

--00000000000046812105d086ea4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 11 Nov 2021 at 18:40, Ross Burton &lt;<a href=3D"mailto:ross=
@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
But why does the Meson build want CMake?<br></blockquote><div><br></div><di=
v>Maybe this?</div><div><a href=3D"https://gitlab.freedesktop.org/mesa/waff=
le/-/blob/master/src/waffle/meson.build#L238">https://gitlab.freedesktop.or=
g/mesa/waffle/-/blob/master/src/waffle/meson.build#L238</a></div><div><br><=
/div><div>Alex<br> </div></div></div>

--00000000000046812105d086ea4d--

