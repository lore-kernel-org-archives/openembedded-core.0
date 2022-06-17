Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A605C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 14:31:01 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.31066.1655476256687530922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 07:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b9sL+Kin;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gd1so4093779pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5/2cgWY9/s2Y5k2SKvRO32/g0rXnUyxMtG4/cHLQ4vU=;
        b=b9sL+KinQOwukNjT/HZptCiM6IOEhRghTVQErUzCWv6VPLWC9HWc2FvbXd5EvjzKPh
         QjlLax4Fz0GsWPqvZ8XccdIrmQcDI2LmWfMh8sZhyvAJvBYFP1yJbV7LPVcVioX7psDl
         a8nZA3pjMccg49CeS2rouFI3cAE5dxCPQT5nHEYl6T3xttKShT7yFuu9DvvezHrIOJ13
         fprnVQ9jKwcwGw0omM2KS7XqOKCHsathOJ9sPE15WcHbsm1k/Hd0WhqsdzUOijr7Hc7w
         6isDY1WinSJi81UrZqwtzb0MQmym2JFSdvSZ6ligWmwoF2jLtqVHrkEfsWPvmgdOvhOl
         xOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5/2cgWY9/s2Y5k2SKvRO32/g0rXnUyxMtG4/cHLQ4vU=;
        b=x1mChahwcP9RAZBY19YaegjY3oi3RnDmJwDqAF6yA9aG+2xh22Bs3nRSqpUMINX+/A
         Ubcxn17dHucraEBtkERdWZ5maa8KyTPrqXVP1xBySRuLRwBjla11/1FlQmCbu0qkubAd
         pv7vVDjzAUD4U4r6SX6XNKXXkVsUVYYZ64+Vbr7hr9jik7PRwtMz25vmjjlj1rx375U9
         4Mt6HzuCGlm6qM4B+u9jxFP6yMjRtokcu1ZTcMi7gtKHRiTnGrv76BjhnaeZz/NVjEz9
         EQqPpq1jYIs3UCFxieeo7F3CxCi+Wu0xWz3UqZ0N5Nrb05KsbioVpOJvB52WRxy8qimO
         7JRQ==
X-Gm-Message-State: AJIora8xXekgCXbmeR2jeBGGqzpZlpRDeTCQhsPBPwcsN3N74Yt5D8hK
	PxWsQG8diWZXUCgvxcfb6MrQASfBiZoFwMOUzFA=
X-Google-Smtp-Source: 
 AGRyM1tPV4X+L9nTxMJt6H+sAmJCPQTIRKIQMln4+Px7BImZucmkxEaITUjDvYtkKoszN8vVVidS2dAgqT8skGurbQk=
X-Received: by 2002:a17:90a:49cd:b0:1ea:6e7e:5872 with SMTP id
 l13-20020a17090a49cd00b001ea6e7e5872mr21821779pjm.239.1655476255910; Fri, 17
 Jun 2022 07:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <1655447108-20329-1-git-send-email-wangmy@fujitsu.com>
 <1655447108-20329-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1655447108-20329-2-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 17 Jun 2022 07:30:46 -0700
Message-ID: 
 <CANx9H-AoNVG+v5hM3CV3ZS62x9tqJMmJUV4HYKRnV2pvQ4NQ+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-exceptiongroup : add recipe
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002aed6905e1a59a17"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 14:31:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167026

--0000000000002aed6905e1a59a17
Content-Type: text/plain; charset="UTF-8"

Why should this be added to oe-core? You have an empty git log with no
justification. We also do not typically take pre-release components to
oe-core (the version is a release candidate).

You also need to add a maintainer entry.

On Thu, Jun 16, 2022 at 11:25 PM wangmy <wangmy@fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/python3-exceptiongroup_1.0.0rc8.bb         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/
> python3-exceptiongroup_1.0.0rc8.bb
>
> diff --git a/meta/recipes-devtools/python/
> python3-exceptiongroup_1.0.0rc8.bb b/meta/recipes-devtools/python/
> python3-exceptiongroup_1.0.0rc8.bb
> new file mode 100644
> index 0000000000..adf530a6e5
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-exceptiongroup_1.0.0rc8.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "This is a backport of the BaseExceptionGroup and
> ExceptionGroup classes from Python 3.11."
> +HOMEPAGE = "https://pypi.org/project/exceptiongroup"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d5caa317463c433575efff1d2fe206d7"
> +
> +SRC_URI[sha256sum] =
> "6990c24f06b8d33c8065cfe43e5e8a4bfa384e0358be036af9cc60b6321bd11a"
> +
> +#RDEPENDS:${PN} += "python3-profile python3-logging"
> +
> +inherit pypi python_setuptools_build_meta
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167017):
> https://lists.openembedded.org/g/openembedded-core/message/167017
> Mute This Topic: https://lists.openembedded.org/mt/91816507/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002aed6905e1a59a17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Why should this be added to oe-core? You have an empty gi=
t log with no justification. We also do not typically take pre-release comp=
onents to oe-core (the version is a release candidate).</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">You also need to add a maintainer entry.</d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Jun 16, 2022 at 11:25 PM wangmy &lt;<a href=3D"mailto:wangmy@fuji=
tsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Signed=
-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_b=
lank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-exceptiongroup_1.0.0rc8.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-exceptiongroup_1.0.0rc8.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-exceptiongroup_1.0.0rc8.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-exceptiongroup_1.0.0rc8.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-excepti=
ongroup_1.0.0rc8.bb" rel=3D"noreferrer" target=3D"_blank">python3-exception=
group_1.0.0rc8.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-exceptiongroup_1.0.0rc8.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-exceptiongroup_1.0.0rc8.bb</a><br>
new file mode 100644<br>
index 0000000000..adf530a6e5<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-exceptiongroup=
_1.0.0rc8.bb" rel=3D"noreferrer" target=3D"_blank">python3-exceptiongroup_1=
.0.0rc8.bb</a><br>
@@ -0,0 +1,11 @@<br>
+DESCRIPTION =3D &quot;This is a backport of the BaseExceptionGroup and Exc=
eptionGroup classes from Python 3.11.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/exceptiongroup" rel=
=3D"noreferrer" target=3D"_blank">https://pypi.org/project/exceptiongroup</=
a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd5caa317463c433575efff1d2f=
e206d7&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;6990c24f06b8d33c8065cfe43e5e8a4bfa384e0358be0=
36af9cc60b6321bd11a&quot;<br>
+<br>
+#RDEPENDS:${PN} +=3D &quot;python3-profile python3-logging&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167017): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167017" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167017</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91816507/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
91816507/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002aed6905e1a59a17--

