Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.3779.1620852086129308940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 13:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ltPTDaUu;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id di13so28635318edb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 13:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZueszJeOQLm8YO5IL4VPvkGOuHO+PqFi9QFhx2lgfhc=;
        b=ltPTDaUuPnQT2aNPt4iVT8JwSO4Ao56kDLct4x6C4QrEzv1AuIu0v9SAZcwoBL7/5d
         07ruhAM/xr2F+cK7WaYqJnfUOL8Vr7pmzC7htW63czO9IdILJM9mB5elm4Fvnd5lnxIb
         xUlCfafb5GmMcg7j4mYNhKp4NeayEvCtHhc9iGn5nzwy3xEZE+9WeH/ZqCktK4HjTXll
         oen6v5+0Qt6W6SkFOldaurF+AQ92yxjzhZbugQkgstTf4t1G5WNo8G00DbhD0JCWG6sF
         h+JH1o+A7Egg5PyPzDMiZxyO1+iCSrEUHqv95/M4OQ0GoPOVs2/rQRN9am2DRN1APTWI
         kGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZueszJeOQLm8YO5IL4VPvkGOuHO+PqFi9QFhx2lgfhc=;
        b=q9Q2ENrbsDT4Z2qmqUonaCeViyaVKuNwkzkFSNtoUgPwtovZqoQhSjas+dIl1HUfGe
         56f9A6Mr2DNLqwDRKrSqob+YzDU0Yy4psuWGBLmCejUorKrzi7SP8gu2qQrUyNjaoCEm
         f7Y9BT0J5I8wY9i5QGzbLAF/YkQ6iPZ45LEa1mdPDNe69N1uRqhXRbyWF/5R3GgE3yB+
         V1kjO9IvWLHXdSUb3T2x1usIjdQGJjN1lEA65RFE7UbOcrXD4b5/TPxp0pmfCgPnCB9+
         7UlBii62VNAgaBkMi0rBxWV6KAzK3rZUR0Q7LHeuS6trY5QETMqRbl7ITDZM25CYo2uE
         5oxg==
X-Gm-Message-State: AOAM5307mqKO1f4GFneJ39hFxqUY1JiDW3p7HkPuUZSZkuVJTJLpsWcs
	J6YpjK9JWyEQf1MY9cx5eRg/6Q1OvD/WjQRqcYA=
X-Google-Smtp-Source: ABdhPJwTCHjzQ6tYG0+lvfXzzHxBCDZ/3QlmecUW2bwxydWFpQX+8MgxtPynK8SobyJ10Y8fT5xGK7H6xdFMSmKA6+4=
X-Received: by 2002:a50:fc97:: with SMTP id f23mr44300326edq.311.1620852084652;
 Wed, 12 May 2021 13:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
In-Reply-To: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 12 May 2021 22:41:13 +0200
Message-ID: <CA+chaQfifcU+SLZmJ4np9bnoxyRFx_0BVeJBkQK-BOUQ+A77hg@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: colin walters <walters@verbum.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bd407505c2280838"

--000000000000bd407505c2280838
Content-Type: text/plain; charset="UTF-8"

meta-oe/master
https://lists.openembedded.org/g/openembedded-devel/message/91252
meta-oe/hardknott
https://lists.openembedded.org/g/openembedded-devel/message/91253
meta-oe/gatesgarth
https://lists.openembedded.org/g/openembedded-devel/message/91254
meta-oe/dunfell
https://lists.openembedded.org/g/openembedded-devel/message/91255

It will be a while until it's merged in these still supported branches, for
older branches it would be responsibility of the unlucky people using
unsupported release to fix it on their own with .bbappend.

On Wed, May 12, 2021 at 10:34 PM colin walters <walters@verbum.org> wrote:

> (Sorry I think this isn't the right list, but I happen to still be
> subscribed to this one so...)
>
> Can someone please tell me there's a fix for yocto/bitbake failing if the
> master branch is renamed?
>
> https://github.com/ostreedev/ostree/issues/2360
>
> 
>
>

--000000000000bd407505c2280838
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">meta-oe/master <a href=3D"https://lists.openembedded.org/g=
/openembedded-devel/message/91252">https://lists.openembedded.org/g/openemb=
edded-devel/message/91252</a><br>meta-oe/hardknott <a href=3D"https://lists=
.openembedded.org/g/openembedded-devel/message/91253">https://lists.openemb=
edded.org/g/openembedded-devel/message/91253</a><br>meta-oe/gatesgarth <a h=
ref=3D"https://lists.openembedded.org/g/openembedded-devel/message/91254">h=
ttps://lists.openembedded.org/g/openembedded-devel/message/91254</a><br>met=
a-oe/dunfell <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/message/91255">https://lists.openembedded.org/g/openembedded-devel/message=
/91255</a><br><br>It will be a while until it&#39;s merged in these still s=
upported branches, for older branches it would be responsibility of the unl=
ucky people using unsupported release to fix it on their own with .bbappend=
.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, May 12, 2021 at 10:34 PM colin walters &lt;<a href=3D"mailto:w=
alters@verbum.org">walters@verbum.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">(Sorry I think this isn&#39;t the righ=
t list, but I happen to still be subscribed to this one so...)<br>
<br>
Can someone please tell me there&#39;s a fix for yocto/bitbake failing if =
the master branch is renamed?<br>
<br>
<a href=3D"https://github.com/ostreedev/ostree/issues/2360" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/ostreedev/ostree/issues/2360</a><=
br>
<br>
<br>
<br>
</blockquote></div>

--000000000000bd407505c2280838--
