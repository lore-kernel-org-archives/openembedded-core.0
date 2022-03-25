Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F42C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 17:53:14 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.8900.1648230793472159925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 10:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RPXeFX0S;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id z12so820016lfu.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ldvq7sXc44gUSHDqI0+2tTKsuZqQkMef7JN812DmrIc=;
        b=RPXeFX0SL2x7dExfzlYL3G119sl5gVVFRErZPQ/EcUu4YI69o+AzsyyaZtCREufXaA
         F2KSvF79Vko4PE21kCvDKg4QiuV3bvbSt1121tHP5cpQ2t3yWrKwFCIM5foFaXy15wEQ
         KikY6fHn8vAEJXdY2IupST04UiKwwOvwhAktreUCJ/+gmRHVuVDFgo7IrdwUJCtvU/P4
         nLMougeM/uOwrl65ldk3rYDgCslEbZpuOhcdxDmoq7y1wVDNtnLD9eyTYxroGkntEcb7
         5l09EW0QXwGlYW8u2d7fsH7iTZCAUOcV14cdNcTDFKnmvBq5lCbYKheC85nJwKylV463
         VPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ldvq7sXc44gUSHDqI0+2tTKsuZqQkMef7JN812DmrIc=;
        b=d4BknsIcxpm75GFQO40AKgLmv/KhCpZ/RcFK5Y2+D1NwQxNDYkCB42oo6bGU20HnYv
         6A922IqnTGR7e3wG+z13bR9Cd/mMxKz4VR5KvI5rcdWWveJk1lkQP2KI2UqjovFQp8FG
         ci/7oR9mBUdIcl+6IB6nxw+Q9fP7sSHFnCQEU038jAVFjzrWZJnXm71IilfHgWF2+qIa
         9OHV3PPFdEldnHcw2sSVExk56zeUoK6MI6sYAXA97BK62smOG8zJT5xPzZMjlYOpJBiW
         2A5wKWu7dN/62V+GhRhNPPMM5yrlMXcJIqsoAA+2zits+DewsYwCchjIUarxKkDbsWsr
         IcVg==
X-Gm-Message-State: AOAM530T3aLIomWvldZ2cL78eYpUaPvEgJ1lCCurpBtUBmLaMngwrh05
	bWyVB/mBKZ7+lGheuC4ORouzCLJ2Sw7J/Jx2SgU=
X-Google-Smtp-Source: 
 ABdhPJxR8FhM4SZ1yCGmNCD7moWaL+2HM24rTJh6fEe/jyHgtnPQ2iPxy/FVxbsQ3QHGNkkba/4LM5oKIvTlzQaBRGw=
X-Received: by 2002:a05:6512:282c:b0:44a:129c:7e73 with SMTP id
 cf44-20020a056512282c00b0044a129c7e73mr8698884lfb.106.1648230791413; Fri, 25
 Mar 2022 10:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220323142411.1277228-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220323142411.1277228-1-richard.purdie@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 25 Mar 2022 17:53:00 +0000
Message-ID: 
 <CANPvuRmu=VTrkQmJvBU43jYJ-1N-XwP_sLTr-4UxL=q4W9YLQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: Add warning for local hasheqiv server
 with remote sstate mirrors
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d4854205db0ea2ea"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 17:53:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163647

--000000000000d4854205db0ea2ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I see this patch on dunfell-nut but afaik dunfell don't support upstream
hash equivalence server
https://git.yoctoproject.org/poky-contrib/commit/?h=3Dstable/dunfell-nut&id=
=3D1d33ad9c8ea2388f51ff00ba3a3442f15f29e663

Jose

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quarta,
23/03/2022 =C3=A0(s) 14:24:

> We're seeing a lot of users configuring an sstate mirror but not realisin=
g
> that
> the default hash equivalenve setting will make this ineffective. Add a
> warning
> to highlight this to the user for the common case.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sanity.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 92807dc88e9..be956fbcd6c 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -914,6 +914,11 @@ def check_sanity_everybuild(status, d):
>                      mirror_base =3D
> urllib.parse.urlparse(mirror[:-1*len('/PATH')]).path
>                      check_symlink(mirror_base, d)
>
> +    # Check sstate mirrors aren't being used with a local hash server an=
d
> no remote
> +    hashserv =3D d.getVar("BB_HASHSERVE")
> +    if d.getVar("SSTATE_MIRRORS") and hashserv and
> hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
> +        bb.warn("You are using a local hash equivalence server but have
> configured an sstate mirror. This will likely mean no sstate will match
> from the mirror. You may wish to disable the hash equivalence use
> (BB_HASHSERVE), or use a hash equivalence server alongside the sstate
> mirror.")
> +
>      # Check that TMPDIR hasn't changed location since the last time we
> were run
>      tmpdir =3D d.getVar('TMPDIR')
>      checkfile =3D os.path.join(tmpdir, "saved_tmpdir")
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163584):
> https://lists.openembedded.org/g/openembedded-core/message/163584
> Mute This Topic: https://lists.openembedded.org/mt/89976515/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d4854205db0ea2ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,<div><br></div><div>I see this patch on dunfell-n=
ut but afaik dunfell don&#39;t support=C2=A0upstream hash equivalence serve=
r</div><div><a href=3D"https://git.yoctoproject.org/poky-contrib/commit/?h=
=3Dstable/dunfell-nut&amp;id=3D1d33ad9c8ea2388f51ff00ba3a3442f15f29e663">ht=
tps://git.yoctoproject.org/poky-contrib/commit/?h=3Dstable/dunfell-nut&amp;=
id=3D1d33ad9c8ea2388f51ff00ba3a3442f15f29e663</a><br></div><div><br></div><=
div>Jose</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org">richard.purdie@linuxfoundation.org</a>&gt; escreveu no dia qu=
arta, 23/03/2022 =C3=A0(s) 14:24:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">We&#39;re seeing a lot of users configuring an sstate mir=
ror but not realising that<br>
the default hash equivalenve setting will make this ineffective. Add a warn=
ing<br>
to highlight this to the user for the common case.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/sanity.bbclass | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 92807dc88e9..be956fbcd6c 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -914,6 +914,11 @@ def check_sanity_everybuild(status, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0mirror_base =3D urllib.parse.urlparse(mirror[:-1*len(&#39;/PATH&#39;)]).=
path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0check_symlink(mirror_base, d)<br>
<br>
+=C2=A0 =C2=A0 # Check sstate mirrors aren&#39;t being used with a local ha=
sh server and no remote<br>
+=C2=A0 =C2=A0 hashserv =3D d.getVar(&quot;BB_HASHSERVE&quot;)<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;SSTATE_MIRRORS&quot;) and hashserv and has=
hserv.startswith(&quot;unix://&quot;) and not d.getVar(&quot;BB_HASHSERVE_U=
PSTREAM&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;You are using a local hash equiv=
alence server but have configured an sstate mirror. This will likely mean n=
o sstate will match from the mirror. You may wish to disable the hash equiv=
alence use (BB_HASHSERVE), or use a hash equivalence server alongside the s=
state mirror.&quot;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Check that TMPDIR hasn&#39;t changed location since t=
he last time we were run<br>
=C2=A0 =C2=A0 =C2=A0tmpdir =3D d.getVar(&#39;TMPDIR&#39;)<br>
=C2=A0 =C2=A0 =C2=A0checkfile =3D os.path.join(tmpdir, &quot;saved_tmpdir&q=
uot;)<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163584): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163584" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163584</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89976515/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89976515/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000d4854205db0ea2ea--

