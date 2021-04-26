Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.5195.1619433784626081049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 03:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l/bWPS4I;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id k124so28040863vsk.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sQshKY6xL7WWzK0kBWYnMJA0KGLIx5KUfMOPcJMU7WQ=;
        b=l/bWPS4IHQZMZ+/pBuOlyP6EgGDY1BcrPXLuUpXM1Hx8KfW0Pd7TgztDET+DvQqqiG
         +0V7vQ1SPTdpMjMtIiKiHO2YIAcV4q2M3LPOOITX+s8XC0vA40Y+aQS83hOo9PNCbRvb
         3t5MEG0d6fDR0Z6mWnf5ZSCznskumT4tjqXmRAN8BI2R7upeR4jbSp68wUAII7+XoI+d
         dGvT5QG/Ila3EQDHnJtAZIFtRbcKtx9Q1Nm98OfFBQeblgHh21S/8bSq4mLLRxrtm9h/
         CvXTu6nXszn0RQKEzdmulAIdNdI5Y6W8gSfM7U+hPYFznvO8BfEVB1bqqDdTCDsu/9ic
         +GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sQshKY6xL7WWzK0kBWYnMJA0KGLIx5KUfMOPcJMU7WQ=;
        b=dtOL1kxzVMDvhGLQG+k1xnb7SF7reqCnmD17bGqyLHKUjot0EUvPQ0RQt8XPo+Hj/f
         gOMhPK8kDhCyRFuE8Pvh1CGueQ0jiY7Y75xcsGPRJt21tSriz+LKpmLeO0PAL/+hAGC4
         oQFL6bysbKeeayLRfCzu1lDIb1gVfUJrSmMVwpj+8iQgcFLWWJKEFDXD7kQE0h3y4ABE
         5tnfSV5w4fZgAyIDRUt905WeleZs73EwZdX9d/VPFf569wC5WzmNHd5S5mz/fLAylELE
         IYfQ6ovg1wY2Ux1uOMGOM4rWNRMy1z9XVNZohIm5BSdzodxcqMU6n9lq8QQHEGd9d+qh
         ENZg==
X-Gm-Message-State: AOAM533nSM6wREmsVJeJ15ssTXt/jJCW43Obfel648EH4vNkYhgfiOrY
	Rk7QIWM3rYZOe6BTjjxba1sfVQRhC1VIDRKHE4U=
X-Google-Smtp-Source: ABdhPJyi3iOZ7Bg9GZZVbbJPdMSH8i9sl+/JviORVLZ0t6GlSJ2IROgV6dzrmRpwxfYoL2O+RQ48ue434g3FZyywlh8=
X-Received: by 2002:a05:6102:409:: with SMTP id d9mr11111840vsq.54.1619433783822;
 Mon, 26 Apr 2021 03:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210423174024.705459-1-alex.kanavin@gmail.com> <20210426083906.4rsmmjryx5mso5bv@qschulz>
In-Reply-To: <20210426083906.4rsmmjryx5mso5bv@qschulz>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 26 Apr 2021 12:42:52 +0200
Message-ID: <CANNYZj8A9p1U3DtOYv5AAZrJH6i-+=RTOf_1XkN9+-SOvfCWYg@mail.gmail.com>
Subject: Re: [docs] [PATCH] dev-manual/common-tasks.rst: correct the documentation for debuginfod
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: docs <docs@lists.yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006c0b9705c0ddcfb0"

--0000000000006c0b9705c0ddcfb0
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Apr 2021 at 10:39, Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> > -To run a debuginfod server, you need to do the following:
> > +To run a ``debuginfod`` server, you need to do the following:
> >
> > --  Ensure that this variable is set in your ``local.conf`` file::
> > +-  Ensure that ``debuginfod`` is present in :term:`DISTRO_FEATURES`
> > +   (it already is in ``OpenEmbedded-core`` defaults and ``poky``
> reference distribution).
> > +   If not, set::
>
> I would add where this is supposed to be set (in a distro conf file or
> in local.conf if I'm not mistaken?), since it was an information that
> was there initially.
>
> For the rest:
> Reviewed-by: Quentin Schulz <foss@0leil.net>
>

Thanks, corrected and resent.

Alex

--0000000000006c0b9705c0ddcfb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 26 Apr 2021 at 10:39, Quentin Schulz &lt;<a href=3D"mailto:q=
uentin.schulz@streamunlimited.com">quentin.schulz@streamunlimited.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; -=
To run a debuginfod server, you need to do the following:<br>
&gt; +To run a ``debuginfod`` server, you need to do the following:<br>
&gt;=C2=A0 <br>
&gt; --=C2=A0 Ensure that this variable is set in your ``local.conf`` file:=
:<br>
&gt; +-=C2=A0 Ensure that ``debuginfod`` is present in :term:`DISTRO_FEATUR=
ES`<br>
&gt; +=C2=A0 =C2=A0(it already is in ``OpenEmbedded-core`` defaults and ``p=
oky`` reference distribution).<br>
&gt; +=C2=A0 =C2=A0If not, set::<br>
<br>
I would add where this is supposed to be set (in a distro conf file or<br>
in local.conf if I&#39;m not mistaken?), since it was an information that<b=
r>
was there initially.<br>
<br>
For the rest:<br>
Reviewed-by: Quentin Schulz &lt;<a href=3D"mailto:foss@0leil.net" target=3D=
"_blank">foss@0leil.net</a>&gt;<br></blockquote><div><br></div><div>Thanks,=
 corrected and resent.</div><div><br></div><div>Alex<br></div></div></div>

--0000000000006c0b9705c0ddcfb0--
