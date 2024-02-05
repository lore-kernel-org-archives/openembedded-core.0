Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700D9C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 17:18:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.68625.1707153521925004648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 09:18:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TJ1a1Rb+;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33b402116e5so549847f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 09:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707153520; x=1707758320; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d316TtB6Kl8h2icB7ddHNvrO38WwqoCo2iAfuORDxUg=;
        b=TJ1a1Rb+0fgFkbgOMschClpHE6bVqJyuLlcfuv2IYBvDlRh+gPiLnDCLHn3VpUPiHk
         dnIr1sO9FpY8jNw+jNjh0o4tNrkPtNDdWYx3KtBBrjT0EI+WZto3pI2LwbkU/V/Vev2U
         xpB3MWNF2U+gJIw6SdH4RNJCbTFmu95y/MoDOj8b7ogMY0zvkxfX2A/fjaJ0zq98TY+G
         mad9ilA3eF0t2QeUi+jnk8SiFu5Gl6IYHVgno+nuKqEScJ5Re1Gy/OvT1HGl1sJSDQLr
         AifU1Fe8R64sGP01fsaYYW3E+9jKOdgD+JvyyPZI717BEv3kk4qbtUz0+BsybAYqLRXz
         pigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707153520; x=1707758320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d316TtB6Kl8h2icB7ddHNvrO38WwqoCo2iAfuORDxUg=;
        b=RI2Nwh/sOyRlxdLObfIh4D0xdx4muR6dSgsZ4i+HEMXe0C3kVg3Wf2Xa05aPHC8Mpv
         nQsNF7kIsq8DXoTFvL1ABuoKb7+KuxKc21PZ34kbN/uOnvfirH70bvvz8e3+Z7vBWbrz
         zf6RQ275+J2eHJQpthbZ4KGF1Crk0TaTl36br+jev4MQWNEUXLVk5amleEdnzhZXRJk1
         JCNGs2yQeMX+epP+aR4Xz9LhESE9fHAHQMqr7rTi/QkrxuJKcZyrE4Mkzlqm25aXlxXk
         5rBTdzY4kwV+wjcH2gx100NFgboDwiyrqjU7gsxWtP135IbSCaOTBk3Er7YpuUazx1xR
         +dwQ==
X-Gm-Message-State: AOJu0YzU//J441kcLCMYYHkONDpnhHAlwmTI5gSYSxSAflFRMfgJmIYg
	DWw2g48PU1MxFJ2beEUkUXaEBIvDGdbVx7YfyOwS/XQ1AOUfsmiKcBwj5EvmZ2H42R/oa4wL9gK
	YdK2LHlrn878VCnM5gbKja5Yyr4w=
X-Google-Smtp-Source: AGHT+IFFE+Dj2CEAke9Y5XAw8KQ6wLiHmR5Udm+vxqi2Fve6vFh6o11Rp0WB8F3G5IEa9+fbhlTfSgO2stfRIEGk8eI=
X-Received: by 2002:a5d:4688:0:b0:33b:251c:60d9 with SMTP id
 u8-20020a5d4688000000b0033b251c60d9mr103864wrq.10.1707153520067; Mon, 05 Feb
 2024 09:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20240205164619.3086698-1-pkj@axis.com>
In-Reply-To: <20240205164619.3086698-1-pkj@axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 5 Feb 2024 18:18:27 +0100
Message-ID: <CA+chaQdDR-FmXo=x2RS3bipKpS_HfFo9BAdWDGaFt81g4+aXwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake-diffsigs: Support tasks with
 dependencies correctly again
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002408ef0610a5a772"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 17:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194958

--0000000000002408ef0610a5a772
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

see https://lists.openembedded.org/g/bitbake-devel/message/15824 :)

On Mon, Feb 5, 2024 at 5:46=E2=80=AFPM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> This was missed in commit 5439aca056c84ab4410aaf24bdb68e896191d8e1 that
> adapted the code to the changes made to find_siginfo(), which now
> returns a dict for each file rather than just the filename.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  bitbake/bin/bitbake-diffsigs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bitbake/bin/bitbake-diffsigs b/bitbake/bin/bitbake-diffsigs
> index a8f49191b0..8202c78623 100755
> --- a/bitbake/bin/bitbake-diffsigs
> +++ b/bitbake/bin/bitbake-diffsigs
> @@ -99,7 +99,7 @@ def recursecb(key, hash1, hash2):
>      elif hash2 not in hashfiles:
>          recout.append("Unable to find matching sigdata for %s with hash
> %s" % (key, hash2))
>      else:
> -        out2 =3D bb.siggen.compare_sigfiles(hashfiles[hash1],
> hashfiles[hash2], recursecb, color=3Dcolor)
> +        out2 =3D bb.siggen.compare_sigfiles(hashfiles[hash1]['path'],
> hashfiles[hash2]['path'], recursecb, color=3Dcolor)
>          for change in out2:
>              for line in change.splitlines():
>                  recout.append('    ' + line)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194955):
> https://lists.openembedded.org/g/openembedded-core/message/194955
> Mute This Topic: https://lists.openembedded.org/mt/104179998/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002408ef0610a5a772
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">see=C2=A0<a href=3D"https://lists.openembedded.org/g/bitba=
ke-devel/message/15824">https://lists.openembedded.org/g/bitbake-devel/mess=
age/15824</a> :)</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 5, 2024 at 5:46=E2=80=AFPM Peter Kjellerstedt &=
lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">This was missed in commit 5439aca056c84ab4410aaf24bdb68e896191d8e1 that<b=
r>
adapted the code to the changes made to find_siginfo(), which now<br>
returns a dict for each file rather than just the filename.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0bitbake/bin/bitbake-diffsigs | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/bitbake/bin/bitbake-diffsigs b/bitbake/bin/bitbake-diffsigs<br=
>
index a8f49191b0..8202c78623 100755<br>
--- a/bitbake/bin/bitbake-diffsigs<br>
+++ b/bitbake/bin/bitbake-diffsigs<br>
@@ -99,7 +99,7 @@ def recursecb(key, hash1, hash2):<br>
=C2=A0 =C2=A0 =C2=A0elif hash2 not in hashfiles:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recout.append(&quot;Unable to find matchi=
ng sigdata for %s with hash %s&quot; % (key, hash2))<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 out2 =3D bb.siggen.compare_sigfiles(hashfiles[=
hash1], hashfiles[hash2], recursecb, color=3Dcolor)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out2 =3D bb.siggen.compare_sigfiles(hashfiles[=
hash1][&#39;path&#39;], hashfiles[hash2][&#39;path&#39;], recursecb, color=
=3Dcolor)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for change in out2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for line in change.splitlin=
es():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recout.append=
(&#39;=C2=A0 =C2=A0 &#39; + line)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194955): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194955" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194955</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104179998/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104179998/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002408ef0610a5a772--

