Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.70659.1600116371997285746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 13:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d+4G9s8v;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id p9so1885177ejf.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TGeeE4uUn5oKw8Fl/Y8VM2aeQvuLAgAlhNf7efiQU7c=;
        b=d+4G9s8vHEn3RPCXvieZ0maP+usCTfKUjYwtqkCfn/39GKWmKGji8Vx+scOccqkTyY
         Ld6WdIxfyGNUBEg90M9ceMYSmt30trCWLstluKdwN/fmbawYBtcYZxxbOtTfhDNM6YG7
         aQSk4Z/4x3tl/2N5Vch49bSAhlD/bB51OS/YBpf9SeWSp4xfd+Mzj6t2ZELf7OzDI2hf
         Th2vEw1kJIBvLgpyJyR0H5YOC27Qmfxiu2NymPgKfmW2L3vvnZ0HFAhQn5VFDq56PnJ8
         kDw2qxb9A8Av3Un3NsXmjshkBRrIMa7v/MNhQ4O6gd1RmAnTofvnkw1OM3FG8ZfAAVDW
         AnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TGeeE4uUn5oKw8Fl/Y8VM2aeQvuLAgAlhNf7efiQU7c=;
        b=sSDNVfblEsYOF6AJHBLyCRBm3cF0k6JfPWku+72bK7oK1nJcTUDns7jFeoSi6a6wd7
         E4ZOqo5QF/8k/R+8sD/cTHdai3Lo5JVWl6HSIj4dJEuKcH+8VaJZSoYEv5r2M3Q0gPJY
         OLO1nR89PykTO69QOdvX8ztV4NjChrIuMaSFkMTH+YrDJ3EQngHiEe6DEpDP3l8EEx9i
         XvpYiZF/r5qomt9ryG6sO1oAvFCv8gUKrdPXOmKaZ5LM31t0M4BDOi2itHqo87fhtZ6c
         b9m2nuC35ztWjUlPFEWv0VlidjTr6S8mUjaP6HYQjVUIb2+lEtOV1ddPLWSzIYahiAJ6
         lVgA==
X-Gm-Message-State: AOAM5331ew6iIf1trPdBQLVljqDXEeXewzpqZMwhz3IdflGgDYDWNvDh
	zG7C9oq974Tiw9cdRpR4u0ea4erfUNZs4D8cgM4=
X-Google-Smtp-Source: ABdhPJwZSTfqS75b8H4dsAMXqjKwXQGhihbwyh3kOlZ7Pq6JSUYKljlWTh1ys48spXLSm9FEPZhR+YNg9eR7H6kIczw=
X-Received: by 2002:a17:906:4a81:: with SMTP id x1mr12651076eju.541.1600116370368;
 Mon, 14 Sep 2020 13:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200914075222.22226-1-sno@NetBSD.org> <CADkTA4PZBd-1O8tNPzFSj=2sD9o8z3kWDrP=vXM4d8rWSM+tnw@mail.gmail.com>
In-Reply-To: <CADkTA4PZBd-1O8tNPzFSj=2sD9o8z3kWDrP=vXM4d8rWSM+tnw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 14 Sep 2020 22:45:59 +0200
Message-ID: <CA+chaQeDVYaXeeZgxvbk60R4Ewq2SOpsf565=wOQrLpxL4Z19w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] lttng-modules: backport patch to fix build for linux-5.4.62+
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jens Rehsack <rehsack@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jens Rehsack <sno@netbsd.org>
Content-Type: multipart/alternative; boundary="000000000000daedba05af4c1f64"

--000000000000daedba05af4c1f64
Content-Type: text/plain; charset="UTF-8"

Is this exact backport from lttng-modules repo?

I came across this issue in
https://github.com/agherzan/meta-raspberrypi/pull/722
and
https://github.com/lttng/lttng-modules/commit/817e02f9e256b8f2cbb9e3125eb061757b83bd4a
+
https://github.com/lttng/lttng-modules/commit/b6af46d166c48c9e59600a60b5a2a7ead10f179a
look a bit different than this one (and are more correct with fixed kernel
ranges as not every > 5.4.62 kernel had this change).

