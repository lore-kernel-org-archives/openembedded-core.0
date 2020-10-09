Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.2592.1602278546681532388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 14:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VA1XtsA0;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: rwmacleod@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id b138so5972727yba.5
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 14:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tKl9/mo3xip4Jcgp/PRuIoxOTjDqPsdVo/IbvV6QYV0=;
        b=VA1XtsA0OF+KTyN930OA7wHKLyAWrO4zewbFxSQpQl5XBQl9IKYrgTXvH8TQd9R4gO
         ZBsZB2Er4+dGLBEL0BzHtl7s7Hm4vn4YXc/li0RNDZz0epgdty+NLmnJk4XqurKV7HPk
         7tZU8YXSE/ubo3lO0ePYlNxnlxAjRIH7vnI4Dohb6ONFXwjhWWRAcJTvXUYfMJNpzc3R
         rbHS+bfKD6A7SaTX/nSwzZJAO6nj9++BOhfvd5aGsDn8Gt9KJtpCt5TAUPUIVqb6lFTW
         CmHs6Jkx/HpAMq7G/nKhqFdC2+6EhgNKtgwkrUIrkkAHGMEkMicUwy+qb0PAYNsjKCZk
         q5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tKl9/mo3xip4Jcgp/PRuIoxOTjDqPsdVo/IbvV6QYV0=;
        b=j0zWIQxxBCJKXrSPz1WqJp8/Ixv4HhV5fPjp3VegOtQEeRpSPZzuC/d9HRPnCYFUwa
         ASGrC/ljQGxQutqYkl03UWr7/+mQyd7kRM1fKaZtqbpoiNbaSNCa7xbWQ6l0SRsTuVNA
         eNnbqwBGwipR9GSW9Ba7ob+YQx+UHeUGHciFWAj9I57/jy6sZbQQ+Grk4eQIcuztCzbU
         zsVE+TcOzmrbblHIwVq4qLo75Tc18Zp30tSZ0g9IjFBwCqfa336k0CJZ9yIOpNclnKgr
         9PnG7SfjWSFPU67zCu7xsLis7JhzddlZVhDPew/AiWTjvzUwo+WvtpSPGQpwLxZuiHun
         RtFA==
X-Gm-Message-State: AOAM533E9kxQQlG9m/ndOmR5SajP38fRE417YUp2AenuSOxUy6Hk8BCb
	1Wns57VYpSsxWhhOprUYjYlUcflbh983uS8w5iU=
X-Google-Smtp-Source: ABdhPJzv60YgBn3NE6sruJPT+q1A8gi26LhmIJ0GasiAlg13Ilo42bJAkTnmb0BJe4p+UHWf6+nbpPYLyf+kfO13eRk=
X-Received: by 2002:a25:6883:: with SMTP id d125mr21286435ybc.105.1602278545862;
 Fri, 09 Oct 2020 14:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201009174436.3243814-1-stacy.gaikovaia@windriver.com>
 <CAK6=ix4Uro_mQyie8ZiMXST5TUMvWcDgwDTsAtYtEtjaBE5vmw@mail.gmail.com> <BYAPR11MB3127C6EBD896DBB8D1887A2DFD080@BYAPR11MB3127.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3127C6EBD896DBB8D1887A2DFD080@BYAPR11MB3127.namprd11.prod.outlook.com>
From: "Randy MacLeod" <rwmacleod@gmail.com>
Date: Fri, 9 Oct 2020 17:22:14 -0400
Message-ID: <CAK6=ix5Kq26Bf=xd5E6CXWAsSmtVU80dj-xG8Va9qC9a-geLnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept test failures
To: "Gaikovaia, Stacy" <Stacy.Gaikovaia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008eb52305b1438b10"

--0000000000008eb52305b1438b10
Content-Type: text/plain; charset="UTF-8"

On Fri., Oct. 9, 2020, 16:21 Gaikovaia, Stacy, <
Stacy.Gaikovaia@windriver.com> wrote:

> Sure I'll do those things.
>
>
> Upsteam-Status: Backport
>
>
> >> This goes in the body of the patch. Mention the vg commit ID too please.
>
> I have the vg commit ID in the body of the patch, is that ok or should
> both things be in both spots?
>

Both is marginally better. This just helps the person doing the next uprev:
they find the upstream status in the patch and the commit is is right
there.

Randy

