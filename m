Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.1507.1595355085804333655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 11:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bYe/7BUJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: rwmacleod@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id h16so17225838ilj.11
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YyknEWHJiqVPjykrsz9EruYA02vfCL91QN9BKo6Sldo=;
        b=bYe/7BUJPlIuybot+ZfYhJZLfSNT/vqXXuJzAEgWV9R/z2pfeWRoZ5nLRklCqVPBNj
         0FwWtPt44kLrD4rLAW985w9EIDgjXO8Q0ypHEbl/0vh9EpSosaDAVglp8XvgtSO9aZC7
         rWHTeyEwjAjrsKg7x3JJNv7pDxmfoavDVfwybwprnSBKLSQNzTx9J0to8R1BctPWNB3k
         uMha2YE7mTw0XagKpAcUwq2XYPXEp+5EI/XTKcGzaRWP03KuEGaO8o72IYo0V1CN0YN9
         5uExq8bin4ewaPima2kgIm/271MaHkgFG5/NljOSfBjncVESWlGbp250c7y560WAtRFF
         CD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YyknEWHJiqVPjykrsz9EruYA02vfCL91QN9BKo6Sldo=;
        b=APniMeEi/MyXajL4iYBI5kKaK+NEQcpER/KG/yI/dGwOx7heNZuZN7AwYKRt3QAUjA
         n5b7saWXl1kURrNa7ZUnVfSTzTlRtzr+WahqNEu6NfzwKLaZwZE/1kCuzYiF7i4ecTYu
         EviuLRj73OpDZD2MfmYximBGBXqYmLVdK8hUaezmyGgO56NCs52KY39A6oy5Fxbzp0lf
         DsPbPaqC4ONV33I0PwZ9fWRVywfkKFrd59hn2FtLKfGV/i5vNH2gp/WACLcX5qoKR2wH
         wZEJG5kxwJvyC+qJ55sYofYIaYaKAsYkT7eO3Yrea9CgQ6kBi71PCp8Zfv5pj1SpPn7Q
         oZrQ==
X-Gm-Message-State: AOAM530zB3xs03gCYqRQuKVgxvnR2pU949NmY3enBRNV3iBEfZLco/FL
	NYIIHcaDHgIFCNZVNP80qaF6IE+56XDex9h1u98=
X-Google-Smtp-Source: ABdhPJz6HoeiaJdSt6GvRPQQ90C4J9OM0kJVI1MSc5zheB3Z/7niEXj2pcV5D9uXFdxcJULuASA+6/Dx/nxcYRShJOY=
X-Received: by 2002:a92:c806:: with SMTP id v6mr7464998iln.10.1595355085172;
 Tue, 21 Jul 2020 11:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200721180054.38185-1-sakib.sajal@windriver.com>
In-Reply-To: <20200721180054.38185-1-sakib.sajal@windriver.com>
From: "Randy MacLeod" <rwmacleod@gmail.com>
Date: Tue, 21 Jul 2020 14:11:11 -0400
Message-ID: <CAK6=ix5bcxMfGME1jnf3hKFUMRFmHjaigCrxR-zOSjpad_LyhA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] busybox: make hwclock compatible with glibc 2.31
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002475b005aaf78d28"

--0000000000002475b005aaf78d28
Content-Type: text/plain; charset="UTF-8"

Hi Sakib,

Did you check this busybox fix against musl? I forgot to ask you this when
you showed me this patch yesterday.

Randy

On Tue., Jul. 21, 2020, 14:01 Sakib Sajal, <sakib.sajal@windriver.com>
wrote:

