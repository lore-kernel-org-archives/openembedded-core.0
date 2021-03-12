Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.6010.1615541420967795473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q6RhlrlT;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id q18so1096008uas.11
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZYREsJhTdQU/DHSld8Aq9i5UcPq8RWsVbEkn9F6oUNE=;
        b=q6RhlrlTpil/UPTPgvH7f/mDV5+bwL5sEbqfoburRUWUE6VqM0I1Q16T18k6vZE/D+
         j1AznMC/LfNRGfBBMYyMOlGT7eVPAP0sJTouLwzjL65uyK4gai3//zk5DT/GffrWxJNn
         OUcOTQMkabI3za5Ziq9Yz/yYZnbhl5Pm08BsFKEhHpbEBZJrSU5UuCyWuGR5xnSJiIyv
         yIa0q9ZmssXToDrIg6XsrcPWQdXsN8mommqvxwUte9VRyrgi2wxhjGFlzqC1i35qFE60
         KIsd4/GgXkfyJNNPtk8u8AyJHu1BvDxVTwozdU0iQDnf6EZR8CjDwVVEusEcDgGSY/jf
         nBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZYREsJhTdQU/DHSld8Aq9i5UcPq8RWsVbEkn9F6oUNE=;
        b=VBpwgsxHBGa+8GLFZ5+BI+Zqu2iL0PMDNVUzHREq9bvpuTgApy1LJlpjw/c9zb86vW
         mO7HCtzDjWfEDb8xpp+9ivtv3K144L8aNssWM5VjT8qELbooTX0izwhdBst0cgEToBlZ
         6l+l9vXcCqZZNKq4w46B31SWAKmKWV89THRpDh17WQ5Rafkyc3t5JcF1PaoSHhzuL27z
         CGCl/1RXxHCRpSQASD7yr0dPREKm3mQHFSLN+YYe4LE+SkxRUBthz+orQR999c4ClAGQ
         lmjVua3yXKAYDOYS7X2JwwiIaltDP5iZ6jOET+glf9VYOtOVAMa1I3NKhtl+3U/kKMAD
         Jr4A==
X-Gm-Message-State: AOAM533XcNsarjY2EH+R6ReK5j/uQWvPZLu/+91aE9wwWBMS1NFd5asf
	c9ijbEMUO2SAj0N/R++QpyP7aiM5b8B3o+bWpdM=
X-Google-Smtp-Source: ABdhPJzZEyaNch0Kxh7w3RW5Okq/zJKOZhgEvkDk/fhIAKMNLmUuQsIdUzL+wWJCnFpjnvKvd3ywPDqcQnzaDBLlA0I=
X-Received: by 2002:ab0:7150:: with SMTP id k16mr6500502uao.71.1615541420051;
 Fri, 12 Mar 2021 01:30:20 -0800 (PST)
MIME-Version: 1.0
References: <20210311120512.287214-1-alex.kanavin@gmail.com> <CAMKF1spZ5tYHOVeyPV7xb+KNkdyh5QUgD=UQP9Yaj8VaRH7wpA@mail.gmail.com>
In-Reply-To: <CAMKF1spZ5tYHOVeyPV7xb+KNkdyh5QUgD=UQP9Yaj8VaRH7wpA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 12 Mar 2021 10:30:08 +0100
Message-ID: <CANNYZj_UPO8RpmNC=-E_8=Jzw5+e1VFfw==GjthsVPZPDbj=OQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/2] xwayland: add a standalone recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000076527f05bd538c37"

--00000000000076527f05bd538c37
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Mar 2021 at 00:48, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Mar 11, 2021 at 4:05 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Please see here for the rationale for splitting XWayland out of
> > main xserver-xorg tree:
> > https://fedoraproject.org/wiki/Changes/XwaylandStandalone
> >
>
> I think this is a good change. Should we disable xwayland
> packageconfig in xserver-xorg recipe as well
> since I see that it gets activated with opengl wayland being in distro
> features.
> so I wonder if we can completely turn it off
>

That's done in the second patch, as it has to be atomic with dependency
adjustment in weston.

Alex

--00000000000076527f05bd538c37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, 12 Mar 2021 at 00:48, Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, Mar 11, 2021 at 4:05 AM Alexande=
r Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Please see here for the rationale for splitting XWayland out of<br>
&gt; main xserver-xorg tree:<br>
&gt; <a href=3D"https://fedoraproject.org/wiki/Changes/XwaylandStandalone" =
rel=3D"noreferrer" target=3D"_blank">https://fedoraproject.org/wiki/Changes=
/XwaylandStandalone</a><br>
&gt;<br>
<br>
I think this is a good change. Should we disable xwayland<br>
packageconfig in xserver-xorg recipe as well<br>
since I see that it gets activated with opengl wayland being in distro feat=
ures.<br>
so I wonder if we can completely turn it off<br></blockquote><div><br></div=
>That&#39;s done in the second patch, as it has to be atomic with dependenc=
y adjustment in weston.</div><div class=3D"gmail_quote"><br></div><div clas=
s=3D"gmail_quote">Alex<br></div></div>

--00000000000076527f05bd538c37--
