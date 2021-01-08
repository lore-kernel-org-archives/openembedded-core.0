Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web09.2035.1610102351096793643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 02:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TQ6UGWCa;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id s85so5296101vsc.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Jan 2021 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OyfRg5Udeqjs7dm5kwQv6xMFY00W1j/19hxfx8feqUs=;
        b=TQ6UGWCaANW8UzoFANYoAxTqIS/7JukFkhIAASROIk54GsPfBFlRsofPa+216s6w8e
         20xfmZ3hHDprhHv7/wd4C2wpgXOfF8ju5s+rzcvIjmtJlWMVEvz+1RG8vhLdFX1tYxEi
         k++Z4Zo/qG2VX3tW6uases4ZkL9UN5bilSRlSyJ6/bmcWdiCvYYs2N6yXDwtpumJqW1e
         lAZERkUJPu0CYEfSODIf6+yXYhf1zwVzzgSg+1aJResm5VqmaCiMKpJfFPQqDuRakLi7
         sLjG/VYY8CLxfUb+W3ARw10axhx3X9O/2YKDBDWM4Nup4bQbqwFEhs59Oo+IS27JQAMb
         K5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OyfRg5Udeqjs7dm5kwQv6xMFY00W1j/19hxfx8feqUs=;
        b=FUSQfrXYa0tC/3ETyY7LZvgMkTyLjuAul35RTg2YvjuorFyZjird34kYMm11YWMCBt
         mKFeB9Tz2jBEoScvzkY0i+6ldnAMrqY8I1rVOm/RmVY7rwAIfJa0ld5P/rzzqkAMzohF
         LrTkxU5bPJkVOT2HURI+Ftkn5+2QXB4K/Ym4Ic7kt8BLT5W1OUc9kDgy2mm8iziMRxXC
         MtZ5YsqqL72JNTCntfWr/dVTWxLB1hY8HwIZfcyqHEfK5uIF2hVV1dtCGz8cZBZ0MEge
         k1VKytwPpTgg1SesClbFxbOGA/PkxQ4Nhgq34rjZ/oB92OYnTwrO8+OlcjJCT/5pjHf2
         oxrg==
X-Gm-Message-State: AOAM530cgBNVgkLD53EJYmVukVVWeibDNdobtePQiVYztXGT0Uz9DCch
	NFbfaQGmyKRVMNYUfKU2+vfqqxWuxleQOpf6voE=
X-Google-Smtp-Source: ABdhPJyDs92EkOHbudh/kdXMiw+UQtp8YIiH55AyVipBGZ0K8ZGSYXcdNBNAI9Dow5J0erCsNO26gbMwCHrTW02gDUE=
X-Received: by 2002:a67:af19:: with SMTP id v25mr2099057vsl.41.1610102350176;
 Fri, 08 Jan 2021 02:39:10 -0800 (PST)
MIME-Version: 1.0
References: <1610072945-7114-1-git-send-email-wangmy@cn.fujitsu.com> <AM0PR10MB39713697D8C50860BAD4745892AE0@AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM0PR10MB39713697D8C50860BAD4745892AE0@AM0PR10MB3971.EURPRD10.PROD.OUTLOOK.COM>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 8 Jan 2021 11:38:58 +0100
Message-ID: <CANNYZj9oYpphbo4NfqyHwN-aLY_zDGuRwWd82X4JhgQN58QTDw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: upgrade 1.32.0 ->1.33.0
To: Andrej Valek <andrej.valek@siemens.com>
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a266a005b8612a38"

--000000000000a266a005b8612a38
Content-Type: text/plain; charset="UTF-8"

Or wait for 1.33.1. Maybe UPSTREAM_CHECK_REGEX should be set up to exclude
x.y.0 versions.

Alex

On Fri, 8 Jan 2021 at 07:43, Andrej Valek <andrej.valek@siemens.com> wrote:

