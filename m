Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web12.4513.1614853330177369529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 02:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RA0J8jzd;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id l192so14279927vsd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 02:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvLq7gFqjtdhpdtu6FyB7ciNVPnKJB4S/oMvIRWcDh4=;
        b=RA0J8jzdASIs5dl6PzXpQ1u+Q23jL1WZDtM5Ch2Iggs7RF1VVAk+KRyWj0HyGMV8KJ
         GR2jouzWrCKmpJXDjuyikLl0kk6+FLddrqfMK+36tdUpTmfkF9Hg2f+2yZEmcnZiIsQu
         mloxD/F4W12pjnfvTfjNClgcp3oIcJqpqeMXSWg1wIMvlEvYz3y157yPivWoQP0Oqjgy
         1NATqZF09Aw9MjMHtmsvQwSIz6dSIt7FKeCWe5J18oHV4gUkgo7GvV2iNQTHszcCJxxq
         A10+hVpSPx8y0RQKLSldFQLbMMRugt6Xb6YCAHIMe5wzf+EmqvTiMk9eT2P4xbudVbox
         pPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvLq7gFqjtdhpdtu6FyB7ciNVPnKJB4S/oMvIRWcDh4=;
        b=dpisZl5pU9pxdYhxhQc/XVOCHKGC2ppEIyMvVjI9KU7avTvz6HKgfOOvuDy43dOgXh
         3No2QKKkDESxIJ8idXrDBITnCJf9pbIsd+5NVqDxlUVwXuBuvCH/Rj3VDxJerggm9T84
         nK54JXtxfR2ayfrWixjgI6GcX6zLLupBPpFvwXInAuqJMh3Bfs4NpOMpU5O/PxWJikP+
         TlRNeXA0dyQsnF02fVgt5BIDwyqmo8pPkVKRQlQES+2om76jJoTu1NitzbNYy9hhFnCj
         5nfUaJ2IDQYk5rauRHEkgG6J49krUueRpi4/C/pJM54KDptbmXtZvSxhnqRHhYX/+pSA
         8JOg==
X-Gm-Message-State: AOAM530JAe/6dSf9cWD1bp6t310cGF/8P3psanc5GaMXiIlnErYSyN0a
	blwdFesKPTND15CM28mEi9KRlZmTLHhibm53s68=
X-Google-Smtp-Source: ABdhPJzMI9WRUvc0Mn5jvDwkjmqtuA3J5Yc7NQd+vbxcyYdo7+QffNsDxrJVAfl7yd8/sbDC6ZGQ4kOCz/uIk/rMjmo=
X-Received: by 2002:a05:6102:902:: with SMTP id x2mr2061547vsh.31.1614853329196;
 Thu, 04 Mar 2021 02:22:09 -0800 (PST)
MIME-Version: 1.0
References: <1614852025-42153-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1614852025-42153-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 4 Mar 2021 11:21:57 +0100
Message-ID: <CANNYZj9qu+LBrzYdo9cy5ifQ-K_XSu+sN1AG1emUmUU3z74t7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] procps: upgrade 3.3.16 -> 3.3.17
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000d1cb405bcb357f1"

--0000000000000d1cb405bcb357f1
Content-Type: text/plain; charset="UTF-8"

Thanks, I already sent the same version update earlier and it is being
tested in master-next. When you add a custom patch, remember to add
Upstream-Status, and for issues like musl compatibility, submit it upstream.

Alex

