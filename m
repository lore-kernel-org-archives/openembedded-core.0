Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88087D6B6BB
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 18:19:40 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.22657.1730312374719793195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 11:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rhi61tov;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5ebc0dbc65dso131128eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730312374; x=1730917174; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bsJ2zYbW2JjBZt3EFBeLQR8/bZQ/YhBT6DpNRojrK1I=;
        b=Rhi61tovhZrMLg5NsNmiFnEEcuTAz178wgKRxLkqR0xI+A+RkfvjJEU6yFRq/GY1tv
         tXqINd/9x5MVZf5YR+y5HiQulAC/vGTUFgxIKIY/z4J0WEnYauxz+298TdDbutdfJQqc
         R9kJnllln0JDac5BInqK8SPe+vkar4UtXfhXBaC3SZbqjfmSuTi4IJk4QfGxwRlLPoEa
         QqKRI8fATthRwv2UNE4ngzyuDwRHlkXhRRxEZJGbFeCsFiXO3X83XH6NMTQA/n60pPs0
         +6xIBl1k15r+9ZYnb1wCGRoY3aCRJtPxPtxdhLHgFhmxXl07hEvnqKBdZeYpWsEwFLZm
         xYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730312374; x=1730917174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsJ2zYbW2JjBZt3EFBeLQR8/bZQ/YhBT6DpNRojrK1I=;
        b=H+6XJrdPWfaiyATKX0VpyHT1pXXooyAAq17o3PB2WTeR2IZzjDt+F5WCG6NR6fOG7M
         3EnHn4N2ujV3iibLQXJg1gVsOJGbnMyzsiU8jjUkvsy5UPY0ZmtDwQB5ufslrI7yo7jV
         +bisAfoYPSNhbDS8RlFpdUb1k9Ype+0je0c+6AItQgxLyfNK6qV+HhRuCUveJMOtyHN/
         ZAUpFj8MSXQtWtUbmrmfUhUX24UwS0aF300c0gsbvYdLh8uSnEJs7pm7IvAPjsealuNv
         0IeqI3kf1sAQUdwOcmy8V1WTz3OByPi1K0DnZsbSdGzGk4hfpiJ9vNZISP/37BTtypPi
         b4cg==
X-Gm-Message-State: AOJu0YzcutnokD7urPEkfi56VWblMburUh4pEq2qNn+Wd3AeLejGYM+w
	dwhC6OdZgwcnIHe82kK+W3o0OEqiNDn1oiNMi6Hd1viEFMOJOboPKTPuY5o2eblSr5YmMX3bvlY
	PZt0AsuAxiEqeaP7IB/0VR6Qh0lA=
X-Google-Smtp-Source: AGHT+IFyowC4zmu3VyamX21itENGG7GHwyLZs50RtkbTeeDhEAT4jg90m/5jyfVOLrs/pyVsKFXntqVysUZ40hRnd6k=
X-Received: by 2002:a05:6358:50c7:b0:1c2:f251:d36d with SMTP id
 e5c5f4694b2df-1c3f9f673admr850641855d.24.1730312373607; Wed, 30 Oct 2024
 11:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241030181725.214754-1-jose.quaresma@foundries.io> <18034DD8CF292769.12341@lists.openembedded.org>
In-Reply-To: <18034DD8CF292769.12341@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 30 Oct 2024 18:19:22 +0000
Message-ID: <CANPvuRkm06vDmUuFieQLGUo+brfZh+BUo3AzKOQH-JHCCVXxVQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 2/2] go-runtime: fixme: buildpaths
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000061245c0625b5beaa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 18:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206558

--00000000000061245c0625b5beaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (quarta, 30/10/2024 =C3=A0(s) 18=
:18):

> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-devtools/go/go-runtime_1.23.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> index 63464a1501..a9a4e2a044 100644
> --- a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> +++ b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> @@ -1,3 +1,4 @@
>  require go-${PV}.inc
>  require go-runtime.inc
>
> +INSANE_SKIP:${PN} +=3D "buildpaths"
>

Send this as RFC mostly because of this.

Jose


> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206557):
> https://lists.openembedded.org/g/openembedded-core/message/206557
> Mute This Topic: https://lists.openembedded.org/mt/109301348/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000061245c0625b5beaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu (quarta, 30/10/2024 =C3=A0(s) 18:18):<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Jose Quaresma &l=
t;<a href=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank">jose.quar=
esma@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.23.0.bb" rel=
=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.23.0.b=
b" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a> b/meta/rec=
ipes-devtools/go/<a href=3D"http://go-runtime_1.23.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-runtime_1.23.0.bb</a><br>
index 63464a1501..a9a4e2a044 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.23.0.bb" rel=
=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.23.0.bb" rel=
=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a><br>
@@ -1,3 +1,4 @@<br>
=C2=A0require go-${PV}.inc<br>
=C2=A0require go-runtime.inc<br>
<br>
+INSANE_SKIP:${PN} +=3D &quot;buildpaths&quot;<br></blockquote><div><br></d=
iv><div>Send this as RFC mostly because of this.<br><br>Jose</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.47.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206557): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206557" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206557</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109301348/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109301348/5052612</a><br>
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
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000061245c0625b5beaa--

