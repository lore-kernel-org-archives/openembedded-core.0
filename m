Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E8DC38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 07:58:15 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web12.3755.1666943892841890722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 00:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jqIVAkSI;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ernstp@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id f205so5318972yba.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2CAKiRMFE6kVsz/vSqcmgnIRwwGqmuTOymu2YpCDOA=;
        b=jqIVAkSIPDsiXHH0MjmYQyX/AkC+VaVoSQVHBx8KZHZxjK5acgzqu3QIoaVZFHkOWi
         P2a5KhNt4OhhcroOEvOn65KyTzj569QAR3GvU10ZbzUPVytWfd1jiVR2tNMqcWIOpEOv
         NPxOyoqdKMwC3LE8kvXTBsuLdTAWpkLnGTKwDwXklEZBDCBfB7QLxVJMx0cp+q5AgQMg
         0aUuCGMB4xGLA+CC/2DAOTsZgIE4mgbyifIjB2qeNHGb2D30HpE8CKfkvANz5XIsOYa0
         yQvwF5laqdfcRMmI7O20x4Rb0he5/vk/gyb6xYdDETD1cf1Upf9pJBgmfrK/ky/MO0zy
         zJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2CAKiRMFE6kVsz/vSqcmgnIRwwGqmuTOymu2YpCDOA=;
        b=ugBfL/Y3Evc19A8rU5qKkG3cPSGF83FnDxMqxosu3bhc1uGaueuKONd4/n/2u9fcbq
         qmdnywIxthcYwi0aImefOiUHm4w4cEsjPU12BD+45u8JSVv/cJFZ7kmhyE2rZQKaYo1s
         XpAGzjFGQy7X/jIajCb+JOgEpVkwk7IipaK//uNAjWyIqZskg1QhGlCg9bwGk4UX0Fuc
         TIyTi7WolH9iiLdqrXoCqNohcHA2ji97Q+cxM7nmyjgHcIxUodsXHwyA81mPyNtvYTTf
         cehywMTQSbjf6/5fgwA5fIdWDdz6zrq7+kFuBTETCNE351z+3Qt2By4LSp2Hu4q6ClXl
         rcWA==
X-Gm-Message-State: ACrzQf0VNWckkk5n9ghDZOiQjOiU7Alw1TAFk/DwKz6/dRFv/5U0xe9u
	SlVixSvhMYsZr+M2upeUmdNSb9K0iAEqxBjLcfM=
X-Google-Smtp-Source: AMsMyM4asIhbpdfkzoX6NvzICiqEL6eBRONaCgkrxxHkGtIqvwm7b3zUkkrhaBcbIgTzUDElIFwX0APTdnAcS6h7v50=
X-Received: by 2002:a25:be87:0:b0:67a:7054:c7bc with SMTP id
 i7-20020a25be87000000b0067a7054c7bcmr45262641ybk.601.1666943891952; Fri, 28
 Oct 2022 00:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221027231350.418471-1-bero@baylibre.com>
In-Reply-To: <20221027231350.418471-1-bero@baylibre.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Fri, 28 Oct 2022 09:58:00 +0200
Message-ID: <CAD=4a=VfwOW1UMw=pHDy96SnnkGwHye-DHdz=N62ka+yCskscA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base.bbclass: Try harder to find a compatible
 tar implementation
To: bero@lindev.ch
Cc: openembedded-core@lists.openembedded.org, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Content-Type: multipart/alternative; boundary="0000000000008a58d505ec139eea"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 07:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172236

--0000000000008a58d505ec139eea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Interesting. I think the more common approach is just to compile a native
tar with Yocto and add it with EXTRANATIVEPATH (iirc),
like suggested here: https://stackoverflow.com/a/43109887

Regards
//Ernst

Den fre 28 okt. 2022 kl 01:14 skrev Bernhard Rosenkr=C3=A4nzer via
lists.openembedded.org <bero=3Dlindev.ch@lists.openembedded.org>:

