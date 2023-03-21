Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86093C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 08:36:35 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.7988.1679387793679888127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 01:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Has117vP;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id z42so14665654ljq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 01:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679387792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3k7T1GnToWAp+SWzAAHyTBkTqI+ZNY/IQWuj9u3nTQk=;
        b=Has117vPRGXNxFe2LY4OVS+vICtkRGq2QBv62t/WRZAh12LhUV7ALQYTa7SFFB3FOF
         t3CphSjse6LWyLbsXvCaJlHGncPAw2YL6ww+VgNQcS4e9IfuFQt34Rqchq5am/mtzU+X
         XFKEI8RsvusutJDSO7Wz0NsB3Kex6fMQFo7mHFA5Poleonejz5BiJb2ITL39VqoCxhm7
         6kL8AOQV9iJbCtDtoBKI1zLLcYtaRQeTfVJ4v8VkgMsMemVkXGzLzbjROWbsPLkhT+X4
         nE/1oIVlz7qiWNlWO+lgCd0lmJecSa8zsbCHvAdFwxS409IMVv4FOyabGW2VDy6NkgSP
         /7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679387792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3k7T1GnToWAp+SWzAAHyTBkTqI+ZNY/IQWuj9u3nTQk=;
        b=ZJvlKQNOAXa9ExSRIu4lTLF4/uwoMXvzbbQcd6VCF6CFV2QIZ4tqMLcNvgq+gWZx9z
         z70GUYiv8NH3yHagkTonaGEiHqxIFQZ/X/+0gksKM5PqyN1w5OmThAfZDbTZveYK0eHY
         h8XdPb4wl5qSNGUYcdNNPqRBxb+hWsbEH4Uf5gDsh8dMztrw+KtpWsaxB0F+IkS/r2ZV
         vCUYw1sm9LquJmGes8F1TFVTTJY5BBl0DsfKZ+ivNL4PlyysaUCTSXyJM6+cQW8bacvu
         1PRSl0NU1m9sp6I3g6OFfAR4i4njNpvJV9/KfpyxwWCdcNezy5nHkd+JzH+LZNMrAYAx
         Tpig==
X-Gm-Message-State: AO0yUKXk1kOalAi1sMZvlWNlEG+hj8qUGrDfpgemOmdnUPYVQmyiVdMn
	a6LrmSkZ7Vo8OLppkBHfCHUB9MfNBpXTnUQe2Xs=
X-Google-Smtp-Source: AK7set9cZ/C/QtFLRPJ+j/HFdddIQeLwMJxgHdWfuGVrMaHarW7w1DJKDYpAVwb1cLO0zK8X5+JKusopKeTwJrRl2E0=
X-Received: by 2002:a2e:9b90:0:b0:295:945d:b381 with SMTP id
 z16-20020a2e9b90000000b00295945db381mr565174lji.7.1679387791464; Tue, 21 Mar
 2023 01:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230321062952.2778799-1-wentao.zhang@windriver.com>
In-Reply-To: <20230321062952.2778799-1-wentao.zhang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Mar 2023 09:36:20 +0100
Message-ID: <CANNYZj8tdtMhvDv3AHJOmiD4wzt5k994qj1iC5=TzJfdj-tFxw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: Fix failing sysconfig.py test on x86(64
 bit) by updating test_sysconfig for posix_user purelib
To: Wentao Zhang <wentao.zhang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c01e6805f764f0da"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 08:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178852

--000000000000c01e6805f764f0da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

How can the issue be triggered? It doesn=E2=80=99t show up in regular ptest=
, so can
you change the commit message to include that?

Alex

On Tue 21. Mar 2023 at 7.30, Wentao Zhang <wentao.zhang@windriver.com>
wrote:

> sysconfig.py use platlibdir for purelib. Update
> test_sysconfig.test_user_similar() for the posix_user
> scheme: "purelib" doesn't use sys.platlibdir.
>
> Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> ---
>  ...est_sysconfig-for-posix_user-purelib.patch | 30 +++++++++++++++++++
>  .../recipes-devtools/python/python3_3.11.2.bb |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644
> meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix=
_user-purelib.patch
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-pos=
ix_user-purelib.patch
> b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-pos=
ix_user-purelib.patch
> new file mode 100644
> index 0000000000..3d39839309
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-pos=
ix_user-purelib.patch
> @@ -0,0 +1,30 @@
> +From b9f825b298b555c4770024d1f68ef1df65aad20a Mon Sep 17 00:00:00 2001
> +From: Wentao Zhang <wentao.zhang@windriver.com>
> +Date: Mon, 20 Mar 2023 13:39:52 +0800
> +Subject: [PATCH] Update test_sysconfig for posix_user purelib
> +
> +Update test_sysconfig.test_user_similar() for the posix_user scheme:
> +"purelib" doesn't use sys.platlibdir.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> +---
> + Lib/test/test_sysconfig.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
> +index d96371d..20aea4b 100644
> +--- a/Lib/test/test_sysconfig.py
> ++++ b/Lib/test/test_sysconfig.py
> +@@ -373,7 +373,7 @@ class TestSysConfig(unittest.TestCase):
> +                 expected =3D os.path.normpath(global_path.replace(base,
> user, 1))
> +                 # bpo-44860: platlib of posix_user doesn't use
> sys.platlibdir,
> +                 # whereas posix_prefix does.
> +-                if name =3D=3D 'platlib':
> ++                if name =3D=3D 'platlib' or name =3D=3D 'purelib':
> +                     # Replace "/lib64/python3.11/site-packages" suffix
> +                     # with "/lib/python3.11/site-packages".
> +                     py_version_short =3D sysconfig.get_python_version()
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb
> b/meta/recipes-devtools/python/python3_3.11.2.bb
> index 43c147ca6d..d3ef5c8bb7 100644
> --- a/meta/recipes-devtools/python/python3_3.11.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.2.bb
> @@ -27,6 +27,7 @@ SRC_URI =3D "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-test_ctypes.test_find-skip-without-tools-sdk.patc=
h
> \
>             file://makerace.patch \
>             file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patc=
h
> \
> +           file://0001-Update-test_sysconfig-for-posix_user-purelib.patc=
h
> \
>
> file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
>
> file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
>             file://deterministic_imports.patch \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178850):
> https://lists.openembedded.org/g/openembedded-core/message/178850
> Mute This Topic: https://lists.openembedded.org/mt/97749707/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c01e6805f764f0da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">How can the issue be triggered? It doesn=E2=80=99t show u=
p in regular ptest, so can you change the commit message to include that?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 21. Mar 2=
023 at 7.30, Wentao Zhang &lt;<a href=3D"mailto:wentao.zhang@windriver.com"=
>wentao.zhang@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">syscon=
fig.py use platlibdir for purelib. Update<br>
test_sysconfig.test_user_similar() for the posix_user<br>
scheme: &quot;purelib&quot; doesn&#39;t use sys.platlibdir.<br>
<br>
Signed-off-by: Wentao Zhang &lt;<a href=3D"mailto:wentao.zhang@windriver.co=
m" target=3D"_blank">wentao.zhang@windriver.com</a>&gt;<br>
---<br>
=C2=A0...est_sysconfig-for-posix_user-purelib.patch | 30 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3_3.11.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.2.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 31 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/0001-Update-t=
est_sysconfig-for-posix_user-purelib.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfi=
g-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
Update-test_sysconfig-for-posix_user-purelib.patch<br>
new file mode 100644<br>
index 0000000000..3d39839309<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-p=
osix_user-purelib.patch<br>
@@ -0,0 +1,30 @@<br>
+From b9f825b298b555c4770024d1f68ef1df65aad20a Mon Sep 17 00:00:00 2001<br>
+From: Wentao Zhang &lt;<a href=3D"mailto:wentao.zhang@windriver.com" targe=
t=3D"_blank">wentao.zhang@windriver.com</a>&gt;<br>
+Date: Mon, 20 Mar 2023 13:39:52 +0800<br>
+Subject: [PATCH] Update test_sysconfig for posix_user purelib<br>
+<br>
+Update test_sysconfig.test_user_similar() for the posix_user scheme:<br>
+&quot;purelib&quot; doesn&#39;t use sys.platlibdir.<br>
+<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
+Signed-off-by: Wentao Zhang &lt;<a href=3D"mailto:wentao.zhang@windriver.c=
om" target=3D"_blank">wentao.zhang@windriver.com</a>&gt;<br>
+---<br>
+ Lib/test/test_sysconfig.py | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py<br>
+index d96371d..20aea4b 100644<br>
+--- a/Lib/test/test_sysconfig.py<br>
++++ b/Lib/test/test_sysconfig.py<br>
+@@ -373,7 +373,7 @@ class TestSysConfig(unittest.TestCase):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected =3D=
 os.path.normpath(global_path.replace(base, user, 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# bpo-44860:=
 platlib of posix_user doesn&#39;t use sys.platlibdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# whereas po=
six_prefix does.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name =3D=3D &#=
39;platlib&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name =3D=3D &#=
39;platlib&#39; or name =3D=3D &#39;purelib&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# Replace &quot;/lib64/python3.11/site-packages&quot; suffix<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# with &quot;/lib/python3.11/site-packages&quot;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0py_version_short =3D sysconfig.get_python_version()<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.2.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.11.2.bb</a> b/meta/recip=
es-devtools/python/<a href=3D"http://python3_3.11.2.bb" rel=3D"noreferrer" =
target=3D"_blank">python3_3.11.2.bb</a><br>
index 43c147ca6d..d3ef5c8bb7 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.2.bb</a><br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/py=
thon/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank=
">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test_ctypes.test_find=
-skip-without-tools-sdk.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://makerace.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-sysconfig.py-use-plat=
libdir-also-for-purelib.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Update-test_sysconfig=
-for-posix_user-purelib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Lib-pty.py-handle-std=
in-I-O-errors-same-way-as-maste.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-setup.py-Do-not-detec=
t-multiarch-paths-when-cross-co.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://deterministic_imports.patc=
h \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178850): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178850" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178850</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97749707/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97749707/1686489</a><br>
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

--000000000000c01e6805f764f0da--

