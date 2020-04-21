Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.2878.1587442907375598906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 21:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ODREv1XN;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id v38so5953205qvf.6
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 21:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VaNYzEYKIMx+JQNlqZ/ymUmdnw2P9Wv24fuywuiI38E=;
        b=ODREv1XNw0elB5EgJGreLfJpETNogRCZg4s4brijXN3WcmDRjgbhcjV2FkBJGAQkq8
         L4USCOGP9kl4z2mBSODmX/HqqoetAJ1g5s4+Nt2CEPHuhaYhrRh4wF1rQjFisIBCNf+u
         azpAUssLFFv3a3phpTXnLFiKvoMWttAQNDGH0kL3mZcE5DpOcjeX1cgE5IDzxD9QLu21
         Xu/EoIWpAU1eXDt7zNSJLBMYvxzMjYEhz4I5vKbVbbpC5H4u2iOPDsJc5IHj9YYFrRYN
         xWmaKeSIZ6k1STj/mHD5JfukYo6KOXryz6knC3Tftqt9PMo10cORayco12pOKW+Wfdbk
         d9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VaNYzEYKIMx+JQNlqZ/ymUmdnw2P9Wv24fuywuiI38E=;
        b=QTCynW5QigsTvnRVblAONRveQBH/27Ict5TZ8YmcgW4JWu1yL6acka9ZhSIBhb/4vg
         MwAp98tQBJhUlDkW4hLWgr6Wx4f0NfXHYiybFC7Xiq01x7sFBRGx1ZE4O2GBXbBLIbh8
         gO/Bl2GOrdGk4TPhhuf7FnmDzXAkBt9qQmhh4/g3gxDcGEPj1IRsFVntH13SR05uEHeO
         fGdHqjt1vffDEXGXS6/eJZJZSbfoLjXiDB1lgC/j8517z0Y7zCKj7T7d0oQnd9FxZcMT
         2JV8CHA+X8MB+zAQtofyPMiWcnDytkAGhmMr26ZcGdb9w8DKg3Ppmkz0SjblQfwd+/aW
         RuzQ==
X-Gm-Message-State: AGi0PuaWakmSr1egfFoPo4gdlscX9xX+wSGRVGOjoyLXiIYzhkqlfZzD
	5w0Fa3UEa4jUzderjzzGE1jcPGVv+iz9Wc3+27Y=
X-Google-Smtp-Source: APiQypJRsCJSYvtcHQlNMzLHr3nuQ2EKIfCxuUd5v+ul4qYWq4zoa4EcvyOfQKdg3sTyGUw2vcITX5nuRv/OTF1Kses=
X-Received: by 2002:a0c:b78e:: with SMTP id l14mr18644801qve.4.1587442906435;
 Mon, 20 Apr 2020 21:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200420095802.15290-1-zhixiong.chi@windriver.com> <ff30484f-76fc-544b-0dc7-2cbf0631cf00@gmail.com>
In-Reply-To: <ff30484f-76fc-544b-0dc7-2cbf0631cf00@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Apr 2020 21:21:35 -0700
Message-ID: <CAMKF1spN=zsFXSwEMF2LOFzopkWV5eyK7xj=jXxzTDaxHwLQNw@mail.gmail.com>
Subject: Re: [ZEUS][OE-core][PATCH] glibc: CVE-2020-1751
To: akuster <akuster808@gmail.com>
Cc: Zhixiong Chi <zhixiong.chi@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008a14a005a3c55ae7"

--0000000000008a14a005a3c55ae7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 7:31 PM akuster <akuster808@gmail.com> wrote:

>
>
> On 4/20/20 2:58 AM, Zhixiong Chi wrote:
>
> Backport the CVE patch from upstream:
> git://sourceware.org/git/glibc.git
> commit d93769405996dfc11d216ddbe415946617b5a494
>
>
> Is Dunfell or Master affected ?
>

It=E2=80=99s already in glibc 2.31 iirc