>
> Stacy
> ------------------------------
> *From:* Randy MacLeod <rwmacleod@gmail.com>
> *Sent:* Friday, October 9, 2020 4:14 PM
> *To:* Gaikovaia, Stacy <Stacy.Gaikovaia@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept
> test failures
>
>
>
> On Fri., Oct. 9, 2020, 13:45 Stacy Gaikovaia, <
> Stacy.Gaikovaia@windriver.com> wrote:
>
> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
>
> After glibc uprev 2.32 -> 2.32, the
>
>
> 2.31 -> 2.32
>
> following drd ptests
> fail with the error "condition variable has not been initialized".
>
> drd/tests/annotate_hb_err
> drd/tests/annotate_sem
> drd/tests/annotate_rwlock
> drd/tests/annotate_order_2
> drd/tests/annotate_smart_pointer
> drd/tests/annotate_spinlock
> drd/tests/monitor_example
> drd/tests/pth_cond_race
> drd/tests/pth_inconsistent_cond_wait
>
> In glibc 2.32, the POSIX thread functions are in both
> libc and libpthread, causing valgrind to misinterpert
> test behaviour. This patch tells valgrind to intercept
> the pthread functions in libc,
>
>
>
> It's intercepting both as mentioned in the patch commit:
>
>    "intercept both the libc and the libpthread functions"
> so please make that clear in your commit log.
>
>
> resolving these ptest
> failures. Patch can be removed once we uprev valgrind.
>
>
> Can you add the pass, fail, skip and total counts and mention the test
> system qemux86-64? This will help people track things when there is another
> update.
>
>
> Upsteam-Status: Backport
>
>
> This goes in the body of the patch. Mention the vg commit ID too please.
>
>
> Thanks,
>
> Randy
>
>
> Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> ---
>  .../valgrind/0001-drd-Port-to-Fedora-33.patch | 46 +++++++++++++++++++
>  .../valgrind/valgrind_3.16.1.bb               |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644
> meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
>
> diff --git
> a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> new file mode 100644
> index 0000000000..bca3d9b892
> --- /dev/null
> +++
> b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.patch
> @@ -0,0 +1,46 @@
> +From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001
> +From: Bart Van Assche <bvanassche@acm.org>
> +Date: Sat, 19 Sep 2020 08:08:59 -0700
> +Subject: [PATCH] drd: Port to Fedora 33
> +
> +Apparently on Fedora 33 the POSIX thread functions exist in both libc and
> +libpthread. Hence this patch that intercepts the pthread functions in
> +libc. See also https://bugs.kde.org/show_bug.cgi?id=426144 .
> +
> +Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> +
> +This patch was imported from the valgrind sourceware server
> +(https://sourceware.org/git/?p=valgrind.git), commit id
> +15330adf7c2471fbaa6a0818db07078d81dbff97. It was modified to
> +remove the changes to the valgrind NEWS file, as these are difficult to
> +maintain and don't impact the valgrind code itself.
> +
> +Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
> +---
> + drd/drd_pthread_intercepts.c | 9 +++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
> +index 58c45aaec..c2882e5ab 100644
> +--- a/drd/drd_pthread_intercepts.c
> ++++ b/drd/drd_pthread_intercepts.c
> +@@ -174,7 +174,16 @@ static int never_true;
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
> +    { return implf argl; }
> + #else
> ++/*
> ++ * On Linux, intercept both the libc and the libpthread functions. At
> ++ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthread
> ++ * functions in both libc and libpthread. Older glibc versions only have
> an
> ++ * implementation of the pthread functions in libpthread.
> ++ */
> + #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
> ++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
> ++   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
> ++   { return implf argl; }                                               \
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
> +    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
> +    { return implf argl; }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> index d4ca1a7752..7508098b55 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
> @@ -40,6 +40,7 @@ SRC_URI = "
> https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>             file://s390x_vec_op_t.patch \
>
> file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
>             file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
> +           file://0001-drd-Port-to-Fedora-33.patch \
>             "
>  SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
>  SRC_URI[sha256sum] =
> "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
> --
> 2.25.1
>
>
> 
>
>

--0000000000008eb52305b1438b10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri., Oct. 9, 2020, 16:21 Gaikovaia, Stacy, &lt;<a =
href=3D"mailto:Stacy.Gaikovaia@windriver.com">Stacy.Gaikovaia@windriver.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
<div dir=3D"auto">Sure I&#39;ll do those things.<br>
<br>
</div>
<div dir=3D"auto">
<div dir=3D"auto">
<div>
<blockquote style=3D"margin:0 0 0 0.8ex;padding-left:1ex;border-left:1px s=
olid #cccccc">
<br>
<div>Upsteam-Status: Backport</div>
</blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">&gt;&gt; This goes in the body of the patch. Mention the=
 vg commit ID too please.</div>
</div>
<br>
I have the vg commit ID in the body of the patch, is that ok or should bot=
h things be in both spots?<br></div></div></blockquote></div></div><div dir=
=
=3D"auto"><br></div><div dir=3D"auto">Both is marginally better. This just=
 helps the person doing the next uprev: they find the upstream status in th=
e patch and the commit is is right there.=C2=A0 =C2=A0</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Randy</div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div style=3D"f=
ont-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,=
0)">
<br>
Stacy <br>
</div>
<div id=3D"m_-7564845764657968209appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-7564845764657968209divRplyFwdMsg" dir=3D"ltr"><font face=3D"=
Calibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b=
> Randy MacLeod &lt;<a href=3D"mailto:rwmacleod@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">rwmacleod@gmail.com</a>&gt;<br>
<b>Sent:</b> Friday, October 9, 2020 4:14 PM<br>
<b>To:</b> Gaikovaia, Stacy &lt;<a href=3D"mailto:Stacy.Gaikovaia@windrive=
r.com" target=3D"_blank" rel=3D"noreferrer">Stacy.Gaikovaia@windriver.com</=
a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org<=
/a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a=
>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept=
 test failures</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"auto">
