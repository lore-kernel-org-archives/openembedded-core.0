Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1DCC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:44:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7876.1654760681022610154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DEa0OIgf;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id a10so9469444wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zVC7CfAZE2/cjGBpd+wFcuwgz1LLsMhOvITj106Vo9I=;
        b=DEa0OIgf9/+4X0cMP67vYU2RhXcowAKZPz6v37j6tnqLJkMDbNKYaLE6MRJor/lX0b
         qbIuRTzl/eovc35N4Fbx+KhxPTegyA/PN1tV7lohU7o60E7r7guRtdOvk0y4FO9i40Hf
         62Mod2Gm2NXdubCo2JmcxhdbN7JKCBJ2LhJ7H4dkPrCnw5eHvXDNy/D6vc7JvJWZ7GdD
         1hd/SOclkPuQdak/+PaSlPfEiPMWEmeg0raPsKfKvFDoqffSs5wz+Kw/UWbVoOcrnpeq
         YQlf2xeMmVjFK6gtY0FpAw22sepP7arZ8O2IKXv1h4xd6x/mn7vCQtLH7IiEaVCk97Ij
         B9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zVC7CfAZE2/cjGBpd+wFcuwgz1LLsMhOvITj106Vo9I=;
        b=JGjJpDMayS/S7KLzkP8itGZHzc3tnKg6Tp+u2gdZj6gR46PF75mhIAa3j6ri+qmg60
         k0ZoBa9H/yKNsexLb9UAypWhIzMsDSZk4UXbXRbNqDgfMS0a17XYYWN7sNJ7FSqwj/ii
         ovi9VUqFtw0vdwpeq0JQdoFhYxXdxLH0yKdJ2kGEs5SY5/h262gmjLHZK0qbzgc8Xe7P
         T72GLwk1loB5NUW2ugLV1oIinjN+7ncjA4bFB8LZQm0p09U0mU0FealAXfUH9zae2J4j
         wbbci0ESQu/A5N9F+m+962ixim1FzUBvJYqiD0QFq8PXudwUmu4vwO0FeiAAIqnB3W9X
         I6Sg==
X-Gm-Message-State: AOAM531WMbzoJNV3FTpVYflSyMEEbtXjQ4bHuVBN9azY+k5XFyflWnMY
	gYcdG9IPUpyYtFdOMBPU+PsVJx5j0jAraazehuM=
X-Google-Smtp-Source: 
 ABdhPJy75IDGj8QHYn47yTGeJE/ui/8sWFQzf4Rpm6mgf83NRoGO3DDVuKDEGuVWcR6ACH7vy48QXo1Q61odUuuCKbE=
X-Received: by 2002:a7b:c057:0:b0:39c:4579:42e1 with SMTP id
 u23-20020a7bc057000000b0039c457942e1mr1953388wmc.102.1654760679417; Thu, 09
 Jun 2022 00:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220606120126.3381438-1-alex@linutronix.de>
 <20220606120126.3381438-17-alex@linutronix.de>
In-Reply-To: <20220606120126.3381438-17-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Jun 2022 09:44:28 +0200
Message-ID: 
 <CA+chaQehacw0h3EOX4Onqce3uuxFFa8WY6srzh8cUfom65cMRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 17/21] ltp: upgrade 20220121 -> 20220527
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000007c2a3e05e0fefedd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 07:44:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166761

--0000000000007c2a3e05e0fefedd
Content-Type: text/plain; charset="UTF-8"

This seems to be causing:
http://errors.yoctoproject.org/Errors/Details/657959/
when ld-is-gold is used.

Added in upstream commit:
  commit 3fce2064b54843218d085aae326c8f7ecf3a8c41
  Author: Martin Doucha <mdoucha@suse.cz>
  Date:   Thu Apr 21 14:33:50 2022 +0200

    KVM test infrastructure

https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36