> - armin
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com> <zhixiong.chi@w=
indriver.com>
> ---
>  .../glibc/glibc/CVE-2020-1751.patch           | 70 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.30.bb         |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch b/meta/re=
cipes-core/glibc/glibc/CVE-2020-1751.patch
> new file mode 100644
> index 0000000000..0ed92d50e9
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
> @@ -0,0 +1,70 @@
> +From d93769405996dfc11d216ddbe415946617b5a494 Mon Sep 17 00:00:00 2001
> +From: Andreas Schwab <schwab@suse.de> <schwab@suse.de>
> +Date: Mon, 20 Jan 2020 17:01:50 +0100
> +Subject: [PATCH] Fix array overflow in backtrace on PowerPC (bug 25423)
> +
> +When unwinding through a signal frame the backtrace function on PowerPC
> +didn't check array bounds when storing the frame address.  Fixes commit
> +d400dcac5e ("PowerPC: fix backtrace to handle signal trampolines").
> +
> +CVE: CVE-2020-1751
> +Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com> <zhixiong.chi@=
windriver.com>
> +---
> + debug/tst-backtrace5.c                | 12 ++++++++++++
> + sysdeps/powerpc/powerpc32/backtrace.c |  2 ++
> + sysdeps/powerpc/powerpc64/backtrace.c |  2 ++
> + 3 files changed, 16 insertions(+)
> +
> +diff --git a/debug/tst-backtrace5.c b/debug/tst-backtrace5.c
> +index e7ce410845..b2f46160e7 100644
> +--- a/debug/tst-backtrace5.c
> ++++ b/debug/tst-backtrace5.c
> +@@ -89,6 +89,18 @@ handle_signal (int signum)
> +       }
> +   /* Symbol names are not available for static functions, so we do not
> +      check do_test.  */
> ++
> ++  /* Check that backtrace does not return more than what fits in the a=
rray
> ++     (bug 25423).  */
> ++  for (int j =3D 0; j < NUM_FUNCTIONS; j++)
> ++    {
> ++      n =3D backtrace (addresses, j);
> ++      if (n > j)
> ++	{
> ++	  FAIL ();
> ++	  return;
> ++	}
> ++    }
> + }
> +
> + NO_INLINE int
> +diff --git a/sysdeps/powerpc/powerpc32/backtrace.c b/sysdeps/powerpc/po=
werpc32/backtrace.c
> +index 7c2d4726f8..d1456c8ae4 100644
> +--- a/sysdeps/powerpc/powerpc32/backtrace.c
> ++++ b/sysdeps/powerpc/powerpc32/backtrace.c
> +@@ -114,6 +114,8 @@ __backtrace (void **array, int size)
> +         }
> +       if (gregset)
> + =09{
> ++	  if (count + 1 =3D=3D size)
> ++	    break;
> + =09  array[++count] =3D (void*)((*gregset)[PT_NIP]);
> + =09  current =3D (void*)((*gregset)[PT_R1]);
> + =09}
> +diff --git a/sysdeps/powerpc/powerpc64/backtrace.c b/sysdeps/powerpc/po=
werpc64/backtrace.c
> +index 65c260ab76..8a53a1088f 100644
> +--- a/sysdeps/powerpc/powerpc64/backtrace.c
> ++++ b/sysdeps/powerpc/powerpc64/backtrace.c
> +@@ -87,6 +87,8 @@ __backtrace (void **array, int size)
> +       if (is_sigtramp_address (current->return_address))
> +         {
> + =09  struct signal_frame_64 *sigframe =3D (struct signal_frame_64*) cu=
rrent;
> ++	  if (count + 1 =3D=3D size)
> ++	    break;
> +           array[++count] =3D (void*) sigframe->uc.uc_mcontext.gp_regs[=
PT_NIP];
> + =09  current =3D (void*) sigframe->uc.uc_mcontext.gp_regs[PT_R1];
> + =09}
> +--
> +2.23.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.30.bb b/meta/recipes-core/g=
libc/glibc_2.30.bb
> index c9e44a396d..84a6538ea1 100644
> --- a/meta/recipes-core/glibc/glibc_2.30.bb
> +++ b/meta/recipes-core/glibc/glibc_2.30.bb
> @@ -43,6 +43,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};n=
ame=3Dglibc \
>             file://0028-locale-prevent-maybe-uninitialized-errors-with-O=
s-BZ.patch \
>             file://CVE-2019-19126.patch \
>             file://CVE-2020-10029.patch \
> +           file://CVE-2020-1751.patch \
>             "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
>
>
>
>=20
>

--0000000000008a14a005a3c55ae7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 20, 2020 at 7:31 PM akuster &lt;<a href=3D"mai=
lto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
  
    
  
  <div>
    <br>
    <br>
    <div>On 4/20/20 2:58 AM, Zhixiong Chi wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>Backport the CVE patch from upstream:
git://<a href=3D"http://sourceware.org/git/glibc.git" target=3D"_blank">so=
urceware.org/git/glibc.git</a>
commit d93769405996dfc11d216ddbe415946617b5a494</pre>
    </blockquote>
    <br>
    Is Dunfell or Master affected ?<br>
    </div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=
=
=80=99s already in glibc 2.31 iirc=C2=A0</div><div dir=3D"auto"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><br>
    - armin</div><div><br>
    <blockquote type=3D"cite">
      <pre>Signed-off-by: Zhixiong Chi <a href=3D"mailto:zhixiong.chi@wind=
river.com" target=3D"_blank">&lt;zhixiong.chi@windriver.com&gt;</a>
---
 .../glibc/glibc/CVE-2020-1751.patch           | 70 +++++++++++++++++++
 meta/recipes-core/glibc/<a href=3D"http://glibc_2.30.bb" target=3D"_blank=
