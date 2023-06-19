Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A188EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:18:53 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.7300.1687180723504702751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=q4yR8qbz;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so1042633e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687180722; x=1689772722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s+roJ50bo4cbNJzw3RBcQDulp7KDerrODSBVbSev1qc=;
        b=q4yR8qbztaN3r3RrfDo0BkNsskB1w1AAoQJo2WID16XqGjnGFs1GrRbWwEHzHtUnss
         vZtu1koYb9dAUWv4OOhEWKmT1B+Irifoy+OEsmExyZsQnUZIOiNNUtlwYHYXRI/a69rT
         6NB+F6yvVbGO3PxKlY+btPCjqzBBEA5aroYrZxLRZs9GMXX+e6e79PJvvqkqLqP+Lgc3
         8nm5Xyt67FLw5UDkrY/kjRcT/FB1gFRQClmqTmJiL4Kxf7KrM6DFGQhKyuVk0vYDsnUy
         5G0OV511yG9vstIe6Vw39y3Rtjy4RsNNnNoFfca4tgq0cEeqCxL1u0R3xOSy8uIkNqYE
         0vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180722; x=1689772722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+roJ50bo4cbNJzw3RBcQDulp7KDerrODSBVbSev1qc=;
        b=lMt1qRwmzG17vJsVDmEFgSNHbOydteWpl2sw221KBKPOXDSQ8RPP6y4y66L/0Cpdgf
         inz+FaknuCgAGqL6FlT/VAOIgpAce2jzfh8p9w/sYu1T+kaH/OJZQM6Qu8B6xmHFTdTW
         K3v6tp+tJNAEASvHTywuTdbi5blKPjC7cLfwrVhISTe3kPuCctQvh1KgdQwavWwMTOZA
         lgLxDCFOlhHxPm4I+STx3o5r+jtQWuBlDAtinOfvZU1OwHby7N7NUIq3Efv3bu1tJfV1
         5NLyvZOdHKRJfLujHNQA82u77SfpmMxDt3Y1p4q3rbpCZZY4cxA6HIZAvicX9D+JYTuU
         zYZQ==
X-Gm-Message-State: AC+VfDzT9xEJf6AvwNhlYt/EnSsFLJzW3p9lEhHhhzEA2ZAUedl7uyUE
	Rd7ZwnUWGzq97mDuh7YkQ/h1v7qSGsUC2R696X0=
X-Google-Smtp-Source: ACHHUZ5Bic3xzxp/JigrgNKLggcwxUqFDkhij43YCzC224R4n0wRwirNwyOq3VxF5fcl8tm3DiIlpQwx4RH8q9mldDs=
X-Received: by 2002:a19:5018:0:b0:4f8:75b0:2297 with SMTP id
 e24-20020a195018000000b004f875b02297mr731923lfb.43.1687180721297; Mon, 19 Jun
 2023 06:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230618212617.232149-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20230618212617.232149-1-alexandre.belloni@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Jun 2023 15:18:30 +0200
Message-ID: <CANNYZj85WkWiLNMjmGVijaNRXf3uzJRtS6Oi8rGi5QpX=yyZTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base-passwd: fix patchreview warning
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000909e2505fe7b5f58"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 13:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183106

--000000000000909e2505fe7b5f58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Should the regex that finds these lines be fixed rather? It=E2=80=99s entir=
ely
valid to say =E2=80=98upstream status=E2=80=99 somewhere, it should be matc=
hing
=E2=80=98Upstream-Status:=E2=80=99 at the start of the line exactly.

Alex

On Sun 18. Jun 2023 at 23.26, Alexandre Belloni via lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:

> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> Fix:
>
> Malformed Upstream-Status 'Upstream status'
> (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)
> Unknown Upstream-Status value 'says'
> (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../base-passwd/base-passwd/0007-Add-wheel-group.patch          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
> b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
> index 00eaec38a294..d77122789d5e 100644
> --- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patc=
h
> +++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patc=
h
> @@ -2,7 +2,7 @@
>  We need to have a wheel group which has some system privileges to consul=
t
> the
>  systemd journal or manage printers with cups.
>
> -Upstream status says the group does not exist by default.
> +Upstream says the group does not exist by default.
>
>  Upstream-Status: Inappropriate [enable feature]
>
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183064):
> https://lists.openembedded.org/g/openembedded-core/message/183064
> Mute This Topic: https://lists.openembedded.org/mt/99611534/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000909e2505fe7b5f58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Should the regex that finds these lines be fixed rather? =
It=E2=80=99s entirely valid to say =E2=80=98upstream status=E2=80=99 somewh=
ere, it should be matching =E2=80=98Upstream-Status:=E2=80=99 at the start =
of the line exactly.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ale=
x</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sun 18. Jun 2023 at 23.26, Alexandre Belloni via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;alexandre.belloni=
=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Alexandre B=
elloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blan=
k">alexandre.belloni@bootlin.com</a>&gt;<br>
<br>
Fix:<br>
<br>
Malformed Upstream-Status &#39;Upstream status&#39; (meta/recipes-core/base=
-passwd/base-passwd/0007-Add-wheel-group.patch)<br>
Unknown Upstream-Status value &#39;says&#39; (meta/recipes-core/base-passwd=
/base-passwd/0007-Add-wheel-group.patch)<br>
<br>
Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bo=
otlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0.../base-passwd/base-passwd/0007-Add-wheel-group.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group=
.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.pat=
ch<br>
index 00eaec38a294..d77122789d5e 100644<br>
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch<=
br>
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch<=
br>
@@ -2,7 +2,7 @@<br>
=C2=A0We need to have a wheel group which has some system privileges to con=
sult the<br>
=C2=A0systemd journal or manage printers with cups.<br>
<br>
-Upstream status says the group does not exist by default.<br>
+Upstream says the group does not exist by default.<br>
<br>
=C2=A0Upstream-Status: Inappropriate [enable feature]<br>
<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183064): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183064" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183064</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99611534/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99611534/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000909e2505fe7b5f58--

