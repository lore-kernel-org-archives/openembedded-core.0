Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.30.1624398657696176875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 14:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IVZDUW11;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: weaverjs@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id i68so140376qke.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 14:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ph6+cRtfYd2GDBpri3ai9KuUByEa8sl8Ao0LZcj6v4M=;
        b=IVZDUW11GFypoSyjNrrm3ikVpKyaj4uXqKWpCCp2ZTF/cp6siBM2IpkLuHjSM7IzgE
         TqJTQPiEOyphUl/mbsh19QHe1e7iIeVuAK2t2y7GuFnZa2mfD2JL+7ETAr/OL4pvImaW
         LnSBE8rwsdjdb2sg2thNC5WRFoWVyo+B35tqK5M4GgWm9e1BryBfO6v7GJ/K7ArUhUlX
         o3PGLNcwmteRnUh3AzgCdNwaNVndwbc0CJZo8T/tfeRNaJnkEgtJFxYKsVaf3MipuMkH
         U/YcYU2XvoWV+Ux358ZMHpnkRH0YmqfvSlKOu5bTcVz5VuMNYftZl4GWdZ+oXAaQjDFv
         ZAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ph6+cRtfYd2GDBpri3ai9KuUByEa8sl8Ao0LZcj6v4M=;
        b=fIdiEq2WIO8bFGExwKa6TXXEu6Wl17B8N6gyo7PVyBRpx0AsON4a9spatw2JrbfLW6
         tgxzJHSPTS3EHhi7ZuwGJ5vR2xPB2lafrdPTMGj/mqfYgy077yw72zgn4WGcyYYDoSlz
         LoRs1OqMXS1dFQZj2qNmMoUZamASnxMQtRACqliFUnmW9fU1J2wDSw+TrVvnP3STJSa5
         y1mOjkWqdkcWbZQbdvad3ZYN9noVKgXzrSzwoT18kO+UlicR0mdDWCRcjJHpv8JDs9Nb
         9Jlt27ZQ0jdJpffQh+JmMEQc7Yoa96Qz/d96i7F+CSds4hKx5P/r89QcL/3fIE389pJq
         0ihA==
X-Gm-Message-State: AOAM531Ba6tNBDj75vjdKd96ij4bqiWm/Te6eNE5MfPa+Kve6Z+aeFnc
	KwovQRvIjpraOLLj5UEO23z73xgBq5gHb5vbzL28gDc=
X-Google-Smtp-Source: ABdhPJythJ9iuGkSaYVacC1vxAWwFBGew5Vz2sb8fDk9ksTC5JejGLsj81EfFv4FSz1nmnKAfpdFY/PLdqZ0uoSobqM=
X-Received: by 2002:a37:9f47:: with SMTP id i68mr6658680qke.266.1624398656821;
 Tue, 22 Jun 2021 14:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <1686C6B4AE0761BC.32729@lists.openembedded.org>
In-Reply-To: <1686C6B4AE0761BC.32729@lists.openembedded.org>
From: "Scott Weaver" <weaverjs@gmail.com>
Date: Tue, 22 Jun 2021 17:50:44 -0400
Message-ID: <CAJGjTV_yVtjf6sW7vyapmavA=u_Lzw-sVjtiUOURV+Mhdy3O-g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] README.skeleton: add readme to meta-skeleton layer
To: Scott Weaver <weaverjs@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000e9dc7505c561c86e"

--000000000000e9dc7505c561c86e
Content-Type: text/plain; charset="UTF-8"

I didn't see that this patch was picked up (but maybe I'm looking in the
wrong place) and I received the email from Stephen that the issue should be
moved to 3.4 M2.
Did I send this to the wrong mailing list or is it not the solution you're
looking for?

I elaborated in bugzilla on why I think just adding the readme file to
close this issue is enough but you may not have seen that comment or agree.
:)
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13612

Scott

On Tue, Jun 8, 2021 at 9:46 PM Scott Weaver via lists.openembedded.org
<weaverjs=gmail.com@lists.openembedded.org> wrote:

> Added to satisfy the yocto-check-layer tool readme file test.
>
> [YOCTO #13612]
>
> Signed-off-by: Scott Weaver <weaverjs@gmail.com>
> ---
>  meta-skeleton/README.skeleton | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 meta-skeleton/README.skeleton
>
> diff --git a/meta-skeleton/README.skeleton b/meta-skeleton/README.skeleton
> new file mode 100644
> index 0000000000..25468dc87a
> --- /dev/null
> +++ b/meta-skeleton/README.skeleton
> @@ -0,0 +1,7 @@
> +meta-skeleton
> +=============
> +
> +The meta-skeleton layer contains example recipes and configuration files.
> +
> +This layer is not intended to demonstrate a Yocto Project Compatible
> software layer.
> +Disable the signature check when testing this layer using the
> yocto-check-layer tool.
> --
> 2.25.1
>
>
> 
>
>

--000000000000e9dc7505c561c86e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I didn&#39;t see that this patch was picked up (but m=
aybe I&#39;m looking in the wrong place) and I received the email from Step=
hen that the issue should be moved to 3.4 M2.</div><div>Did I send this to =
the wrong mailing list or is it not the solution you&#39;re looking for?</d=
iv><div><br></div><div>I elaborated in bugzilla on why I think just adding =
the readme file to close this issue is enough but you may not have seen tha=
t comment or agree. :)<br></div><div><a href=3D"https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D13612">https://bugzilla.yoctoproject.org/show_bug.=
cgi?id=3D13612</a></div><div><br></div><div>Scott <br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 8, =
2021 at 9:46 PM Scott Weaver via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;weaverjs=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Added to satisfy the yoc=
to-check-layer tool readme file test.<br>
<br>
[YOCTO #13612]<br>
<br>
Signed-off-by: Scott Weaver &lt;<a href=3D"mailto:weaverjs@gmail.com" targ=
et=3D"_blank">weaverjs@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-skeleton/README.skeleton | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
=C2=A0create mode 100644 meta-skeleton/README.skeleton<br>
<br>
diff --git a/meta-skeleton/README.skeleton b/meta-skeleton/README.skeleton=
<br>
new file mode 100644<br>
index 0000000000..25468dc87a<br>
--- /dev/null<br>
+++ b/meta-skeleton/README.skeleton<br>
@@ -0,0 +1,7 @@<br>
+meta-skeleton<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+The meta-skeleton layer contains example recipes and configuration files.=
<br>
+<br>
+This layer is not intended to demonstrate a Yocto Project Compatible soft=
ware layer.<br>
+Disable the signature check when testing this layer using the yocto-check=
-layer tool.<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e9dc7505c561c86e--
