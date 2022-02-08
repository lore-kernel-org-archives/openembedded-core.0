Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C62DC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 10:10:13 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.9335.1644315011939271973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oZMRwaJA;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id o17so23703257ljp.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4vSkKk5gP5X5UzrBOOJoYQ1yBR0W6O0DCfEHoauf5V8=;
        b=oZMRwaJAeKeA9U/yvWWISQkX2XA+EtJoV+daEzDFAFLrpOoxrQYl+L9jW34f5nYDSF
         jJrjoTcmTF9ENzvbAtf0xf1i0qIEVAJZr3VQlAG9OhsWIc+aJERxKkLyZopHxu75qe+6
         spUxYawzm9Fw9k4u6ANBe6bO45xQbT3TH+FCLj4jV9t7T65nbmYjCl/xhqAD4HZYqVba
         dibyTE81/h89+s6D7YO90anwsfqO4jtXxhM/yj0apxhGEMaINQUjzuwH0vPT5IfZS1R6
         FlSMoMOIWJPcGuFK84JS5Zdods2+yy2FMY+hhwihXVLU17Aj6afA2wk2DMzbl7Z0HQXN
         UF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4vSkKk5gP5X5UzrBOOJoYQ1yBR0W6O0DCfEHoauf5V8=;
        b=iOEQf/tFcFRQQ/h8vCFguUWQxPe6h3pEgdACAYjNMMMurscj6ycuyr8KBcA23B8X2h
         gwA5/9XAnfXcVx8khTNar9DWiSwjLORPU9pyyGC+HpfYSy1pVLZIeE2epS3fwh2Zm3BE
         Ldn63NCM4YMq/q9a7bFVipsjHJb344/ObnxqR0/9N0lslH3MIOnCrV4c8A1nTct9VVMI
         2EbXATEnc4N1c2bluDqA/t/j7WjhnAVfyVBV2iAFtwnNvYaOiHjpR64qCxg70suWFkUU
         GC9j3qiYfI6SRWC1otUbdOmsYbuWaguY0lclGVEjZ68RnPaKDRL7+yGB9GaMYXD2RxFX
         S+Jw==
X-Gm-Message-State: AOAM532cReXBJHfogxjTZZTET3kBSJ9Io5HKR2BEt18JlSiFwSIQWq/p
	UKnpCITuKIhl+idShqGK6od2YDxKSEPw5K9uT18=
X-Google-Smtp-Source: 
 ABdhPJyHmFq0eaD4CNxinWz2DFOVN7VMGC6PKaQkcFl0h/THDwm3i3KVu4Dp0jC6Tk5aBhtfQC4wp5krfckk+BEeBcw=
X-Received: by 2002:a2e:b0ca:: with SMTP id g10mr2403017ljl.216.1644315009840;
 Tue, 08 Feb 2022 02:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20220208034149.399705-1-bkylerussell@gmail.com>
In-Reply-To: <20220208034149.399705-1-bkylerussell@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 8 Feb 2022 10:09:58 +0000
Message-ID: 
 <CANPvuRm8bjZEK1znAC3WwJVs+sNUezRW+wBogWkkBR2itvsVfg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] rpm: fix intermittent compression
 failure in do_package_write_rpm
To: bkylerussell@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000f7af005d77eec9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 10:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161489

--0000000000000f7af005d77eec9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

<bkylerussell@gmail.com> escreveu no dia ter=C3=A7a, 8/02/2022 =C3=A0(s) 03=
:42:

> rpmbuild can start processing random memory when processing the value
> provided by XZ_THREADS, and unintentionally disable encoding for a
> file descriptor that in fact requires encoding to be enabled in order
> for lzwrite() to actually create an rpm.
>
>   *** Fdopen(0x7f2030002b30,w6T16.xzdio)  | fdio 23 fp (nil)
>   =3D=3D>     lzopen_internal("w6T16", 23, 1)
>   =3D=3D>     lzopen_internal set encoding
>   =3D=3D>     lzopen_internal clear encoding
>   =3D=3D> Fdopen(0x7f2030002b30,"w6T16.xzdio") returns fd 0x7f2030002b30
> | xzdio 0x7f2030004e30 fp 23 | fdio -1 fp (nil)
>   =3D=3D>     lzwrite(0x7f2030004e30, 0x7f20789d8070, 6) encoding 0
>   =3D=3D>     Fwrite(0x7f2030002b30,0x7f20789d8070,6) rc -1   | xzdio
> 0x7f2030004e30 fp 23 | fdio -1 fp (nil)
>   error: create archive failed: cpio: write
>
> When the encoding bit gets cleared on the LZFILE* struct, lzwrite() then
> rightfully complains when it detects !lzfile->encoding, which then gets
> bubbled up as a write failure when we go to create the archive.
>
> This fix is available in the rpm 4.17-release.
>
> Upstream-Status: Backport [
> https://github.com/rpm-software-management/rpm/commit/405fc8998181353bd51=
0864ca251dc233afec276
> ]
>

