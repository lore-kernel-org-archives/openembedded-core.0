Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB1AC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:14:44 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web08.46.1637766883792100735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OFG6bpGa;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id p2so5740446uad.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5cJ2VYBioUZmagkSY+kpLy8O3L6QDdgW4FYckRG5j7k=;
        b=OFG6bpGa9a8gz8sReMW1199qffBZ7YEkV7SorFyy8AlvJ8K7INj07CmFVkdLYOIY+Z
         TvCPJjiakckMbIxwe2m4RPn0lpcz5XFdi9APSo2iNZhEKo+utn+ZiRnCnAP+R6chw15m
         57OF+bnlkpWlFg1268p5s+DOVrPdkxbjA1W06nEpX8d82i1iE8kJtXQM2DukqknJWora
         YWeOqmc5HLJ2CoDvPi7M/Chlkgr50/OsvtyNIfu+fz74Vpze9FQXVly7TppfPrLsU7Ws
         LaAPFqg3RB408n8Ki8S3iycJ/BvZXbBcsbLpTlQ7gV/PJencDJC+c+mxUergTye9KYMo
         2IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5cJ2VYBioUZmagkSY+kpLy8O3L6QDdgW4FYckRG5j7k=;
        b=TfZ+Q+tTX+xEPpQJWQrfJrUNp5lhGTSyvgox3EulVpKWJQtEACR9GDyvomuhp7aC2C
         bYG+XlNVIYzFY0ChGFamm7+9zwy0IZv1s3PkY+AoUVWT8vlyqteT4PBwlly20liYX9iy
         kFC5cnqi6F0718ZdEReWvHzTasROvhhcIuAB6iY0+5qFHfWya0ADqytXsI5bRUm2y2jF
         sMru4md4TlLujcRrtY5RJFbvrxVcn30Qz8zG8DQo4VsUv8qtvtQO5LGY1GhTJW/hEBEk
         nUxrqpexG1BDSASrY8ovLE9H6vw0B2ilO+pKB65KaEi+Hx77nI440Br6yjYBcWioiFTR
         oTgg==
X-Gm-Message-State: AOAM531/igED5QSG2edjfg/aSG/hWbyh430PX4lvr+0SFyjEBBAS4gHv
	B4DTGfe5+j1bCsFKWBW+Ry3/lwd2hWg7rZzMLes=
X-Google-Smtp-Source: 
 ABdhPJwrg4UN1nxdB5pmEDx80X81AT98gNk9UfSEj1+0ej4pmCo/oLyISID/FZ4HV3b9RNi6+1JSjXIsPr2NcfzXEo0=
X-Received: by 2002:ab0:1e04:: with SMTP id m4mr11727795uak.100.1637766882551;
 Wed, 24 Nov 2021 07:14:42 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-5-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20211124144739.2250-5-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 16:14:29 +0100
Message-ID: 
 <CANNYZj-OvQRjVf1LpWfNcjxvH0fAi9XvoY=X9A3Nm9=J9jhRSA@mail.gmail.com>
Subject: Re: [RFC PATCH 04/15] bitbake: fetch2: Add striplevel support to
 unpack
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000426cfb05d18a518d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 15:14:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158717

--000000000000426cfb05d18a518d
Content-Type: text/plain; charset="UTF-8"

Please extend the explanation a bit: how would a typical SRC_URI look that
uses the feature, what is the typical tarball structure and how it maps to
the unpacked tree.

Alex

On Wed, 24 Nov 2021 at 15:48, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Add striplevel support to unpack tar archives into specified sub
> directories. The node package manager (npm) need this feature to unpack
> packages into its node_modules directory.
>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  bitbake/lib/bb/fetch2/__init__.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/bitbake/lib/bb/fetch2/__init__.py
> b/bitbake/lib/bb/fetch2/__init__.py
> index ded3106173..05b2d2e924 100644
> --- a/bitbake/lib/bb/fetch2/__init__.py
> +++ b/bitbake/lib/bb/fetch2/__init__.py
> @@ -1462,6 +1462,9 @@ class FetchMethod(object):
>                  cmd = 'tar x --no-same-owner -f %s' % file
>              elif file.endswith('.tgz') or file.endswith('.tar.gz') or
> file.endswith('.tar.Z'):
>                  cmd = 'tar xz --no-same-owner -f %s' % file
> +                striplevel = urldata.parm.get('striplevel')
> +                if striplevel:
> +                    cmd += ' --strip-components=%s' % striplevel
>              elif file.endswith('.tbz') or file.endswith('.tbz2') or
> file.endswith('.tar.bz2'):
>                  cmd = 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
>              elif file.endswith('.gz') or file.endswith('.Z') or
> file.endswith('.z'):
> --
> 2.20.1
>
>

--000000000000426cfb05d18a518d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please extend the explanation a bit: how would a typi=
cal SRC_URI look that uses the feature, what is the typical tarball structu=
re and how it maps to the unpacked tree.</div><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, 24 Nov 2021 at 15:48, Stefan Herbrechtsmeier &lt;<a href=3D"ma=
ilto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-oss=
@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">From: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.h=
erbrechtsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@we=
idmueller.com</a>&gt;<br>
<br>
Add striplevel support to unpack tar archives into specified sub<br>
directories. The node package manager (npm) need this feature to unpack<br>
packages into its node_modules directory.<br>
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
---<br>
<br>
=C2=A0bitbake/lib/bb/fetch2/__init__.py | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__in=
it__.py<br>
index ded3106173..05b2d2e924 100644<br>
--- a/bitbake/lib/bb/fetch2/__init__.py<br>
+++ b/bitbake/lib/bb/fetch2/__init__.py<br>
@@ -1462,6 +1462,9 @@ class FetchMethod(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &#39;=
tar x --no-same-owner -f %s&#39; % file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif file.endswith(&#39;.tg=
z&#39;) or file.endswith(&#39;.tar.gz&#39;) or file.endswith(&#39;.tar.Z&#3=
9;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &#39;=
tar xz --no-same-owner -f %s&#39; % file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 striplevel =3D url=
data.parm.get(&#39;striplevel&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if striplevel:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =
+=3D &#39; --strip-components=3D%s&#39; % striplevel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif file.endswith(&#39;.tb=
z&#39;) or file.endswith(&#39;.tbz2&#39;) or file.endswith(&#39;.tar.bz2&#3=
9;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &#39;=
bzip2 -dc %s | tar x --no-same-owner -f -&#39; % file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif file.endswith(&#39;.gz=
&#39;) or file.endswith(&#39;.Z&#39;) or file.endswith(&#39;.z&#39;):<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--000000000000426cfb05d18a518d--

