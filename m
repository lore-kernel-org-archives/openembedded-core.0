Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.4554.1606790449386533076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z3KBTcCW;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id x16so776313ejj.7
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 18:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aKC7pxLqHId89r/0KGTGEO+4gfLy23J6CVZRDgtBLN4=;
        b=Z3KBTcCWVw5XyaxSbUd95f+najCsRzu6XVGEjBT+ih/5K6FAXl8s6QeVVRIgYXCupP
         gSiqhiQvQYGRm/PCbvCjFxPHDJpoaW72hydcnzU8g2efQShWHK47a3iKbEb04y960QNi
         pVTNY88kuyv6EJgNuMSmu64/vG97HE22mvj9TTcRKUbMumExDdWBVf3S4EwRvoiJ7LSW
         dGCGvO9UED2FaPkL/E5a6ZOSQ64JH121T6YccYbDzpX/6t3rfVJ9FzsAVn3q4Rp2SF3W
         6FyGV0sFS0N8TtgXOlpzhaubqiBolp9v0Q4cuKnf52PCs9njxzuVcvucwCL9VId0rUF0
         o0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aKC7pxLqHId89r/0KGTGEO+4gfLy23J6CVZRDgtBLN4=;
        b=lsW/i9PrN796pHx20dakIpAuLVMUA0qs2bKiMCy3Yhi81zcqzgVtIckI+ULa19pka3
         AMsoXfBA5glZzAYw5CSlU3ses+x6OeFU+azPxFjIUU6Igr+um3342wLJGbNnaUUkYm3q
         kN3Vf8lyigtN5CcbmWWDJzGp4jsr9dGyMfKV0bW+LZjoheIRMm5C5Q9JQ4IOQLMN56LR
         klCXm24zMEWxztBuPopOCiPAt29Rk+AykreKgKcKTStkRQ9LjUR6nlYAz4vJTpchqW2a
         QvL5tjdCoksU4X1kjdcyKlnNTBAXU5mi8fJaV2ST9YZQq/Lu2oELgOwVFRqkmWTY+tTm
         59bA==
X-Gm-Message-State: AOAM533c/yvolbKeZrtFjR/3fTxqAWN6uMHM2SSwz2QYnzVlMXQy7sSo
	ae31fUDVuRKfZ+KzaCFU8YH9Xa/UzvrUCvbA50w=
X-Google-Smtp-Source: ABdhPJyQlg/L0xcgJHmBFrxu20hBkKLvCUJNZepRW+TlaPKgYqPg5WPDfEqP2kvNM77y4iwYR9tYDL4Et14oSgwKliA=
X-Received: by 2002:a17:906:fa8b:: with SMTP id lt11mr967229ejb.94.1606790447243;
 Mon, 30 Nov 2020 18:40:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606352479.git.paul.eggleton@linux.microsoft.com>
 <3cbf479d1c740e65e5c2fdaae2b060910766b1c6.1606352479.git.paul.eggleton@linux.microsoft.com>
 <3140175.5fSG56mABF@linc>
In-Reply-To: <3140175.5fSG56mABF@linc>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 30 Nov 2020 18:40:36 -0800
Message-ID: <CA+chaQdMdRJJTQfTADj5TjJWm4y4kOj7X5_FChaG_zX5TsBmSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] classes/kernel*: allow disabling symlink creation
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d6256805b55e0d59"

--000000000000d6256805b55e0d59
Content-Type: text/plain; charset="UTF-8"

Can we use a separate variable controlling this behavior other than
*_LINK_NAME variables being set to empty?

Then we could easily extend it to stop creating the links also for image
artifacts as well.

On Thu, Nov 26, 2020 at 7:55 PM Paul Eggleton <
bluelightning@bluelightning.org> wrote:

> On Thursday, 26 November 2020 14:01:47 NZDT Paul Eggleton wrote:
> > From: Paul Eggleton <paul.eggleton@microsoft.com>
> >
> > Allow setting any of the *_LINK_NAME variables to empty string in order
> > to disable creating symlinks. This is particularly useful for situations
> > where symlinks in DEPLOY_DIR_IMAGE will be treated externally as
> > duplicates of the linked files (in which case you would probably set
> > KERNEL_ARTIFACT_LINK_NAME = "" to disable them all at once).
>
> I missed something - v2 incoming.
>
> Cheers
> Paul
>
>
>
>
> 
>
>

--000000000000d6256805b55e0d59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can we use a separate variable controlling this behavior o=
ther than *_LINK_NAME variables being set to empty?<div><br></div><div>Then=
 we could easily extend it to stop creating the links also for image artifa=
cts as well.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Nov 26, 2020 at 7:55 PM Paul Eggleton &lt;<a href=
=
=3D"mailto:bluelightning@bluelightning.org">bluelightning@bluelightning.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thursday, 26 November 2020 14:01:47 NZDT Paul Eggleton wrote:<br>
&gt; From: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@microsoft.com=
" target=3D"_blank">paul.eggleton@microsoft.com</a>&gt;<br>
&gt; <br>
&gt; Allow setting any of the *_LINK_NAME variables to empty string in ord=
er<br>
&gt; to disable creating symlinks. This is particularly useful for situati=
ons<br>
&gt; where symlinks in DEPLOY_DIR_IMAGE will be treated externally as<br>
&gt; duplicates of the linked files (in which case you would probably set<=
br>
&gt; KERNEL_ARTIFACT_LINK_NAME =3D &quot;&quot; to disable them all at onc=
e).<br>
<br>
I missed something - v2 incoming.<br>
<br>
Cheers<br>
Paul<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d6256805b55e0d59--
