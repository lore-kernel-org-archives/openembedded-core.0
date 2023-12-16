Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C253DC46CCD
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 13:54:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.15304.1702734849912142077
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 05:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=BLJvYhnz;
 spf=pass (domain: snapchat.com, ip: 209.85.128.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40b5155e154so19278225e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 05:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702734848; x=1703339648; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mld2DYdMyJe4Gw4UiNmhKuQbaDuTyFz3OcQfMZyO97g=;
        b=BLJvYhnzjK7NfoJWddx3wHNEeWkB61RvaoPnfNAtAJhXpIGgEUVHOpOc4m7g/Z2RJZ
         8zBayDd5RqKE8WeaYczC9aHzRQYUBhxZRzSqAcF4xWqQGBNuc87NwWNn3g4IgIdChw55
         M8UeYM2v5GS7EYhEl2vlsY7Ymw7LQ3AB4wHHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734848; x=1703339648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mld2DYdMyJe4Gw4UiNmhKuQbaDuTyFz3OcQfMZyO97g=;
        b=TrWhfPJoAm7bO7+TX7gfagfk1vZwT0R/V8rU1yx8/pN38DE/SaLwDiAn06+z0f3scO
         9GoBGA9kZDE1markIDdkItUOqybU63FxsrrNfYTIlw3q+DxBB+AQvC+gFp7F2v3wMy81
         kWUu6jwJj5Q/Jjvk2nrZRfnD+UAmZ8sDVSS5tukbdpBw8cRHiyfJjpJ42tHiEBIFJ0Ej
         0BW9j3jrFWUcFfm6rlmfpzcvwGke7qVnaWvBVfWJiSXmLYHd7dA2fnTfhV8sKivVAxlt
         0lLh6cq+mUmIyaYzb9VYvI5ONkZM/tDB5NPKJgoFLF/7jtlrguN2WV/RVhvc7itc1mXt
         dhMw==
X-Gm-Message-State: AOJu0YwUGAULUVPi2ayySR05Ht/eGt7cJNlkIvdCpZ55zcYBU4sRgDVK
	A4zu41Q9Z5+mVYuGArtTRRrUrfvFOHXh9MXKSlA4CA==
X-Google-Smtp-Source: AGHT+IFTfJnK4uwtS139VdvDHtSN87TNOWRnngIEG4tP5M7nBW0sqxKv9kMNJlXyrvP6E6pVQixf6wuQR4P0TYeuzUo=
X-Received: by 2002:a05:600c:4706:b0:40c:6e31:9248 with SMTP id
 v6-20020a05600c470600b0040c6e319248mr966794wmo.4.1702734848148; Sat, 16 Dec
 2023 05:54:08 -0800 (PST)
MIME-Version: 1.0
References: <17A15446D20C1B60.21267@lists.openembedded.org>
In-Reply-To: <17A15446D20C1B60.21267@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Sat, 16 Dec 2023 14:53:57 +0100
Message-ID: <CAHUKmYYivmR=HU9jA+g8o3DKzNvJ8D67OY0wUMQ2W0HLiAJkQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c60e59060ca0d9d4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 13:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192565

--000000000000c60e59060ca0d9d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

patch v2: fixed commit title format

On Sat, Dec 16, 2023 at 2:53=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The function do_symlink_kernsrc is not reentrant in the case where S is
> defined
> to a non-default value. This causes build-failures e.g. when building
> linux-yocto, then updating
> poky to a commit which modifies kernel.bbclass, and then building
> linux-yocto again.
>
> Bugzilla:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproj=
ect.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Djt6=
YiS6E6i9e41ybWHwIDnQjJnbIg07KQZQBm5Obxl5_hRIXQQ6Yh8rNM7xAkzJi&s=3DVEQXVXbX9=
PUylLXpjvdMaNLjg7TIojyrvYA6INKcJLk&e=3D
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 9ff37f5c38..130bedd901 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
>              os.symlink(s, kernsrc)
>          else:
>              import shutil
> +            if os.path.islink(s):
> +                # this happens for instance when a poky update forces
> symlink_kernsrc to run again
> +                # after s was already moved to kernsrc
> +                bb.warn("%s is already a symlink! Not symlinking kernel
> sources" % s)
> +                return 0
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192564):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_192564&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3Djt6YiS6E6i9e41ybWHwIDnQjJnbIg07KQZQBm5Obxl5_hRIXQQ6Yh8rNM7xAkzJi&s=3D4Pp=
cOB2owGFWjvPhD-XD2iHuk3B8OeCjlnUVG2Q_b-E&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103208527_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Djt6YiS6E6i9e4=
1ybWHwIDnQjJnbIg07KQZQBm5Obxl5_hRIXQQ6Yh8rNM7xAkzJi&s=3Da8388EZCsGeWCuCCtQN=
u9x8UE3soxZ_xr17coBWUVPM&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Djt6YiS=
6E6i9e41ybWHwIDnQjJnbIg07KQZQBm5Obxl5_hRIXQQ6Yh8rNM7xAkzJi&s=3DAVhaS6PSPRkh=
IynLZKzh1Y7hmb7XX3ZyJKg-3oloVaY&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c60e59060ca0d9d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">patch v2: fixed commit title format</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 16, 2023 at=
 2:53=E2=80=AFPM Etienne Cordonnier via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.=
com@lists.openembedded.org">snap.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Etienne Co=
rdonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecor=
donnier@snap.com</a>&gt;<br>
<br>
The function do_symlink_kernsrc is not reentrant in the case where S is def=
ined<br>
to a non-default value. This causes build-failures e.g. when building linux=
-yocto, then updating<br>
poky to a commit which modifies kernel.bbclass, and then building linux-yoc=
to again.<br>
<br>
Bugzilla: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A_=
_bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&amp;d=3DDwIDAg&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3Djt6YiS6E6i9e41ybWHwIDnQjJnbIg07KQZQBm5Obxl5=
_hRIXQQ6Yh8rNM7xAkzJi&amp;s=3DVEQXVXbX9PUylLXpjvdMaNLjg7TIojyrvYA6INKcJLk&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D1=
5325&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Djt6YiS6E6i9e41ybWH=
wIDnQjJnbIg07KQZQBm5Obxl5_hRIXQQ6Yh8rNM7xAkzJi&amp;s=3DVEQXVXbX9PUylLXpjvdM=
aNLjg7TIojyrvYA6INKcJLk&amp;e=3D</a> <br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 9ff37f5c38..130bedd901 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -194,6 +194,11 @@ python do_symlink_kernsrc () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(s, kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import shutil<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.islink(s):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # this happens for=
 instance when a poky update forces symlink_kernsrc to run again<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # after s was alre=
ady moved to kernsrc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;%s i=
s already a symlink! Not symlinking kernel sources&quot; % s)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.move(s, kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(kernsrc, s)<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192564): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
2564&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Djt6YiS6E6i9e41ybWH=
wIDnQjJnbIg07KQZQBm5Obxl5_hRIXQQ6Yh8rNM7xAkzJi&amp;s=3D4PpcOB2owGFWjvPhD-XD=
2iHuk3B8OeCjlnUVG2Q_b-E&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_192564&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3Djt6YiS6E6i9e41ybWHwIDnQjJnbIg07KQZQBm5Obxl5_hRIXQQ6Yh8rNM7xAkz=
Ji&amp;s=3D4PpcOB2owGFWjvPhD-XD2iHuk3B8OeCjlnUVG2Q_b-E&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103208527_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3Djt6YiS6E6i9e41ybWHwIDnQjJnbIg07KQZQBm5Obxl5_hR=
IXQQ6Yh8rNM7xAkzJi&amp;s=3Da8388EZCsGeWCuCCtQNu9x8UE3soxZ_xr17coBWUVPM&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103208527_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Djt6YiS6E6i9e41ybWHwIDnQjJnbIg07=
KQZQBm5Obxl5_hRIXQQ6Yh8rNM7xAkzJi&amp;s=3Da8388EZCsGeWCuCCtQNu9x8UE3soxZ_xr=
17coBWUVPM&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3Djt6YiS6E6i9e41ybWHwIDnQjJnbIg07KQZQBm5Obxl5=
_hRIXQQ6Yh8rNM7xAkzJi&amp;s=3DAVhaS6PSPRkhIynLZKzh1Y7hmb7XX3ZyJKg-3oloVaY&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Djt6YiS6E6i9e41ybWHwI=
DnQjJnbIg07KQZQBm5Obxl5_hRIXQQ6Yh8rNM7xAkzJi&amp;s=3DAVhaS6PSPRkhIynLZKzh1Y=
7hmb7XX3ZyJKg-3oloVaY&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c60e59060ca0d9d4--