On Mon, Sep 14, 2020 at 10:11 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> In my latest round of linux-yocto reference updates, I ran into these
> same issues, but I needed to pull in more of the fixes on the 2.12
> branch than just this to get things building against 5.8.9.
>
> I didn't need to tweak any of the patches for v5.4.64+ here.
>
> I have 10 backported patches and confirmed my 5.8.9 and 5.4.65 both
> build with the changes.
>
> I can submit that patch along with my reference kernel bumps later today.
>
> Bruce
>
>
> On Mon, Sep 14, 2020 at 3:52 AM Jens Rehsack <rehsack@gmail.com> wrote:
> >
> > From: Jens Rehsack <sno@netbsd.org>
> >
> > Backport patch from lttng-modules/stable-2.12
> >     87b2aff fix: writeback: Fix sync livelock due to b_dirty_time
> processing (v5.9)
> >
> > with minor modfication to catch
> >     6623c19042b6 writeback: Fix sync livelock due to b_dirty_time
> processing
> >
> > from linux/stable-5.4 v5.4.62+
> >
> > Signed-off-by: Jens Rehsack <sno@netbsd.org>
> > ---
> >  ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 ++++++++++++++++++
> >  .../lttng/lttng-modules_2.12.2.bb             |   1 +
> >  2 files changed, 118 insertions(+)
> >  create mode 100644
> meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
> >
> > diff --git
> a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
> b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
> > new file mode 100644
> > index 0000000000..96a1c486ef
> > --- /dev/null
> > +++
> b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
> > @@ -0,0 +1,117 @@
> > +From 87b2affc3eb06f3fb2d0923f18af37713eb6814b Mon Sep 17 00:00:00 2001
> > +From: Michael Jeanson <mjeanson@efficios.com>
> > +Date: Mon, 31 Aug 2020 14:16:01 -0400
> > +Subject: [PATCH] fix: writeback: Fix sync livelock due to b_dirty_time
> > + processing (v5.9)
> > +
> > +See upstream commit:
> > +
> > +  commit f9cae926f35e8230330f28c7b743ad088611a8de
> > +  Author: Jan Kara <jack@suse.cz>
> > +  Date:   Fri May 29 16:08:58 2020 +0200
> > +
> > +    writeback: Fix sync livelock due to b_dirty_time processing
> > +
> > +    When we are processing writeback for sync(2), move_expired_inodes()
> > +    didn't set any inode expiry value (older_than_this). This can
> result in
> > +    writeback never completing if there's steady stream of inodes added
> to
> > +    b_dirty_time list as writeback rechecks dirty lists after each
> writeback
> > +    round whether there's more work to be done. Fix the problem by using
> > +    sync(2) start time is inode expiry value when processing
> b_dirty_time
> > +    list similarly as for ordinarily dirtied inodes. This requires some
> > +    refactoring of older_than_this handling which simplifies the code
> > +    noticeably as a bonus.
> > +
> > +Change-Id: I8b894b13ccc14d9b8983ee4c2810a927c319560b
> > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > +---
> > + .../events/lttng-module/writeback.h           | 39 ++++++++++++-------
> > + 1 file changed, 26 insertions(+), 13 deletions(-)
> > +
> > +Upstream Status: Backport
> > +
> > +diff --git a/instrumentation/events/lttng-module/writeback.h
> b/instrumentation/events/lttng-module/writeback.h
> > +index ece67ad..e9018dd 100644
> > +--- a/instrumentation/events/lttng-module/writeback.h
> > ++++ b/instrumentation/events/lttng-module/writeback.h
> > +@@ -384,34 +384,48 @@
> LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_balance_dirty_wait,
> writeback_wbc_balanc
> > + #endif
> > + LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage,
> writeback_wbc_writepage)
> > +
> > +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
> > ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,9,0)) ||
> (LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,62))
> > ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> > ++      TP_PROTO(struct bdi_writeback *wb,
> > ++               struct wb_writeback_work *work,
> > ++               unsigned long dirtied_before,
> > ++               int moved),
> > ++      TP_ARGS(wb, work, dirtied_before, moved),
> > ++      TP_FIELDS(
> > ++              ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
> > ++              ctf_integer(unsigned long, older, dirtied_before)
> > ++              ctf_integer(int, moved, moved)
> > ++      )
> > ++)
> > ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> > + LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> > +       TP_PROTO(struct bdi_writeback *wb,
> > +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> > +                struct wb_writeback_work *work,
> > +-#else
> > +-               unsigned long *older_than_this,
> > +-#endif
> > +                int moved),
> > +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> > +       TP_ARGS(wb, work, moved),
> > +-#else
> > ++      TP_FIELDS(
> > ++              ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
> > ++              ctf_integer(int, moved, moved)
> > ++      )
> > ++)
> > ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
> > ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> > ++      TP_PROTO(struct bdi_writeback *wb,
> > ++               unsigned long *older_than_this,
> > ++               int moved),
> > +       TP_ARGS(wb, older_than_this, moved),
> > +-#endif
> > +       TP_FIELDS(
> > +               ctf_array_text(char, name, dev_name(wb->bdi->dev), 32)
> > +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> > +-#else
> > +               ctf_integer(unsigned long, older,
> > +                       older_than_this ? *older_than_this : 0)
> > +               ctf_integer(long, age,
> > +                       older_than_this ?
> > +                               (jiffies - *older_than_this) * 1000 / HZ
> > +                               : -1)
> > +-#endif
> > +               ctf_integer(int, moved, moved)
> > +       )
> > + )
> > ++#endif
> > +
> > + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,8,0))
> > + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> > +@@ -460,7 +474,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> > +               ctf_integer(unsigned long, dirty_limit,
> global_dirty_limit)
> > +       )
> > + )
> > +-#else
> > ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0))
> > + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> > +
> > +       writeback_global_dirty_state,
> > +@@ -485,7 +499,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> > +       )
> > + )
> > + #endif
> > +-#endif
> > +
> > + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> > index 0e1a209ce8..f58b3bf0d7 100644
> > --- a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> > @@ -10,6 +10,7 @@ include lttng-platforms.inc
> >
> >  SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> >
>  file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
> > +
>  file://0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch \
> >             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> >             "
> >
> > --
> > 2.17.1
> >
> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
>

