Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E63C433F5
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 19:15:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.14424.1634411708676945145
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 12:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aUEsVIq6;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so5943892wms.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJIWLSzXQPd4vIAYmWhihtoHaAdyl857HiFcUpzN8To=;
        b=aUEsVIq6K/ZpbPZ8eJgX0/GsZvyCjBvEdKIxYKUGsixdcLeLHTjM8CJ9kTXqKrRfdp
         tPSoDda7K2qQ3AW6xOttRW5ra+hPxK6w2RJn7qlb1cMZqnGVrQFSGSC5On6tas4zu+6w
         B9SqJGaFygNUn//xgPttmaUA1xzpV42YbBEb5bbQ9f76IywJEgYLVdKN25xsE7esZvsY
         or7Co5fOf8y7cq+NzMo05TfDEwA5BQ/TDE97XEyuOC48MPY684A9w3X8SbRxpP7tmteN
         /4tM5m6ARWTU0CNTOUkZyy5bJKNHSAzgrEjyC83KtkPsjsxp9K8dzp9FbIKHF3qcwVoS
         GAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJIWLSzXQPd4vIAYmWhihtoHaAdyl857HiFcUpzN8To=;
        b=RHrkIpOpGknEdVDoqUvrp74Kpgo6XfhpAqwOPv0o5YuVmPiYb9aISqy6iBbqke41Aj
         lhAHJOO9WLZ12r+LI/6nrRrppujKJy5dnbEK2uX5SB1KpXlxmmXW4vbpY5zj5oC6Bzz0
         L0K1w4M7mt8ftW6BlDJMJikKLapl4c0xviArdBDQbk3x9seqpMBo01a5selAvWXlok32
         i7wFT9HrHfxuv1Wl7uCXvplMnsoPfvDg0tOdh06oSWJMpvK1Yy9PBY8jftuoGXTk8hYq
         ZWvTNdP875tqIDFsvYIGcwATe6qwizkqwYLBkXdsqfZMGlqHERpuL5GTc+g7DDq5TA4u
         GSLg==
X-Gm-Message-State: AOAM533T++Dsp9rTJ9owZogacTDfEaWW7FQYV+c1qUgLT2iis/8tOvBC
	eUhw9te6Ta/j7sCsjS0fV21wBTbM2rYoBWfezBA=
X-Google-Smtp-Source: 
 ABdhPJwF4FpE2a5+61BlEJvcGiZQr0njTbogXYQ6/whnZvfuBB7K3Gw3qwYKRHRKp9y4KhOuU/KAvvaP5c9CQrlPYBA=
X-Received: by 2002:a05:600c:892:: with SMTP id
 l18mr20689652wmp.89.1634411707118;
 Sat, 16 Oct 2021 12:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211015234728.338196-1-quaresma.jose@gmail.com>
In-Reply-To: <20211015234728.338196-1-quaresma.jose@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 16 Oct 2021 14:14:56 -0500
Message-ID: 
 <CAJdd5GZka84w1vRP6ufegohVaRrh1=ZKP=YB6gmzzxOcyZ8ZyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake: cooker: check if upstream hash
 equivalence server is available
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003835c305ce7d21e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Oct 2021 19:15:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157017

--0000000000003835c305ce7d21e2
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021, 6:47 PM Jose Quaresma <quaresma.jose@gmail.com> wrote:

> When the user specify an upstream hash equivalence server in
> BB_HASHSERVE_UPSTREAM abort if we can't connect otherwise the
> user will never be notified about the problem.
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  bitbake/lib/bb/cooker.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
> index af794b4c42..34603c5ea2 100644
> --- a/bitbake/lib/bb/cooker.py
> +++ b/bitbake/lib/bb/cooker.py
> @@ -388,12 +388,22 @@ class BBCooker:
>              # Create a new hash server bound to a unix domain socket
>              if not self.hashserv:
>                  dbfile = (self.data.getVar("PERSISTENT_DIR") or
> self.data.getVar("CACHE")) + "/hashserv.db"
> +                upstream = self.data.getVar("BB_HASHSERVE_UPSTREAM") or
> None
> +                if upstream:
> +                    import socket
> +                    try:
> +                        sock =
> socket.create_connection(upstream.split(":"), 5)
> +                        sock.close()
> +                    except socket.error as e:
> +                        bb.fatal("BB_HASHSERVE_UPSTREAM is not valid,
> unable to connect hash equivalence server at '%s': %s"
> +                                 % (upstream, repr(e)))
> +
>

Perhaps this should just be a warning? The upstream missing should not be
fatal for a given server, if it is we probably need to fix that

                 self.hashservaddr = "unix://%s/hashserve.sock" %
> self.data.getVar("TOPDIR")
>                  self.hashserv = hashserv.create_server(
>                      self.hashservaddr,
>                      dbfile,
>                      sync=False,
> -                    upstream=self.data.getVar("BB_HASHSERVE_UPSTREAM") or
> None,
> +                    upstream=upstream,
>                  )
>                  self.hashserv.serve_as_process()
>              self.data.setVar("BB_HASHSERVE", self.hashservaddr)
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157010):
> https://lists.openembedded.org/g/openembedded-core/message/157010
> Mute This Topic: https://lists.openembedded.org/mt/86362510/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003835c305ce7d21e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Oct 15, 2021, 6:47 PM Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">When the user specify an upstream =
hash equivalence server in<br>
BB_HASHSERVE_UPSTREAM abort if we can&#39;t connect otherwise the<br>
user will never be notified about the problem.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0bitbake/lib/bb/cooker.py | 12 +++++++++++-<br>
=C2=A01 file changed, 11 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py<br>
index af794b4c42..34603c5ea2 100644<br>
--- a/bitbake/lib/bb/cooker.py<br>
+++ b/bitbake/lib/bb/cooker.py<br>
@@ -388,12 +388,22 @@ class BBCooker:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create a new hash server =
bound to a unix domain socket<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.hashserv:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dbfile =3D (s=
elf.data.getVar(&quot;PERSISTENT_DIR&quot;) or self.data.getVar(&quot;CACHE=
&quot;)) + &quot;/hashserv.db&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 upstream =3D self.=
data.getVar(&quot;BB_HASHSERVE_UPSTREAM&quot;) or None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if upstream:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 impo=
rt socket<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sock =3D socket.create_connection(upstream.split(&quot;:&quot;),=
 5)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sock.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exce=
pt socket.error as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.fatal(&quot;BB_HASHSERVE_UPSTREAM is not valid, unable to con=
nect hash equivalence server at &#39;%s&#39;: %s&quot; <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% (upstream, repr(e)))<br>
+<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Perhaps this should just be a warning? The upstream missing should not be =
fatal for a given server, if it is we probably need to fix that</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.hashserv=
addr =3D &quot;unix://%s/hashserve.sock&quot; % self.data.getVar(&quot;TOPD=
IR&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.hashserv=
 =3D hashserv.create_server(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.hashservaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dbfile,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sync=3DFalse,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 upst=
ream=3Dself.data.getVar(&quot;BB_HASHSERVE_UPSTREAM&quot;) or None,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 upst=
ream=3Dupstream,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.hashserv=
.serve_as_process()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.data.setVar(&quot;BB_H=
ASHSERVE&quot;, self.hashservaddr)<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157010): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157010" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/157010</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86362510/3616=
693" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/86362510/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000003835c305ce7d21e2--

