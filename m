Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.1497.1596607162529322867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 22:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MGXzgqms;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id f24so24546946ejx.6
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 22:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D17Jqvf4V0qGppL//46xUmbr9W1/Rvw1FexIJLVnzMw=;
        b=MGXzgqmsxmwSyIcLVqOPTt4suRgFMBkMekE7F0pVRPeIBDuQ0orKAsXWXrlQb/dD6q
         IkSYDjcm+g2RUwE2j1Xx6ucNu+Y0gFkQIL0BNiLQKuPrI8J5rdQJTpYxUC/HRmYukfEq
         q9NW42oE3Mn4oqAafVa6xwlWCjCObsdhLyQAPfLGOuEBNSoGeCQVtCWT2LUSSOVynFV4
         l4bRVdGpUo0gcUVAdd6ToyYsypY/fCkN0v/A8ztNjyHu2pGAto0Y5kVONXbAZE9QS09z
         Z6BLMkLtvkLyD3Zp64BZ2cUMh1zyEPQJ0GpZFQT58nvKflUQpYe2fXCgbyVxb/vr1nYA
         QiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D17Jqvf4V0qGppL//46xUmbr9W1/Rvw1FexIJLVnzMw=;
        b=fIg4OBEx5JLqBRdry1o4wllNjGDXErBzmHgce9C3pyDhemLVl4kX1oxqv9OclRY8eA
         P8dPLLE5cmU5b/MRDOiC9lV3394fHiVxrPB1+z6/WXzSydqjWEyMPJH4HQsyhs/5Xedk
         Gp3mbdiKJPVBcyWtf9XP7OBEEX+Gp8cwoAE2h7pRDK0JG/uIz6fQNjLshhCCS2Z0c+Pv
         mLDw8RSjtWsZnA9dNvDUBI6GpEuVb+053DoU9N+mxLk2dsEU2b4QlnpTf4mZZJFv0/t+
         /u+2MeTBdf2NwrnBXO5E3LZRi5jgWoR807sTaU0SDp2OTiBwIDyTK31Ud/Rm4iLEjN93
         EzCg==
X-Gm-Message-State: AOAM532RJTMhItZ1Q0vNS08XqTlE23km9jUAgmZ8mPIbHO7vTi5p8t4y
	H1kzUO+lQX2RF6OKvsZTxePg3pMsJEJWNzJwzx0=
X-Google-Smtp-Source: ABdhPJwt48ONliUYlI3h5bkOzeXZ+lfUD/oc1knuMrxP9uiDIKeCOQJwGbifAfql/5u6J0khckZ+eeuz9dccBfjbrTg=
X-Received: by 2002:a17:907:11dd:: with SMTP id va29mr1684880ejb.470.1596607161009;
 Tue, 04 Aug 2020 22:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596464561.git.steve@sakoman.com> <0a664b963c116786382fbba6f3386a7105a01122.1596464561.git.steve@sakoman.com>
 <a6cd8adae83c5cbe1aabc48fc2a613bc03f93f4e.camel@linuxfoundation.org>
In-Reply-To: <a6cd8adae83c5cbe1aabc48fc2a613bc03f93f4e.camel@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 5 Aug 2020 07:59:09 +0200
Message-ID: <CA+chaQdKyvwfSnMj6G=obKiUADNyVDKm20SJbhYopmDqWrqJsQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 05/12] layer.conf: fix adwaita-icon-theme signature change problem
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ad8a9605ac1b1268"

--000000000000ad8a9605ac1b1268
Content-Type: text/plain; charset="UTF-8"

We did the gtk-icon-cache.bbclass backport in:
https://git.openembedded.org/openembedded-core/commit/meta/classes/gtk-icon-cache.bbclass?h=dunfell&id=e921edd27e71af00f07e3f1e973d2b0c6c777bf4
but this fix, is only for adwaita-icon-them and other recipes using
gtk-icon-cache might need identical fix as mentioned by Khem in review of
this work around in master:
https://lists.openembedded.org/g/openembedded-core/message/140910

I guess it would be better to just
revert e921edd27e71af00f07e3f1e973d2b0c6c777bf4 in dunfell and find better
solution for master first.

Cheers,

On Tue, Aug 4, 2020 at 11:46 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2020-08-03 at 04:26 -1000, Steve Sakoman wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > allarch package adwaita-icon-theme inherit both allarch and
> > gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
> > [gtk-icon-cache.bbclass: add runtime dependency]
>
> Did we add that to dunfell? If not we don't need this fix?
>
> Cheers,
>
> Richard
>
> 
>

--000000000000ad8a9605ac1b1268
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We did the gtk-icon-cache.bbclass backport in:<div><a href=
=
=3D"https://git.openembedded.org/openembedded-core/commit/meta/classes/gtk=
-icon-cache.bbclass?h=3Ddunfell&amp;id=3De921edd27e71af00f07e3f1e973d2b0c6c=
777bf4">https://git.openembedded.org/openembedded-core/commit/meta/classes/=
gtk-icon-cache.bbclass?h=3Ddunfell&amp;id=3De921edd27e71af00f07e3f1e973d2b0=
c6c777bf4</a><br></div><div>but this fix, is only for adwaita-icon-them and=
 other recipes using gtk-icon-cache might need identical fix as mentioned b=
y Khem in review of this work around in master:</div><div><a href=3D"https:=
//lists.openembedded.org/g/openembedded-core/message/140910">https://lists.=
openembedded.org/g/openembedded-core/message/140910</a><br></div><div><br><=
/div><div>I guess it would be better to just revert=C2=A0e921edd27e71af00f0=
7e3f1e973d2b0c6c777bf4 in dunfell and find better solution for master first=
.</div><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 4, 2020 at 11:46 PM Ric=
hard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richa=
rd.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Mon, 2020-08-03 at 04:26 -1000, Steve Sakom=
an wrote:<br>
&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; <br>
&gt; allarch package adwaita-icon-theme inherit both allarch and<br>
&gt; gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62=
<br>
&gt; [gtk-icon-cache.bbclass: add runtime dependency]<br>
<br>
Did we add that to dunfell? If not we don&#39;t need this fix?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--000000000000ad8a9605ac1b1268--
