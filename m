Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web08.29843.1604317635060886937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 03:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cz2Af0hJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id s25so4558767ejy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 03:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r18V43VyVnFXBDvM0mOLR8ZS4itn4kdPKxoph3S17GY=;
        b=cz2Af0hJPEtHrRzExCUVY8ByJhCjToc3WF1pohddSMYBpdcclSFyhj2U4o3lanUVcT
         ljg7qCbJ7E0LmIPXgr3mKA8OSY16hCqBMGF+rWjo58+bzEVeIYUt9dZC4IWc7YOUWPeI
         NSMbsjdcATaC+t3QTnfBTy4UnD8t66fsKCM85cNySu0benvSR3kKhIVsbOroJ0vn1jYm
         mtD/R10h6s725pm+g4VNrQMNM7yYqULX8n+Id+hb/rAhGXy1PAmXDvwOGQlli+/YAbm/
         tjvgzDQ553IL4+KgDhN0oXzT+MtmwyrazojTDgyS5CEjHvwEObrSH7nNZ7mLaKukqb4V
         wXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r18V43VyVnFXBDvM0mOLR8ZS4itn4kdPKxoph3S17GY=;
        b=T4R/m89Q5DvQvwJUI5S34i7PgjWHdQ9p0mmb4eymAWYwgUovhxd5ag0qjbdVXpXY94
         QGNhk63ttWCfgTfa/eWk1HivLKHTq+NDgGCc8eKjkWyIYebmd4dnNNkm8pu3VB13Za6m
         hfQ2N9hvqa6XGM/pnA0uK1ncpQMXOqTM3f0NbDUFwZrRLxBCQ84ak2bKnBHJahDgZJL3
         ND1R8FQD4avh8oxZk4U449WofRlXjy5YEqi0/bhT1j1oK12+lSBTJDICD8L/taxgdCBv
         DwsUivM9pq7AaqbGihkuFayUVRQC+UXt0gU1yWHjbgCoiMJdz8+8jOIMUESwlNU5qDkG
         0eLw==
X-Gm-Message-State: AOAM532IHYujQMb161ZRfynul0K1bU+ISBgExLCDztIS37d+FbTCHHVm
	/X9mXac8aTmD6/EWF76A61r4sfdOgS5FHcuhX9E=
X-Google-Smtp-Source: ABdhPJxotFmtuB9fJ8n9WTrc/Vyp+iFdgZ426YGt/t6roOS3EET3cyZEwtq5l88ON1kWRvjvYKKWl2c1UaUpXv1yODg=
X-Received: by 2002:a17:906:ca54:: with SMTP id jx20mr15662948ejb.541.1604317633481;
 Mon, 02 Nov 2020 03:47:13 -0800 (PST)
MIME-Version: 1.0
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
 <CANPvuRmmZoqHZP7pbNqHtPBqBo0VqTrftmBhh+nK7iTE_gF=wA@mail.gmail.com> <b72d77dbd65970a8aa40798545eed309957b121f.camel@linuxfoundation.org>
In-Reply-To: <b72d77dbd65970a8aa40798545eed309957b121f.camel@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 2 Nov 2020 12:47:02 +0100
Message-ID: <CA+chaQd5LzwrHzcKVEPhD-PVXgp=9ZRGmGbJXyupfmsY5x_Ndw@mail.gmail.com>
Subject: Re: [OE-core] [gastesgarth][PATCH 01/12] gstreamer1.0: Fix reproducibility issue around libcap
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a6928505b31e4e37"

--000000000000a6928505b31e4e37
Content-Type: text/plain; charset="UTF-8"

FWIW: I've sent this 1.16.3 upgrade for gatesgarth only because it was
recently merged to dunfell and going backwards for something as significant
as gstreamer might be complicated, even when we should probably start
getting used to this as dunfell is LTS and will receive minor upgrades long
after gatesgarth is dead completely.

After updating some patches to apply on 1.16.3 and disabling hls support in
plugins-bad (because it now requires GPLv3 nette >= 3 after
https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/a9c115adebeaa4f35f27953b1cb94881912e5c00
) I just didn't want to undo these 2 changes in gatesgarth branch.

I'm fine with 1.16 in oe-core, people who need 1.18 in gatesgarth (or even
dunfell) should do it in separate layer like you already prepared in
https://github.com/OSSystems/meta-gstreamer1.0/

On Mon, Nov 2, 2020 at 12:16 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2020-11-02 at 09:57 +0000, Jose Quaresma wrote:
> > I think I already know the answer but Is there any possibility to use
> > gstreamer 1.18 on gastesgarth ?
>
> Not really, we can't do version upgrades on releases in their
> maintenance cycle unless there is a really pressing reasons to take
> those risks. gatesgarth whilst not released yet, is imminently due to
> release (I hope!).
>
> Cheers,
>
> Richard
>
>

--000000000000a6928505b31e4e37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I&#39;ve sent this 1.16.3 upgrade for gatesgarth onl=
y because it was recently merged to dunfell and going backwards for somethi=
ng as significant as gstreamer might be complicated, even when we should pr=
obably start getting used to this as dunfell is LTS and will receive minor =
upgrades long after gatesgarth is dead completely.<div><br></div><div>After=
 updating some patches to apply on 1.16.3 and disabling hls support in plug=
ins-bad (because it now requires GPLv3 nette &gt;=3D 3 after <a href=3D"htt=
ps://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/a9c115adebea=
a4f35f27953b1cb94881912e5c00">https://gitlab.freedesktop.org/gstreamer/gst-=
plugins-bad/-/commit/a9c115adebeaa4f35f27953b1cb94881912e5c00</a> ) I just =
didn&#39;t want to undo these 2 changes in gatesgarth branch.</div><div><br=
></div><div>I&#39;m fine with 1.16 in oe-core, people who need 1.18 in gate=
sgarth (or even dunfell) should do it in separate layer like you already pr=
epared in=C2=A0<a href=3D"https://github.com/OSSystems/meta-gstreamer1.0/">=
https://github.com/OSSystems/meta-gstreamer1.0/</a></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 2, 202=
0 at 12:16 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2020-11-02 at 09:57 +=
0000, Jose Quaresma wrote:<br>
&gt; I think I already know the answer but Is there any possibility to use<=
br>
&gt; gstreamer 1.18 on gastesgarth ?<br>
<br>
Not really, we can&#39;t do version upgrades on releases in their<br>
maintenance cycle unless there is a really pressing reasons to take<br>
those risks. gatesgarth whilst not released yet, is imminently due to<br>
release (I hope!).<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000a6928505b31e4e37--
