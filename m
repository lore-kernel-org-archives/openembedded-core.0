Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BFEC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 16:19:09 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.24472.1636993148972141427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 08:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oPf4zVWQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id p37so34362395uae.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 08:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nK48toPWNDqnGcJUMnG/D1x4K4AnruiyRbI4fJ/Q3f0=;
        b=oPf4zVWQVu904H4+EX1fz9GBZHGSKacAuIgdlAD2oRn1JLC5pl+Pk6hyYptYioIgL7
         n3p0rkFVcV0AwzN3w5xorZkJCHrxlKfLLt6fC0khsiR+bsUewAbfQUPpi61i2M746en1
         SyytLjJAV79E+LOXZ7WXR3QTSOG/3V2JqyuuKm8avW4rDGKl8xiKHNk+QIsK14zOpkhh
         hCEF58RJl1RuFyO6cr9E5pWKGHftnMJzW3yjNX9inVc51aQJSwWZ/53NIYmhMgv1RRaE
         cATZ3fYajQTjsyky8c5uJDB+Klv+2XT7DntXwjxoiMwtAsrBPLvJ9B4/ctGN+ioUk5Zm
         FgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nK48toPWNDqnGcJUMnG/D1x4K4AnruiyRbI4fJ/Q3f0=;
        b=8G6KFLriQp8s7tYohxY/sDGQi/ALgBtFNgfzyNRlDfEFqQPLF0r5eR8SI22pC84dF/
         3q5Ll0ewpgtWwNp08LlqAvlA9WwzyIT0lBLpsfAggpuZjFFRLdqtWdWM7Cq+Yr3e4rVT
         GM3Y4o/+07EGa2hAr6AyezWr5k3J1+xu/zWTPQLtjWYdndqtvmY1CZ6KDYkFaVMcu6OG
         UdPH646MCEO/UMtlX6qwMlE9Px/QHCpc/xjWWumbdUcM/OiVNepUdfMfA4Tekgdvs0Bs
         Kr5zD0HZbT9Slr6oMXc8Ho3Ud/uCRGno/FSBxZUMdR44UPXW1GzjAQtNGL/AfS9C+VI6
         RpIQ==
X-Gm-Message-State: AOAM533BuLd0Ek6YbNEZuPw6lO2D4ripreHl6vqp3LfHjln3fKzu8Igr
	5s4+0UI8/XseLA0mRgsnuEW2v2oxyl6xQdk0nJw=
X-Google-Smtp-Source: 
 ABdhPJwFSdSM6LbiBtJ+VCSxHPY2ur+Ezns8IQ0zeqmJ3RpBM0xOzylqOOlELqp6lXa5OMrTOFpBt4nbBoydMt2El60=
X-Received: by 2002:ab0:484:: with SMTP id 4mr59791067uaw.71.1636993148157;
 Mon, 15 Nov 2021 08:19:08 -0800 (PST)
MIME-Version: 1.0
References: <1636990751-78972-1-git-send-email-wangmy@fujitsu.com>
 <1636990751-78972-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1636990751-78972-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Nov 2021 17:18:57 +0100
Message-ID: 
 <CANNYZj-us8u_WrRLXjVEXuOR6uT0=so2-bE-BR=diTv=q2-nsg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: upgrade 249.5 -> 249.6
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000018822105d0d62ba1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 16:19:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158304

--00000000000018822105d0d62ba1
Content-Type: text/plain; charset="UTF-8"

Thanks, this needs to be updated together with systems itself. You can
squash the two updates together as they share the .inc.

Alex

On Mon 15. Nov 2021 at 16.39, wangmy <wangmy@fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../systemd/{systemd-boot_249.5.bb => systemd-boot_249.6.bb}    | 0
>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd-boot_249.5.bb =>
> systemd-boot_249.6.bb} (100%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_249.5.bb
> b/meta/recipes-core/systemd/systemd-boot_249.6.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_249.5.bb
> rename to meta/recipes-core/systemd/systemd-boot_249.6.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> index 4e4cdd2e2f..f3ce32efc2 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>
>  file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>
> -SRCREV = "00b0393e65252bf631670604f58b844780b08c50"
> +SRCREV = "deda69dad784f9c4367533555ff4d7bf6308c0ff"
>  SRCBRANCH = "v249-stable"
>  SRC_URI = "git://
> github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}
> <http://github.com/systemd/systemd-stable.git;protocol=https;branch=$%7BSRCBRANCH%7D>
> \
>  "
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158302):
> https://lists.openembedded.org/g/openembedded-core/message/158302
> Mute This Topic: https://lists.openembedded.org/mt/87071795/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000018822105d0d62ba1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, this needs to be updated together with systems it=
self. You can squash the two updates together as they share the .inc.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 15. Nov 2021 =
at 16.39, wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)">Signed-off-by: Wang Mingyu &lt;=
<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com<=
/a>&gt;<br>
---<br>
=C2=A0.../systemd/{<a href=3D"http://systemd-boot_249.5.bb" rel=3D"noreferr=
er" target=3D"_blank">systemd-boot_249.5.bb</a> =3D&gt; <a href=3D"http://s=
ystemd-boot_249.6.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249=
.6.bb</a>}=C2=A0 =C2=A0 | 0<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
=C2=A02 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot_249.=
5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.5.bb</a> =3D&gt=
; <a href=3D"http://systemd-boot_249.6.bb" rel=3D"noreferrer" target=3D"_bl=
ank">systemd-boot_249.6.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.5=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.5.bb</a> b/meta/=
recipes-core/systemd/<a href=3D"http://systemd-boot_249.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">systemd-boot_249.6.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.5.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.5.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.6.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.6.bb</a><br>
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc<br>
index 4e4cdd2e2f..f3ce32efc2 100644<br>
--- a/meta/recipes-core/systemd/systemd.inc<br>
+++ b/meta/recipes-core/systemd/systemd.inc<br>
@@ -14,7 +14,7 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D751419260aa95449=
9f7abaabaa882bbe \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c&quot;<br>
<br>
-SRCREV =3D &quot;00b0393e65252bf631670604f58b844780b08c50&quot;<br>
+SRCREV =3D &quot;deda69dad784f9c4367533555ff4d7bf6308c0ff&quot;<br>
=C2=A0SRCBRANCH =3D &quot;v249-stable&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/systemd/systemd-=
stable.git;protocol=3Dhttps;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/systemd/systemd-stable.git;protocol=3Dhttps;bra=
nch=3D${SRCBRANCH}</a> \<br>
=C2=A0&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158302): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158302" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158302</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87071795/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87071795/1686489</a><br>
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

--00000000000018822105d0d62ba1--

