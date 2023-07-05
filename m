Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E069EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 18:32:45 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.2814.1688581963481533644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 11:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=it54JQve;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31438512cafso3719537f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 11:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688581962; x=1691173962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l+r7T0r8NiUzAeejgWxCz6dlfMi0dzkKZFGsjTLIHWU=;
        b=it54JQveoyPC+Lf/elpLEJUgy2WgwoIg6tSuuTDghtM58aMbOhl1aShhU6S2uMvlWl
         IFKG2AhqnrXDwnmfTd01pi57l0LGvRhahoLn4tCxuPe15v1Hj6u5k16/aRV2DbR7vTN9
         A8ouwv0m24SxrrdYcuQl3HpQu+nPhLmeQuXExOaih/LYlztMh2A4AqvN06zUfLU8afxW
         h/RiVHPNA58x0PQcG8kFW5o52ZVSdtuoGKqevfondfeG7v6PJik3D1sGcth3gjHs5vAZ
         2OnyYtpCe0kZUYJMZplvIkxVJqqHyOS0y6sPYLBtiixjrWRUbZIQdN6muB6PaedkYvm6
         WyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688581962; x=1691173962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+r7T0r8NiUzAeejgWxCz6dlfMi0dzkKZFGsjTLIHWU=;
        b=jI4hlttVfcjLpMz3Fh/AMGs985GefPk5Io9tCoBgKN6/RsdJX0uB2mDlOlZz5qjx5v
         L5YNnkPYG5Tj90oZ/KlXc1F8y6WZcpTRdtwrmjEaehna7M0uxw9BpC6JUwzoMilnX50h
         Ep3AT+7ilvgkPSOSNypkSS2Iwdm3al2b5kBdvz0CtRyhDmjNAnETJfL47rJC8Qga//FR
         jwLu0eb1t7JpAGzamPPjerPEsTlcgMyLgGnBehOGkmU4MYVJervJYr0JF9rhJ7OdKOIs
         piEkKKRhC4Gl86HMYH4HGOn684dd7+J/HISXRGihJfaqbfDFHShCfoXvDDFZNgx2l+yW
         1rcg==
X-Gm-Message-State: ABy/qLa3LDAh0X24O3lO6Pd3XbiOSQITJKQ4fXnEptsIlcbHf+tVMQ0J
	+MAQogHC5JV7jTlgCyFGc3yZOB35IHsd9dbmjs2rd6Vn
X-Google-Smtp-Source: APBJJlF2cIddxVNTEclkJ86RgWiAUK71Cg9Y2SLde8CcfIcaD3fHD0HqBXHCC1fw2dbwPoaiRQFPURJb0ypQwcww/wo=
X-Received: by 2002:a5d:58f3:0:b0:30f:bdc5:c150 with SMTP id
 f19-20020a5d58f3000000b0030fbdc5c150mr14449961wrd.33.1688581961465; Wed, 05
 Jul 2023 11:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230629091205.1038353-1-changqing.li@windriver.com>
In-Reply-To: <20230629091205.1038353-1-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Jul 2023 20:32:30 +0200
Message-ID: <CA+chaQexsc1B1CcRk0QLBseQKMkgvoBD4+fH-g5ZAT4QFn=7mw@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] systemd: fix a dead link under /var/log
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fcc38105ffc19f53"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 18:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183904

--000000000000fcc38105ffc19f53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This was merged in mickledore recently, but isn't the same needed for
master branch where it was rejected with alternative fix proposed by RP?

