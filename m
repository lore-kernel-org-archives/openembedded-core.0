Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA48C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:18:08 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web08.56.1637767087884170461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qr3/Tu8w;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id a14so5967324uak.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xd7WgyQ64J6RPhFhucV4QlcIJXPJzKprCn0O5gAeUWk=;
        b=qr3/Tu8we4MbuGJuR9376Hrtgtd6jiPlHn+5Lc+3WDMLjlmUoj+dbocIl4xaJ4jKyb
         foAORvKdFqFWxxwKIVWhLJM/kRh+hQFxghSZo1hx6UqmxmBer0eC3fmb1GHj2Angx4pX
         jB/o73L5DEFUJltzHF7n0PJdWrenugrhHKP26bOcLH0xJOdPsgS4jTw7ds1QPdAUFYLU
         UsiatpqHxcd7hJeDcTqdcdu/CRF6i0/2VNHFbHenVH1MLXkUIaB+r7RtmlhDQSOQPgdL
         +2rEoX0/vvP3IGwEiJOXRUxKTtJLFJGO9VOXOJ2Iuj+f110gZvZDtMV+A3+GMC8q/IbR
         Br5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xd7WgyQ64J6RPhFhucV4QlcIJXPJzKprCn0O5gAeUWk=;
        b=sHTBRbVdAgIUxMV8w/xyf4DMLfsvop5Iw6dvH+Hxl4wUx7m4u4dERylqFzNc01WZfr
         cGhWVSJwm2f900LbgNni3bzvZ2bF8YlAY/ZWDR/v+QITbcYRgj+OunrY5eVR7MG611Uj
         R+9/XXxd1hkeowmTzU8A5E7q2lXOG1EwQsIsX3wmZWD8PVONxfLWhPRNM6kvdDkuQBQH
         MuJ+8BNNkiPdKySi7ZdNoFVbdNAqUqD9oq5cct5ODZTm7oO5t6qyhH3gMkaMGDxeqgwG
         RvjSu3OXbW9JcjmzHL6iSZDDC5oAoF6UQD8q9c7NtMuMlIgHTkDZeaNnSOY2ofH9k5iP
         lf/g==
X-Gm-Message-State: AOAM530KxnOzWaB3yf2vtzJImUmj4+XjXUjnc+zpbGpJBLEV+6YkkGcj
	fcl9LomzCb6t6eIecuX90ZXDHzEgN7tDDUNAWqE=
X-Google-Smtp-Source: 
 ABdhPJwVtaiZLV5RP12XaDF8l75DZ6KrSmJEQZB+Dq0z9BMdMMGtO3RmMradS53kgaQIg25dKzbUN8Vor2diH8KI6PM=
X-Received: by 2002:a67:846:: with SMTP id 67mr25107052vsi.7.1637767086452;
 Wed, 24 Nov 2021 07:18:06 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-6-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20211124144739.2250-6-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 16:17:54 +0100
Message-ID: 
 <CANNYZj9JQqkh3zf9a4zCbsbAWktP4K6YpFmb8fHhrn+47Eqtsw@mail.gmail.com>
Subject: Re: [RFC PATCH 05/15] bitbake: fetch2: Support archives with missing
 search directory mode
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="00000000000069b4dd05d18a5d99"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 15:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158718

--00000000000069b4dd05d18a5d99
Content-Type: text/plain; charset="UTF-8"

Is it the missing x bit on directories? If you've encountered this, then
where did it happen, and shouldn't the tarball be fixed instead?

Alex

On Wed, 24 Nov 2021 at 15:48, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  bitbake/lib/bb/fetch2/__init__.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/bitbake/lib/bb/fetch2/__init__.py
> b/bitbake/lib/bb/fetch2/__init__.py
> index 05b2d2e924..8ad4e3a5ec 100644
> --- a/bitbake/lib/bb/fetch2/__init__.py
> +++ b/bitbake/lib/bb/fetch2/__init__.py
> @@ -1554,6 +1554,7 @@ class FetchMethod(object):
>          path = data.getVar('PATH')
>          if path:
>              cmd = "PATH=\"%s\" %s" % (path, cmd)
> +        cmd += " && chmod -R +X %s" % (unpackdir)
>          bb.note("Unpacking %s to %s/" % (file, unpackdir))
>          ret = subprocess.call(cmd, preexec_fn=subprocess_setup,
> shell=True, cwd=unpackdir)
>
> --
> 2.20.1
>
>

--00000000000069b4dd05d18a5d99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Is it the missing x bit on directories? If you&#39;ve=
 encountered this, then where did it happen, and shouldn&#39;t the tarball =
be fixed instead?</div><div><br></div><div>Alex<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 24 Nov 202=
1 at 15:48, Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsm=
eier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: S=
tefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier@weidmuel=
ler.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.com</a>&gt;<b=
r>
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
---<br>
<br>
=C2=A0bitbake/lib/bb/fetch2/__init__.py | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__in=
it__.py<br>
index 05b2d2e924..8ad4e3a5ec 100644<br>
--- a/bitbake/lib/bb/fetch2/__init__.py<br>
+++ b/bitbake/lib/bb/fetch2/__init__.py<br>
@@ -1554,6 +1554,7 @@ class FetchMethod(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D data.getVar(&#39;PATH&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if path:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;PATH=3D\&quot=
;%s\&quot; %s&quot; % (path, cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &quot; &amp;&amp; chmod -R +X %s&quot=
; % (unpackdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Unpacking %s to %s/&quot; %=
 (file, unpackdir))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D subprocess.call(cmd, preexec_fn=
=3Dsubprocess_setup, shell=3DTrue, cwd=3Dunpackdir)<br>
<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--00000000000069b4dd05d18a5d99--