> settimeofday(2) has been deprecated as of glibc 2.31
> which hwclock makes use of. This patch makes hwclock
> compatible with glibc v2.31
> See patch for more details:
>   busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>
> Fixes [YOCTO #13981]
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...1-hwclock-make-glibc-2.31-compatible.patch | 83 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.32.0.bb   |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644
> meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>
> diff --git
> a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
> b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
> new file mode 100644
> index 0000000000..8d1f272120
> --- /dev/null
> +++
> b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
> @@ -0,0 +1,83 @@
> +From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001
> +From: Sakib Sajal <sakib.sajal@windriver.com>
> +Date: Fri, 17 Jul 2020 17:27:21 +0000
> +Subject: [PATCH] hwclock: make glibc 2.31 compatible
> +
> +NEWS for glibc version 2.31
> +===========================
> +
> +Deprecated and removed features, and other changes affecting
> compatibility:
> +
> +* The settimeofday function can still be used to set a system-wide
> +  time zone when the operating system supports it.  This is because
> +  the Linux kernel reused the API, on some architectures, to describe
> +  a system-wide time-zone-like offset between the software clock
> +  maintained by the kernel, and the "RTC" clock that keeps time when
> +  the system is shut down.
> +
> +  However, to reduce the odds of this offset being set by accident,
> +  settimeofday can no longer be used to set the time and the offset
> +  simultaneously.  If both of its two arguments are non-null, the call
> +  will fail (setting errno to EINVAL).
> +
> +  Callers attempting to set this offset should also be prepared for
> +  the call to fail and set errno to ENOSYS; this already happens on
> +  the Hurd and on some Linux architectures.  The Linux kernel
> +  maintainers are discussing a more principled replacement for the
> +  reused API.  After a replacement becomes available, we will change
> +  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
> +  argument is not a null pointer.
> +
> +  settimeofday itself is obsolescent according to POSIX.  Programs
> +  that set the system time should use clock_settime and/or the adjtime
> +  family of functions instead.  We may cease to make settimeofday
> +  available to newly linked binaries after there is a replacement for
> +  Linux's time-zone-like offset API.
> +
> +hwclock had two calls to settimeofday, in functions to_sys_clock and
> +set_system_clock_timezone, where both the arguments to settimeofday
> +were valid (non-null).
> +Therefore, split the call, once for timezone and once for timeval.
> +
> +Fixes #12756
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + util-linux/hwclock.c | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
> +index dc97d8f..cf346e8 100644
> +--- a/util-linux/hwclock.c
> ++++ b/util-linux/hwclock.c
> +@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname,
> int utc)
> +
> +       tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
> +       tv.tv_usec = 0;
> +-      if (settimeofday(&tv, &tz))
> +-              bb_simple_perror_msg_and_die("settimeofday");
> ++      if (settimeofday(NULL, &tz))
> ++              bb_simple_perror_msg_and_die("settimeofday: timezone");
> ++      if (settimeofday(&tv, NULL))
> ++              bb_simple_perror_msg_and_die("settimeofday: timeval");
> + }
> +
> + static void from_sys_clock(const char **pp_rtcname, int utc)
> +@@ -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)
> +       gettimeofday(&tv, NULL);
> +       if (!utc)
> +               tv.tv_sec += tz.tz_minuteswest * 60;
> +-      if (settimeofday(&tv, &tz))
> +-              bb_simple_perror_msg_and_die("settimeofday");
> ++      if (settimeofday(NULL, &tz))
> ++              bb_simple_perror_msg_and_die("settimeofday: timezone");
> ++      if (settimeofday(&tv, NULL))
> ++              bb_simple_perror_msg_and_die("settimeofday: timeval");
> + }
> +
> + //usage:#define hwclock_trivial_usage
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb
> b/meta/recipes-core/busybox/busybox_1.32.0.bb
> index 0dfdfdb549..aeea40fbc1 100644
> --- a/meta/recipes-core/busybox/busybox_1.32.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
> @@ -43,6 +43,7 @@ SRC_URI = "
> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>
> file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
>             file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
>
> file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
> +           file://0001-hwclock-make-glibc-2.31-compatible.patch \
>  "
>  SRC_URI_append_libc-musl = " file://musl.cfg "
>
> --
> 2.27.0
>
> 
>