On Thu, Jun 29, 2023 at 11:12=E2=80=AFAM Changqing Li <
changqing.li@eng.windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
> install README.logs under systemd doc dir.
>
> But for OE, systemd doc dir is splited into package systemd-doc, when it
> is not installed on the target, there will be an dead link:
> Eg:
> root@intel-x86-64:/var/log# ls -l README
> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README ->
> ../../usr/share/doc/systemd/README.logs
> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file
> or directory
>
> Meantime, relative path for a symlink also will meet issue like
> "No such file or directory"
>
> So remove this symlink from package systemd, and create legacy-doc.conf,
> only create the symlink when systemd-doc is installed.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...on-t-create-symlink-README-in-this-f.patch | 42 +++++++++++++++++++
>  ....in-split-out-the-doc-related-config.patch | 41 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_253.1.bb    |  4 ++
>  3 files changed, 87 insertions(+)
>  create mode 100644
> meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlin=
k-README-in-this-f.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-out-the-d=
oc-related-config.patch
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-syml=
ink-README-in-this-f.patch
> b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-syml=
ink-README-in-this-f.patch
> new file mode 100644
> index 0000000000..a2644bba8e
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-syml=
ink-README-in-this-f.patch
> @@ -0,0 +1,42 @@
> +From b17826490c1db2051dda23550ebdcd7f10e23479 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 28 Jun 2023 13:49:41 +0800
> +Subject: [PATCH 1/2] legacy.conf.in: Don't create symlink README in this
> file
> +
> +Commit 6fe23ff31c0 changed README to an symlink to README.logs, and
> +install README.logs under systemd doc dir.
> +
> +But for OE, systemd doc dir is splited into package systemd-doc, when it
> +is not installed on the target, there will be an dead link:
> +Eg:
> +root@intel-x86-64:/var/log# ls -l README
> +lrwxrwxrwx 1 root root 39 Jun 20 08:57 README ->
> ../../usr/share/doc/systemd/README.logs
> +root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.log=
s
> +ls: cannot access '../../usr/share/doc/systemd/README.logs': No such fil=
e
> or directory
> +
> +So remove this symlink from package systemd
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tmpfiles.d/legacy.conf.in | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
> +index 4f2c0d7c43..62e2ae0986 100644
> +--- a/tmpfiles.d/legacy.conf.in
> ++++ b/tmpfiles.d/legacy.conf.in
> +@@ -12,9 +12,6 @@
> +
> + d /run/lock 0755 root root -
> + L /var/lock - - - - ../run/lock
> +-{% if CREATE_LOG_DIRS %}
> +-L /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
> +-{% endif %}
> +
> + # /run/lock/subsys is used for serializing SysV service execution, and
> + # hence without use on SysV-less systems.
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-out-the=
-doc-related-config.patch
> b/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-out-the=
-doc-related-config.patch
> new file mode 100644
> index 0000000000..47af64f12f
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-out-the=
-doc-related-config.patch
> @@ -0,0 +1,41 @@
> +From 865974a2f268ae6b4dab4f37ba39d86e6600180d Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 28 Jun 2023 16:00:13 +0800
> +Subject: [PATCH 2/2] legacy-doc.conf.in: split out the doc related confi=
g
> +
> +split out the doc related config, only install this when
> +package systemd-doc is installed.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tmpfiles.d/legacy-doc.conf.in | 3 +++
> + tmpfiles.d/meson.build        | 1 +
> + 2 files changed, 4 insertions(+)
> + create mode 100644 tmpfiles.d/legacy-doc.conf.in
> +
> +diff --git a/tmpfiles.d/legacy-doc.conf.in b/tmpfiles.d/
> legacy-doc.conf.in
> +new file mode 100644
> +index 0000000000..9b1cef5a18
> +--- /dev/null
> ++++ b/tmpfiles.d/legacy-doc.conf.in
> +@@ -0,0 +1,3 @@
> ++{% if CREATE_LOG_DIRS %}
> ++L /var/log/README - - - - {{DOC_DIR}}/README.logs
> ++{% endif %}
> +diff --git a/tmpfiles.d/meson.build b/tmpfiles.d/meson.build
> +index 4d94e3743f..f78bddf136 100644
> +--- a/tmpfiles.d/meson.build
> ++++ b/tmpfiles.d/meson.build
> +@@ -31,6 +31,7 @@ endforeach
> +
> + in_files =3D [['etc.conf',                      ''],
> +             ['legacy.conf',                   'HAVE_SYSV_COMPAT'],
> ++            ['legacy-doc.conf',               'HAVE_SYSV_COMPAT'],
> +             ['static-nodes-permissions.conf', ''],
> +             ['systemd.conf',                  ''],
> +             ['var.conf',                      ''],
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_253.1.bb
> b/meta/recipes-core/systemd/systemd_253.1.bb
> index f306765168..85d6efb69c 100644
> --- a/meta/recipes-core/systemd/systemd_253.1.bb
> +++ b/meta/recipes-core/systemd/systemd_253.1.bb
> @@ -25,6 +25,8 @@ SRC_URI +=3D " \
>
> file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
>
> file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
> +
>  file://0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch \
> +
>  file://0002-legacy-doc.conf.in-split-out-the-doc-related-config.patch \
>             "
>
>  # patches needed by musl
> @@ -754,6 +756,8 @@ FILES:udev +=3D "${base_sbindir}/udevd \
>  FILES:udev-hwdb =3D "${rootlibexecdir}/udev/hwdb.d \
>                     "
>
> +FILES:${PN}-doc +=3D "${exec_prefix}/lib/tmpfiles.d/legacy-doc.conf"
> +
>  RCONFLICTS:${PN} =3D "tiny-init ${@bb.utils.contains('PACKAGECONFIG',
> 'resolved', 'resolvconf', '', d)}"
>
>  INITSCRIPT_PACKAGES =3D "udev"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183611):
> https://lists.openembedded.org/g/openembedded-core/message/183611
> Mute This Topic: https://lists.openembedded.org/mt/99847505/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fcc38105ffc19f53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This was merged in mickledore recently, but isn&#39;t the =
same needed for master branch where it was rejected with alternative fix pr=
oposed by RP?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Jun 29, 2023 at 11:12=E2=80=AFAM Changqing Li &lt;<a h=
ref=3D"mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
Commit 6fe23ff31c0 changed README to a symlink to README.logs, and<br>
install README.logs under systemd doc dir.<br>
<br>
But for OE, systemd doc dir is splited into package systemd-doc, when it<br=
>
is not installed on the target, there will be an dead link:<br>
Eg:<br>
root@intel-x86-64:/var/log# ls -l README<br>
lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -&gt; ../../usr/share/doc/sys=
temd/README.logs<br>
root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs<b=
r>
ls: cannot access &#39;../../usr/share/doc/systemd/README.logs&#39;: No suc=
h file or directory<br>
<br>
Meantime, relative path for a symlink also will meet issue like<br>
&quot;No such file or directory&quot;<br>
<br>
So remove this symlink from package systemd, and create legacy-doc.conf,<br=
>
only create the symlink when systemd-doc is installed.<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0...on-t-create-symlink-README-in-this-f.patch | 42 ++++++++++++++++++=
+<br>
=C2=A0....in-split-out-the-doc-related-config.patch | 41 ++++++++++++++++++=
<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_253.1.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_253.1.bb</a>=C2=A0 =C2=A0 |=C2=A0 4 +=
+<br>
=C2=A03 files changed, 87 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0001-legacy.conf=
.in-Don-t-create-symlink-README-in-this-f.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0002-legacy-doc.=
conf.in-split-out-the-doc-related-config.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-cr=
eate-symlink-README-in-this-f.patch b/meta/recipes-core/systemd/systemd/000=
1-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch<br>
new file mode 100644<br>
index 0000000000..a2644bba8e<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-sy=
mlink-README-in-this-f.patch<br>
@@ -0,0 +1,42 @@<br>
+From b17826490c1db2051dda23550ebdcd7f10e23479 Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Wed, 28 Jun 2023 13:49:41 +0800<br>
+Subject: [PATCH 1/2] <a href=3D"http://legacy.conf.in" rel=3D"noreferrer" =
target=3D"_blank">legacy.conf.in</a>: Don&#39;t create symlink README in th=
is file<br>
+<br>
+Commit 6fe23ff31c0 changed README to an symlink to README.logs, and<br>
+install README.logs under systemd doc dir.<br>
+<br>
+But for OE, systemd doc dir is splited into package systemd-doc, when it<b=
r>
+is not installed on the target, there will be an dead link:<br>
+Eg:<br>
+root@intel-x86-64:/var/log# ls -l README<br>
+lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -&gt; ../../usr/share/doc/sy=
stemd/README.logs<br>
+root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs<=
br>
+ls: cannot access &#39;../../usr/share/doc/systemd/README.logs&#39;: No su=
ch file or directory<br>
+<br>
+So remove this symlink from package systemd<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ tmpfiles.d/<a href=3D"http://legacy.conf.in" rel=3D"noreferrer" target=3D=
"_blank">legacy.conf.in</a> | 3 ---<br>
+ 1 file changed, 3 deletions(-)<br>
+<br>
+diff --git a/tmpfiles.d/<a href=3D"http://legacy.conf.in" rel=3D"noreferre=
r" target=3D"_blank">legacy.conf.in</a> b/tmpfiles.d/<a href=3D"http://lega=
cy.conf.in" rel=3D"noreferrer" target=3D"_blank">legacy.conf.in</a><br>
+index 4f2c0d7c43..62e2ae0986 100644<br>
+--- a/tmpfiles.d/<a href=3D"http://legacy.conf.in" rel=3D"noreferrer" targ=
et=3D"_blank">legacy.conf.in</a><br>
++++ b/tmpfiles.d/<a href=3D"http://legacy.conf.in" rel=3D"noreferrer" targ=
et=3D"_blank">legacy.conf.in</a><br>
+@@ -12,9 +12,6 @@<br>
+ <br>
+ d /run/lock 0755 root root -<br>
+ L /var/lock - - - - ../run/lock<br>
+-{% if CREATE_LOG_DIRS %}<br>
+-L /var/log/README - - - - ../..{{DOC_DIR}}/README.logs<br>
+-{% endif %}<br>
+ <br>
+ # /run/lock/subsys is used for serializing SysV service execution, and<br=
>
+ # hence without use on SysV-less systems.<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-spli=
t-out-the-doc-related-config.patch b/meta/recipes-core/systemd/systemd/0002=
-legacy-doc.conf.in-split-out-the-doc-related-config.patch<br>
new file mode 100644<br>
index 0000000000..47af64f12f<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0002-legacy-doc.conf.in-split-out-t=
he-doc-related-config.patch<br>
@@ -0,0 +1,41 @@<br>
+From 865974a2f268ae6b4dab4f37ba39d86e6600180d Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Wed, 28 Jun 2023 16:00:13 +0800<br>
+Subject: [PATCH 2/2] <a href=3D"http://legacy-doc.conf.in" rel=3D"noreferr=
er" target=3D"_blank">legacy-doc.conf.in</a>: split out the doc related con=
fig<br>
+<br>
+split out the doc related config, only install this when<br>
+package systemd-doc is installed.<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ tmpfiles.d/<a href=3D"http://legacy-doc.conf.in" rel=3D"noreferrer" targe=
t=3D"_blank">legacy-doc.conf.in</a> | 3 +++<br>
+ tmpfiles.d/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
+ 2 files changed, 4 insertions(+)<br>
+ create mode 100644 tmpfiles.d/<a href=3D"http://legacy-doc.conf.in" rel=
=3D"noreferrer" target=3D"_blank">legacy-doc.conf.in</a><br>
+<br>
+diff --git a/tmpfiles.d/<a href=3D"http://legacy-doc.conf.in" rel=3D"noref=
errer" target=3D"_blank">legacy-doc.conf.in</a> b/tmpfiles.d/<a href=3D"htt=
p://legacy-doc.conf.in" rel=3D"noreferrer" target=3D"_blank">legacy-doc.con=
f.in</a><br>
+new file mode 100644<br>
+index 0000000000..9b1cef5a18<br>
+--- /dev/null<br>
++++ b/tmpfiles.d/<a href=3D"http://legacy-doc.conf.in" rel=3D"noreferrer" =
target=3D"_blank">legacy-doc.conf.in</a><br>
+@@ -0,0 +1,3 @@<br>
++{% if CREATE_LOG_DIRS %}<br>
++L /var/log/README - - - - {{DOC_DIR}}/README.logs<br>
++{% endif %}<br>
+diff --git a/tmpfiles.d/meson.build b/tmpfiles.d/meson.build<br>
+index 4d94e3743f..f78bddf136 100644<br>
+--- a/tmpfiles.d/meson.build<br>
++++ b/tmpfiles.d/meson.build<br>
+@@ -31,6 +31,7 @@ endforeach<br>
+ <br>
+ in_files =3D [[&#39;etc.conf&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;legacy.conf&#39;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;HAVE=
_SYSV_COMPAT&#39;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;legacy-doc.conf&#39;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;HAVE_SYSV_COMPAT&#=
39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;static-nodes-permiss=
ions.conf&#39;, &#39;&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;systemd.conf&#39;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;],=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;var.conf&#39;,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;&#39;],<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_253.1.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_253.1.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_253.1.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_253.1.bb</a><br>
index f306765168..85d6efb69c 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_253.1.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_253.1.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_253.1.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_253.1.bb</a><br>
@@ -25,6 +25,8 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-binfmt-Don-t-install-=
dependency-links-at-install-tim.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-implment-systemd-sysv=
-install-for-OE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Move-sysusers.d-sysct=
l.d-binfmt.d-modules-load.d-to-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-legacy.conf.in-Don-t-=
create-symlink-README-in-this-f.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-legacy-doc.conf.in-sp=
lit-out-the-doc-related-config.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# patches needed by musl<br>
@@ -754,6 +756,8 @@ FILES:udev +=3D &quot;${base_sbindir}/udevd \<br>
=C2=A0FILES:udev-hwdb =3D &quot;${rootlibexecdir}/udev/hwdb.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;<br>
<br>
+FILES:${PN}-doc +=3D &quot;${exec_prefix}/lib/tmpfiles.d/legacy-doc.conf&q=
uot;<br>
+<br>
=C2=A0RCONFLICTS:${PN} =3D &quot;tiny-init ${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;resolved&#39;, &#39;resolvconf&#39;, &#39;&#39;, d)}&quo=
t;<br>
<br>
=C2=A0INITSCRIPT_PACKAGES =3D &quot;udev&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183611): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183611" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183611</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99847505/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99847505/3617156</a><br>
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

--000000000000fcc38105ffc19f53--

