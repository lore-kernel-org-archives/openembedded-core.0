Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web09.555.1604348358637545783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 12:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vUzGJySW;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id x26so4321697uau.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 12:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N9ZPg1ZSZRhIHcv23dHorxQFPQeDFnqHTkdeDVAsWew=;
        b=vUzGJySWgLLE1Z3WhjwWONeGMAE7IKnka6MG6+nVv1eDaz/rBNUufGRuQRQqCOL0G3
         0EoI5FifJPmydwGAIWldxN7f7+RZfLFllyT5ZcuxqILasIsJxHEp9qWrqaZjU7WIa5Ff
         IMGkinIa44GbyqNqvLrIjYRjU7P4mDdCCFFrqtlLwhChQHJErGjn+bilRMR+DHO26ITb
         7ocT0FA7qreyFGlya61VrALQGobAPFvODDy3MwchQ9AFvVwGwPoFDG7gObtxYmuiOWpQ
         a7Xc2pOXxoiWXjV4RClILSLa9kz8Zipz9Rn6uZd9NjaRmTOTe0bA4Wz22RJGksJs5rv2
         VqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N9ZPg1ZSZRhIHcv23dHorxQFPQeDFnqHTkdeDVAsWew=;
        b=FHMxwI0ycE90Lr4wPKc/pXUkUrhnaBFdqQKMOT+X6c83vUjqXd2eY4Wl0+1hHPhaGT
         JkNf3UCDdINWFrH6OeXdz+y4+dfES1t17obkCssjA80N7YIY84kuw7VIRi9KoRyOXHgU
         5l58iDCK76CMZVQuIwUyLXi9au307OhFsIe+5G3riWps2F/SidO3WpWOxTj7RC2TMEL8
         Yz4f0abQh5sQtJrG9VqOjvcoj3AIh+hBNXNpngz1JVglFE/XR1aEtBAw/PmfR7SM2wDR
         /RyX1H8PH1EJXQzCX5fM4nY5ff24opSri/CajqGlfOZ0rwIDiS6btTEZWZnKuStjerv3
         PuCA==
X-Gm-Message-State: AOAM531IrKRGi3HbPl8lmcLxrhtFR6zCIVRpqzUNFb/ueolWQcL6fc6b
	LLWZjFdXAtM8+0ugyIX1+5uYAsd2mrpYCdQiODk=
X-Google-Smtp-Source: ABdhPJwZXAwf44ZWBS6WrGjOa15fE4ku9IhZBlPMfDmvKZnRSOnqGE+DODQM8/LolgFa4abIYGUQBGZrtK8BlFtee4k=
X-Received: by 2002:ab0:23cc:: with SMTP id c12mr4643444uan.89.1604348357843;
 Mon, 02 Nov 2020 12:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
 <20201102164907.27572-48-alex.kanavin@gmail.com> <3f8aa9dc-ef61-e498-2e3a-1c3efddad253@gmail.com>
 <1643C0CD4D3FE498.21917@lists.openembedded.org>
In-Reply-To: <1643C0CD4D3FE498.21917@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 2 Nov 2020 21:19:06 +0100
Message-ID: <CANNYZj9bGNCJZKWg9d0rViSuCmOMVr+8jssPRXWKfWy84NKxmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 48/80] kea: upgrade 1.7.10 -> 1.9.1
To: akuster808 <akuster808@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000f7221405b3257553"

--000000000000f7221405b3257553
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2020 at 18:24, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> I guess we do, which means the recipe should inherit upstream-version is
> even, to avoid erroneous updates to development series.
>
> This patch can be dropped then, to be replaced later by 1.8 update.
>

I sent a replacement patch to use only even versions. Then AUH should re-do
the update to 1.8.x in a couple weeks.

Alex

--000000000000f7221405b3257553
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 2 Nov 2020 at 18:24, Alexander Kanavin via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a h=
ref=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr">I guess we do, which means the recipe should inherit =
upstream-version is even, to avoid erroneous updates to development series.=
<div class=3D"gmail_quote"><div><br></div><div>This patch can be dropped th=
en, to be replaced later by 1.8 update.<br></div></div></div></blockquote><=
div><br></div><div>I sent a replacement patch to use only even versions. Th=
en AUH should re-do the update to 1.8.x in a couple weeks.</div><div><br></=
div><div>Alex<br></div></div></div>

--000000000000f7221405b3257553--