> Hello,
> Do we have to continue with unstable version? Isn't the stable version
> (1.32.1) a better choice?
>
> Cheers,
> Andrej
>
> > 0001-hwclock-make-glibc-2.31-compatible.patch
> > removed sincie it is not available in 1.33.0
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  ...1-hwclock-make-glibc-2.31-compatible.patch | 83 -------------------
> .../{busybox_1.32.0.bb => busybox_1.33.0.bb}  |  5 +-
> >  2 files changed, 2 insertions(+), 86 deletions(-)  delete mode 100644
> meta/recipes-core/busybox/busybox/0001-hwclock->
> make-glibc-2.31-compatible.patch
> >  rename meta/recipes-core/busybox/{busybox_1.32.0.bb =>
> busybox_1.33.0.bb} (90%)
> >
> > diff --git
> a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
> b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
> > deleted file mode 100644
> > index 8d1f272120..0000000000
> > ---
> a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
> > +++ /dev/null
> > @@ -1,83 +0,0 @@
> > -From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001
> > -From: Sakib Sajal <sakib.sajal@windriver.com>
> > -Date: Fri, 17 Jul 2020 17:27:21 +0000
> > -Subject: [PATCH] hwclock: make glibc 2.31 compatible
> > -
> > -NEWS for glibc version 2.31
> > -===========================
> > -
> > -Deprecated and removed features, and other changes affecting
> compatibility:
> > -
> > -* The settimeofday function can still be used to set a system-wide
> > -  time zone when the operating system supports it.  This is because
> > -  the Linux kernel reused the API, on some architectures, to describe
> > -  a system-wide time-zone-like offset between the software clock
> > -  maintained by the kernel, and the "RTC" clock that keeps time when
> > -  the system is shut down.
> > -
> > -  However, to reduce the odds of this offset being set by accident,
> > -  settimeofday can no longer be used to set the time and the offset
> > -  simultaneously.  If both of its two arguments are non-null, the call
> > -  will fail (setting errno to EINVAL).
> > -
> > -  Callers attempting to set this offset should also be prepared for
> > -  the call to fail and set errno to ENOSYS; this already happens on
> > -  the Hurd and on some Linux architectures.  The Linux kernel
> > -  maintainers are discussing a more principled replacement for the
> > -  reused API.  After a replacement becomes available, we will change
> > -  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
> > -  argument is not a null pointer.
> > -
> > -  settimeofday itself is obsolescent according to POSIX.  Programs
> > -  that set the system time should use clock_settime and/or the adjtime
> > -  family of functions instead.  We may cease to make settimeofday
> > -  available to newly linked binaries after there is a replacement for
> > -  Linux's time-zone-like offset API.
> > -
> > -hwclock had two calls to settimeofday, in functions to_sys_clock and
> -set_system_clock_timezone, where both the arguments to settimeofday -were
> valid (non-null).
> > -Therefore, split the call, once for timezone and once for timeval.
> > -
> > -Fixes #12756
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > ----
> > - util-linux/hwclock.c | 12 ++++++++----
> > - 1 file changed, 8 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c -index
> dc97d8f..cf346e8 100644
> > ---- a/util-linux/hwclock.c
> > -+++ b/util-linux/hwclock.c
> > -@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname,
> int utc)
> > -
> > -     tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
> > -     tv.tv_usec = 0;
> > --    if (settimeofday(&tv, &tz))
> > --            bb_simple_perror_msg_and_die("settimeofday");
> > -+    if (settimeofday(NULL, &tz))
> > -+            bb_simple_perror_msg_and_die("settimeofday: timezone");
> > -+    if (settimeofday(&tv, NULL))
> > -+            bb_simple_perror_msg_and_die("settimeofday: timeval");
> > - }
> > -
> > - static void from_sys_clock(const char **pp_rtcname, int utc) -@@
> -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)
> > -     gettimeofday(&tv, NULL);
> > -     if (!utc)
> > -             tv.tv_sec += tz.tz_minuteswest * 60;
> > --    if (settimeofday(&tv, &tz))
> > --            bb_simple_perror_msg_and_die("settimeofday");
> > -+    if (settimeofday(NULL, &tz))
> > -+            bb_simple_perror_msg_and_die("settimeofday: timezone");
> > -+    if (settimeofday(&tv, NULL))
> > -+            bb_simple_perror_msg_and_die("settimeofday: timeval");
> > - }
> > -
> > - //usage:#define hwclock_trivial_usage
> > ---
> > -2.24.1
> > -
> > diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb
> b/meta/recipes-core/busybox/busybox_1.33.0.bb
> > similarity index 90%
> > rename from meta/recipes-core/busybox/busybox_1.32.0.bb
> > rename to meta/recipes-core/busybox/busybox_1.33.0.bb
> > index 3a669444dd..ec8f350955 100644
> > --- a/meta/recipes-core/busybox/busybox_1.32.0.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
> > @@ -44,11 +44,10 @@ SRC_URI = "
> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> >             file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
> >
>  file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
> > -           file://0001-hwclock-make-glibc-2.31-compatible.patch \
> >             file://rev.cfg \
> >             file://pgrep.cfg \
> >  "
> >  SRC_URI_append_libc-musl = " file://musl.cfg "
> >
> > -SRC_URI[tarball.md5sum] = "9576986f1a960da471d03b72a62f13c7"
> > -SRC_URI[tarball.sha256sum] =
> "c35d87f1d04b2b153d33c275c2632e40d388a88f19a9e71727e0bbbff51fe689"
> > +SRC_URI[tarball.md5sum] = "eb0e85d59015ddcd8d2219f42c8844ac"
> > +SRC_URI[tarball.sha256sum] =
> "d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd"
> > --
> > 2.25.1
>
>
>
>
> 
>
>

