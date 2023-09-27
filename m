Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC50E82CA1
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 17:38:56 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web11.23896.1695836332596384045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 10:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l0HOX88F;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-452749f6c47so5098025137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695836331; x=1696441131; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UsTzr474uuwR5yOb2D+274Lkhh4Hsn43SB7n/43FStU=;
        b=l0HOX88Fz4ACY6xwV8uyHj1LuRunbenWiCVC9DH3uVSZKZqEwgljF6PONkWv35W7s5
         ocRuL3RTtl+AG04KoB+ykyDUtpL/PyXJ6PAxEreO1IkASI8JsYbJzRx0y6l+9T6yvrip
         rGjxjq7f/qSUjF0CRaQbiJkxqurC2jrvy8jbjsolL9FteN/aWHgWqziOqUJxtShWUrDJ
         4xU9PAUHi+ToH5RMMOX1TDdunAZ6vZodpZLpmtZgoEKai8Z2ltOjiHVT2a6lUZhHQCft
         Lv5voxNxBf0ZmwioqtNkdX6RWhR6OvOKphKddmX753MlFJSVLtzoovMe03I1rr1v0kF0
         W2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695836331; x=1696441131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsTzr474uuwR5yOb2D+274Lkhh4Hsn43SB7n/43FStU=;
        b=PE0eUANh1Dd+ZJDnWm6FYZgG6cE1VkPLqnVVrndKM7Nqx25HRAowd1DFi56Dr6Zhbv
         rnDjU7Up6ePEwS/GUY1l3fkYGV181TkSqwDSafLwGpUAs4dLaoRgX53L9mg4cvrv18bJ
         G09DKlcLziJJnvXMzFg/WThZzyAFp5DsMzNd9/M4DPaiJKIIgsjSQNqeBWfoJ7+oKRtz
         F/4WrMIOv2rMACl37AWHEGJNEFCduHxIHBZQ/9yu4pc0G3EKkVYcYfGhUW+QmEpwk/rj
         Q0YWRjE/x83YgLI8GYyG9nA33LtRnfYa0se2VM3Yufo/hvxetUNJjmTG/CsQdtREi37O
         T6rg==
X-Gm-Message-State: AOJu0YyOvnvOVgHq1tS1DZYSi6Fx15ZsgVQjpSgxXoSrMvW96XAvyRHU
	NdzR1ztHmNepBGwJfiOKM2x6UFshPxwwZOTWDyw=
X-Google-Smtp-Source: AGHT+IHntyx2YB5nbekOYpqqsTs0/nnfnyhq5rxyU0rRU3Uw2sLxCm5uNnOk79f8jMkkcdIHi77mFn/KiO+xcw/HWoM=
X-Received: by 2002:a05:6102:3bc4:b0:452:607d:8603 with SMTP id
 a4-20020a0561023bc400b00452607d8603mr2602284vsv.1.1695836331461; Wed, 27 Sep
 2023 10:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <17716875CB1538DC.30314@lists.openembedded.org>
In-Reply-To: <17716875CB1538DC.30314@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 27 Sep 2023 18:38:40 +0100
Message-ID: <CANPvuRkyH5evET6PCX0abF1hsnYTOSgpNiapZGAj5ZL92uLLug@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] sstatesig: be more precise and show the full
 path in exceptions
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000022530106065aaab3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 17:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188338

--00000000000022530106065aaab3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping.

The other patch of the series was rejected but imho this one is useful as
it improves the error reporting.

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia quinta, 13/07/2023 =C3=A0=
(s)
12:03:

> Also remove the warning than doesn't make sense as the code will generate
> an exception and bitbake will abort.
>
> Before:
> | WARNING: core-image-minimal-initramfs-1.0-r0 do_image_complete: KeyErro=
r
> in .
> | Exception: Exception: KeyError: 'getpwuid(): uid not found: xxxxx'
> | Path . is owned by uid xxxxx, gid yyy, which doesn't match any
> user/group on target. This may be due to host contamination.
>
> After:
> | Exception: Exception: KeyError: 'getpwuid(): uid not found: xxxxx'
> | Path
> /build/tmp/work/intel_corei7_64-lmp-linux/core-image-minimal-initramfs/1.=
0-r0/sstate-build-image_complete
> is owned by uid xxxxx, gid yyy, which doesn't match any user/group on
> target. This may be due to host contamination.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/lib/oe/sstatesig.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 30f27b0f4f..4a886215b2 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -595,9 +595,9 @@ def OEOuthashBasic(path, sigfile, task, d):
>                          update_hash(" %10s" %
> pwd.getpwuid(s.st_uid).pw_name)
>                          update_hash(" %10s" %
> grp.getgrgid(s.st_gid).gr_name)
>                      except KeyError as e:
> -                        bb.warn("KeyError in %s" % path)
>                          msg =3D ("KeyError: %s\nPath %s is owned by uid =
%d,
> gid %d, which doesn't match "
> -                            "any user/group on target. This may be due t=
o
> host contamination." % (e, path, s.st_uid, s.st_gid))
> +                            "any user/group on target. This may be due t=
o
> host contamination." %
> +                            (e, os.path.abspath(path), s.st_uid,
> s.st_gid))
>                          raise
> Exception(msg).with_traceback(e.__traceback__)
>
>                  if include_timestamps:
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184240):
> https://lists.openembedded.org/g/openembedded-core/message/184240
> Mute This Topic: https://lists.openembedded.org/mt/100117925/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000022530106065aaab3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Gentle ping.<br><br>The other patch=C2=A0of the series was=
 rejected but imho this one is useful=C2=A0as it improves the error reporti=
ng.<br><br>Jose</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com=
@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; escreveu =
no dia quinta, 13/07/2023 =C3=A0(s) 12:03:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Also remove the warning than doesn&#39;t make se=
nse as the code will generate<br>
an exception and bitbake will abort.<br>
<br>
Before:<br>
| WARNING: core-image-minimal-initramfs-1.0-r0 do_image_complete: KeyError =
in .<br>
| Exception: Exception: KeyError: &#39;getpwuid(): uid not found: xxxxx&#39=
;<br>
| Path . is owned by uid xxxxx, gid yyy, which doesn&#39;t match any user/g=
roup on target. This may be due to host contamination.<br>
<br>
After:<br>
| Exception: Exception: KeyError: &#39;getpwuid(): uid not found: xxxxx&#39=
;<br>
| Path /build/tmp/work/intel_corei7_64-lmp-linux/core-image-minimal-initram=
fs/1.0-r0/sstate-build-image_complete is owned by uid xxxxx, gid yyy, which=
 doesn&#39;t match any user/group on target. This may be due to host contam=
ination.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/sstatesig.py | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py<br>
index 30f27b0f4f..4a886215b2 100644<br>
--- a/meta/lib/oe/sstatesig.py<br>
+++ b/meta/lib/oe/sstatesig.py<br>
@@ -595,9 +595,9 @@ def OEOuthashBasic(path, sigfile, task, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0update_hash(&quot; %10s&quot; % pwd.getpwuid(s.st_uid).pw_=
name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0update_hash(&quot; %10s&quot; % grp.getgrgid(s.st_gid).gr_=
name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0except KeyError as e:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.warn(&quot;KeyError in %s&quot; % path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0msg =3D (&quot;KeyError: %s\nPath %s is owned by uid %d, g=
id %d, which doesn&#39;t match &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;any user/group on target. This may be due to=
 host contamination.&quot; % (e, path, s.st_uid, s.st_gid))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;any user/group on target. This may be due to=
 host contamination.&quot; %<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (e, os.path.abspath(path), s.st_uid, s.st_gid))<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0raise Exception(msg).with_traceback(e.__traceback__)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if include_ti=
mestamps:<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184240): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184240" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184240</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100117925/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100117925/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--00000000000022530106065aaab3--