On Thu, 4 Mar 2021 at 11:00, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> Add patch to fix bug of compile under musl:
> 0001-Fix-compile-bug-of-musl.patch
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../procps/0001-Fix-compile-bug-of-musl.patch | 52 +++++++++++++++++++
>  .../{procps_3.3.16.bb => procps_3.3.17.bb}    |  5 +-
>  2 files changed, 55 insertions(+), 2 deletions(-)
>  create mode 100644
> meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-musl.patch
>  rename meta/recipes-extended/procps/{procps_3.3.16.bb => procps_3.3.17.bb}
> (95%)
>
> diff --git
> a/meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-musl.patch
> b/meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-musl.patch
> new file mode 100644
> index 0000000000..98186c7d78
> --- /dev/null
> +++
> b/meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-musl.patch
> @@ -0,0 +1,52 @@
> +From 4ceaef8b624042d510492864cb5ee0179452312b Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@cn.fujitsu.com>
> +Date: Thu, 4 Mar 2021 17:16:03 +0900
> +Subject: [PATCH] Fix compile bug of musl
> +
> +It solves the problem that the variable definition cannot be found
> because the header file cannot be included under musl
> +
> +Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> +---
> + proc/escape.c |  2 +-
> + w.c           | 12 ++++++++----
> + 2 files changed, 9 insertions(+), 5 deletions(-)
> +
> +diff --git a/proc/escape.c b/proc/escape.c
> +index 2e8fb7d..21ccdc6 100644
> +--- a/proc/escape.c
> ++++ b/proc/escape.c
> +@@ -25,7 +25,7 @@
> + #include "escape.h"
> + #include "readproc.h"
> +
> +-#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) ||
> defined(__UCLIBC_HAS_WCHAR__))
> ++#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) ||
> defined(__UCLIBC_HAS_WCHAR__)) || (DEFAULT_LIBC == LIBC_UCLIBC)
> + # include <wchar.h>
> + # include <wctype.h>
> + # include <stdlib.h>  /* MB_CUR_MAX */
> +diff --git a/w.c b/w.c
> +index 9d07ac9..722b612 100644
> +--- a/w.c
> ++++ b/w.c
> +@@ -56,10 +56,14 @@
> + #include <time.h>
> + #include <unistd.h>
> + #ifdef HAVE_UTMPX_H
> +-#     include <utmpx.h>
> +-#else
> +-#     include <utmp.h>
> +-#endif
> ++#  if HAVE_UTMP_H
> ++   /* needs utmp.h, for the definition of e.g., UT_HOSTSIZE.  */
> ++#   include <utmp.h>
> ++#  endif
> ++#  include <utmpx.h>
> ++#elif HAVE_UTMP_H
> ++#  include <utmp.h>
> ++#endif
> + #include <arpa/inet.h>
> +
> + static int ignoreuser = 0;    /* for '-u' */
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb
> b/meta/recipes-extended/procps/procps_3.3.17.bb
> similarity index 95%
> rename from meta/recipes-extended/procps/procps_3.3.16.bb
> rename to meta/recipes-extended/procps/procps_3.3.17.bb
> index ef3ac86e97..c1d3fee4d2 100644
> --- a/meta/recipes-extended/procps/procps_3.3.16.bb
> +++ b/meta/recipes-extended/procps/procps_3.3.17.bb
> @@ -14,8 +14,9 @@ inherit autotools gettext pkgconfig update-alternatives
>
>  SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
>             file://sysctl.conf \
> +           file://0001-Fix-compile-bug-of-musl.patch \
>             "
> -SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
> +SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
>
>  S = "${WORKDIR}/git"
>
> @@ -98,4 +99,4 @@ ALTERNATIVE_LINK_NAME[ps] = "${base_bindir}/ps"
>
>  ALTERNATIVE_${PN}-sysctl = "sysctl"
>  ALTERNATIVE_TARGET[sysctl] = "${base_sbindir}/sysctl"
> -ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
> \ No newline at end of file
> +ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
> --
> 2.25.1
>
>
> 
>
>