--000000000000a266a005b8612a38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Or wait for 1.33.1. Maybe UPSTREAM_CHECK_REGEX should=
 be set up to exclude x.y.0 versions.</div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, 8 Jan 2021 at 07:43, Andrej Valek &lt;<a href=3D"mailto:andrej.va=
lek@siemens.com">andrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hello,<br>
Do we have to continue with unstable version? Isn&#39;t the stable version=
 (1.32.1) a better choice?<br>
<br>
Cheers,<br>
Andrej<br>
<br>
&gt; 0001-hwclock-make-glibc-2.31-compatible.patch<br>
&gt; removed sincie it is not available in 1.33.0<br>
&gt;<br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.co=
m" target=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...1-hwclock-make-glibc-2.31-compatible.patch | 83 ------------=
-------=C2=A0 .../{<a href=3D"http://busybox_1.32.0.bb" rel=3D"noreferrer" =
target=3D"_blank">busybox_1.32.0.bb</a> =3D&gt; <a href=3D"http://busybox_1=
.33.0.bb" rel=3D"noreferrer" target=3D"_blank">busybox_1.33.0.bb</a>}=C2=A0=
 |=C2=A0 5 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 86 deletions(-)=C2=A0 delete =
mode 100644 meta/recipes-core/busybox/busybox/0001-hwclock-&gt; make-glibc-=
2.31-compatible.patch<br>
&gt;=C2=A0 rename meta/recipes-core/busybox/{<a href=3D"http://busybox_1.3=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">busybox_1.32.0.bb</a> =3D&gt; =
<a href=3D"http://busybox_1.33.0.bb" rel=3D"noreferrer" target=3D"_blank">b=
usybox_1.33.0.bb</a>} (90%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glib=
c-2.31-compatible.patch b/meta/recipes-core/busybox/busybox/0001-hwclock-ma=
ke-glibc-2.31-compatible.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 8d1f272120..0000000000<br>
&gt; --- a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-=
compatible.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,83 +0,0 @@<br>
&gt; -From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com" t=
arget=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
&gt; -Date: Fri, 17 Jul 2020 17:27:21 +0000<br>
&gt; -Subject: [PATCH] hwclock: make glibc 2.31 compatible<br>
&gt; -<br>
&gt; -NEWS for glibc version 2.31<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; -<br>
&gt; -Deprecated and removed features, and other changes affecting compati=
bility:<br>
&gt; -<br>
&gt; -* The settimeofday function can still be used to set a system-wide<b=
r>
&gt; -=C2=A0 time zone when the operating system supports it.=C2=A0 This i=
s because<br>
&gt; -=C2=A0 the Linux kernel reused the API, on some architectures, to de=
scribe<br>
&gt; -=C2=A0 a system-wide time-zone-like offset between the software cloc=
k<br>
&gt; -=C2=A0 maintained by the kernel, and the &quot;RTC&quot; clock that =
keeps time when<br>
&gt; -=C2=A0 the system is shut down.<br>
&gt; -<br>
&gt; -=C2=A0 However, to reduce the odds of this offset being set by accid=
ent,<br>
&gt; -=C2=A0 settimeofday can no longer be used to set the time and the of=
fset<br>
&gt; -=C2=A0 simultaneously.=C2=A0 If both of its two arguments are non-nu=
ll, the call<br>
&gt; -=C2=A0 will fail (setting errno to EINVAL).<br>
&gt; -<br>
&gt; -=C2=A0 Callers attempting to set this offset should also be prepared=
 for<br>
&gt; -=C2=A0 the call to fail and set errno to ENOSYS; this already happen=
s on<br>
&gt; -=C2=A0 the Hurd and on some Linux architectures.=C2=A0 The Linux ker=
nel<br>
&gt; -=C2=A0 maintainers are discussing a more principled replacement for =
the<br>
&gt; -=C2=A0 reused API.=C2=A0 After a replacement becomes available, we w=
ill change<br>
&gt; -=C2=A0 settimeofday to fail with ENOSYS on all platforms when its &#=
39;tzp&#39;<br>
&gt; -=C2=A0 argument is not a null pointer.<br>
&gt; -<br>
&gt; -=C2=A0 settimeofday itself is obsolescent according to POSIX.=C2=A0 =
Programs<br>
&gt; -=C2=A0 that set the system time should use clock_settime and/or the =
adjtime<br>
&gt; -=C2=A0 family of functions instead.=C2=A0 We may cease to make setti=
meofday<br>
&gt; -=C2=A0 available to newly linked binaries after there is a replaceme=
nt for<br>
&gt; -=C2=A0 Linux&#39;s time-zone-like offset API.<br>
&gt; -<br>
&gt; -hwclock had two calls to settimeofday, in functions to_sys_clock and=
 -set_system_clock_timezone, where both the arguments to settimeofday -were=
 valid (non-null).<br>
&gt; -Therefore, split the call, once for timezone and once for timeval.<b=
r>
&gt; -<br>
&gt; -Fixes #12756<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriv=
er.com" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - util-linux/hwclock.c | 12 ++++++++----<br>
&gt; - 1 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c -index dc97=
d8f..cf346e8 100644<br>
&gt; ---- a/util-linux/hwclock.c<br>
&gt; -+++ b/util-linux/hwclock.c<br>
&gt; -@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcnam=
e, int utc)<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0tv.tv_sec =3D read_rtc(pp_rtcname, NULL, utc);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0tv.tv_usec =3D 0;<br>
&gt; --=C2=A0 =C2=A0 if (settimeofday(&amp;tv, &amp;tz))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_and_=
die(&quot;settimeofday&quot;);<br>
&gt; -+=C2=A0 =C2=A0 if (settimeofday(NULL, &amp;tz))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_and_=
die(&quot;settimeofday: timezone&quot;);<br>
&gt; -+=C2=A0 =C2=A0 if (settimeofday(&amp;tv, NULL))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_and_=
die(&quot;settimeofday: timeval&quot;);<br>
&gt; - }<br>
&gt; -<br>
&gt; - static void from_sys_clock(const char **pp_rtcname, int utc) -@@ -2=
83,8 +285,10 @@ static void set_system_clock_timezone(int utc)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0gettimeofday(&amp;tv, NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!utc)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tv.tv_sec +=3D tz.tz=
_minuteswest * 60;<br>
&gt; --=C2=A0 =C2=A0 if (settimeofday(&amp;tv, &amp;tz))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_and_=
die(&quot;settimeofday&quot;);<br>
&gt; -+=C2=A0 =C2=A0 if (settimeofday(NULL, &amp;tz))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_and_=
die(&quot;settimeofday: timezone&quot;);<br>
&gt; -+=C2=A0 =C2=A0 if (settimeofday(&amp;tv, NULL))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_simple_perror_msg_and_=
die(&quot;settimeofday: timeval&quot;);<br>
&gt; - }<br>
&gt; -<br>
&gt; - //usage:#define hwclock_trivial_usage<br>
&gt; ---<br>
&gt; -2.24.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.32=
.0.bb" rel=3D"noreferrer" target=3D"_blank">busybox_1.32.0.bb</a> b/meta/re=
cipes-core/busybox/<a href=3D"http://busybox_1.33.0.bb" rel=3D"noreferrer" =
target=3D"_blank">busybox_1.33.0.bb</a><br>
&gt; similarity index 90%<br>
&gt; rename from meta/recipes-core/busybox/<a href=3D"http://busybox_1.32.=
0.bb" rel=3D"noreferrer" target=3D"_blank">busybox_1.32.0.bb</a><br>
&gt; rename to meta/recipes-core/busybox/<a href=3D"http://busybox_1.33.0.=
bb" rel=3D"noreferrer" target=3D"_blank">busybox_1.33.0.bb</a><br>
&gt; index 3a669444dd..ec8f350955 100644<br>
&gt; --- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.32.0.bb" =
rel=3D"noreferrer" target=3D"_blank">busybox_1.32.0.bb</a><br>
&gt; +++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.33.0.bb" =
rel=3D"noreferrer" target=3D"_blank">busybox_1.33.0.bb</a><br>
&gt; @@ -44,11 +44,10 @@ SRC_URI =3D &quot;<a href=3D"https://busybox.net/=
downloads/busybox-$%7BPV%7D.tar.bz2;name=3Dtarball" rel=3D"noreferrer" targ=
et=3D"_blank">https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dta=
rball</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-du-l-works=
-fix-to-use-145-instead-of-144.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-sysctl-ign=
ore-EIO-of-stable_secret-below-proc-sys-ne.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-hwclock-make-gl=
ibc-2.31-compatible.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rev.cfg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pgrep.cfg \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI_append_libc-musl =3D &quot; file://musl.cfg &quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[tarball.md5sum] =3D &quot;9576986f1a960da471d03b72a62f13c7&q=
uot;<br>
&gt; -SRC_URI[tarball.sha256sum] =3D &quot;c35d87f1d04b2b153d33c275c2632e4=
0d388a88f19a9e71727e0bbbff51fe689&quot;<br>
&gt; +SRC_URI[tarball.md5sum] =3D &quot;eb0e85d59015ddcd8d2219f42c8844ac&q=
uot;<br>
&gt; +SRC_URI[tarball.sha256sum] =3D &quot;d568681c91a85edc6710770cebc1e80=
e042ad74d305b5c2e6d57a5f3de3b8fbd&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a266a005b8612a38--