-Upstream-Status: Backport [
https://github.com/rpm-software-management/rpm/commit/405fc8998181353bd5108=
64ca251dc233afec276
]
+Signed-off-by: your@mail

Upstream-Status need to be placed on the patch an not on the commit message

---
>  ..._internal-mode-parsing-when-Tn-is-us.patch | 31 +++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644
> meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsi=
ng-when-Tn-is-us.patch
>
> diff --git
> a/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-par=
sing-when-Tn-is-us.patch
> b/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-par=
sing-when-Tn-is-us.patch
> new file mode 100644
> index 0000000000..52110fa2b1
> --- /dev/null
> +++
> b/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-par=
sing-when-Tn-is-us.patch
> @@ -0,0 +1,31 @@
> +From 405fc8998181353bd510864ca251dc233afec276 Mon Sep 17 00:00:00 2001
> +From: Vitaly Chikunov <vt@altlinux.org>
> +Date: Wed, 6 Jan 2021 23:43:41 +0300
> +Subject: [PATCH] rpmio: Fix lzopen_internal mode parsing when 'Tn' is us=
ed
> +
> +When there is number after "T" (suggested number of threads or "0" for
> +getncpus), lzopen_internal() mode parser would skip one byte, and when
> +it's at the end of the string it would then parse undesired garbage from
> +the memory, making intermittent compression failures.
> +
> +Fixes: 7740d1098 ("Add support for multithreaded xz compression")
> +Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
>

+Upstream-Status: Backport [
https://github.com/rpm-software-management/rpm/commit/405fc8998181353bd5108=
64ca251dc233afec276
]


> +---
> + rpmio/rpmio.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
> +index ed1e25140..9d32ec6d9 100644
> +--- a/rpmio/rpmio.c
> ++++ b/rpmio/rpmio.c
> +@@ -798,6 +798,7 @@ static LZFILE *lzopen_internal(const char *mode, int
> fd, int xz)
> +                * should've processed
> +                * */
> +               while (isdigit(*++mode));
> ++              --mode;
> +           }
> + #ifdef HAVE_LZMA_MT
> +           else
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> index c39a5208e5..376021d913 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> @@ -44,6 +44,7 @@ SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.14.x;protoc
>
> file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
>
> file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
>             file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
> +
>  file://0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch \
>             file://CVE-2021-3421.patch \
>             file://CVE-2021-20266.patch \
>             "
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161472):
> https://lists.openembedded.org/g/openembedded-core/message/161472
> Mute This Topic: https://lists.openembedded.org/mt/88989796/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000f7af005d77eec9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">&lt;<a href=3D"mailto:bkylerussell@gmail.com">bkyl=
erussell@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 8/02/2022 =C3=A0(s) =
03:42:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">rpmbuild =
can start processing random memory when processing the value<br>
provided by XZ_THREADS, and unintentionally disable encoding for a<br>
file descriptor that in fact requires encoding to be enabled in order<br>
for lzwrite() to actually create an rpm.<br>
<br>
=C2=A0 *** Fdopen(0x7f2030002b30,w6T16.xzdio)=C2=A0 | fdio 23 fp (nil)<br>
=C2=A0 =3D=3D&gt;=C2=A0 =C2=A0 =C2=A0lzopen_internal(&quot;w6T16&quot;, 23,=
 1)<br>
=C2=A0 =3D=3D&gt;=C2=A0 =C2=A0 =C2=A0lzopen_internal set encoding<br>
=C2=A0 =3D=3D&gt;=C2=A0 =C2=A0 =C2=A0lzopen_internal clear encoding<br>
=C2=A0 =3D=3D&gt; Fdopen(0x7f2030002b30,&quot;w6T16.xzdio&quot;) returns fd=
 0x7f2030002b30=C2=A0 =C2=A0 =C2=A0 | xzdio 0x7f2030004e30 fp 23 | fdio -1 =