--000000000000daedba05af4c1f64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this exact backport from lttng-modules repo?<div><br></=
div><div>I came across this issue in=C2=A0<a href=3D"https://github.com/agh=
erzan/meta-raspberrypi/pull/722">https://github.com/agherzan/meta-raspberry=
pi/pull/722</a></div><div>and</div><div><a href=3D"https://github.com/lttng=
/lttng-modules/commit/817e02f9e256b8f2cbb9e3125eb061757b83bd4a">https://git=
hub.com/lttng/lttng-modules/commit/817e02f9e256b8f2cbb9e3125eb061757b83bd4a=
</a><br></div><div>+<br></div><div><a href=3D"https://github.com/lttng/lttn=
g-modules/commit/b6af46d166c48c9e59600a60b5a2a7ead10f179a">https://github.c=
om/lttng/lttng-modules/commit/b6af46d166c48c9e59600a60b5a2a7ead10f179a</a><=
br></div><div>look a bit different than this one (and are more correct with=
 fixed kernel ranges as not every &gt; 5.4.62 kernel had this change).</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, Sep 14, 2020 at 10:11 PM Bruce Ashfield &lt;<a href=3D"mailto:bruc=
e.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">In my latest round of linux-y=
octo reference updates, I ran into these<br>
same issues, but I needed to pull in more of the fixes on the 2.12<br>
branch than just this to get things building against 5.8.9.<br>
<br>
I didn&#39;t need to tweak any of the patches for v5.4.64+ here.<br>
<br>
I have 10 backported patches and confirmed my 5.8.9 and 5.4.65 both<br>
build with the changes.<br>
<br>
I can submit that patch along with my reference kernel bumps later today.<=
br>
<br>
Bruce<br>
<br>
<br>
On Mon, Sep 14, 2020 at 3:52 AM Jens Rehsack &lt;<a href=3D"mailto:rehsack=
@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Jens Rehsack &lt;<a href=3D"mailto:sno@netbsd.org" target=3D"_b=
lank">sno@netbsd.org</a>&gt;<br>
&gt;<br>
&gt; Backport patch from lttng-modules/stable-2.12<br>
&gt;=C2=A0 =C2=A0 =C2=A087b2aff fix: writeback: Fix sync livelock due to b=
_dirty_time processing (v5.9)<br>
&gt;<br>
&gt; with minor modfication to catch<br>
&gt;=C2=A0 =C2=A0 =C2=A06623c19042b6 writeback: Fix sync livelock due to b=
_dirty_time processing<br>
&gt;<br>
&gt; from linux/stable-5.4 v5.4.62+<br>
&gt;<br>
&gt; Signed-off-by: Jens Rehsack &lt;<a href=3D"mailto:sno@netbsd.org" tar=
get=3D"_blank">sno@netbsd.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 +++++++++++=
+++++++<br>
&gt;=C2=A0 .../lttng/<a href=3D"http://lttng-modules_2.12.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">lttng-modules_2.12.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 118 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001=
-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeba=
ck-Fix-sync-livelock-due-to-b_dirty_time-.patch b/meta/recipes-kernel/lttng=
/lttng-modules/0001-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.pa=
tch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..96a1c486ef<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-writeback-Fix-=
sync-livelock-due-to-b_dirty_time-.patch<br>
&gt; @@ -0,0 +1,117 @@<br>
&gt; +From 87b2affc3eb06f3fb2d0923f18af37713eb6814b Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@efficios.com" t=
arget=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
&gt; +Date: Mon, 31 Aug 2020 14:16:01 -0400<br>
&gt; +Subject: [PATCH] fix: writeback: Fix sync livelock due to b_dirty_ti=
me<br>
&gt; + processing (v5.9)<br>
&gt; +<br>
&gt; +See upstream commit:<br>
&gt; +<br>
&gt; +=C2=A0 commit f9cae926f35e8230330f28c7b743ad088611a8de<br>
&gt; +=C2=A0 Author: Jan Kara &lt;<a href=3D"mailto:jack@suse.cz" target=
=3D"_blank">jack@suse.cz</a>&gt;<br>
&gt; +=C2=A0 Date:=C2=A0 =C2=A0Fri May 29 16:08:58 2020 +0200<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 writeback: Fix sync livelock due to b_dirty_time proce=
ssing<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 When we are processing writeback for sync(2), move_exp=
ired_inodes()<br>
&gt; +=C2=A0 =C2=A0 didn&#39;t set any inode expiry value (older_than_this=
). This can result in<br>
&gt; +=C2=A0 =C2=A0 writeback never completing if there&#39;s steady strea=
m of inodes added to<br>
&gt; +=C2=A0 =C2=A0 b_dirty_time list as writeback rechecks dirty lists af=
ter each writeback<br>
&gt; +=C2=A0 =C2=A0 round whether there&#39;s more work to be done. Fix th=
e problem by using<br>
&gt; +=C2=A0 =C2=A0 sync(2) start time is inode expiry value when processi=
ng b_dirty_time<br>
&gt; +=C2=A0 =C2=A0 list similarly as for ordinarily dirtied inodes. This =
requires some<br>
&gt; +=C2=A0 =C2=A0 refactoring of older_than_this handling which simplifi=
es the code<br>
&gt; +=C2=A0 =C2=A0 noticeably as a bonus.<br>
&gt; +<br>
&gt; +Change-Id: I8b894b13ccc14d9b8983ee4c2810a927c319560b<br>
&gt; +Signed-off-by: Michael Jeanson &lt;<a href=3D"mailto:mjeanson@effici=
os.com" target=3D"_blank">mjeanson@efficios.com</a>&gt;<br>
&gt; +Signed-off-by: Mathieu Desnoyers &lt;<a href=3D"mailto:mathieu.desno=
yers@efficios.com" target=3D"_blank">mathieu.desnoyers@efficios.com</a>&gt;=
<br>
&gt; +---<br>
&gt; + .../events/lttng-module/writeback.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 39 ++++++++++++-------<br>
&gt; + 1 file changed, 26 insertions(+), 13 deletions(-)<br>
&gt; +<br>
&gt; +Upstream Status: Backport<br>
&gt; +<br>
&gt; +diff --git a/instrumentation/events/lttng-module/writeback.h b/instr=
umentation/events/lttng-module/writeback.h<br>
&gt; +index ece67ad..e9018dd 100644<br>
&gt; +--- a/instrumentation/events/lttng-module/writeback.h<br>
&gt; ++++ b/instrumentation/events/lttng-module/writeback.h<br>
&gt; +@@ -384,34 +384,48 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_balanc=
e_dirty_wait, writeback_wbc_balanc<br>
&gt; + #endif<br>
&gt; + LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeback_wbc_wr=
itepage)<br>
&gt; +<br>
&gt; +-#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,1,0))<br>
&gt; ++#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(5,9,0)) || (LINUX_VE=
RSION_CODE &gt;=3D KERNEL_VERSION(5,4,62))<br>
&gt; ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 TP_PROTO(struct bdi_writeback *wb,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct wb_wr=
iteback_work *work,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned lon=
g dirtied_before,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int moved),<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 TP_ARGS(wb, work, dirtied_before, moved),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 TP_FIELDS(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctf_array_text(cha=
r, name, dev_name(wb-&gt;bdi-&gt;dev), 32)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctf_integer(unsign=
ed long, older, dirtied_before)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctf_integer(int, m=
oved, moved)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; ++)<br>
&gt; ++#elif (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,2,0))<br>
&gt; + LTTNG_TRACEPOINT_EVENT(writeback_queue_io,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TP_PROTO(struct bdi_writeback *wb,<br>
&gt; +-#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,2,0))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct wb_wr=
iteback_work *work,<br>
&gt; +-#else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned lon=
g *older_than_this,<br>
&gt; +-#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int moved),<=
br>
&gt; +-#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,2,0))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TP_ARGS(wb, work, moved),<br>
&gt; +-#else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 TP_FIELDS(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctf_array_text(cha=
r, name, dev_name(wb-&gt;bdi-&gt;dev), 32)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctf_integer(int, m=
oved, moved)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; ++)<br>
&gt; ++#elif (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,1,0))<br>
&gt; ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 TP_PROTO(struct bdi_writeback *wb,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned lon=
g *older_than_this,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int moved),<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TP_ARGS(wb, older_than_this, moved),<br>
&gt; +-#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0TP_FIELDS(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctf_array_tex=
t(char, name, dev_name(wb-&gt;bdi-&gt;dev), 32)<br>
&gt; +-#if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,2,0))<br>
&gt; +-#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctf_integer(u=
nsigned long, older,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0older_than_this ? *older_than_this : 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctf_integer(l=
ong, age,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0older_than_this ?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(jiffies - *older_than_this) =
* 1000 / HZ<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: -1)<br>
&gt; +-#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctf_integer(i=
nt, moved, moved)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; + )<br>
&gt; ++#endif<br>
&gt; +<br>
&gt; + #if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(5,8,0))<br>
&gt; + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,<br>
&gt; +@@ -460,7 +474,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctf_integer(u=
nsigned long, dirty_limit, global_dirty_limit)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; + )<br>
&gt; +-#else<br>
&gt; ++#elif (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,1,0))<br>
&gt; + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writeback_global_dirty_state,<br>
&gt; +@@ -485,7 +499,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; + )<br>
&gt; + #endif<br>
&gt; +-#endif<br>
&gt; +<br>
&gt; + #if (LINUX_VERSION_CODE &gt;=3D KERNEL_VERSION(3,2,0))<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.17.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-module=
s_2.12.2.bb" rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.12.2.bb</=
a> b/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.12.2.bb" r=
el=3D"noreferrer" target=3D"_blank">lttng-modules_2.12.2.bb</a><br>
&gt; index 0e1a209ce8..f58b3bf0d7 100644<br>
&gt; --- a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.12.=
2.bb" rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.12.2.bb</a><br>
&gt; +++ b/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.12.=
2.bb" rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.12.2.bb</a><br>
&gt; @@ -10,6 +10,7 @@ include lttng-platforms.inc<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://lttng.org/files/$%7BBPN%7D=
/$%7BBPN%7D-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https:/=
/lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile-Do-not=
-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fix-writeback-F=
ix-sync-livelock-due-to-b_dirty_time-.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://BUILD_RUNTIME_B=
UG_ON-vs-gcc7.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</blockquote></div>

--000000000000daedba05af4c1f64--
