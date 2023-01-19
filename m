Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED278C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 15:15:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.47633.1674141311597271642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 07:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CC5DdHi/;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id z7so2428331ljz.4
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 07:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OqzX24bwCksLziUqxohj1Fz6H0fWkqz8Kab+LCzRK+M=;
        b=CC5DdHi/a9YSnBIDjfKl8ZEow4x/tNehwzTOiYBdXmLQVhMp2gCOWwiui0n4hLBgYq
         oCCn6tjhkLA15GSEuK8mdJIK/1jzMx7E4fZYk+MFeU8RNNiBB8VrCB14amoMhV7TjPvR
         fVjDzNJ2TCr9qcF2jXxPzV8eLcXPjFefGCZzJZ1J+IDL5auqF0Ma478DSEEDTp/B4IuY
         xTcWXgjR1ObnFFIWWyCDMKAMidOXjeeNLvGHkTHPUFvjYj38PX92rMTxW0l29RF7mPrV
         hKBJCNnob+OLQBajIqjhQKjFWwWZSasktpl8+jw1uYaR0NwVrokV6Rysn7VP6F5/OlR/
         5jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqzX24bwCksLziUqxohj1Fz6H0fWkqz8Kab+LCzRK+M=;
        b=QY/TuxiYtWfaVxUZJ/BNeDoA3dMD0CSTx1CR4VgX0fWS54ChVYDc51P+AQMbAjGPv8
         HGbrE8BZB7LxQMW6iizb0jZwUaRhSRH9nX8hgtvSiPxFoPwq1KOWXYC3AT67M5LKycNg
         OgyTA1syq7/DY23GPP+yT7EWlfOnY9RhKhErLQZjUWzHQ/ZgcCnYBmdQFRY6+HzRQXFy
         kMLrJ2fkoDiS+AlWC0LxhaKFGtaSatRRacxKMKUPTusAzs3calE9eUBrfJy+gyeuJ9ny
         3S5EHzBpSz6tYIjlaUX1TJD1dvdSz8k+8rv3p7uE/CGl4JcZa0qQqCRPsM9YAKuJRwz1
         vHQQ==
X-Gm-Message-State: AFqh2kqmonfML+QQKdSx2IGPcv3UTtsOERS8cjX4ToZQwVfnBVc4QDOB
	2R4xe+/rdA1glfNStHdgKsYCX1fV739HJg9lrY0=
X-Google-Smtp-Source: AMrXdXvnGttf45hs8cthQ1NTys1H5OkdWY+M4qlcKZ/ibIJ2us9ckPvYQYKEuJ67zhkLq00qbXJj77IGYUl8Mwe6Bv4=
X-Received: by 2002:a2e:824b:0:b0:28b:94fd:1bdb with SMTP id
 j11-20020a2e824b000000b0028b94fd1bdbmr617540ljh.108.1674141309788; Thu, 19
 Jan 2023 07:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20230119131853.27372-1-f_l_k@t-online.de>
In-Reply-To: <20230119131853.27372-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Jan 2023 16:14:58 +0100
Message-ID: <CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gptfdisk: add follow-up patch to fix with
 current popt
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000012e4b805f29f667c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176145

--00000000000012e4b805f29f667c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It=E2=80=99s not a backport as source comes from source forge. Please check=
 other
patches to see the upstream situation and correct the status.

Alex

On Thu 19. Jan 2023 at 14.20, Markus Volk <f_l_k@t-online.de> wrote:

> sgdisk still segfaults for some tasks (e.g 'sgdisk -v', 'sgdisk -V')
>
> Add a follow-up patch that fixes the issue. It was taken from Archlinux
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../fdisk/gptfdisk/popt-1.19-follow-up.patch  | 42 +++++++++++++++++++
>  meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644
> meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch
>
> diff --git
> a/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch
> b/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch
> new file mode 100644
> index 0000000000..a5ccd2385a
> --- /dev/null
> +++ b/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch
> @@ -0,0 +1,42 @@
> +From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
> +From: Damian Kurek <starfire24680@gmail.com>
> +Date: Thu, 7 Jul 2022 03:39:16 +0000
> +Subject: [PATCH] Fix NULL dereference when duplicating string argument
> +
> +poptGetArg can return NULL if there are no additional arguments, which
> +makes strdup dereference NULL on strlen
> +
> +Upstream-Status: Backport [
> https://github.com/archlinux/svntogit-packages/tree/packages/gptfdisk/tru=
nk
> ]
> +
> +Unsure if this patch is really a backport yet. It was taken from Archlin=
ux
> +---
> + gptcl.cc | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/gptcl.cc b/gptcl.cc
> +index 0d578eb..ab95239 100644
> +--- a/gptcl.cc
> ++++ b/gptcl.cc
> +@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
> +    } // while
> +
> +    // Assume first non-option argument is the device filename....
> +-   device =3D strdup((char*) poptGetArg(poptCon));
> +-   poptResetContext(poptCon);
> ++   device =3D (char*) poptGetArg(poptCon);
> +
> +    if (device !=3D NULL) {
> ++      device =3D strdup(device);
> ++      poptResetContext(poptCon);
> +       JustLooking(); // reset as necessary
> +       BeQuiet(); // Tell called functions to be less verbose &
> interactive
> +       if (LoadPartitions((string) device)) {
> +@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
> +          cerr << "Error encountered; not saving changes.\n";
> +          retval =3D 4;
> +       } // if
> ++      free(device);
> +    } // if (device !=3D NULL)
> +    poptFreeContext(poptCon);
> +    return retval;
> +
> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
> b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
> index 66935b7fbb..cf0a60a1a9 100644
> --- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
> +++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
>
> file://0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch \
>
> file://0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch \
>             file://0001-Use-64bit-time_t-on-linux-as-well.patch \
> +           file://popt-1.19-follow-up.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176138):
> https://lists.openembedded.org/g/openembedded-core/message/176138
> Mute This Topic: https://lists.openembedded.org/mt/96376633/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000012e4b805f29f667c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">It=E2=80=99s not a backport as source comes from sou=
rce forge. Please check other patches to see the upstream situation and cor=
rect the status.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</d=
iv></div><div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu 19. Jan 2023 at 14.20, Markus Volk &lt;<a href=3D"mailt=
o:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-c=
olor:rgb(204,204,204)">sgdisk still segfaults for some tasks (e.g &#39;sgdi=
sk -v&#39;, &#39;sgdisk -V&#39;)<br>
<br>
Add a follow-up patch that fixes the issue. It was taken from Archlinux<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../fdisk/gptfdisk/popt-1.19-follow-up.patch=C2=A0 | 42 +++++++++++++=
++++++<br>
=C2=A0meta/recipes-devtools/fdisk/<a href=3D"http://gptfdisk_1.0.9.bb" rel=
=3D"noreferrer" target=3D"_blank">gptfdisk_1.0.9.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 43 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-fol=
low-up.patch<br>
<br>
diff --git a/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch=
 b/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch<br>