--0000000000002475b005aaf78d28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Sakib,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"au=
to">Did you check this busybox fix against musl? I forgot to ask you this w=
hen you showed me this patch yesterday.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Randy</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue., Jul. 21, 2020, 14:01 Sakib Sajal, &lt;<=
a href=3D"mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">settimeofday(2) has been =
deprecated as of glibc 2.31<br>
which hwclock makes use of. This patch makes hwclock<br>
compatible with glibc v2.31<br>
See patch for more details:<br>
=C2=A0 busybox/0001-hwclock-make-glibc-2.31-compatible.patch<br>
<br>
Fixes [YOCTO #13981]<br>
<br>
Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com=
" target=3D"_blank" rel=3D"noreferrer">sakib.sajal@windriver.com</a>&gt;<br=
>
---<br>
=C2=A0...1-hwclock-make-glibc-2.31-compatible.patch | 83 +++++++++++++++++=
++<br>
=C2=A0meta/recipes-core/busybox/<a href=3D"http://busybox_1.32.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">busybox_1.32.0.bb</a>=C2=A0 =
=C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 84 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/busybox/busybox/0001-hwclock-ma=
ke-glibc-2.31-compatible.patch<br>
<br>
diff --git a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.3=
1-compatible.patch b/meta/recipes-core/busybox/busybox/0001-hwclock-make-gl=
ibc-2.31-compatible.patch<br>
new file mode 100644<br>
index 0000000000..8d1f272120<br>
--- /dev/null<br>
+++ b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compa=
tible.patch<br>
@@ -0,0 +1,83 @@<br>
+From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001<br=
>
+From: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com" target=
=
=3D"_blank" rel=3D"noreferrer">sakib.sajal@windriver.com</a>&gt;<br>
+Date: Fri, 17 Jul 2020 17:27:21 +0000<br>
+Subject: [PATCH] hwclock: make glibc 2.31 compatible<br>
+<br>
+NEWS for glibc version 2.31<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
+<br>
+Deprecated and removed features, and other changes affecting compatibilit=
y:<br>
+<br>
+* The settimeofday function can still be used to set a system-wide<br>
+=C2=A0 time zone when the operating system supports it.=C2=A0 This is bec=
ause<br>
+=C2=A0 the Linux kernel reused the API, on some architectures, to describ=
e<br>
+=C2=A0 a system-wide time-zone-like offset between the software clock<br>
+=C2=A0 maintained by the kernel, and the &quot;RTC&quot; clock that keeps=
 time when<br>
+=C2=A0 the system is shut down.<br>
+<br>
+=C2=A0 However, to reduce the odds of this offset being set by accident,<=
br>
+=C2=A0 settimeofday can no longer be used to set the time and the offset<=
br>
+=C2=A0 simultaneously.=C2=A0 If both of its two arguments are non-null, t=
he call<br>
+=C2=A0 will fail (setting errno to EINVAL).<br>
+<br>
+=C2=A0 Callers attempting to set this offset should also be prepared for<=
br>
+=C2=A0 the call to fail and set errno to ENOSYS; this already happens on<=
br>
+=C2=A0 the Hurd and on some Linux architectures.=C2=A0 The Linux kernel<b=
r>
+=C2=A0 maintainers are discussing a more principled replacement for the<b=
r>
+=C2=A0 reused API.=C2=A0 After a replacement becomes available, we will c=
hange<br>
+=C2=A0 settimeofday to fail with ENOSYS on all platforms when its &#39;tz=
p&#39;<br>
+=C2=A0 argument is not a null pointer.<br>
+<br>
+=C2=A0 settimeofday itself is obsolescent according to POSIX.=C2=A0 Progr=
ams<br>
+=C2=A0 that set the system time should use clock_settime and/or the adjti=
me<br>
+=C2=A0 family of functions instead.=C2=A0 We may cease to make settimeofd=
ay<br>
+=C2=A0 available to newly linked binaries after there is a replacement fo=
r<br>
+=C2=A0 Linux&#39;s time-zone-like offset API.<br>
+<br>
+hwclock had two calls to settimeofday, in functions to_sys_clock and<br>
+set_system_clock_timezone, where both the arguments to settimeofday<br>
+were valid (non-null).<br>
+Therefore, split the call, once for timezone and once for timeval.<br>
+<br>
+Fixes #12756<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.co=
m" target=3D"_blank" rel=3D"noreferrer">sakib.sajal@windriver.com</a>&gt;<b=
r>
+---<br>
+ util-linux/hwclock.c | 12 ++++++++----<br>
+ 1 file changed, 8 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c<br>
+index dc97d8f..cf346e8 100644<br>
+--- a/util-linux/hwclock.c<br>
++++ b/util-linux/hwclock.c<br>
+@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname, in=
t utc)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tv.tv_sec =3D read_rtc(pp_rtcname, NULL, utc);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tv.tv_usec =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (settimeofday(&amp;tv, &amp;tz))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_an=
d_die(&quot;settimeofday&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (settimeofday(NULL, &amp;tz))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_an=
d_die(&quot;settimeofday: timezone&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (settimeofday(&amp;tv, NULL))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_an=
d_die(&quot;settimeofday: timeval&quot;);<br>
+ }<br>
+ <br>
+ static void from_sys_clock(const char **pp_rtcname, int utc)<br>
+@@ -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gettimeofday(&amp;tv, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!utc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tv.tv_sec +=3D tz.=
tz_minuteswest * 60;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (settimeofday(&amp;tv, &amp;tz))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_an=
d_die(&quot;settimeofday&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (settimeofday(NULL, &amp;tz))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_an=
d_die(&quot;settimeofday: timezone&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (settimeofday(&amp;tv, NULL))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_an=
d_die(&quot;settimeofday: timeval&quot;);<br>
+ }<br>
+ <br>
+ //usage:#define hwclock_trivial_usage<br>
+-- <br>
+2.24.1<br>
+<br>
diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.32.0.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">busybox_1.32.0.bb</a> b/m=
eta/recipes-core/busybox/<a href=3D"http://busybox_1.32.0.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">busybox_1.32.0.bb</a><br>
index 0dfdfdb549..aeea40fbc1 100644<br>
--- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.32.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">busybox_1.32.0.bb</a><br>
+++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.32.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">busybox_1.32.0.bb</a><br>
@@ -43,6 +43,7 @@ SRC_URI =3D &quot;<a href=3D"https://busybox.net/downloa=
ds/busybox-$%7BPV%7D.tar.bz2;name=3Dtarball" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=
=3Dtarball</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-testsuite-use-www.ex=
ample.org-for-wget-test-cases.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-du-l-works-fix-to-us=
e-145-instead-of-144.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-sysctl-ignore-EIO-of=
-stable_secret-below-proc-sys-ne.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-hwclock-make-glibc-2=
.31-compatible.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://musl.cfg &quot;<br>
<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div>

--0000000000002475b005aaf78d28--
