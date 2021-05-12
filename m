Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web09.3776.1620852059727248348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 13:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e0lRwQUx;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id x188so7068778vsx.12
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hgiq5/iShM47N+TE/8Lp8kU2Eh30lTp92w8jbttxx7Q=;
        b=e0lRwQUxV5fOuaGg1V6xjwkfxf4aEua5GnTVy3wZu5Nfd3nszxeN5TPabxv5Uxjapx
         0hpE9wzGFF3xKwXbWr2HqTWO5ng2/3fWo9GBYBTKRGrgC957aSAZoTItM4QX8s4sSlLC
         SWYzUPS31lFWlXw80hGDpIV3OkKKpzuov7BdkCOi5JVZ5y8olNg0mkYGNvMGwfu78cz7
         QLvHHYDI41l8nCT4xnH/38wOdKCMsX+f46wzNEbkREQz2kmz5rtzgk8jXWz/s/ryKUok
         q2lmJbH234EZG9gmSH2od/FDz7hPTDV+AXlN28iQSZliMP0DzwIJ2G2at++xSGf7AKP7
         yoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hgiq5/iShM47N+TE/8Lp8kU2Eh30lTp92w8jbttxx7Q=;
        b=e6KL9iPnKo1zqzmFTu4hFFtY0dnYsGTsohoItMw+i9QfMCue81x3PfUj+yljroxHbo
         I8z1o5Tbu5DMeZrZe9nYGl2B2OD5QRlbDSRuf8os1c5wcC2gCUBRSDxQhy1L5bVoNg4q
         gFSRoE00HMEzl8J46JTakzjGsn0DtcBXYpwshaDVQq960fEKNyEkoktAdHgeqOdNE4vm
         MkiACurt3csdw+BjvWcBxv9RFwJXRJg0GGNHe8nUP4gbpgjwLJnFv9g8netckpK5cirj
         nOLZRvtNHtmWWKIjQxWNGHLgUrbFcDNXflk0YNmhcMNHEEuyqLFva048P+OwHLObM+lf
         MSVg==
X-Gm-Message-State: AOAM532hYP1f8Bcyo40dpysNj0bH9VQZGtA0Ig1WWt9K+tYBFxi7nR4l
	wCwY/Qv13c3TbH5RmcxPdDH0ZssZG/uIid5eUfY=
X-Google-Smtp-Source: ABdhPJzGeGb8Zk1Ocu7Mfx2iJ1/pj8NlkDY9BwJn6iBUOFUwnyYRONl9nbyVWTiIxM2JRENw8EIGQ7JAbMtap3SfJt0=
X-Received: by 2002:a67:c401:: with SMTP id c1mr33706119vsk.51.1620852058693;
 Wed, 12 May 2021 13:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
In-Reply-To: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 12 May 2021 22:40:47 +0200
Message-ID: <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: colin walters <walters@verbum.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000031230a05c2280781"

--00000000000031230a05c2280781
Content-Type: text/plain; charset="UTF-8"

For ostree, yes:
http://git.openembedded.org/meta-openembedded/log/?h=master-next

For the generic case, no. It's not a good idea to start guessing what the
upstream did.

Alex


On Wed, 12 May 2021 at 22:34, colin walters <walters@verbum.org> wrote:

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

--00000000000031230a05c2280781
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For ostree, yes:</div><div><a href=3D"http://git.open=
embedded.org/meta-openembedded/log/?h=3Dmaster-next">http://git.openembedde=
d.org/meta-openembedded/log/?h=3Dmaster-next</a></div><div><br></div><div>F=
or the generic case, no. It&#39;s not a good idea to start guessing what th=
e upstream did.<br></div><div><br></div><div>Alex<br></div></div><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 12 May 2021 at 22:34, colin walters &lt;<a href=3D=
"mailto:walters@verbum.org" target=3D"_blank">walters@verbum.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(Sorry I th=
ink this isn&#39;t the right list, but I happen to still be subscribed to t=
his one so...)<br>
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

--00000000000031230a05c2280781--