--0000000000000d1cb405bcb357f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I already sent the same version update earlie=
r and it is being tested in master-next. When you add a custom patch, remem=
ber to add Upstream-Status, and for issues like musl compatibility, submit =
it upstream.</div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 4 Mar 2021 at 1=
1:00, Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com">wangmy@cn.fu=
jitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Add patch to fix bug of compile under musl:<br>
0001-Fix-compile-bug-of-musl.patch<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" ta=
rget=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../procps/0001-Fix-compile-bug-of-musl.patch | 52 +++++++++++++++++=
++<br>
=C2=A0.../{<a href=3D"http://procps_3.3.16.bb" rel=3D"noreferrer" target=
=3D"_blank">procps_3.3.16.bb</a> =3D&gt; <a href=3D"http://procps_3.3.17.b=
b" rel=3D"noreferrer" target=3D"_blank">procps_3.3.17.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 5 +-<br>
=C2=A02 files changed, 55 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/procps/procps/0001-Fix-comp=
ile-bug-of-musl.patch<br>
=C2=A0rename meta/recipes-extended/procps/{<a href=3D"http://procps_3.3.16=
.bb" rel=3D"noreferrer" target=3D"_blank">procps_3.3.16.bb</a> =3D&gt; <a h=
ref=3D"http://procps_3.3.17.bb" rel=3D"noreferrer" target=3D"_blank">procps=
_3.3.17.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-m=
usl.patch b/meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-mus=
l.patch<br>
new file mode 100644<br>
index 0000000000..98186c7d78<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-musl.pat=
ch<br>
@@ -0,0 +1,52 @@<br>
+From 4ceaef8b624042d510492864cb5ee0179452312b Mon Sep 17 00:00:00 2001<br=
>
+From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" target=3D"=
_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
+Date: Thu, 4 Mar 2021 17:16:03 +0900<br>
+Subject: [PATCH] Fix compile bug of musl<br>
+<br>
+It solves the problem that the variable definition cannot be found becaus=
e the header file cannot be included under musl<br>
+<br>
+Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" t=
arget=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
+---<br>
+ proc/escape.c |=C2=A0 2 +-<br>
+ w.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++----<br>
+ 2 files changed, 9 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/proc/escape.c b/proc/escape.c<br>
+index 2e8fb7d..21ccdc6 100644<br>
+--- a/proc/escape.c<br>
++++ b/proc/escape.c<br>
+@@ -25,7 +25,7 @@<br>
+ #include &quot;escape.h&quot;<br>
+ #include &quot;readproc.h&quot;<br>
+ <br>
+-#if (__GNU_LIBRARY__ &gt;=3D 6) &amp;&amp; (!defined(__UCLIBC__) || defi=
ned(__UCLIBC_HAS_WCHAR__))<br>
++#if (__GNU_LIBRARY__ &gt;=3D 6) &amp;&amp; (!defined(__UCLIBC__) || defi=
ned(__UCLIBC_HAS_WCHAR__)) || (DEFAULT_LIBC =3D=3D LIBC_UCLIBC)<br>
+ # include &lt;wchar.h&gt;<br>
+ # include &lt;wctype.h&gt;<br>
+ # include &lt;stdlib.h&gt;=C2=A0 /* MB_CUR_MAX */<br>
+diff --git a/w.c b/w.c<br>
+index 9d07ac9..722b612 100644<br>
+--- a/w.c<br>
++++ b/w.c<br>
+@@ -56,10 +56,14 @@<br>
+ #include &lt;time.h&gt;<br>
+ #include &lt;unistd.h&gt;<br>
+ #ifdef HAVE_UTMPX_H<br>
+-#=C2=A0 =C2=A0 =C2=A0include &lt;utmpx.h&gt;<br>
+-#else<br>
+-#=C2=A0 =C2=A0 =C2=A0include &lt;utmp.h&gt;<br>
+-#endif<br>
++#=C2=A0 if HAVE_UTMP_H<br>
++=C2=A0 =C2=A0/* needs utmp.h, for the definition of e.g., UT_HOSTSIZE.=
=C2=A0 */<br>
++#=C2=A0 =C2=A0include &lt;utmp.h&gt;<br>
++#=C2=A0 endif<br>
++#=C2=A0 include &lt;utmpx.h&gt;<br>
++#elif HAVE_UTMP_H<br>
++#=C2=A0 include &lt;utmp.h&gt;<br>
++#endif<br>
+ #include &lt;arpa/inet.h&gt;<br>
+ <br>
+ static int ignoreuser =3D 0;=C2=A0 =C2=A0 /* for &#39;-u&#39; */<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-extended/procps/<a href=3D"http://procps_3.3.16.=
bb" rel=3D"noreferrer" target=3D"_blank">procps_3.3.16.bb</a> b/meta/recipe=
s-extended/procps/<a href=3D"http://procps_3.3.17.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">procps_3.3.17.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-extended/procps/<a href=3D"http://procps_3.3.16.b=
b" rel=3D"noreferrer" target=3D"_blank">procps_3.3.16.bb</a><br>
rename to meta/recipes-extended/procps/<a href=3D"http://procps_3.3.17.bb"=
 rel=3D"noreferrer" target=3D"_blank">procps_3.3.17.bb</a><br>
index ef3ac86e97..c1d3fee4d2 100644<br>
--- a/meta/recipes-extended/procps/<a href=3D"http://procps_3.3.16.bb" rel=
=
=3D"noreferrer" target=3D"_blank">procps_3.3.16.bb</a><br>
+++ b/meta/recipes-extended/procps/<a href=3D"http://procps_3.3.17.bb" rel=
=
=3D"noreferrer" target=3D"_blank">procps_3.3.17.bb</a><br>
@@ -14,8 +14,9 @@ inherit autotools gettext pkgconfig update-alternatives<=
br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/procps-ng/procp=
s.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab.com/pro=
cps-ng/procps.git;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sysctl.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-compile-bug-of-m=
usl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;59c88e18f29000ceaf7e5f98181b07be443cf12f&quot;<br>
+SRCREV =3D &quot;19a508ea121c0c4ac6d0224575a036de745eaaf8&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
@@ -98,4 +99,4 @@ ALTERNATIVE_LINK_NAME[ps] =3D &quot;${base_bindir}/ps&qu=
ot;<br>
<br>
=C2=A0ALTERNATIVE_${PN}-sysctl =3D &quot;sysctl&quot;<br>
=C2=A0ALTERNATIVE_TARGET[sysctl] =3D &quot;${base_sbindir}/sysctl&quot;<br=
>
-ALTERNATIVE_LINK_NAME[sysctl] =3D &quot;${base_sbindir}/sysctl&quot;<br>
\ No newline at end of file<br>
+ALTERNATIVE_LINK_NAME[sysctl] =3D &quot;${base_sbindir}/sysctl&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000000d1cb405bcb357f1--
