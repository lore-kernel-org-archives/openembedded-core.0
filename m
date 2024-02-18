Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4A0C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 15:12:03 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.19351.1708269115251100051
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 07:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DPmcnL+V;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33d4c11bd34so200405f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 07:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708269114; x=1708873914; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1BK0DVSxTmUDSlqbzw3Kr8dV0vYyL84+ge1o+IZUTFI=;
        b=DPmcnL+Vd0EzYX1kYcirgAGkDBaFJ0AcPzDzE3o7sJuPSZNTZMZSBfwQLnDvfRLenR
         /AvFTWv8Zbo0CSYi10uH+HeCU0h8ybGbQQKLfxzRV+1pUdckex8VR07uOXH0m0DwTppO
         00nKf9/8dg1MD+2j0v0IE0LnHs9+Kc3Foe7DTnHHx8/J99tLIGRdE4rpf7XaD625apoI
         PqMKSXYzVAFoxU8Q7pt0uGxA+YODQOeaWq48l+J+LF/6PFuI2Qz6A+Ffn+liRer//NYW
         mmyGl7xTKFR9FTPpEPeVc9T7y3Nb3qxrdThhLJjwTs3iP/JzVnqDMtwLAbgC08Y3aSKU
         zyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708269114; x=1708873914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BK0DVSxTmUDSlqbzw3Kr8dV0vYyL84+ge1o+IZUTFI=;
        b=P42JsfuOEgkqOTW5+5LEUFjRD9dDHB3uEivPTfwjwu3D+ZpkRMRLaMskBoie3SoCUM
         iVYGIfAZPdu3Ah4Cqsp7TDB172BkJ0uwQbg35hzW7eF4Rw62zHNzE8apXG7S3SkJ7xkD
         TYlI22IOCXNy5R4ich1XJVyN/Gvi7CLk3u/jWTmw045H/9ZzxQzF07QhsHYDvezo9lcU
         4YXQQ+tmo+Z6RhOJTOgNv0VMJDW3P2eIzxqLWWU+rp0IKfK6JtDie3RnQ7YYP4qlCeL1
         zFlYkkNoOQfzXTWD9Dg1amYzj0C3/pdZiP7kHErViSjxI/RHs687tvI2NkGWbynUR2tb
         EN5w==
X-Gm-Message-State: AOJu0YwHnNm4L7kmS8pwxk5IZmA5PT3XbmarfI64xgcmEr8uNBcfKtY5
	Az5oLdb7I4ulgpV9KrZBLluGO6x72q8xZ5GE9Cs/Z2YyTumDTXGAgE/LakLLlDFyXX7WAZ58mgz
	nvxm4M7YA68NwJxbw4LNVNr+9Vi0=
X-Google-Smtp-Source: AGHT+IGxubxsKZDdMbVna4ROU+dYroEjmaFtPJRSOVg/zhAyzfWPahkSZlCrdfptbTqKG1kIr+Ryo9UYzgg6pAouGJg=
X-Received: by 2002:a5d:5f96:0:b0:33d:2065:c6d7 with SMTP id
 dr22-20020a5d5f96000000b0033d2065c6d7mr6463235wrb.43.1708269113454; Sun, 18
 Feb 2024 07:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20231107152641.1043-2-jermain.horsman@nedap.com> <20231107152641.1043-7-jermain.horsman@nedap.com>
In-Reply-To: <20231107152641.1043-7-jermain.horsman@nedap.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 Feb 2024 16:11:42 +0100
Message-ID: <CA+chaQfBEOr+NTjD=7d07xieHPfn=AOrnr2K2XTSnz0-qRT3LQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC 5/7] lib/oe/buildcfg.py: Add additional git functions
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b034620611a96553"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 15:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195832

--000000000000b034620611a96553
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Was there a reason why this wasn't merged in the end (other than being sent
as RFC)?

We're using git describe in webOS for long time (through our bbclass:
https://github.com/webosose/meta-webosose/blob/master/meta-webos/classes/we=
bos_base.bbclass#L114
)

I would be happy to drop it from our bbclass to use this shared function.

Regards,

On Tue, Nov 7, 2023 at 4:27=E2=80=AFPM Jermain Horsman <jermain.horsman@ned=
ap.com>
wrote:

> From: Jermain Horsman <jermain.horsman@nedap.com>
>
> Includes a function to determine the default remote.
>
> Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
> ---
>  meta/lib/oe/buildcfg.py | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
> index f9cb0cc74c..2ca654e56e 100644
> --- a/meta/lib/oe/buildcfg.py
> +++ b/meta/lib/oe/buildcfg.py
> @@ -50,6 +50,22 @@ def get_metadata_git_remote_url(path, remote):
>          uri =3D ''
>      return uri.strip()
>
> +def get_metadata_git_default_remote(path):
> +    remotes =3D get_metadata_git_remotes(path)
> +    if len(remotes) =3D=3D 1:
> +        default_remote =3D remotes[0]
> +    else:
> +        try:
> +            default_remote, _ =3D bb.process.run('git config --local
> checkout.defaultRemote', cwd=3Dpath)
> +        except bb.process.ExecutionError:
> +            default_remote =3D ""
> +        if not default_remote:
> +            try:
> +                default_remote, _ =3D bb.process.run('git config
> checkout.defaultRemote', cwd=3Dpath)
> +            except bb.process.ExecutionError:
> +                default_remote =3D ""
> +    return default_remote.strip()
> +
>  def get_metadata_git_describe(path):
>      try:
>          describe, _ =3D bb.process.run('git describe --tags', cwd=3Dpath=
)
> --
> 2.42.0.windows.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190295):
> https://lists.openembedded.org/g/openembedded-core/message/190295
> Mute This Topic: https://lists.openembedded.org/mt/102444609/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b034620611a96553
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Was there a reason why this wasn&#39;t merged in the end (=
other than being sent as RFC)?<div><br></div><div>We&#39;re using git descr=
ibe in webOS for long time (through our bbclass:</div><div><a href=3D"https=
://github.com/webosose/meta-webosose/blob/master/meta-webos/classes/webos_b=
ase.bbclass#L114">https://github.com/webosose/meta-webosose/blob/master/met=
a-webos/classes/webos_base.bbclass#L114</a><br></div><div>)</div><div><br><=
/div><div>I would be happy to drop it from our bbclass to use this shared f=
unction.</div><div><br></div><div>Regards,</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 7, 2023 at 4:27=
=E2=80=AFPM Jermain Horsman &lt;<a href=3D"mailto:jermain.horsman@nedap.com=
">jermain.horsman@nedap.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">From: Jermain Horsman &lt;<a href=3D"mailto:jerm=
ain.horsman@nedap.com" target=3D"_blank">jermain.horsman@nedap.com</a>&gt;<=
br>
<br>
Includes a function to determine the default remote.<br>
<br>
Signed-off-by: Jermain Horsman &lt;<a href=3D"mailto:jermain.horsman@nedap.=
com" target=3D"_blank">jermain.horsman@nedap.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/buildcfg.py | 16 ++++++++++++++++<br>
=C2=A01 file changed, 16 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py<br>
index f9cb0cc74c..2ca654e56e 100644<br>
--- a/meta/lib/oe/buildcfg.py<br>
+++ b/meta/lib/oe/buildcfg.py<br>
@@ -50,6 +50,22 @@ def get_metadata_git_remote_url(path, remote):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uri =3D &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0return uri.strip()<br>
<br>
+def get_metadata_git_default_remote(path):<br>
+=C2=A0 =C2=A0 remotes =3D get_metadata_git_remotes(path)<br>
+=C2=A0 =C2=A0 if len(remotes) =3D=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default_remote =3D remotes[0]<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_remote, _ =3D bb.process=
.run(&#39;git config --local checkout.defaultRemote&#39;, cwd=3Dpath)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.process.ExecutionError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_remote =3D &quot;&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not default_remote:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_remote, _ =
=3D bb.process.run(&#39;git config checkout.defaultRemote&#39;, cwd=3Dpath)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.process.ExecutionError=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default_remote =3D=
 &quot;&quot;<br>
+=C2=A0 =C2=A0 return default_remote.strip()<br>
+<br>
=C2=A0def get_metadata_git_describe(path):<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0describe, _ =3D bb.process.run(&#39;git d=
escribe --tags&#39;, cwd=3Dpath)<br>
-- <br>
2.42.0.windows.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190295): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190295" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190295</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102444609/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102444609/3617156</a><br>
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

--000000000000b034620611a96553--