new file mode 100644<br>
index 0000000000..a5ccd2385a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch<br>
@@ -0,0 +1,42 @@<br>
+From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001<br>
+From: Damian Kurek &lt;<a href=3D"mailto:starfire24680@gmail.com" target=
=3D"_blank">starfire24680@gmail.com</a>&gt;<br>
+Date: Thu, 7 Jul 2022 03:39:16 +0000<br>
+Subject: [PATCH] Fix NULL dereference when duplicating string argument<br>
+<br>
+poptGetArg can return NULL if there are no additional arguments, which<br>
+makes strdup dereference NULL on strlen<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/archlinux/svntogi=
t-packages/tree/packages/gptfdisk/trunk" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/archlinux/svntogit-packages/tree/packages/gptfdisk/tr=
unk</a>]<br>
+<br>
+Unsure if this patch is really a backport yet. It was taken from Archlinux=
<br>
+---<br>
+ gptcl.cc | 6 ++++--<br>
+ 1 file changed, 4 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/gptcl.cc b/gptcl.cc<br>
+index 0d578eb..ab95239 100644<br>
+--- a/gptcl.cc<br>
++++ b/gptcl.cc<br>
+@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {<b=
r>
+=C2=A0 =C2=A0 } // while<br>
+ <br>
+=C2=A0 =C2=A0 // Assume first non-option argument is the device filename..=
..<br>
+-=C2=A0 =C2=A0device =3D strdup((char*) poptGetArg(poptCon));<br>
+-=C2=A0 =C2=A0poptResetContext(poptCon);<br>
++=C2=A0 =C2=A0device =3D (char*) poptGetArg(poptCon);<br>
+ <br>
+=C2=A0 =C2=A0 if (device !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 device =3D strdup(device);<br>
++=C2=A0 =C2=A0 =C2=A0 poptResetContext(poptCon);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0JustLooking(); // reset as necessary<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BeQuiet(); // Tell called functions to be less =
verbose &amp; interactive<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (LoadPartitions((string) device)) {<br>
+@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cerr &lt;&lt; &quot;Error encountered; =
not saving changes.\n&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} // if<br>
++=C2=A0 =C2=A0 =C2=A0 free(device);<br>
+=C2=A0 =C2=A0 } // if (device !=3D NULL)<br>
+=C2=A0 =C2=A0 poptFreeContext(poptCon);<br>
+=C2=A0 =C2=A0 return retval;<br>
+<br>
diff --git a/meta/recipes-devtools/fdisk/<a href=3D"http://gptfdisk_1.0.9.b=
b" rel=3D"noreferrer" target=3D"_blank">gptfdisk_1.0.9.bb</a> b/meta/recipe=
s-devtools/fdisk/<a href=3D"http://gptfdisk_1.0.9.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gptfdisk_1.0.9.bb</a><br>
index 66935b7fbb..cf0a60a1a9 100644<br>
--- a/meta/recipes-devtools/fdisk/<a href=3D"http://gptfdisk_1.0.9.bb" rel=
=3D"noreferrer" target=3D"_blank">gptfdisk_1.0.9.bb</a><br>
+++ b/meta/recipes-devtools/fdisk/<a href=3D"http://gptfdisk_1.0.9.bb" rel=
=3D"noreferrer" target=3D"_blank">gptfdisk_1.0.9.bb</a><br>
@@ -12,6 +12,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP=
}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Updated-guid.cc-to-de=
al-with-minor-change-in-libuuid.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-failure-crash-of-=
sgdisk-when-compiled-with-lates.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-64bit-time_t-on-l=
inux-as-well.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://popt-1.19-follow-up.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;dafead2693faeb8e8b97832b23407f6ed5b3219b=
c1784f482dd855774e2d50c2&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176138): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176138" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176138</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96376633/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96376633/1686489</a><br>
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
</div>

--00000000000012e4b805f29f667c--

