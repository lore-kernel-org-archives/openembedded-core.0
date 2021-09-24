Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.5157.1632470300298401255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 00:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ewnfs4MC;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id t11so5904872plq.11
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 00:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wxmZ3kemwUdg3yy04e8Y6BHtDMF+x2omlMVFkvYNOws=;
        b=Ewnfs4MCfNe7zi8z0RvYpGQ46Q6uD6Fanpl90KqibiZohEqkAnux6xn8kuMtEekpAI
         dvC9Xqhb9izRW6c6YdZOa3zcH7FbwNYjwhmZzC6mnPqiC/Z/Cpq02w04bR3tgk/HRlSE
         kRna/3kAvf+i5Rr4psC4kxtJxRNqL3/KV1vJy3FnmVkKob+tJFySJ4rgUcvJX7lQPRpk
         iJZ6Z8tSNYb6rmMfVlMiM0eF9HhMpHIMJ1dnzCUoyGbNo+CVj12+j4N34JnySBxzlqdg
         XTtHyhZ5uNZ9O1rXHMfNXV4PTi702/nd7+9h0hSAXFpYsuNFw593l0LDL2rCGGUZCgnk
         Cj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wxmZ3kemwUdg3yy04e8Y6BHtDMF+x2omlMVFkvYNOws=;
        b=ACOFMHvvsNb86tr7PjLf0UqYqAqTxb0trpOxx2Cw9Y+EOVd6pccqRNps+YmiFVtGr9
         SY0x4a+67xEkDsQ7sTDvoyMtUaqu0q470cJyw5TzAwN+sgVSpXenhh47b4zMlAUQYRBP
         WJBplrXoYlSJV2lRXQv2m21x3C/38wcJPvMjBqHjvjFMc/+gIOgqV2rLo4V3IeOJdzXl
         cmm92zkUQNoZz3ATzI/+ZQlWt1gM3WnCvLVg4+URfUWESgPUJKh71xhfSJUJsYqOWYT2
         fmOHV2GEJNb6lueIB+8S5CQHr0nKQI8+aRjV0iH6BDiNwlOx63T8POKYQNtpBiuYGhEc
         Yxig==
X-Gm-Message-State: AOAM5304t3YimvnREBUjG6ujsv6T8UPV4LPrjgzP2kEVYbwALPmvGOyI
	XG/2JYUlRD12yOMMMalf197XPvn80uXNfZ0kCAc=
X-Google-Smtp-Source: ABdhPJz2EEaIGCcZ0s5S/N48XzhLSrSTpGhiFC05uhxz9MFqcItHwrIjZ/DH1OhCab0eT+fdjb9zBpiKv5Bim6N6qQk=
X-Received: by 2002:a17:90a:c913:: with SMTP id v19mr366453pjt.169.1632470299489;
 Fri, 24 Sep 2021 00:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <20210920124621.1576702-10-richard.purdie@linuxfoundation.org>
 <c6c0603017b848fea5650c2a2273e66b@axis.com> <CAMKF1sqeyw09suOzauHvqhMfieBedsKa-JH5Qe5H+M8R0cCbgg@mail.gmail.com>
In-Reply-To: <CAMKF1sqeyw09suOzauHvqhMfieBedsKa-JH5Qe5H+M8R0cCbgg@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 24 Sep 2021 09:58:08 +0200
Message-ID: <CA+chaQeYFOeGMS0LtPYxOR5wPCwEQ0BMYJW9FRyOwNjf8N23PA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive do_build task dependencies
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004eba5605ccb91cf7"

--0000000000004eba5605ccb91cf7
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 24, 2021 at 6:51 AM Khem Raj <raj.khem@gmail.com> wrote:

> this is quite encouraging, dont go by number of lines of change :)
> btw. did you also try with other change which reduces native dependencies,
>

I've tried layer.conf change in our builds and it causes _a lot_ of
pkgconfig issues, but in most cases they are easy to spot in failed task
log and easy to fix. With ~ 100 fixed recipes I can build the images again
:). I've already merged bunch of these fixes in various layers and queued
it for others. I've seen a lot of these fixes for meta-oe layers from Khem
as well, so I think it's also getting ready. But possibly less impressive
improvement and more fixes still needed for other external layers. Maybe we
could add pkgconfig inherit in e.g. cmake.bbclass, that would at least in
my case eliminate maybe 90% cases where I needed to add pkgconfig inherit
(because native pkgconfig is called from CMake's FindPkgConfig).

--0000000000004eba5605ccb91cf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Sep 24, 2021 at 6:51 AM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">this is quite encouraging, dont go by number of lines of change=
 :)<br>
btw. did you also try with other change which reduces native dependencies,<=
br></blockquote><div>=C2=A0</div>I&#39;ve tried layer.conf change in our bu=
ilds and it causes _a lot_ of pkgconfig issues, but in most cases they are =
easy to spot in failed task log and easy to fix. With ~ 100 fixed recipes I=
 can build the images again :). I&#39;ve already merged bunch of these fixe=
s in various layers and queued it for others. I&#39;ve seen a lot of these =
fixes for meta-oe layers from Khem as well, so I think it&#39;s also gettin=
g ready. But possibly less impressive improvement and more fixes still need=
ed for other external layers. Maybe we could add pkgconfig inherit in e.g. =
cmake.bbclass, that would at least in my case eliminate maybe 90% cases whe=
re I needed to add pkgconfig inherit (because native pkgconfig is called fr=
om CMake&#39;s FindPkgConfig).=C2=A0</div></div>

--0000000000004eba5605ccb91cf7--
