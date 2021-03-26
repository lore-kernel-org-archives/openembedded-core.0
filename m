Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web08.8699.1616738118558882910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 22:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rr5Iy7h6;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id s136so958877vks.4
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 22:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TMxsrkSdMDsW44A+SWVEcN6u7zrKE6tX8sAWo9Dp/5g=;
        b=Rr5Iy7h6Dhc+JRlZADCq5hnrezBN4UTgh36fFm5TRpCQX3ofhEmifn0KHewXEZfKso
         6eejrRUgKCj3MuzYuLANpcuxDUI0zcD4lQzsiBQfMNxQDw5S+n7N6D9NKRl1fv5qICsk
         CsVEfEhFcrxbDB6vFCvaDZJ37TMPPLjjNmnh8zVlvCdv55A6ZqiEgUZZ363vCvXdpxVz
         GvC3UEPqa1sL5/aGi+tPfzPuToFTfyNwRP27EdTJ+WlZPtcrwxk3/BNWKxt2EzKeqT8R
         AMtSCC4gC8UuChFqPAB0XxMaqP9EtXtcp5bdN/Q2Y6s/j6D+hA9uC4e45wdIwlUUzlNq
         1Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TMxsrkSdMDsW44A+SWVEcN6u7zrKE6tX8sAWo9Dp/5g=;
        b=A5TGW/rOXrLRtpYVAFKRuCaSUyhteDsqm6xCi0SxKquw1bhx0009cTy80FTMay9Zgs
         4RTIwoq+aeVxhyHTOGKEiD+0+BkITdlHnwiduKrf5FOlaNkGnDQODtUjwH0IL7tnwzRp
         FqxpDM8Cc3lJOUl24WpDleDlK3BHUImP7Of1q4/fJvZCLFWmdDN9hexZgmPwvhTB3tZ0
         SIPW5+YqDJ1erT/KkcDR3nUipLtN7aO9RSbM5cMveaFCxo99DOkACmbFjjUnpWegCvIk
         9QQdxZacOvinNyBdK4Zw8eiobz0EIpJAA7mjBMdrAYn6sC9X6yYU624aL0fi2BMVfR5w
         CKVw==
X-Gm-Message-State: AOAM530qWi067Dgbox8o078/Xbx9d6s9GkC201Y/s4o7mQrxoABDZBCn
	YtdCy37EZbXtvoV8gdzCGdlmoGgePrQWv8+qd9UjVP+zhMa+aQ==
X-Google-Smtp-Source: ABdhPJwOdVCTSI/LUd/dELUkr6Q4BM9WZIN5lyUCAb+NtliB2mpnTEX5lxhfWmcY49PgWPYOi4X0QCNhlJmUVEXRngs=
X-Received: by 2002:ac5:c0cd:: with SMTP id b13mr7350634vkk.16.1616738117756;
 Thu, 25 Mar 2021 22:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <166F13E0887164C0.12477@lists.openembedded.org>
 <20210325221341.39135-1-yifan.yu@windriver.com> <20210325221341.39135-2-yifan.yu@windriver.com>
In-Reply-To: <20210325221341.39135-2-yifan.yu@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 26 Mar 2021 06:55:06 +0100
Message-ID: <CANNYZj84ouSdcdxtvqTBb1ietNN9+PgLeUQ4er0bJpWX1PF3Cg@mail.gmail.com>
Subject: Re: [oe-core][PATCH v2 2/2] valgrind: Disable ptest swapcontext.vgtest
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000034282205be6a2d42"

--00000000000034282205be6a2d42
Content-Type: text/plain; charset="UTF-8"

Can you put the ticket link into the patch itself as well please?

Alex


On Thu, 25 Mar 2021 at 23:14, Yi Fan Yu <yifan.yu@windriver.com> wrote:

> New test introduced in valgrind 3.17.0.
> Test fails on both qemuarm64 and qemux64.
>
> [YOCTO #14324]
>
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>  ...orarily-drd-tests-swapcontext.vgtest.patch | 28 +++++++++++++++++++
>  .../valgrind/valgrind_3.17.0.bb               |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644
> meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
>
> diff --git
> a/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
> b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
> new file mode 100644
> index 0000000000..f217098650
> --- /dev/null
> +++
> b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
> @@ -0,0 +1,28 @@
> +From 0f1814a618eff4233e9e8379a8cb2dededdc5a8b Mon Sep 17 00:00:00 2001
> +From: Yi Fan Yu <yifan.yu@windriver.com>
> +Date: Tue, 23 Mar 2021 11:09:20 -0700
> +Subject: [PATCH] Disable temporarily drd/tests/swapcontext.vgtest
> +
> +New test introduced in valgrind 3.17.0.
> +Test fails on both qemuarm64 and qemux64.
> +
> +Upstream-Status: Pending [Needs more Investigation]
> +
> +Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> +---
> + drd/tests/swapcontext.vgtest | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/drd/tests/swapcontext.vgtest b/drd/tests/swapcontext.vgtest
> +index 98e3712c4..5492da31d 100644
> +--- a/drd/tests/swapcontext.vgtest
> ++++ b/drd/tests/swapcontext.vgtest
> +@@ -1,4 +1,4 @@
> +-prereq: test -e swapcontext && ./supported_libpthread
> ++prereq: false
> + vgopts: --read-var-info=yes --check-stack-var=yes --show-confl-seg=no
> --num-callers=2
> + prog: swapcontext
> + stderr_filter: filter_stderr
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> index 1e29896596..7a6b766121 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
> @@ -43,6 +43,7 @@ SRC_URI = "
> https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>
> file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
>             file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
>             file://0001-Add-missing-musl.supp.patch \
> +
>  file://0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch \
>             "
>  SRC_URI[md5sum] = "afe11b5572c3121a781433b7c0ab741b"
>  SRC_URI[sha256sum] =
> "ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2"
> --
> 2.17.1
>
>
> 
>
>

--00000000000034282205be6a2d42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you put the ticket link into the patch itself as =
well please?</div><div><br></div><div>Alex<br></div><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Mar 2021=
 at 23:14, Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@windriver.com">yifan.yu=
@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">New test introduced in valgrind 3.17.0.<br>
Test fails on both qemuarm64 and qemux64.<br>
<br>
[YOCTO #14324]<br>
<br>
Signed-off-by: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@windriver.com" tar=
get=3D"_blank">yifan.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0...orarily-drd-tests-swapcontext.vgtest.patch | 28 +++++++++++++++++=
++<br>
=C2=A0.../valgrind/<a href=3D"http://valgrind_3.17.0.bb" rel=3D"noreferrer=
" target=3D"_blank">valgrind_3.17.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 29 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Disa=
ble-temporarily-drd-tests-swapcontext.vgtest.patch<br>
<br>
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporar=
ily-drd-tests-swapcontext.vgtest.patch b/meta/recipes-devtools/valgrind/val=
grind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch<br>
new file mode 100644<br>
index 0000000000..f217098650<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd=
-tests-swapcontext.vgtest.patch<br>
@@ -0,0 +1,28 @@<br>
+From 0f1814a618eff4233e9e8379a8cb2dededdc5a8b Mon Sep 17 00:00:00 2001<br=
>
+From: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@windriver.com" target=3D"_=
blank">yifan.yu@windriver.com</a>&gt;<br>
+Date: Tue, 23 Mar 2021 11:09:20 -0700<br>
+Subject: [PATCH] Disable temporarily drd/tests/swapcontext.vgtest<br>
+<br>
+New test introduced in valgrind 3.17.0.<br>
+Test fails on both qemuarm64 and qemux64.<br>
+<br>
+Upstream-Status: Pending [Needs more Investigation]<br>
+<br>
+Signed-off-by: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@windriver.com" ta=
rget=3D"_blank">yifan.yu@windriver.com</a>&gt;<br>
+---<br>
+ drd/tests/swapcontext.vgtest | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/drd/tests/swapcontext.vgtest b/drd/tests/swapcontext.vgtest<=
br>
+index 98e3712c4..5492da31d 100644<br>
+--- a/drd/tests/swapcontext.vgtest<br>
++++ b/drd/tests/swapcontext.vgtest<br>
+@@ -1,4 +1,4 @@<br>
+-prereq: test -e swapcontext &amp;&amp; ./supported_libpthread<br>
++prereq: false<br>
+ vgopts: --read-var-info=3Dyes --check-stack-var=3Dyes --show-confl-seg=
=3Dno --num-callers=3D2<br>
+ prog: swapcontext<br>
+ stderr_filter: filter_stderr<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.1=
7.0.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.17.0.bb</a> b/meta/=
recipes-devtools/valgrind/<a href=3D"http://valgrind_3.17.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">valgrind_3.17.0.bb</a><br>
index 1e29896596..7a6b766121 100644<br>
--- a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.17.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">valgrind_3.17.0.bb</a><br>
+++ b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.17.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">valgrind_3.17.0.bb</a><br>
@@ -43,6 +43,7 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/=
valgrind/valgrind-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">h=
ttps://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-none-tests-fdleak_cm=
sg.stderr.exp-adjust-tmp-paths.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-memcheck-tests-Fix-t=
imerfd-syscall-test.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-missing-musl.sup=
p.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Disable-temporarily-=
drd-tests-swapcontext.vgtest.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;afe11b5572c3121a781433b7c0ab741b&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ad3aec668e813e40f238995f60796d9590eee64=
a16dff88421430630e69285a2&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000034282205be6a2d42--