<div><br>
<br>
<div>
<div dir=3D"ltr">On Fri., Oct. 9, 2020, 13:45 Stacy Gaikovaia, &lt;<a href=
=
=3D"mailto:Stacy.Gaikovaia@windriver.com" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">Stacy.Gaikovaia@windriver.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
From: Stacy Gaikovaia &lt;<a href=3D"mailto:Stacy.Gaikovaia@windriver.com"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">Stacy.Gaikovaia=
@windriver.com</a>&gt;<br>
<br>
After glibc uprev 2.32 -&gt; 2.32, the </blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">2.31 -&gt; 2.32</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div>
<blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
following drd ptests<br>
fail with the error &quot;condition variable has not been initialized&quot=
;.<br>
<br>
drd/tests/annotate_hb_err<br>
drd/tests/annotate_sem<br>
drd/tests/annotate_rwlock<br>
drd/tests/annotate_order_2<br>
drd/tests/annotate_smart_pointer<br>
drd/tests/annotate_spinlock<br>
drd/tests/monitor_example<br>
drd/tests/pth_cond_race<br>
drd/tests/pth_inconsistent_cond_wait<br>
<br>
In glibc 2.32, the POSIX thread functions are in both<br>
libc and libpthread, causing valgrind to misinterpert<br>
test behaviour. This patch tells valgrind to intercept<br>
the pthread functions in libc, </blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">It&#39;s intercepting both as mentioned in the patch com=
mit:</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif">=C2=A0 =C2=A0&quo=
t;intercept both the libc and the libpthread functions&quot;</span><br>
</div>
<div dir=3D"auto"><font face=3D"sans-serif">so please make that clear in y=
our commit log.</font></div>
<div dir=3D"auto"><font face=3D"sans-serif"><br>
</font></div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div>
<blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
resolving these ptest<br>
failures. Patch can be removed once we uprev valgrind.<br>
</blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Can you add the pass, fail, skip and total counts and me=
ntion the test system qemux86-64? This will help people track things when t=
here is another update.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div>
<blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
Upsteam-Status: Backport<br>
</blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">This goes in the body of the patch. Mention the vg commi=
t ID too please.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks,</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Randy</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">
<div>
<blockquote style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
Signed-off-by: Stacy Gaikovaia &lt;<a href=3D"mailto:Stacy.Gaikovaia@windr=
iver.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">Stacy.=
Gaikovaia@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../valgrind/0001-drd-Port-to-Fedora-33.patch | 46 +++++++++++++++++=
++<br>
=C2=A0.../valgrind/<a href=3D"http://valgrind_3.16.1.bb" rel=3D"noreferrer=
 noreferrer noreferrer noreferrer" target=3D"_blank">valgrind_3.16.1.bb</a>=
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 47 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-=
Port-to-Fedora-33.patch<br>
<br>
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedo=
ra-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedo=
ra-33.patch<br>
new file mode 100644<br>
index 0000000000..bca3d9b892<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.p=
atch<br>
@@ -0,0 +1,46 @@<br>
+From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001<br=
>
+From: Bart Van Assche &lt;<a href=3D"mailto:bvanassche@acm.org" rel=3D"no=
referrer noreferrer noreferrer" target=3D"_blank">bvanassche@acm.org</a>&gt=
;<br>
+Date: Sat, 19 Sep 2020 08:08:59 -0700<br>
+Subject: [PATCH] drd: Port to Fedora 33<br>
+<br>
+Apparently on Fedora 33 the POSIX thread functions exist in both libc and=
<br>
+libpthread. Hence this patch that intercepts the pthread functions in<br>
+libc. See also <a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D426144" =
rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">
https://bugs.kde.org/show_bug.cgi?id=3D426144</a> .<br>
+<br>
+Signed-off-by: Bart Van Assche &lt;<a href=3D"mailto:bvanassche@acm.org" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">bvanassche@acm.o=
rg</a>&gt;<br>
+<br>
+This patch was imported from the valgrind sourceware server<br>
+(<a href=3D"https://sourceware.org/git/?p=3Dvalgrind.git" rel=3D"noreferr=
er noreferrer noreferrer noreferrer" target=3D"_blank">https://sourceware.o=
rg/git/?p=3Dvalgrind.git</a>), commit id<br>
+15330adf7c2471fbaa6a0818db07078d81dbff97. It was modified to<br>
+remove the changes to the valgrind NEWS file, as these are difficult to <=
br>
+maintain and don&#39;t impact the valgrind code itself.<br>
+<br>
+Signed-off-by: Stacy Gaikovaia &lt;<a href=3D"mailto:stacy.gaikovaia@wind=
river.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">stacy=
.gaikovaia@windriver.com</a>&gt;<br>
+---<br>
+ drd/drd_pthread_intercepts.c | 9 +++++++++<br>
+ 1 file changed, 10 insertions(+)<br>
+<br>
+diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c<=
br>
+index 58c45aaec..c2882e5ab 100644<br>
+--- a/drd/drd_pthread_intercepts.c<br>
++++ b/drd/drd_pthread_intercepts.c<br>
+@@ -174,7 +174,16 @@ static int never_true;<br>
+=C2=A0 =C2=A0 ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 { return implf argl; }<br>
+ #else<br>
++/*<br>
++ * On Linux, intercept both the libc and the libpthread functions. At<br=
>
++ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthrea=
d<br>
++ * functions in both libc and libpthread. Older glibc versions only have=
 an<br>
++ * implementation of the pthread functions in libpthread.<br>
++ */<br>
+ #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0{ return implf argl; }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_=
decl;=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_=
decl=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 { return implf argl; }<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.1=
6.1.bb" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blan=
k">valgrind_3.16.1.bb</a> b/meta/recipes-devtools/valgrind/<a href=3D"http:=
//valgrind_3.16.1.bb" rel=3D"noreferrer noreferrer noreferrer noreferrer" t=
arget=3D"_blank">valgrind_3.16.1.bb</a><br>
index d4ca1a7752..7508098b55 100644<br>
--- a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.16.1.bb"=
 rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">valg=
rind_3.16.1.bb</a><br>
+++ b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.16.1.bb"=
 rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">valg=
rind_3.16.1.bb</a><br>
@@ -40,6 +40,7 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/=
valgrind/valgrind-$%7BPV%7D.tar.bz2" rel=3D"noreferrer noreferrer noreferre=
r noreferrer" target=3D"_blank">https://sourceware.org/pub/valgrind/valgrin=
d-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://s390x_vec_op_t.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-none-tests-fdleak_cm=
sg.stderr.exp-adjust-tmp-paths.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-memcheck-tests-Fix-t=
imerfd-syscall-test.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-drd-Port-to-Fedora-3=
3.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;d1b153f1ab17cf1f311705e7a83ef589&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c91f3a2f7b02db0f3bc99479861656154d241d2=
fdb265614ba918cc6720a33ca&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div></div>

--0000000000008eb52305b1438b10--