On Mon, Jun 6, 2022 at 2:02 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Disable stack protection as newly added kvm tests won't build with it.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/security_flags.inc   |  1 +
>  ...sh-sort-filelist-for-reproducibility.patch | 28 -------------------
>  .../ltp/{ltp_20220121.bb => ltp_20220527.bb}  |  3 +-
>  3 files changed, 2 insertions(+), 30 deletions(-)
>  delete mode 100644
> meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
>  rename meta/recipes-extended/ltp/{ltp_20220121.bb => ltp_20220527.bb}
> (97%)
>
> diff --git a/meta/conf/distro/include/security_flags.inc
> b/meta/conf/distro/include/security_flags.inc
> index 8374cb8544..2972f05b4e 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -61,6 +61,7 @@ TARGET_LDFLAGS:append:class-cross-canadian = "
> ${SECURITY_LDFLAGS}"
>  SECURITY_STACK_PROTECTOR:pn-gcc-runtime = ""
>  SECURITY_STACK_PROTECTOR:pn-glibc = ""
>  SECURITY_STACK_PROTECTOR:pn-glibc-testsuite = ""
> +SECURITY_STACK_PROTECTOR:pn-ltp = ""
>  # All xorg module drivers need to be linked this way as well and are
>  # handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
>  SECURITY_LDFLAGS:pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
> b/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
> deleted file mode 100644
> index e8d9f212a9..0000000000
> ---
> a/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 4aad23f208cc7725cd61bbe5aaadb9994c794cd0 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Wed, 26 Jan 2022 20:58:46 +0100
> -Subject: [PATCH] metadata/parse.sh: sort filelist for reproducibility
> -
> -find does not guarantee the order of the files.
> -
> -Upstream-Status: Submitted [
> https://github.com/linux-test-project/ltp/pull/907]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - metadata/parse.sh | 2 +-
> -
> -diff --git a/metadata/parse.sh b/metadata/parse.sh
> -index b43d024c68..1811665bfe 100755
> ---- a/metadata/parse.sh
> -+++ b/metadata/parse.sh
> -@@ -29,7 +29,7 @@ echo ' "tests": {'
> -
> - first=1
> -
> --for test in `find testcases/ -name '*.c'`; do
> -+for test in `find testcases/ -name '*.c'|sort`; do
> -       a=$($top_builddir/metadata/metaparse -Iinclude
> -Itestcases/kernel/syscalls/utils/ "$test")
> -       if [ -n "$a" ]; then
> -               if [ -z "$first" ]; then
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20220121.bb
> b/meta/recipes-extended/ltp/ltp_20220527.bb
> similarity index 97%
> rename from meta/recipes-extended/ltp/ltp_20220121.bb
> rename to meta/recipes-extended/ltp/ltp_20220527.bb
> index 8a13dcf9d0..b136c83860 100644
> --- a/meta/recipes-extended/ltp/ltp_20220121.bb
> +++ b/meta/recipes-extended/ltp/ltp_20220527.bb
> @@ -22,11 +22,10 @@ CFLAGS:append:x86-64 = " -fomit-frame-pointer"
>
>  CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "b0561ad8d9ee9fe1244b5385e941eb65a21e91a1"
> +SRCREV = "6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a"
>
>  SRC_URI = "git://
> github.com/linux-test-project/ltp.git;branch=master;protocol=https \
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
> -
>  file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch \
>             file://disable_hanging_tests.patch \
>             "
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166610):
> https://lists.openembedded.org/g/openembedded-core/message/166610
> Mute This Topic: https://lists.openembedded.org/mt/91575165/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007c2a3e05e0fefedd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to be causing:<div><a href=3D"http://errors.yoc=
toproject.org/Errors/Details/657959/">http://errors.yoctoproject.org/Errors=
/Details/657959/</a><br></div><div>when ld-is-gold is used.</div><div><br><=
/div><div>Added in upstream commit:</div><div>=C2=A0 commit 3fce2064b548432=
18d085aae326c8f7ecf3a8c41<br>=C2=A0 Author: Martin Doucha &lt;<a href=3D"ma=
ilto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt;<br>=C2=A0 Date: =C2=A0 Thu Ap=
r 21 14:33:50 2022 +0200<br><br>=C2=A0 =C2=A0 KVM test infrastructure<br></=
div><div><br></div><div><a href=3D"https://github.com/linux-test-project/lt=
p/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8=
993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36">https://github.com/linux-t=
est-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f=
0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36</a><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Jun 6, 2022 at 2:02 PM Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Disable stack protection as newly=
 added kvm tests won&#39;t build with it.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/security_flags.inc=C2=A0 =C2=A0|=C2=A0 1 +<b=