">glibc_2.30.bb</a>         |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-1751.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch b/meta/reci=
pes-core/glibc/glibc/CVE-2020-1751.patch
new file mode 100644
index 0000000000..0ed92d50e9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
@@ -0,0 +1,70 @@
+From d93769405996dfc11d216ddbe415946617b5a494 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <a href=3D"mailto:schwab@suse.de" target=3D"_blank">=
&lt;schwab@suse.de&gt;</a>
+Date: Mon, 20 Jan 2020 17:01:50 +0100
+Subject: [PATCH] Fix array overflow in backtrace on PowerPC (bug 25423)
+
+When unwinding through a signal frame the backtrace function on PowerPC
+didn&#39;t check array bounds when storing the frame address.  Fixes comm=
it
+d400dcac5e (&quot;PowerPC: fix backtrace to handle signal trampolines&quo=
t;).
+
+CVE: CVE-2020-1751
+Upstream-Status: Backport [git://<a href=3D"http://sourceware.org/git/gli=
bc.git" target=3D"_blank">sourceware.org/git/glibc.git</a>]
+Signed-off-by: Zhixiong Chi <a href=3D"mailto:zhixiong.chi@windriver.com"=
 target=3D"_blank">&lt;zhixiong.chi@windriver.com&gt;</a>
+---
+ debug/tst-backtrace5.c                | 12 ++++++++++++
+ sysdeps/powerpc/powerpc32/backtrace.c |  2 ++
+ sysdeps/powerpc/powerpc64/backtrace.c |  2 ++
+ 3 files changed, 16 insertions(+)
+
+diff --git a/debug/tst-backtrace5.c b/debug/tst-backtrace5.c
+index e7ce410845..b2f46160e7 100644
+--- a/debug/tst-backtrace5.c
++++ b/debug/tst-backtrace5.c
+@@ -89,6 +89,18 @@ handle_signal (int signum)
+       }
+   /* Symbol names are not available for static functions, so we do not
+      check do_test.  */
++
++  /* Check that backtrace does not return more than what fits in the arr=
ay
++     (bug 25423).  */
++  for (int j =3D 0; j &lt; NUM_FUNCTIONS; j++)
++    {
++      n =3D backtrace (addresses, j);
++      if (n &gt; j)
++	{
++	  FAIL ();
++	  return;
++	}
++    }
+ }
+=20
+ NO_INLINE int
+diff --git a/sysdeps/powerpc/powerpc32/backtrace.c b/sysdeps/powerpc/powe=
rpc32/backtrace.c
+index 7c2d4726f8..d1456c8ae4 100644
+--- a/sysdeps/powerpc/powerpc32/backtrace.c
++++ b/sysdeps/powerpc/powerpc32/backtrace.c
+@@ -114,6 +114,8 @@ __backtrace (void **array, int size)
+         }
+       if (gregset)
+ =09{
++	  if (count + 1 =3D=3D size)
++	    break;
+ =09  array[++count] =3D (void*)((*gregset)[PT_NIP]);
+ =09  current =3D (void*)((*gregset)[PT_R1]);
+ =09}
+diff --git a/sysdeps/powerpc/powerpc64/backtrace.c b/sysdeps/powerpc/powe=
rpc64/backtrace.c
+index 65c260ab76..8a53a1088f 100644
+--- a/sysdeps/powerpc/powerpc64/backtrace.c
++++ b/sysdeps/powerpc/powerpc64/backtrace.c
+@@ -87,6 +87,8 @@ __backtrace (void **array, int size)
+       if (is_sigtramp_address (current-&gt;return_address))
+         {
+ =09  struct signal_frame_64 *sigframe =3D (struct signal_frame_64*) curr=
ent;
++	  if (count + 1 =3D=3D size)
++	    break;
+           array[++count] =3D (void*) sigframe-&gt;uc.uc_mcontext.gp_regs=
[PT_NIP];
+ =09  current =3D (void*) sigframe-&gt;uc.uc_mcontext.gp_regs[PT_R1];
+ =09}
+--=20
+2.23.0
+
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.30.bb" targ=
et=3D"_blank">glibc_2.30.bb</a> b/meta/recipes-core/glibc/<a href=3D"http:/=
/glibc_2.30.bb" target=3D"_blank">glibc_2.30.bb</a>
index c9e44a396d..84a6538ea1 100644
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.30.bb" target=3D"_=
blank">glibc_2.30.bb</a>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.30.bb" target=3D"_=
blank">glibc_2.30.bb</a>
@@ -43,6 +43,7 @@ SRC_URI =3D  &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH=
};name=3Dglibc \
            <a>file://0028-locale-prevent-maybe-uninitialized-errors-with-=
Os-BZ.patch</a> \
            <a>file://CVE-2019-19126.patch</a> \
            <a>file://CVE-2020-10029.patch</a> \
+           <a>file://CVE-2020-1751.patch</a> \
            &quot;
 S =3D &quot;${WORKDIR}/git&quot;
 B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;
</pre>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
    <br>
  </div><div></div>

<br>
</blockquote></div></div>

--0000000000008a14a005a3c55ae7--
