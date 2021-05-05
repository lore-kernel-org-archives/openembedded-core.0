Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.1150.1620240367926952339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cQWMOMgp;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id b4so1603446vst.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jJg9pa13PndNBCdxyOFgb/TtpnRZqsF3zXdB5WMJflM=;
        b=cQWMOMgp4Os9263f8xfYQNSw9I7XGP+qy5CMQ9Uunw9ghGZH+0NYH1oJfXSAc/M0+p
         cBvEzeKm7u0Oyh2/OEEsZR9GOU+fCaIWZboVPL8RSAqyAyDd1tnozNoYYlcJvdZTDR6C
         bLhBNAOBuqCquKikOP4XArd09ROwcgKJ4OSaDZoACPV/IYLRANxUl2+5IFNJymNwXPzn
         5KMt4Ssrol8TRyQcH2cDp76kr5diGHye8WLkBuki4qAr6i4FSDh8oakzxSKfWb2TXgzb
         BwhLPaSLYncXF8eCbr5mZEngUjBJiWak1WTIFCffHyrnZcV5YcMHrnGhQNrb3UkJMx/i
         5WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jJg9pa13PndNBCdxyOFgb/TtpnRZqsF3zXdB5WMJflM=;
        b=BEcDUcaDivtV5Itj7oDRimc3MYLmfFxPlG93LtxM6H7maOpUC77Pqz0AbxMQP/SExf
         Ne11b7Y5B3+LXdrS/9vD+UHZoRlbegiDYImz4FDW2pctEW9vgmMUHtpGinUOLb9GRPOo
         XzKLyK7SypEUSTE2Y/lHjAhMVG5OVnAaUDkzHNOg1mqZIoEVAOAdfGpJwO/gtKgdb9Ew
         qhO69FfG0pT3H3SzJaq0caJfZOK4JH60Sb621Q1z5Lg/Njccoz0t1sk+js4G3Za1Jblj
         MwDxVcalOd91XyDZQmGhuLH4jSH9Lo6lEN49kyUAH9AqGnRFlQDKKK5cgQmFHdFT1kiC
         W04Q==
X-Gm-Message-State: AOAM531m3DpSP/1QOens5VC+uEEO6w9hszRBnl1www8oWYtLDcBIx15H
	96IZ+dRaQ336uxzqadORq4JUv5xH3ZNMh71isGE=
X-Google-Smtp-Source: ABdhPJxozWEGQPtY0eaD8SVwJ/K/OlDvpvIalDxPUOnoHwvwnE1B6F7dy8aIErknO7F/EDcfscDlPBW3NGoXEvWHPrM=
X-Received: by 2002:a67:c401:: with SMTP id c1mr175207vsk.51.1620240367091;
 Wed, 05 May 2021 11:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-58-alex.kanavin@gmail.com> <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
In-Reply-To: <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 5 May 2021 20:45:55 +0200
Message-ID: <CANNYZj9scBK7xAZpR1A3Fs9AiC8MT_EZHqszbGfiAkZSZgMYwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 58/61] gi-docgen: add a recipe and class
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008804a705c1999b70"

--0000000000008804a705c1999b70
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 May 2021 at 20:05, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > This seems to be the gtk-doc successor, and gnome
> > projects such as pango and gdk-pixbuf have started
> > transitioning to it.
> >
>
> going through
> https://gitlab.gnome.org/GNOME/gi-docgen#disclaimer
>
> it seems that its still under development and not declared stable, so
> I am wary of the churn it will cause.
> I would prefer to wait until at least its declared prime time for
> system wide inclusion.
>

It is only built if you enable api-documentation, and even then used only
in pango and gdk-pixbuf. I'd say it's fairly well contained.

Alex

--0000000000008804a705c1999b70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 5 May 2021 at 20:05, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Wed, May 5, 2021 at 8:20 AM Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.ka=
navin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This seems to be the gtk-doc successor, and gnome<br>
&gt; projects such as pango and gdk-pixbuf have started<br>
&gt; transitioning to it.<br>
&gt;<br>
<br>
going through<br>
<a href=3D"https://gitlab.gnome.org/GNOME/gi-docgen#disclaimer" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gi-docgen#disclaim=
er</a><br>
<br>
it seems that its still under development and not declared stable, so<br>
I am wary of the churn it will cause.<br>
I would prefer to wait until at least its declared prime time for<br>
system wide inclusion.<br></blockquote><div><br></div><div>It is only built=
 if you enable api-documentation, and even then used only in pango and gdk-=
pixbuf. I&#39;d say it&#39;s fairly well contained.</div><div><br></div><di=
v>Alex<br></div></div></div>

--0000000000008804a705c1999b70--