r>
=C2=A0...sh-sort-filelist-for-reproducibility.patch | 28 ------------------=
-<br>
=C2=A0.../ltp/{<a href=3D"http://ltp_20220121.bb" rel=3D"noreferrer" target=
=3D"_blank">ltp_20220121.bb</a> =3D&gt; <a href=3D"http://ltp_20220527.bb" =
rel=3D"noreferrer" target=3D"_blank">ltp_20220527.bb</a>}=C2=A0 |=C2=A0 3 +=
-<br>
=C2=A03 files changed, 2 insertions(+), 30 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/0001-metadata-parse.=
sh-sort-filelist-for-reproducibility.patch<br>
=C2=A0rename meta/recipes-extended/ltp/{<a href=3D"http://ltp_20220121.bb" =
rel=3D"noreferrer" target=3D"_blank">ltp_20220121.bb</a> =3D&gt; <a href=3D=
"http://ltp_20220527.bb" rel=3D"noreferrer" target=3D"_blank">ltp_20220527.=
bb</a>} (97%)<br>
<br>
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro=
/include/security_flags.inc<br>
index 8374cb8544..2972f05b4e 100644<br>
--- a/meta/conf/distro/include/security_flags.inc<br>
+++ b/meta/conf/distro/include/security_flags.inc<br>
@@ -61,6 +61,7 @@ TARGET_LDFLAGS:append:class-cross-canadian =3D &quot; ${S=
ECURITY_LDFLAGS}&quot;<br>
=C2=A0SECURITY_STACK_PROTECTOR:pn-gcc-runtime =3D &quot;&quot;<br>
=C2=A0SECURITY_STACK_PROTECTOR:pn-glibc =3D &quot;&quot;<br>
=C2=A0SECURITY_STACK_PROTECTOR:pn-glibc-testsuite =3D &quot;&quot;<br>
+SECURITY_STACK_PROTECTOR:pn-ltp =3D &quot;&quot;<br>
=C2=A0# All xorg module drivers need to be linked this way as well and are<=
br>
=C2=A0# handled in recipes-graphics/xorg-driver/xorg-driver-common.inc<br>
=C2=A0SECURITY_LDFLAGS:pn-xserver-xorg =3D &quot;${SECURITY_X_LDFLAGS}&quot=
;<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-file=
list-for-reproducibility.patch b/meta/recipes-extended/ltp/ltp/0001-metadat=
a-parse.sh-sort-filelist-for-reproducibility.patch<br>
deleted file mode 100644<br>
index e8d9f212a9..0000000000<br>
--- a/meta/recipes-extended/ltp/ltp/0001-metadata-parse.sh-sort-filelist-fo=
r-reproducibility.patch<br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-From 4aad23f208cc7725cd61bbe5aaadb9994c794cd0 Mon Sep 17 00:00:00 2001<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;<br>
-Date: Wed, 26 Jan 2022 20:58:46 +0100<br>
-Subject: [PATCH] metadata/parse.sh: sort filelist for reproducibility<br>
-<br>
-find does not guarantee the order of the files.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/linux-test-proje=
ct/ltp/pull/907" rel=3D"noreferrer" target=3D"_blank">https://github.com/li=
nux-test-project/ltp/pull/907</a>]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
----<br>
- metadata/parse.sh | 2 +-<br>
-<br>
-diff --git a/metadata/parse.sh b/metadata/parse.sh<br>
-index b43d024c68..1811665bfe 100755<br>
---- a/metadata/parse.sh<br>
-+++ b/metadata/parse.sh<br>
-@@ -29,7 +29,7 @@ echo &#39; &quot;tests&quot;: {&#39;<br>
- <br>
- first=3D1<br>
- <br>
--for test in `find testcases/ -name &#39;*.c&#39;`; do<br>
-+for test in `find testcases/ -name &#39;*.c&#39;|sort`; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0a=3D$($top_builddir/metadata/metaparse -Iinclud=
e -Itestcases/kernel/syscalls/utils/ &quot;$test&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$a&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$firs=
t&quot; ]; then<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20220121.bb" r=
el=3D"noreferrer" target=3D"_blank">ltp_20220121.bb</a> b/meta/recipes-exte=
nded/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"noreferrer" target=3D"_b=
lank">ltp_20220527.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-extended/ltp/<a href=3D"http://ltp_20220121.bb" re=
l=3D"noreferrer" target=3D"_blank">ltp_20220121.bb</a><br>
rename to meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20220527.bb</a><br>
index 8a13dcf9d0..b136c83860 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20220121.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20220121.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20220527.bb</a><br>
@@ -22,11 +22,10 @@ CFLAGS:append:x86-64 =3D &quot; -fomit-frame-pointer&qu=
ot;<br>
<br>
=C2=A0CFLAGS:append:powerpc64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;<b=
r>
=C2=A0CFLAGS:append:mipsarchn64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;=
<br>
-SRCREV =3D &quot;b0561ad8d9ee9fe1244b5385e941eb65a21e91a1&quot;<br>
+SRCREV =3D &quot;6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-test-proje=
ct/ltp.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/linux-test-project/ltp.git;branch=3Dmaster;protocol=3Dhtt=
ps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Remove-OOM-tests-from=
-runtest-mm.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-metadata-parse.sh-sor=
t-filelist-for-reproducibility.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_hanging_tests.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166610): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166610" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166610</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91575165/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91575165/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007c2a3e05e0fefedd--