> From: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
>
> base.bbclass currently symlinks the first copy of tar on the PATH
> to hosttools.
>
> If that copy of tar isn't GNU tar (some Linux distributions use
> libarchive tar for the fact that it can handle zip files etc. as
> well; some others probably use busybox or toybox tar for space
> issues), the build fails early on because path.py uses --xattrs
> and --xattrs-include
>
> With this patch, base.bbclass checks if tar supports --xattrs-include,
> and checks for gtar if the first tar found doesn't support it.
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> ---
>  meta/classes-global/base.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/classes-global/base.bbclass
> b/meta/classes-global/base.bbclass
> index 8203f54519..b6391501ca 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -135,6 +135,16 @@ def setup_hosttools_dir(dest, toolsvar, d,
> fatal=3DTrue):
>              if os.path.islink(desttool):
>                  os.unlink(desttool)
>              srctool =3D bb.utils.which(path, tool, executable=3DTrue)
> +            # copytree() uses tar options such as --xattrs and
> +            # --xattrs-include that are currently specific to GNU tar.
> +            # If the first tar in PATH is libarchive tar or busybox/toyb=
ox
> +            # tar, GNU tar may well be available as gtar.
> +            if (tool =3D=3D "tar"):
> +                import subprocess
> +                if not b'--xattrs-include' in
> subprocess.check_output([srctool, '--help']):
> +                    gtar =3D bb.utils.which(path, "gtar", executable=3DT=
rue)
> +                    if gtar:
> +                        srctool =3D gtar
>              # gcc/g++ may link to ccache on some hosts, e.g.,
>              # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then
> which(gcc)
>              # would return /usr/local/bin/ccache/gcc, but what we need i=
s
> --
> 2.38.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172229):
> https://lists.openembedded.org/g/openembedded-core/message/172229
> Mute This Topic: https://lists.openembedded.org/mt/94616037/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008a58d505ec139eea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Interesting. I think the more common approach is just t=
o compile a native tar with Yocto and add it with EXTRANATIVEPATH (iirc),</=
div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-=
serif">like suggested here: <a href=3D"https://stackoverflow.com/a/43109887=
">https://stackoverflow.com/a/43109887</a></div><div class=3D"gmail_default=
" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"=
gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Regards</di=
v><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-se=
rif">//Ernst<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Den fre 28 okt. 2022 kl 01:14 skrev Bernhard Rosenkr=
=C3=A4nzer via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;bero=3D<a href=3D"mailto:lindev.ch@lists.openembedded.org">lin=
dev.ch@lists.openembedded.org</a>&gt;:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">From: Bernhard Rosenkr=C3=A4nzer &lt;<a href=3D"mail=
to:bero@baylibre.com" target=3D"_blank">bero@baylibre.com</a>&gt;<br>
<br>
base.bbclass currently symlinks the first copy of tar on the PATH<br>
to hosttools.<br>
<br>
If that copy of tar isn&#39;t GNU tar (some Linux distributions use<br>
libarchive tar for the fact that it can handle zip files etc. as<br>
well; some others probably use busybox or toybox tar for space<br>
issues), the build fails early on because path.py uses --xattrs<br>
and --xattrs-include<br>
<br>
With this patch, base.bbclass checks if tar supports --xattrs-include,<br>
and checks for gtar if the first tar found doesn&#39;t support it.<br>
<br>
Signed-off-by: Bernhard Rosenkr=C3=A4nzer &lt;<a href=3D"mailto:bero@baylib=
re.com" target=3D"_blank">bero@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/base.bbclass | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class<br>
index 8203f54519..b6391501ca 100644<br>
--- a/meta/classes-global/base.bbclass<br>
+++ b/meta/classes-global/base.bbclass<br>
@@ -135,6 +135,16 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTru=
e):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.islink(desttool)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.unlink(des=
ttool)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctool =3D bb.utils.which(=
path, tool, executable=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # copytree() uses tar options su=
ch as --xattrs and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # --xattrs-include that are curr=
ently specific to GNU tar.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If the first tar in PATH is li=
barchive tar or busybox/toybox<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # tar, GNU tar may well be avail=
able as gtar.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tool =3D=3D &quot;tar&quot;)=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import subprocess<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not b&#39;--xat=
trs-include&#39; in subprocess.check_output([srctool, &#39;--help&#39;]):<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtar=
 =3D bb.utils.which(path, &quot;gtar&quot;, executable=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if g=
tar:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 srctool =3D gtar<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# gcc/g++ may link to ccach=
e on some hosts, e.g.,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# /usr/local/bin/ccache/gcc=
 -&gt; /usr/bin/ccache, then which(gcc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# would return /usr/local/b=
in/ccache/gcc, but what we need is<br>
-- <br>
2.38.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172229): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172229" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172229</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94616037/4947=
266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94616037/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008a58d505ec139eea--