fp (nil)<br>
=C2=A0 =3D=3D&gt;=C2=A0 =C2=A0 =C2=A0lzwrite(0x7f2030004e30, 0x7f20789d8070=
, 6) encoding 0<br>
=C2=A0 =3D=3D&gt;=C2=A0 =C2=A0 =C2=A0Fwrite(0x7f2030002b30,0x7f20789d8070,6=
) rc -1=C2=A0 =C2=A0| xzdio 0x7f2030004e30 fp 23 | fdio -1 fp (nil)<br>
=C2=A0 error: create archive failed: cpio: write<br>
<br>
When the encoding bit gets cleared on the LZFILE* struct, lzwrite() then<br=
>
rightfully complains when it detects !lzfile-&gt;encoding, which then gets<=
br>
bubbled up as a write failure when we go to create the archive.<br>
<br>
This fix is available in the rpm 4.17-release.<br>
<br>
Upstream-Status: Backport [<a href=3D"https://github.com/rpm-software-manag=
ement/rpm/commit/405fc8998181353bd510864ca251dc233afec276" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/rpm-software-management/rpm/commit/=
405fc8998181353bd510864ca251dc233afec276</a>]<br></blockquote><div>=C2=A0</=
div><div>-Upstream-Status: Backport [<a href=3D"https://github.com/rpm-soft=
ware-management/rpm/commit/405fc8998181353bd510864ca251dc233afec276" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/rpm-software-management/r=
pm/commit/405fc8998181353bd510864ca251dc233afec276</a>]</div><div><div>+Sig=
ned-off-by: your@mail</div></div><div>=C2=A0</div><div>Upstream-Status need=
 to be placed on the patch an not on the commit message<br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0..._internal-mode-parsing-when-Tn-is-us.patch | 31 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 1 +<br>
=C2=A02 files changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzo=
pen_internal-mode-parsing-when-Tn-is-us.patch<br>
<br>
diff --git a/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal=
-mode-parsing-when-Tn-is-us.patch b/meta/recipes-devtools/rpm/files/0001-rp=
mio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch<br>
new file mode 100644<br>
index 0000000000..52110fa2b1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-p=
arsing-when-Tn-is-us.patch<br>
@@ -0,0 +1,31 @@<br>
+From 405fc8998181353bd510864ca251dc233afec276 Mon Sep 17 00:00:00 2001<br>
+From: Vitaly Chikunov &lt;<a href=3D"mailto:vt@altlinux.org" target=3D"_bl=
ank">vt@altlinux.org</a>&gt;<br>
+Date: Wed, 6 Jan 2021 23:43:41 +0300<br>
+Subject: [PATCH] rpmio: Fix lzopen_internal mode parsing when &#39;Tn&#39;=
 is used<br>
+<br>
+When there is number after &quot;T&quot; (suggested number of threads or &=
quot;0&quot; for<br>
+getncpus), lzopen_internal() mode parser would skip one byte, and when<br>
+it&#39;s at the end of the string it would then parse undesired garbage fr=
om<br>
+the memory, making intermittent compression failures.<br>
+<br>
+Fixes: 7740d1098 (&quot;Add support for multithreaded xz compression&quot;=
)<br>
+Signed-off-by: Vitaly Chikunov &lt;<a href=3D"mailto:vt@altlinux.org" targ=
et=3D"_blank">vt@altlinux.org</a>&gt;<br></blockquote><div><br></div><div>+=
Upstream-Status: Backport [<a href=3D"https://github.com/rpm-software-manag=
ement/rpm/commit/405fc8998181353bd510864ca251dc233afec276" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/rpm-software-management/rpm/commit/=
405fc8998181353bd510864ca251dc233afec276</a>]</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+---<br>
+ rpmio/rpmio.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c<br>
+index ed1e25140..9d32ec6d9 100644<br>
+--- a/rpmio/rpmio.c<br>
++++ b/rpmio/rpmio.c<br>
+@@ -798,6 +798,7 @@ static LZFILE *lzopen_internal(const char *mode, int f=
d, int xz)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * should&#39;ve pr=
ocessed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (isdigit(*++m=
ode));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --mode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ #ifdef HAVE_LZMA_MT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" r=
el=3D"noreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a> b/meta/recipes-devt=
ools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">rpm_4.14.2.1.bb</a><br>
index c39a5208e5..376021d913 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.2.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">rpm_4.14.2.1.bb</a><br>
@@ -44,6 +44,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-=
software-management/rpm;branch=3Drpm-4.14.x;protoc" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-4.14.x;pr=
otoc</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mono-find-provides-re=
quires-do-not-use-monodis-from-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Rip-out-partial-suppo=
rt-for-unused-MD2-and-RIPEMD160.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-rpmplugins.c-call-dle=
rror-prior-to-dlsym.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-rpmio-Fix-lzopen_inte=
rnal-mode-parsing-when-Tn-is-us.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2021-3421.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2021-20266.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161472): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161472" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161472</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88989796/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88989796/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000000f7af005d77eec9e--

