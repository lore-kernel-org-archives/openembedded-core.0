Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.7770.1601333637455687703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 15:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=guqs53EG;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id gx22so12027041ejb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 15:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xkW7/INin4hmCdbIc2oHKZOGeMHgIY2FEPt/PIEidXI=;
        b=guqs53EGXX/IpJVssqObrzRB90qqHufD3vGJ8ULgEwL4yQetXZP7oTlspR9AdUqOdk
         qdp1in8DEefpkTaCWth6wK12xnFBZgfPEKts1kGp4cSLEz6xWS9VH0ax+5WAKbzTbgto
         Q0ppe3S9XSdEkC0QjhOM4AtCQBd3hx3YSzUY3ZgPn3t6gz2iZZEJmwyDuCTHticXO2ac
         u/J72tqrOyBu0BBWG3V4e/aqP5zOyg9y2LtRFUOpYGQolTLQHXasBd1+Top7us1bHTGa
         SQOaOZVVj3+jwwK/RLONojZT/oUq1wh9BEFAL3pdWOTrAt6TtCPhhE4f3FU24Tp2aaW1
         UO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xkW7/INin4hmCdbIc2oHKZOGeMHgIY2FEPt/PIEidXI=;
        b=IDqTR0jldVJ+4YhTMhBjyAlMzhCbQPJKxnRYIt4QrLhdHm5Yoh/LU8jJWKuyNxdoti
         p30jW2xA+XHRlIYpoz5wPqP15iwkObDL/kXIU5XRKsPm660JA3HbK4nZL0IC9foHMp8J
         ZKPFJArzoNTmWYeREgg1b/VlGaSLoxZjN7XIBRV64FgUm6T9XYXzh+A6h8AqjH5HBHbB
         6bI3/zZ1Yw257rno8yfmq3SUx/0ZPxz6tCdUFiNS9R4xYWi7Q/f0n0t+BApyi7lZkUBt
         9gPJOrICbEnQesIA/UpVJF1wuNGzAYdCp1MPddprT9WjbAaf0TboXKHoQrXl/z/ngGg9
         dRYA==
X-Gm-Message-State: AOAM5318RrBNWywIUe0WQYqozTItFDUtTjVkasuY3AphyNMQ1dwnEouW
	d62oG6F/4Dbcp4VIK64bTryT2J5/ZywKyoSBeOE=
X-Google-Smtp-Source: ABdhPJwYtB65CXiaMtoJxvy++8z1dnu3wafY/jAF3NLROUmnZ7r2TzIw/LbX9xvelEvMz1eRUzLnkNxmELaTducH6+o=
X-Received: by 2002:a17:906:46d5:: with SMTP id k21mr948032ejs.247.1601333635112;
 Mon, 28 Sep 2020 15:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
 <ced4f4ad5252bcc989f40b54341c0d7a5835bfce.1600122415.git.bruce.ashfield@gmail.com>
 <CAOSpxdYTk_t5EWiSydN9-bLPvs-JnsM8LJZgEuJw8oTNOWVitw@mail.gmail.com>
 <CADkTA4M+00ziJmy53FYH+cs302+9eGEqw--=Zc_stwQzKC0pHA@mail.gmail.com>
 <CAOSpxdYTy=PAgsQXwuk8ujGebdxB9NRqYDzykxcEkQgy8t0JPg@mail.gmail.com>
 <1638C0AFDA43827E.8201@lists.openembedded.org> <CADkTA4Oqnt_69n=1Vp2BF39Wj=ZeaY6kWVW+PP+up=xRQ24+NQ@mail.gmail.com>
 <CAOSpxdaf8i_9QZQ5GT++HAEKU7FkkpABBhGVBzsNbYJwN-jdAA@mail.gmail.com>
In-Reply-To: <CAOSpxdaf8i_9QZQ5GT++HAEKU7FkkpABBhGVBzsNbYJwN-jdAA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 28 Sep 2020 18:53:43 -0400
Message-ID: <CADkTA4M5mvKgdk5a3_Uvwv9dj-tALeGawEZ35fqxpJUBvAJWXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] lttng-modules: backport patches from 2.12.x to fix 5.4.64+ and 5.8.9+ builds
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 6:35 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Mon, Sep 28, 2020 at 7:44 AM Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
> >
> > On Sun, Sep 27, 2020 at 5:18 PM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > On Fri, Sep 25, 2020 at 3:49 PM Steve Sakoman <steve@sakoman.com> wr=
ote:
> > > >
> > > > On Fri, Sep 25, 2020 at 6:52 AM Bruce Ashfield <bruce.ashfield@gma=
il.com> wrote:
> > > > >
> > > > > On Fri, Sep 25, 2020 at 12:43 PM Steve Sakoman <steve@sakoman.co=
m> wrote:
> > > > > >
> > > > > > Dunfell is still at 2.11.2.  Will there be a need for patches =
to this
> > > > > > version too?  Or should I take the lttng version bump along wi=
th the
> > > > > > 5.4 version bumps that cause the issue?
> > > > >
> > > > > I don't see a lot of options on that front. Unless we do some cu=
stom backports.
> > > > >
> > > > > I just checked the lttng 2.11 branch, and the last commit is fro=
m January, which
> > > > > is too old to cover these -stable kernel bump issues.
> > > > >
> > > > > I can have a go at the backports, but we should be prepared to b=
end the version
> > > > > upgrade rule if that gets too complex (and for the record, I've =
never
> > > > > had much luck
> > > > > with lttng fixes).
> > > >
> > > > Totally understood!  I think this is likely one of those cases whe=
re
> > > > we'll have to take an exception to the upgrade rule.
> > > >
> > > > If you see issues with a backport just let me know and I'll go wit=
h
> > > > the version upgrade approach.
> > >
> > > I'll have a go at some backports on Monday and send info by end of d=
ay.
> >
> > Hmm. Despite the advertised kernel version limitations, I was able to
> > build lttng-modules against my dunfell branch with v5.4 bumped all the
> > way to v5.4.67.
> >
> > So at this point, I'd suggest taking my kernel uprevs and running it
> > through the autobuilder. If nothing blows up on build, we are good to
> > go.
> >
> > If it does blow up, let me know and I'll figure out how my local build=
s worked.
>
> Sadly I am starting to errors on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/975
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/2498
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/962
>

Not surprising!

Leave it with me, and I'll send a dunfell series later today or early tomo=
rrow.

Bruce


> Steve
>
> > > > While I have your attention, what about "linux-yocto/config:
> > > > netfilter: Enable nat for ipv4 and ipv6" for dunfell?  I'll have t=
o
> > > > prune out the changes for 5.8 in the commit, but does it make sens=
e
> > > > for 5.4?
> > >
> > > It isn't a bugfix by a strict definition, but it also  won't hurt
> > > anything. It does
> > > make sense to keep 5.4 & 5.8 kernel configuration consistent wheneve=
r
> > > possible, so I'd say go ahead and do the port.
> > >
> > > Bruce
> > >
> > > >
> > > > Thanks!
> > > >
> > > > Steve
> > > >
> > > >
> > > >  >
> > > > > > On Mon, Sep 14, 2020 at 12:34 PM Bruce Ashfield
> > > > > > <bruce.ashfield@gmail.com> wrote:
> > > > > > >
> > > > > > > From: Jens Rehsack <sno@netbsd.org>
> > > > > > >
> > > > > > > Backporting the 10 patches since the lttng 2.12.2 release. W=
e'll drop
> > > > > > > them once .3 is released, but for now, we need the fixes to =
build
> > > > > > > against the latest 5.4, 5.8 and 5.9 kernels.
> > > > > > >
> > > > > > > We also bump the devupstream SRCREV to pickup the same chang=
es.
> > > > > > >
> > > > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > ---
> > > > > > >  ...ndency-issue-when-building-in-tree-w.patch |  54 ++
> > > > > > >  ...ce.h-into-the-mmu-sub-directory-v5.9.patch |  41 +
> > > > > > >  ...Make-kvm_mmu_page-definition-and-acc.patch |  39 +
> > > > > > >  ...he-length-of-per-inode-prealloc-list.patch |  84 ++
> > > > > > >  ...e-via-a-block-bitmap-read-is-prefetc.patch |  63 ++
> > > > > > >  ...al-of-smp_-read_barrier_depends-v5.9.patch | 391 +++++++=
+
> > > > > > >  ...teback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch |  59 ++
> > > > > > >  ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 +++
> > > > > > >  ...es-for-ext4_discard_preallocations-a.patch |  52 +
> > > > > > >  .../0010-Fix-system-call-filter-table.patch   | 918 +++++++=
+++++++++++
> > > > > > >  .../lttng/lttng-modules_2.12.2.bb             |  12 +-
> > > > > > >  11 files changed, 1829 insertions(+), 1 deletion(-)
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0001-Kconfig-fix-dependency-issue-when-building-in-tree-w.patch
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0002-fix-Move-mmutrace.h-into-the-mmu-sub-directory-v5.9.patch
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0003-fix-KVM-x86-mmu-Make-kvm_mmu_page-definition-and-acc.patch
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0004-fix-ext4-limit-the-length-of-per-inode-prealloc-list.patch
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0005-fix-ext4-indicate-via-a-block-bitmap-read-is-prefetc.patch
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0006-fix-removal-of-smp_-read_barrier_depends-v5.9.patch
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0007-fix-writeback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0008-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0009-fix-version-ranges-for-ext4_discard_preallocations-a.patch
> > > > > > >  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/=
0010-Fix-system-call-filter-table.patch
> > > > > > >
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Kc=
onfig-fix-dependency-issue-when-building-in-tree-w.patch b/meta/recipes-ker=
nel/lttng/lttng-modules/0001-Kconfig-fix-dependency-issue-when-building-in-=
tree-w.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..ae8bec45de
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Kconfig-f=
ix-dependency-issue-when-building-in-tree-w.patch
> > > > > > > @@ -0,0 +1,54 @@
> > > > > > > +From ff4d1d7e85be94ef43709cd698f0ec9a12f247d1 Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > > +Date: Thu, 13 Aug 2020 16:24:39 +0300
> > > > > > > +Subject: [PATCH 01/10] Kconfig: fix dependency issue when b=
uilding in-tree
> > > > > > > + without CONFIG_FTRACE
> > > > > > > +
> > > > > > > +When building in-tree, one could disable CONFIG_FTRACE from=
 kernel
> > > > > > > +config which will leave CONFIG_TRACEPOINTS selected by LTTN=
G modules,
> > > > > > > +but generate a lot of linker errors like below because it l=
eaves out
> > > > > > > +other stuff, e.g.:
> > > > > > > +
> > > > > > > +trace.c:(.text+0xd86b): undefined reference to `trace_event=
_buffer_reserve'
> > > > > > > +ld: trace.c:(.text+0xd8de): undefined reference to `trace_e=
vent_buffer_commit'
> > > > > > > +ld: trace.c:(.text+0xd926): undefined reference to `event_t=
riggers_call'
> > > > > > > +ld: trace.c:(.text+0xd942): undefined reference to `trace_e=
vent_ignore_this_pid'
> > > > > > > +ld: net/mac80211/trace.o: in function `trace_event_raw_even=
t_drv_tdls_cancel_channel_switch':
> > > > > > > +
> > > > > > > +It appears to be caused by the fact that TRACE_EVENT macros=
 in the Linux
> > > > > > > +kernel depend on the Ftrace ring buffer as soon as CONFIG_T=
RACEPOINTS is
> > > > > > > +enabled.
> > > > > > > +
> > > > > > > +Steps to reproduce:
> > > > > > > +
> > > > > > > +- Get a clone of an upstream stable kernel and use scripts/=
built-in.sh on it
> > > > > > > +
> > > > > > > +- Configure a standard x86-64 build, enable built-in LTTNG =
but disable
> > > > > > > +  CONFIG_FTRACE from Kernel Hacking-->Tracers using menucon=
fig
> > > > > > > +
> > > > > > > +- Build will fail at linking stage
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +---
> > > > > > > + Kconfig | 2 +-
> > > > > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > +
> > > > > > > +diff --git a/Kconfig b/Kconfig
> > > > > > > +index acdab73..10eccff 100644
> > > > > > > +--- a/Kconfig
> > > > > > > ++++ b/Kconfig
> > > > > > > +@@ -2,7 +2,7 @@
> > > > > > > +
> > > > > > > + config LTTNG
> > > > > > > +       tristate "LTTng support"
> > > > > > > +-      select TRACEPOINTS
> > > > > > > ++      select TRACING
> > > > > > > +       help
> > > > > > > +         LTTng is an open source tracing framework for Linu=
x.
> > > > > > > +
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fi=
x-Move-mmutrace.h-into-the-mmu-sub-directory-v5.9.patch b/meta/recipes-kern=
el/lttng/lttng-modules/0002-fix-Move-mmutrace.h-into-the-mmu-sub-directory-=
v5.9.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..fab673b854
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-Move-=
mmutrace.h-into-the-mmu-sub-directory-v5.9.patch
> > > > > > > @@ -0,0 +1,41 @@
> > > > > > > +From e10ab43dd0e425df5bc0ac763447664ed075ba05 Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Date: Mon, 10 Aug 2020 11:22:05 -0400
> > > > > > > +Subject: [PATCH 02/10] fix: Move mmutrace.h into the mmu/ s=
ub-directory (v5.9)
> > > > > > > +
> > > > > > > +  commit 33e3042dac6bcc33b80835f7d7b502b1d74c457c
> > > > > > > +  Author: Sean Christopherson <sean.j.christopherson@intel.=
com>
> > > > > > > +  Date:   Mon Jun 22 13:20:29 2020 -0700
> > > > > > > +
> > > > > > > +    KVM: x86/mmu: Move mmu_audit.c and mmutrace.h into the =
mmu/ sub-directory
> > > > > > > +
> > > > > > > +    Move mmu_audit.c and mmutrace.h under mmu/ where they b=
elong.
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Change-Id: I582525ccca34e1e3bd62870364108a7d3e9df2e4
> > > > > > > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +---
> > > > > > > + probes/lttng-probe-kvm-x86-mmu.c | 4 ++++
> > > > > > > + 1 file changed, 4 insertions(+)
> > > > > > > +
> > > > > > > +diff --git a/probes/lttng-probe-kvm-x86-mmu.c b/probes/lttn=
g-probe-kvm-x86-mmu.c
> > > > > > > +index 37384a2..5a7ef1e 100644
> > > > > > > +--- a/probes/lttng-probe-kvm-x86-mmu.c
> > > > > > > ++++ b/probes/lttng-probe-kvm-x86-mmu.c
> > > > > > > +@@ -24,7 +24,11 @@
> > > > > > > +  */
> > > > > > > + #include <wrapper/tracepoint.h>
> > > > > > > +
> > > > > > > ++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0))
> > > > > > > ++#include <../../arch/x86/kvm/mmu/mmutrace.h>
> > > > > > > ++#else
> > > > > > > + #include <../../arch/x86/kvm/mmutrace.h>
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > + #undef TRACE_INCLUDE_PATH
> > > > > > > + #undef TRACE_INCLUDE_FILE
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fi=
x-KVM-x86-mmu-Make-kvm_mmu_page-definition-and-acc.patch b/meta/recipes-ker=
nel/lttng/lttng-modules/0003-fix-KVM-x86-mmu-Make-kvm_mmu_page-definition-a=
nd-acc.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..524631cc72
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-KVM-x=
86-mmu-Make-kvm_mmu_page-definition-and-acc.patch
> > > > > > > @@ -0,0 +1,39 @@
> > > > > > > +From f16315cc45c4c6b880de541bb092ca18a13952b7 Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Date: Mon, 10 Aug 2020 11:36:03 -0400
> > > > > > > +Subject: [PATCH 03/10] fix: KVM: x86/mmu: Make kvm_mmu_page=
 definition and
> > > > > > > + accessor internal-only (v5.9)
> > > > > > > +
> > > > > > > +  commit 985ab2780164698ec6e7d73fad523d50449261dd
> > > > > > > +  Author: Sean Christopherson <sean.j.christopherson@intel.=
com>
> > > > > > > +  Date:   Mon Jun 22 13:20:32 2020 -0700
> > > > > > > +
> > > > > > > +    KVM: x86/mmu: Make kvm_mmu_page definition and accessor=
 internal-only
> > > > > > > +
> > > > > > > +    Make 'struct kvm_mmu_page' MMU-only, nothing outside of=
 the MMU should
> > > > > > > +    be poking into the gory details of shadow pages.
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Change-Id: Ia5c1b9c49c2b00dad1d5b17c50c3dc730dafda20
> > > > > > > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +---
> > > > > > > + probes/lttng-probe-kvm-x86-mmu.c | 1 +
> > > > > > > + 1 file changed, 1 insertion(+)
> > > > > > > +
> > > > > > > +diff --git a/probes/lttng-probe-kvm-x86-mmu.c b/probes/lttn=
g-probe-kvm-x86-mmu.c
> > > > > > > +index 5a7ef1e..8f98186 100644
> > > > > > > +--- a/probes/lttng-probe-kvm-x86-mmu.c
> > > > > > > ++++ b/probes/lttng-probe-kvm-x86-mmu.c
> > > > > > > +@@ -25,6 +25,7 @@
> > > > > > > + #include <wrapper/tracepoint.h>
> > > > > > > +
> > > > > > > + #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0))
> > > > > > > ++#include <../../arch/x86/kvm/mmu/mmu_internal.h>
> > > > > > > + #include <../../arch/x86/kvm/mmu/mmutrace.h>
> > > > > > > + #else
> > > > > > > + #include <../../arch/x86/kvm/mmutrace.h>
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-fi=
x-ext4-limit-the-length-of-per-inode-prealloc-list.patch b/meta/recipes-ker=
nel/lttng/lttng-modules/0004-fix-ext4-limit-the-length-of-per-inode-preallo=
c-list.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..e29c07252c
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-ext4-=
limit-the-length-of-per-inode-prealloc-list.patch
> > > > > > > @@ -0,0 +1,84 @@
> > > > > > > +From 8fe742807e65af29dac3fea568ff93cbc5dd9a56 Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Date: Mon, 24 Aug 2020 15:26:04 -0400
> > > > > > > +Subject: [PATCH 04/10] fix: ext4: limit the length of per-i=
node prealloc list
> > > > > > > + (v5.9)
> > > > > > > +MIME-Version: 1.0
> > > > > > > +Content-Type: text/plain; charset=3DUTF-8
> > > > > > > +Content-Transfer-Encoding: 8bit
> > > > > > > +
> > > > > > > +See upstream commit:
> > > > > > > +
> > > > > > > +  commit 27bc446e2def38db3244a6eb4bb1d6312936610a
> > > > > > > +  Author: brookxu <brookxu.cn@gmail.com>
> > > > > > > +  Date:   Mon Aug 17 15:36:15 2020 +0800
> > > > > > > +
> > > > > > > +    ext4: limit the length of per-inode prealloc list
> > > > > > > +
> > > > > > > +    In the scenario of writing sparse files, the per-inode =
prealloc list may
> > > > > > > +    be very long, resulting in high overhead for ext4_mb_us=
e_preallocated().
> > > > > > > +    To circumvent this problem, we limit the maximum length=
 of per-inode
> > > > > > > +    prealloc list to 512 and allow users to modify it.
> > > > > > > +
> > > > > > > +    After patching, we observed that the sys ratio of cpu h=
as dropped, and
> > > > > > > +    the system throughput has increased significantly. We c=
reated a process
> > > > > > > +    to write the sparse file, and the running time of the p=
rocess on the
> > > > > > > +    fixed kernel was significantly reduced, as follows:
> > > > > > > +
> > > > > > > +    Running time on unfixed kernel=EF=BC=9A
> > > > > > > +    [root@TENCENT64 ~]# time taskset 0x01 ./sparse /data1/s=
parce.dat
> > > > > > > +    real    0m2.051s
> > > > > > > +    user    0m0.008s
> > > > > > > +    sys     0m2.026s
> > > > > > > +
> > > > > > > +    Running time on fixed kernel=EF=BC=9A
> > > > > > > +    [root@TENCENT64 ~]# time taskset 0x01 ./sparse /data1/s=
parce.dat
> > > > > > > +    real    0m0.471s
> > > > > > > +    user    0m0.004s
> > > > > > > +    sys     0m0.395s
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +Change-Id: I5169cb24853d4da32e2862a6626f1f058689b053
> > > > > > > +---
> > > > > > > + instrumentation/events/lttng-module/ext4.h | 15 ++++++++++=
+++++
> > > > > > > + 1 file changed, 15 insertions(+)
> > > > > > > +
> > > > > > > +diff --git a/instrumentation/events/lttng-module/ext4.h b/i=
nstrumentation/events/lttng-module/ext4.h
> > > > > > > +index 5f7ab28..72ad4c9 100644
> > > > > > > +--- a/instrumentation/events/lttng-module/ext4.h
> > > > > > > ++++ b/instrumentation/events/lttng-module/ext4.h
> > > > > > > +@@ -460,6 +460,20 @@ LTTNG_TRACEPOINT_EVENT(ext4_mb_release=
_group_pa,
> > > > > > > + )
> > > > > > > + #endif
> > > > > > > +
> > > > > > > ++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0))
> > > > > > > ++LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
> > > > > > > ++      TP_PROTO(struct inode *inode, unsigned int len, unsi=
gned int needed),
> > > > > > > ++
> > > > > > > ++      TP_ARGS(inode, len, needed),
> > > > > > > ++
> > > > > > > ++      TP_FIELDS(
> > > > > > > ++              ctf_integer(dev_t, dev, inode->i_sb->s_dev)
> > > > > > > ++              ctf_integer(ino_t, ino, inode->i_ino)
> > > > > > > ++              ctf_integer(unsigned int, len, len)
> > > > > > > ++              ctf_integer(unsigned int, needed, needed)
> > > > > > > ++      )
> > > > > > > ++)
> > > > > > > ++#else
> > > > > > > + LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
> > > > > > > +       TP_PROTO(struct inode *inode),
> > > > > > > +
> > > > > > > +@@ -470,6 +484,7 @@ LTTNG_TRACEPOINT_EVENT(ext4_discard_pre=
allocations,
> > > > > > > +               ctf_integer(ino_t, ino, inode->i_ino)
> > > > > > > +       )
> > > > > > > + )
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > + LTTNG_TRACEPOINT_EVENT(ext4_mb_discard_preallocations,
> > > > > > > +       TP_PROTO(struct super_block *sb, int needed),
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-fi=
x-ext4-indicate-via-a-block-bitmap-read-is-prefetc.patch b/meta/recipes-ker=
nel/lttng/lttng-modules/0005-fix-ext4-indicate-via-a-block-bitmap-read-is-p=
refetc.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..f76e9698c8
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-=
indicate-via-a-block-bitmap-read-is-prefetc.patch
> > > > > > > @@ -0,0 +1,63 @@
> > > > > > > +From 52563d02a9234215b62c5f519aa1b5d8589ccd0a Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Date: Mon, 24 Aug 2020 15:37:50 -0400
> > > > > > > +Subject: [PATCH 05/10] =3D?UTF-8?q?fix:=3D20ext4:=3D20indic=
ate=3D20via=3D20a=3D20block?=3D
> > > > > > > + =3D?UTF-8?q?=3D20bitmap=3D20read=3D20is=3D20prefetched=3DE=
2=3D80=3DA6=3D20(v5.9)?=3D
> > > > > > > +MIME-Version: 1.0
> > > > > > > +Content-Type: text/plain; charset=3DUTF-8
> > > > > > > +Content-Transfer-Encoding: 8bit
> > > > > > > +
> > > > > > > +See upstream commit:
> > > > > > > +
> > > > > > > +  commit ab74c7b23f3770935016e3eb3ecdf1e42b73efaa
> > > > > > > +  Author: Theodore Ts'o <tytso@mit.edu>
> > > > > > > +  Date:   Wed Jul 15 11:48:55 2020 -0400
> > > > > > > +
> > > > > > > +    ext4: indicate via a block bitmap read is prefetched vi=
a a tracepoint
> > > > > > > +
> > > > > > > +    Modify the ext4_read_block_bitmap_load tracepoint so th=
at it tells us
> > > > > > > +    whether a block bitmap is being prefetched.
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +Change-Id: I0e5e2c5b8004223d0928235c092449ee16a940e1
> > > > > > > +---
> > > > > > > + instrumentation/events/lttng-module/ext4.h | 14 ++++++++++=
++++
> > > > > > > + 1 file changed, 14 insertions(+)
> > > > > > > +
> > > > > > > +diff --git a/instrumentation/events/lttng-module/ext4.h b/i=
nstrumentation/events/lttng-module/ext4.h
> > > > > > > +index 72ad4c9..4476abb 100644
> > > > > > > +--- a/instrumentation/events/lttng-module/ext4.h
> > > > > > > ++++ b/instrumentation/events/lttng-module/ext4.h
> > > > > > > +@@ -893,12 +893,26 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4_=
_bitmap_load, ext4_mb_buddy_bitmap_load,
> > > > > > > +       TP_ARGS(sb, group)
> > > > > > > + )
> > > > > > > +
> > > > > > > ++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0))
> > > > > > > ++LTTNG_TRACEPOINT_EVENT(ext4_read_block_bitmap_load,
> > > > > > > ++      TP_PROTO(struct super_block *sb, unsigned long group=
, bool prefetch),
> > > > > > > ++
> > > > > > > ++      TP_ARGS(sb, group, prefetch),
> > > > > > > ++
> > > > > > > ++      TP_FIELDS(
> > > > > > > ++              ctf_integer(dev_t, dev, sb->s_dev)
> > > > > > > ++              ctf_integer(__u32, group, group)
> > > > > > > ++              ctf_integer(bool, prefetch, prefetch)
> > > > > > > ++      )
> > > > > > > ++)
> > > > > > > ++#else
> > > > > > > + LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_re=
ad_block_bitmap_load,
> > > > > > > +
> > > > > > > +       TP_PROTO(struct super_block *sb, unsigned long group=
),
> > > > > > > +
> > > > > > > +       TP_ARGS(sb, group)
> > > > > > > + )
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > + LTTNG_TRACEPOINT_EVENT_INSTANCE(ext4__bitmap_load, ext4_lo=
ad_inode_bitmap,
> > > > > > > +
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-fi=
x-removal-of-smp_-read_barrier_depends-v5.9.patch b/meta/recipes-kernel/ltt=
ng/lttng-modules/0006-fix-removal-of-smp_-read_barrier_depends-v5.9.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..0970dd30aa
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-remov=
al-of-smp_-read_barrier_depends-v5.9.patch
> > > > > > > @@ -0,0 +1,391 @@
> > > > > > > +From 57ccbfa6a8a79c7b84394c2097efaf7935607aa5 Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Date: Tue, 25 Aug 2020 10:56:29 -0400
> > > > > > > +Subject: [PATCH 06/10] fix: removal of [smp_]read_barrier_d=
epends (v5.9)
> > > > > > > +
> > > > > > > +See upstream commits:
> > > > > > > +
> > > > > > > +  commit 76ebbe78f7390aee075a7f3768af197ded1bdfbb
> > > > > > > +  Author: Will Deacon <will@kernel.org>
> > > > > > > +  Date:   Tue Oct 24 11:22:47 2017 +0100
> > > > > > > +
> > > > > > > +    locking/barriers: Add implicit smp_read_barrier_depends=
() to READ_ONCE()
> > > > > > > +
> > > > > > > +    In preparation for the removal of lockless_dereference(=
), which is the
> > > > > > > +    same as READ_ONCE() on all architectures other than Alp=
ha, add an
> > > > > > > +    implicit smp_read_barrier_depends() to READ_ONCE() so t=
hat it can be
> > > > > > > +    used to head dependency chains on all architectures.
> > > > > > > +
> > > > > > > +  commit 76ebbe78f7390aee075a7f3768af197ded1bdfbb
> > > > > > > +  Author: Will Deacon <will.deacon@arm.com>
> > > > > > > +  Date:   Tue Oct 24 11:22:47 2017 +0100
> > > > > > > +
> > > > > > > +    locking/barriers: Add implicit smp_read_barrier_depends=
() to READ_ONCE()
> > > > > > > +
> > > > > > > +    In preparation for the removal of lockless_dereference(=
), which is the
> > > > > > > +    same as READ_ONCE() on all architectures other than Alp=
ha, add an
> > > > > > > +    implicit smp_read_barrier_depends() to READ_ONCE() so t=
hat it can be
> > > > > > > +    used to head dependency chains on all architectures.
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Change-Id: Ife8880bd9378dca2972da8838f40fc35ccdfaaac
> > > > > > > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +---
> > > > > > > + instrumentation/events/lttng-module/i2c.h |  4 ++--
> > > > > > > + lib/ringbuffer/backend.h                  |  2 +-
> > > > > > > + lib/ringbuffer/backend_internal.h         |  2 +-
> > > > > > > + lib/ringbuffer/frontend.h                 |  4 ++--
> > > > > > > + lib/ringbuffer/ring_buffer_frontend.c     |  4 ++--
> > > > > > > + lib/ringbuffer/ring_buffer_iterator.c     |  2 +-
> > > > > > > + lttng-events.c                            |  8 ++++----
> > > > > > > + probes/lttng-kprobes.c                    |  6 +++---
> > > > > > > + probes/lttng-kretprobes.c                 |  6 +++---
> > > > > > > + probes/lttng-tracepoint-event-impl.h      | 12 ++++++-----=
-
> > > > > > > + probes/lttng-uprobes.c                    |  6 +++---
> > > > > > > + wrapper/compiler.h                        | 18 +++++++++++=
+++++++
> > > > > > > + wrapper/trace-clock.h                     | 15 +++++------=
----
> > > > > > > + 13 files changed, 51 insertions(+), 38 deletions(-)
> > > > > > > +
> > > > > > > +diff --git a/instrumentation/events/lttng-module/i2c.h b/in=
strumentation/events/lttng-module/i2c.h
> > > > > > > +index dcbabf6..131d134 100644
> > > > > > > +--- a/instrumentation/events/lttng-module/i2c.h
> > > > > > > ++++ b/instrumentation/events/lttng-module/i2c.h
> > > > > > > +@@ -23,7 +23,7 @@ LTTNG_TRACEPOINT_EVENT_CODE(i2c_write,
> > > > > > > +
> > > > > > > +       TP_code_pre(
> > > > > > > +               tp_locvar->extract_sensitive_payload =3D
> > > > > > > +-                      READ_ONCE(extract_sensitive_payload)=
;
> > > > > > > ++                      LTTNG_READ_ONCE(extract_sensitive_pa=
yload);
> > > > > > > +       ),
> > > > > > > +
> > > > > > > +       TP_FIELDS(
> > > > > > > +@@ -78,7 +78,7 @@ LTTNG_TRACEPOINT_EVENT_CODE(i2c_reply,
> > > > > > > +
> > > > > > > +       TP_code_pre(
> > > > > > > +               tp_locvar->extract_sensitive_payload =3D
> > > > > > > +-                      READ_ONCE(extract_sensitive_payload)=
;
> > > > > > > ++                      LTTNG_READ_ONCE(extract_sensitive_pa=
yload);
> > > > > > > +       ),
> > > > > > > +
> > > > > > > +       TP_FIELDS(
> > > > > > > +diff --git a/lib/ringbuffer/backend.h b/lib/ringbuffer/back=
end.h
> > > > > > > +index da937f2..43e1d47 100644
> > > > > > > +--- a/lib/ringbuffer/backend.h
> > > > > > > ++++ b/lib/ringbuffer/backend.h
> > > > > > > +@@ -156,7 +156,7 @@ size_t lib_ring_buffer_do_strcpy(const =
struct lib_ring_buffer_config *config,
> > > > > > > +                * Only read source character once, in case =
it is
> > > > > > > +                * modified concurrently.
> > > > > > > +                */
> > > > > > > +-              c =3D READ_ONCE(src[count]);
> > > > > > > ++              c =3D LTTNG_READ_ONCE(src[count]);
> > > > > > > +               if (!c)
> > > > > > > +                       break;
> > > > > > > +               lib_ring_buffer_do_copy(config, &dest[count]=
, &c, 1);
> > > > > > > +diff --git a/lib/ringbuffer/backend_internal.h b/lib/ringbu=
ffer/backend_internal.h
> > > > > > > +index 2d6a345..1226fd8 100644
> > > > > > > +--- a/lib/ringbuffer/backend_internal.h
> > > > > > > ++++ b/lib/ringbuffer/backend_internal.h
> > > > > > > +@@ -367,7 +367,7 @@ void lib_ring_buffer_clear_noref(const =
struct lib_ring_buffer_config *config,
> > > > > > > +        * Performing a volatile access to read the sb_pages=
, because we want to
> > > > > > > +        * read a coherent version of the pointer and the as=
sociated noref flag.
> > > > > > > +        */
> > > > > > > +-      id =3D READ_ONCE(bufb->buf_wsb[idx].id);
> > > > > > > ++      id =3D LTTNG_READ_ONCE(bufb->buf_wsb[idx].id);
> > > > > > > +       for (;;) {
> > > > > > > +               /* This check is called on the fast path for=
 each record. */
> > > > > > > +               if (likely(!subbuffer_id_is_noref(config, id=
))) {
> > > > > > > +diff --git a/lib/ringbuffer/frontend.h b/lib/ringbuffer/fro=
ntend.h
> > > > > > > +index 6f516d9..41382fe 100644
> > > > > > > +--- a/lib/ringbuffer/frontend.h
> > > > > > > ++++ b/lib/ringbuffer/frontend.h
> > > > > > > +@@ -79,7 +79,7 @@ void *channel_destroy(struct channel *cha=
n);
> > > > > > > + #define for_each_channel_cpu(cpu, chan)                   =
                    \
> > > > > > > +       for ((cpu) =3D -1;                                  =
              \
> > > > > > > +               ({ (cpu) =3D cpumask_next(cpu, (chan)->backe=
nd.cpumask);  \
> > > > > > > +-                 smp_read_barrier_depends(); (cpu) < nr_cp=
u_ids; });)
> > > > > > > ++                 smp_rmb(); (cpu) < nr_cpu_ids; });)
> > > > > > > +
> > > > > > > + extern struct lib_ring_buffer *channel_get_ring_buffer(
> > > > > > > +                               const struct lib_ring_buffer=
_config *config,
> > > > > > > +@@ -155,7 +155,7 @@ static inline
> > > > > > > + int lib_ring_buffer_is_finalized(const struct lib_ring_buf=
fer_config *config,
> > > > > > > +                                struct lib_ring_buffer *buf=
)
> > > > > > > + {
> > > > > > > +-      int finalized =3D READ_ONCE(buf->finalized);
> > > > > > > ++      int finalized =3D LTTNG_READ_ONCE(buf->finalized);
> > > > > > > +       /*
> > > > > > > +        * Read finalized before counters.
> > > > > > > +        */
> > > > > > > +diff --git a/lib/ringbuffer/ring_buffer_frontend.c b/lib/ri=
ngbuffer/ring_buffer_frontend.c
> > > > > > > +index 3cab365..4980d20 100644
> > > > > > > +--- a/lib/ringbuffer/ring_buffer_frontend.c
> > > > > > > ++++ b/lib/ringbuffer/ring_buffer_frontend.c
> > > > > > > +@@ -1074,7 +1074,7 @@ int lib_ring_buffer_snapshot(struct l=
ib_ring_buffer *buf,
> > > > > > > +       int finalized;
> > > > > > > +
> > > > > > > + retry:
> > > > > > > +-      finalized =3D READ_ONCE(buf->finalized);
> > > > > > > ++      finalized =3D LTTNG_READ_ONCE(buf->finalized);
> > > > > > > +       /*
> > > > > > > +        * Read finalized before counters.
> > > > > > > +        */
> > > > > > > +@@ -1245,7 +1245,7 @@ int lib_ring_buffer_get_subbuf(struct=
 lib_ring_buffer *buf,
> > > > > > > +               return -EBUSY;
> > > > > > > +       }
> > > > > > > + retry:
> > > > > > > +-      finalized =3D READ_ONCE(buf->finalized);
> > > > > > > ++      finalized =3D LTTNG_READ_ONCE(buf->finalized);
> > > > > > > +       /*
> > > > > > > +        * Read finalized before counters.
> > > > > > > +        */
> > > > > > > +diff --git a/lib/ringbuffer/ring_buffer_iterator.c b/lib/ri=
ngbuffer/ring_buffer_iterator.c
> > > > > > > +index d25db72..7b4f20a 100644
> > > > > > > +--- a/lib/ringbuffer/ring_buffer_iterator.c
> > > > > > > ++++ b/lib/ringbuffer/ring_buffer_iterator.c
> > > > > > > +@@ -46,7 +46,7 @@ restart:
> > > > > > > +       switch (iter->state) {
> > > > > > > +       case ITER_GET_SUBBUF:
> > > > > > > +               ret =3D lib_ring_buffer_get_next_subbuf(buf)=
;
> > > > > > > +-              if (ret && !READ_ONCE(buf->finalized)
> > > > > > > ++              if (ret && !LTTNG_READ_ONCE(buf->finalized)
> > > > > > > +                   && config->alloc =3D=3D RING_BUFFER_ALLO=
C_GLOBAL) {
> > > > > > > +                       /*
> > > > > > > +                        * Use "pull" scheme for global buff=
ers. The reader
> > > > > > > +diff --git a/lttng-events.c b/lttng-events.c
> > > > > > > +index be7e389..d719294 100644
> > > > > > > +--- a/lttng-events.c
> > > > > > > ++++ b/lttng-events.c
> > > > > > > +@@ -1719,7 +1719,7 @@ int lttng_metadata_printf(struct lttn=
g_session *session,
> > > > > > > +       size_t len;
> > > > > > > +       va_list ap;
> > > > > > > +
> > > > > > > +-      WARN_ON_ONCE(!READ_ONCE(session->active));
> > > > > > > ++      WARN_ON_ONCE(!LTTNG_READ_ONCE(session->active));
> > > > > > > +
> > > > > > > +       va_start(ap, fmt);
> > > > > > > +       str =3D kvasprintf(GFP_KERNEL, fmt, ap);
> > > > > > > +@@ -2305,7 +2305,7 @@ int _lttng_event_metadata_statedump(s=
truct lttng_session *session,
> > > > > > > + {
> > > > > > > +       int ret =3D 0;
> > > > > > > +
> > > > > > > +-      if (event->metadata_dumped || !READ_ONCE(session->ac=
tive))
> > > > > > > ++      if (event->metadata_dumped || !LTTNG_READ_ONCE(sessi=
on->active))
> > > > > > > +               return 0;
> > > > > > > +       if (chan->channel_type =3D=3D METADATA_CHANNEL)
> > > > > > > +               return 0;
> > > > > > > +@@ -2377,7 +2377,7 @@ int _lttng_channel_metadata_statedump=
(struct lttng_session *session,
> > > > > > > + {
> > > > > > > +       int ret =3D 0;
> > > > > > > +
> > > > > > > +-      if (chan->metadata_dumped || !READ_ONCE(session->act=
ive))
> > > > > > > ++      if (chan->metadata_dumped || !LTTNG_READ_ONCE(sessio=
n->active))
> > > > > > > +               return 0;
> > > > > > > +
> > > > > > > +       if (chan->channel_type =3D=3D METADATA_CHANNEL)
> > > > > > > +@@ -2604,7 +2604,7 @@ int _lttng_session_metadata_statedump=
(struct lttng_session *session)
> > > > > > > +       struct lttng_event *event;
> > > > > > > +       int ret =3D 0;
> > > > > > > +
> > > > > > > +-      if (!READ_ONCE(session->active))
> > > > > > > ++      if (!LTTNG_READ_ONCE(session->active))
> > > > > > > +               return 0;
> > > > > > > +
> > > > > > > +       lttng_metadata_begin(session);
> > > > > > > +diff --git a/probes/lttng-kprobes.c b/probes/lttng-kprobes.=
c
> > > > > > > +index a44eaa1..38fb72e 100644
> > > > > > > +--- a/probes/lttng-kprobes.c
> > > > > > > ++++ b/probes/lttng-kprobes.c
> > > > > > > +@@ -31,11 +31,11 @@ int lttng_kprobes_handler_pre(struct kp=
robe *p, struct pt_regs *regs)
> > > > > > > +       int ret;
> > > > > > > +       unsigned long data =3D (unsigned long) p->addr;
> > > > > > > +
> > > > > > > +-      if (unlikely(!READ_ONCE(chan->session->active)))
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(chan->session->active)=
))
> > > > > > > +               return 0;
> > > > > > > +-      if (unlikely(!READ_ONCE(chan->enabled)))
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(chan->enabled)))
> > > > > > > +               return 0;
> > > > > > > +-      if (unlikely(!READ_ONCE(event->enabled)))
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(event->enabled)))
> > > > > > > +               return 0;
> > > > > > > +
> > > > > > > +       lib_ring_buffer_ctx_init(&ctx, chan->chan, &lttng_pr=
obe_ctx, sizeof(data),
> > > > > > > +diff --git a/probes/lttng-kretprobes.c b/probes/lttng-kretp=
robes.c
> > > > > > > +index ab98ff2..a6bcd21 100644
> > > > > > > +--- a/probes/lttng-kretprobes.c
> > > > > > > ++++ b/probes/lttng-kretprobes.c
> > > > > > > +@@ -51,11 +51,11 @@ int _lttng_kretprobes_handler(struct kr=
etprobe_instance *krpi,
> > > > > > > +               unsigned long parent_ip;
> > > > > > > +       } payload;
> > > > > > > +
> > > > > > > +-      if (unlikely(!READ_ONCE(chan->session->active)))
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(chan->session->active)=
))
> > > > > > > +               return 0;
> > > > > > > +-      if (unlikely(!READ_ONCE(chan->enabled)))
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(chan->enabled)))
> > > > > > > +               return 0;
> > > > > > > +-      if (unlikely(!READ_ONCE(event->enabled)))
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(event->enabled)))
> > > > > > > +               return 0;
> > > > > > > +
> > > > > > > +       payload.ip =3D (unsigned long) krpi->rp->kp.addr;
> > > > > > > +diff --git a/probes/lttng-tracepoint-event-impl.h b/probes/=
lttng-tracepoint-event-impl.h
> > > > > > > +index 77b8638..72a669e 100644
> > > > > > > +--- a/probes/lttng-tracepoint-event-impl.h
> > > > > > > ++++ b/probes/lttng-tracepoint-event-impl.h
> > > > > > > +@@ -1132,11 +1132,11 @@ static void __event_probe__##_name(=
void *__data, _proto)                     \
> > > > > > > +                                                           =
                  \
> > > > > > > +       if (!_TP_SESSION_CHECK(session, __session))         =
                  \
> > > > > > > +               return;                                     =
                  \
> > > > > > > +-      if (unlikely(!READ_ONCE(__session->active)))        =
                  \
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(__session->active)))  =
                  \
> > > > > > > +               return;                                     =
                  \
> > > > > > > +-      if (unlikely(!READ_ONCE(__chan->enabled)))          =
                  \
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(__chan->enabled)))    =
                  \
> > > > > > > +               return;                                     =
                  \
> > > > > > > +-      if (unlikely(!READ_ONCE(__event->enabled)))         =
                  \
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(__event->enabled)))   =
                  \
> > > > > > > +               return;                                     =
                  \
> > > > > > > +       __lf =3D lttng_rcu_dereference(__session->pid_tracke=
r.p);               \
> > > > > > > +       if (__lf && likely(!lttng_id_tracker_lookup(__lf, cu=
rrent->tgid)))    \
> > > > > > > +@@ -1225,11 +1225,11 @@ static void __event_probe__##_name(=
void *__data)                             \
> > > > > > > +                                                           =
                  \
> > > > > > > +       if (!_TP_SESSION_CHECK(session, __session))         =
                  \
> > > > > > > +               return;                                     =
                  \
> > > > > > > +-      if (unlikely(!READ_ONCE(__session->active)))        =
                  \
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(__session->active)))  =
                  \
> > > > > > > +               return;                                     =
                  \
> > > > > > > +-      if (unlikely(!READ_ONCE(__chan->enabled)))          =
                  \
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(__chan->enabled)))    =
                  \
> > > > > > > +               return;                                     =
                  \
> > > > > > > +-      if (unlikely(!READ_ONCE(__event->enabled)))         =
                  \
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(__event->enabled)))   =
                  \
> > > > > > > +               return;                                     =
                  \
> > > > > > > +       __lf =3D lttng_rcu_dereference(__session->pid_tracke=
r.p);               \
> > > > > > > +       if (__lf && likely(!lttng_id_tracker_lookup(__lf, cu=
rrent->tgid)))    \
> > > > > > > +diff --git a/probes/lttng-uprobes.c b/probes/lttng-uprobes.=
c
> > > > > > > +index bc10128..bda1d9b 100644
> > > > > > > +--- a/probes/lttng-uprobes.c
> > > > > > > ++++ b/probes/lttng-uprobes.c
> > > > > > > +@@ -40,11 +40,11 @@ int lttng_uprobes_handler_pre(struct up=
robe_consumer *uc, struct pt_regs *regs)
> > > > > > > +               unsigned long ip;
> > > > > > > +       } payload;
> > > > > > > +
> > > > > > > +-      if (unlikely(!READ_ONCE(chan->session->active)))
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(chan->session->active)=
))
> > > > > > > +               return 0;
> > > > > > > +-      if (unlikely(!READ_ONCE(chan->enabled)))
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(chan->enabled)))
> > > > > > > +               return 0;
> > > > > > > +-      if (unlikely(!READ_ONCE(event->enabled)))
> > > > > > > ++      if (unlikely(!LTTNG_READ_ONCE(event->enabled)))
> > > > > > > +               return 0;
> > > > > > > +
> > > > > > > +       lib_ring_buffer_ctx_init(&ctx, chan->chan, &lttng_pr=
obe_ctx,
> > > > > > > +diff --git a/wrapper/compiler.h b/wrapper/compiler.h
> > > > > > > +index 1496f33..b9f8c51 100644
> > > > > > > +--- a/wrapper/compiler.h
> > > > > > > ++++ b/wrapper/compiler.h
> > > > > > > +@@ -9,6 +9,7 @@
> > > > > > > + #define _LTTNG_WRAPPER_COMPILER_H
> > > > > > > +
> > > > > > > + #include <linux/compiler.h>
> > > > > > > ++#include <linux/version.h>
> > > > > > > +
> > > > > > > + /*
> > > > > > > +  * Don't allow compiling with buggy compiler.
> > > > > > > +@@ -39,4 +40,21 @@
> > > > > > > + # define WRITE_ONCE(x, val)   ({ ACCESS_ONCE(x) =3D val; }=
)
> > > > > > > + #endif
> > > > > > > +
> > > > > > > ++/*
> > > > > > > ++ * In v4.15 a smp read barrier was added to READ_ONCE to r=
eplace
> > > > > > > ++ * lockless_dereference(), replicate this behavior on prio=
r kernels
> > > > > > > ++ * and remove calls to smp_read_barrier_depends which was =
dropped
> > > > > > > ++ * in v5.9.
> > > > > > > ++ */
> > > > > > > ++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(4,15,0))
> > > > > > > ++#define LTTNG_READ_ONCE(x)    READ_ONCE(x)
> > > > > > > ++#else
> > > > > > > ++#define LTTNG_READ_ONCE(x)                    \
> > > > > > > ++({                                            \
> > > > > > > ++      typeof(x) __val =3D READ_ONCE(x);         \
> > > > > > > ++      smp_read_barrier_depends();             \
> > > > > > > ++      __val;                                  \
> > > > > > > ++})
> > > > > > > ++#endif
> > > > > > > ++
> > > > > > > + #endif /* _LTTNG_WRAPPER_COMPILER_H */
> > > > > > > +diff --git a/wrapper/trace-clock.h b/wrapper/trace-clock.h
> > > > > > > +index 9f4e366..187fc82 100644
> > > > > > > +--- a/wrapper/trace-clock.h
> > > > > > > ++++ b/wrapper/trace-clock.h
> > > > > > > +@@ -160,33 +160,30 @@ static inline void put_trace_clock(vo=
id)
> > > > > > > +
> > > > > > > + static inline u64 trace_clock_read64(void)
> > > > > > > + {
> > > > > > > +-      struct lttng_trace_clock *ltc =3D READ_ONCE(lttng_tr=
ace_clock);
> > > > > > > ++      struct lttng_trace_clock *ltc =3D LTTNG_READ_ONCE(lt=
tng_trace_clock);
> > > > > > > +
> > > > > > > +       if (likely(!ltc)) {
> > > > > > > +               return trace_clock_read64_monotonic();
> > > > > > > +       } else {
> > > > > > > +-              read_barrier_depends(); /* load ltc before c=
ontent */
> > > > > > > +               return ltc->read64();
> > > > > > > +       }
> > > > > > > + }
> > > > > > > +
> > > > > > > + static inline u64 trace_clock_freq(void)
> > > > > > > + {
> > > > > > > +-      struct lttng_trace_clock *ltc =3D READ_ONCE(lttng_tr=
ace_clock);
> > > > > > > ++      struct lttng_trace_clock *ltc =3D LTTNG_READ_ONCE(lt=
tng_trace_clock);
> > > > > > > +
> > > > > > > +       if (!ltc) {
> > > > > > > +               return trace_clock_freq_monotonic();
> > > > > > > +       } else {
> > > > > > > +-              read_barrier_depends(); /* load ltc before c=
ontent */
> > > > > > > +               return ltc->freq();
> > > > > > > +       }
> > > > > > > + }
> > > > > > > +
> > > > > > > + static inline int trace_clock_uuid(char *uuid)
> > > > > > > + {
> > > > > > > +-      struct lttng_trace_clock *ltc =3D READ_ONCE(lttng_tr=
ace_clock);
> > > > > > > ++      struct lttng_trace_clock *ltc =3D LTTNG_READ_ONCE(lt=
tng_trace_clock);
> > > > > > > +
> > > > > > > +-      read_barrier_depends(); /* load ltc before content *=
/
> > > > > > > +       /* Use default UUID cb when NULL */
> > > > > > > +       if (!ltc || !ltc->uuid) {
> > > > > > > +               return trace_clock_uuid_monotonic(uuid);
> > > > > > > +@@ -197,24 +194,22 @@ static inline int trace_clock_uuid(ch=
ar *uuid)
> > > > > > > +
> > > > > > > + static inline const char *trace_clock_name(void)
> > > > > > > + {
> > > > > > > +-      struct lttng_trace_clock *ltc =3D READ_ONCE(lttng_tr=
ace_clock);
> > > > > > > ++      struct lttng_trace_clock *ltc =3D LTTNG_READ_ONCE(lt=
tng_trace_clock);
> > > > > > > +
> > > > > > > +       if (!ltc) {
> > > > > > > +               return trace_clock_name_monotonic();
> > > > > > > +       } else {
> > > > > > > +-              read_barrier_depends(); /* load ltc before c=
ontent */
> > > > > > > +               return ltc->name();
> > > > > > > +       }
> > > > > > > + }
> > > > > > > +
> > > > > > > + static inline const char *trace_clock_description(void)
> > > > > > > + {
> > > > > > > +-      struct lttng_trace_clock *ltc =3D READ_ONCE(lttng_tr=
ace_clock);
> > > > > > > ++      struct lttng_trace_clock *ltc =3D LTTNG_READ_ONCE(lt=
tng_trace_clock);
> > > > > > > +
> > > > > > > +       if (!ltc) {
> > > > > > > +               return trace_clock_description_monotonic();
> > > > > > > +       } else {
> > > > > > > +-              read_barrier_depends(); /* load ltc before c=
ontent */
> > > > > > > +               return ltc->description();
> > > > > > > +       }
> > > > > > > + }
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-fi=
x-writeback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch b/meta/recipes-kernel/lttng=
/lttng-modules/0007-fix-writeback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..2843c9cb62
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-write=
back-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch
> > > > > > > @@ -0,0 +1,59 @@
> > > > > > > +From eae02feb58064eee5ce15a9f6bdffd107c47da05 Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Date: Mon, 31 Aug 2020 11:41:38 -0400
> > > > > > > +Subject: [PATCH 07/10] fix: writeback: Drop I_DIRTY_TIME_EX=
PIRE (v5.9)
> > > > > > > +
> > > > > > > +See upstream commit:
> > > > > > > +
> > > > > > > +  commit 5fcd57505c002efc5823a7355e21f48dd02d5a51
> > > > > > > +  Author: Jan Kara <jack@suse.cz>
> > > > > > > +  Date:   Fri May 29 16:24:43 2020 +0200
> > > > > > > +
> > > > > > > +    writeback: Drop I_DIRTY_TIME_EXPIRE
> > > > > > > +
> > > > > > > +    The only use of I_DIRTY_TIME_EXPIRE is to detect in
> > > > > > > +    __writeback_single_inode() that inode got there because=
 flush worker
> > > > > > > +    decided it's time to writeback the dirty inode time sta=
mps (either
> > > > > > > +    because we are syncing or because of age). However we c=
an detect this
> > > > > > > +    directly in __writeback_single_inode() and there's no n=
eed for the
> > > > > > > +    strange propagation with I_DIRTY_TIME_EXPIRE flag.
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +Change-Id: I92e37c2ff3ec36d431e8f9de5c8e37c5a2da55ea
> > > > > > > +---
> > > > > > > + instrumentation/events/lttng-module/writeback.h | 16 +++++=
++++++++++-
> > > > > > > + 1 file changed, 15 insertions(+), 1 deletion(-)
> > > > > > > +
> > > > > > > +diff --git a/instrumentation/events/lttng-module/writeback.=
h b/instrumentation/events/lttng-module/writeback.h
> > > > > > > +index affb4eb..ece67ad 100644
> > > > > > > +--- a/instrumentation/events/lttng-module/writeback.h
> > > > > > > ++++ b/instrumentation/events/lttng-module/writeback.h
> > > > > > > +@@ -46,7 +46,21 @@ static inline struct backing_dev_info *l=
ttng_inode_to_bdi(struct inode *inode)
> > > > > > > +
> > > > > > > + #endif
> > > > > > > +
> > > > > > > +-#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(4,0,0))
> > > > > > > ++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0))
> > > > > > > ++#define show_inode_state(state)                           =
            \
> > > > > > > ++      __print_flags(state, "|",                           =
    \
> > > > > > > ++              {I_DIRTY_SYNC,          "I_DIRTY_SYNC"},    =
    \
> > > > > > > ++              {I_DIRTY_DATASYNC,      "I_DIRTY_DATASYNC"},=
    \
> > > > > > > ++              {I_DIRTY_PAGES,         "I_DIRTY_PAGES"},   =
    \
> > > > > > > ++              {I_NEW,                 "I_NEW"},           =
    \
> > > > > > > ++              {I_WILL_FREE,           "I_WILL_FREE"},     =
    \
> > > > > > > ++              {I_FREEING,             "I_FREEING"},       =
    \
> > > > > > > ++              {I_CLEAR,               "I_CLEAR"},         =
    \
> > > > > > > ++              {I_SYNC,                "I_SYNC"},          =
    \
> > > > > > > ++              {I_DIRTY_TIME,          "I_DIRTY_TIME"},    =
    \
> > > > > > > ++              {I_REFERENCED,          "I_REFERENCED"}     =
    \
> > > > > > > ++      )
> > > > > > > ++#elif (LINUX_VERSION_CODE >=3D KERNEL_VERSION(4,0,0))
> > > > > > > + #define show_inode_state(state)                           =
            \
> > > > > > > +       __print_flags(state, "|",                           =
    \
> > > > > > > +               {I_DIRTY_SYNC,          "I_DIRTY_SYNC"},    =
    \
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0008-fi=
x-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch b/meta/recipes-ker=
nel/lttng/lttng-modules/0008-fix-writeback-Fix-sync-livelock-due-to-b_dirty=
_time-.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..7a0d9a38b8
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0008-fix-write=
back-Fix-sync-livelock-due-to-b_dirty_time-.patch
> > > > > > > @@ -0,0 +1,117 @@
> > > > > > > +From 87b2affc3eb06f3fb2d0923f18af37713eb6814b Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Date: Mon, 31 Aug 2020 14:16:01 -0400
> > > > > > > +Subject: [PATCH 08/10] fix: writeback: Fix sync livelock du=
e to b_dirty_time
> > > > > > > + processing (v5.9)
> > > > > > > +
> > > > > > > +See upstream commit:
> > > > > > > +
> > > > > > > +  commit f9cae926f35e8230330f28c7b743ad088611a8de
> > > > > > > +  Author: Jan Kara <jack@suse.cz>
> > > > > > > +  Date:   Fri May 29 16:08:58 2020 +0200
> > > > > > > +
> > > > > > > +    writeback: Fix sync livelock due to b_dirty_time proces=
sing
> > > > > > > +
> > > > > > > +    When we are processing writeback for sync(2), move_expi=
red_inodes()
> > > > > > > +    didn't set any inode expiry value (older_than_this). Th=
is can result in
> > > > > > > +    writeback never completing if there's steady stream of =
inodes added to
> > > > > > > +    b_dirty_time list as writeback rechecks dirty lists aft=
er each writeback
> > > > > > > +    round whether there's more work to be done. Fix the pro=
blem by using
> > > > > > > +    sync(2) start time is inode expiry value when processin=
g b_dirty_time
> > > > > > > +    list similarly as for ordinarily dirtied inodes. This r=
equires some
> > > > > > > +    refactoring of older_than_this handling which simplifie=
s the code
> > > > > > > +    noticeably as a bonus.
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Change-Id: I8b894b13ccc14d9b8983ee4c2810a927c319560b
> > > > > > > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +---
> > > > > > > + .../events/lttng-module/writeback.h           | 39 +++++++=
+++++-------
> > > > > > > + 1 file changed, 26 insertions(+), 13 deletions(-)
> > > > > > > +
> > > > > > > +diff --git a/instrumentation/events/lttng-module/writeback.=
h b/instrumentation/events/lttng-module/writeback.h
> > > > > > > +index ece67ad..e9018dd 100644
> > > > > > > +--- a/instrumentation/events/lttng-module/writeback.h
> > > > > > > ++++ b/instrumentation/events/lttng-module/writeback.h
> > > > > > > +@@ -384,34 +384,48 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(w=
bc_balance_dirty_wait, writeback_wbc_balanc
> > > > > > > + #endif
> > > > > > > + LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeba=
ck_wbc_writepage)
> > > > > > > +
> > > > > > > +-#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,1,0))
> > > > > > > ++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0))
> > > > > > > ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> > > > > > > ++      TP_PROTO(struct bdi_writeback *wb,
> > > > > > > ++               struct wb_writeback_work *work,
> > > > > > > ++               unsigned long dirtied_before,
> > > > > > > ++               int moved),
> > > > > > > ++      TP_ARGS(wb, work, dirtied_before, moved),
> > > > > > > ++      TP_FIELDS(
> > > > > > > ++              ctf_array_text(char, name, dev_name(wb->bdi-=
>dev), 32)
> > > > > > > ++              ctf_integer(unsigned long, older, dirtied_be=
fore)
> > > > > > > ++              ctf_integer(int, moved, moved)
> > > > > > > ++      )
> > > > > > > ++)
> > > > > > > ++#elif (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,2,0))
> > > > > > > + LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> > > > > > > +       TP_PROTO(struct bdi_writeback *wb,
> > > > > > > +-#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,2,0))
> > > > > > > +                struct wb_writeback_work *work,
> > > > > > > +-#else
> > > > > > > +-               unsigned long *older_than_this,
> > > > > > > +-#endif
> > > > > > > +                int moved),
> > > > > > > +-#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,2,0))
> > > > > > > +       TP_ARGS(wb, work, moved),
> > > > > > > +-#else
> > > > > > > ++      TP_FIELDS(
> > > > > > > ++              ctf_array_text(char, name, dev_name(wb->bdi-=
>dev), 32)
> > > > > > > ++              ctf_integer(int, moved, moved)
> > > > > > > ++      )
> > > > > > > ++)
> > > > > > > ++#elif (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,1,0))
> > > > > > > ++LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> > > > > > > ++      TP_PROTO(struct bdi_writeback *wb,
> > > > > > > ++               unsigned long *older_than_this,
> > > > > > > ++               int moved),
> > > > > > > +       TP_ARGS(wb, older_than_this, moved),
> > > > > > > +-#endif
> > > > > > > +       TP_FIELDS(
> > > > > > > +               ctf_array_text(char, name, dev_name(wb->bdi-=
>dev), 32)
> > > > > > > +-#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,2,0))
> > > > > > > +-#else
> > > > > > > +               ctf_integer(unsigned long, older,
> > > > > > > +                       older_than_this ? *older_than_this :=
 0)
> > > > > > > +               ctf_integer(long, age,
> > > > > > > +                       older_than_this ?
> > > > > > > +                               (jiffies - *older_than_this)=
 * 1000 / HZ
> > > > > > > +                               : -1)
> > > > > > > +-#endif
> > > > > > > +               ctf_integer(int, moved, moved)
> > > > > > > +       )
> > > > > > > + )
> > > > > > > ++#endif
> > > > > > > +
> > > > > > > + #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,8,0))
> > > > > > > + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> > > > > > > +@@ -460,7 +474,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty=
_state,
> > > > > > > +               ctf_integer(unsigned long, dirty_limit, glob=
al_dirty_limit)
> > > > > > > +       )
> > > > > > > + )
> > > > > > > +-#else
> > > > > > > ++#elif (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,1,0))
> > > > > > > + LTTNG_TRACEPOINT_EVENT_MAP(global_dirty_state,
> > > > > > > +
> > > > > > > +       writeback_global_dirty_state,
> > > > > > > +@@ -485,7 +499,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(global_dirty=
_state,
> > > > > > > +       )
> > > > > > > + )
> > > > > > > + #endif
> > > > > > > +-#endif
> > > > > > > +
> > > > > > > + #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(3,2,0))
> > > > > > > +
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-fi=
x-version-ranges-for-ext4_discard_preallocations-a.patch b/meta/recipes-ker=
nel/lttng/lttng-modules/0009-fix-version-ranges-for-ext4_discard_preallocat=
ions-a.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..346e1d63ad
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0009-fix-versi=
on-ranges-for-ext4_discard_preallocations-a.patch
> > > > > > > @@ -0,0 +1,52 @@
> > > > > > > +From b74b25f349e92d7b5bdc8684e406d6a889f13773 Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Date: Fri, 4 Sep 2020 11:52:51 -0400
> > > > > > > +Subject: [PATCH 09/10] fix: version ranges for ext4_discard=
_preallocations and
> > > > > > > + writeback_queue_io
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +Change-Id: Id4fa53cb2e713cbda651e1a75deed91013115592
> > > > > > > +---
> > > > > > > + instrumentation/events/lttng-module/ext4.h      | 3 ++-
> > > > > > > + instrumentation/events/lttng-module/writeback.h | 8 ++++++=
+-
> > > > > > > + 2 files changed, 9 insertions(+), 2 deletions(-)
> > > > > > > +
> > > > > > > +diff --git a/instrumentation/events/lttng-module/ext4.h b/i=
nstrumentation/events/lttng-module/ext4.h
> > > > > > > +index 4476abb..b172c8d 100644
> > > > > > > +--- a/instrumentation/events/lttng-module/ext4.h
> > > > > > > ++++ b/instrumentation/events/lttng-module/ext4.h
> > > > > > > +@@ -460,7 +460,8 @@ LTTNG_TRACEPOINT_EVENT(ext4_mb_release_=
group_pa,
> > > > > > > + )
> > > > > > > + #endif
> > > > > > > +
> > > > > > > +-#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0))
> > > > > > > ++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0) || \
> > > > > > > ++      LTTNG_KERNEL_RANGE(5,8,6, 5,9,0))
> > > > > > > + LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
> > > > > > > +       TP_PROTO(struct inode *inode, unsigned int len, unsi=
gned int needed),
> > > > > > > +
> > > > > > > +diff --git a/instrumentation/events/lttng-module/writeback.=
h b/instrumentation/events/lttng-module/writeback.h
> > > > > > > +index e9018dd..09637d7 100644
> > > > > > > +--- a/instrumentation/events/lttng-module/writeback.h
> > > > > > > ++++ b/instrumentation/events/lttng-module/writeback.h
> > > > > > > +@@ -384,7 +384,13 @@ LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wb=
c_balance_dirty_wait, writeback_wbc_balanc
> > > > > > > + #endif
> > > > > > > + LTTNG_TRACEPOINT_EVENT_WBC_INSTANCE(wbc_writepage, writeba=
ck_wbc_writepage)
> > > > > > > +
> > > > > > > +-#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0))
> > > > > > > ++#if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,9,0) || \
> > > > > > > ++      LTTNG_KERNEL_RANGE(5,8,6, 5,9,0) || \
> > > > > > > ++      LTTNG_KERNEL_RANGE(5,4,62, 5,5,0) || \
> > > > > > > ++      LTTNG_KERNEL_RANGE(4,19,143, 4,20,0) || \
> > > > > > > ++      LTTNG_KERNEL_RANGE(4,14,196, 4,15,0) || \
> > > > > > > ++      LTTNG_KERNEL_RANGE(4,9,235, 4,10,0) || \
> > > > > > > ++      LTTNG_KERNEL_RANGE(4,4,235, 4,5,0))
> > > > > > > + LTTNG_TRACEPOINT_EVENT(writeback_queue_io,
> > > > > > > +       TP_PROTO(struct bdi_writeback *wb,
> > > > > > > +                struct wb_writeback_work *work,
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/0010-Fi=
x-system-call-filter-table.patch b/meta/recipes-kernel/lttng/lttng-modules/=
0010-Fix-system-call-filter-table.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..a16750ddb3
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules/0010-Fix-syste=
m-call-filter-table.patch
> > > > > > > @@ -0,0 +1,918 @@
> > > > > > > +From ad594e3a953db1b0c3c059fde45b5a5494f6be78 Mon Sep 17 00=
:00:00 2001
> > > > > > > +From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > > > > > > +Date: Tue, 28 Jan 2020 16:02:44 -0500
> > > > > > > +Subject: [PATCH 10/10] Fix: system call filter table
> > > > > > > +
> > > > > > > +The system call filter table has effectively been unused fo=
r a long
> > > > > > > +time due to system call name prefix mismatch. This means th=
e overhead of
> > > > > > > +selective system call tracing was larger than it should hav=
e been because
> > > > > > > +the event payload preparation would be done for all system =
calls as soon
> > > > > > > +as a single system call is traced.
> > > > > > > +
> > > > > > > +However, fixing this underlying issue unearths several issu=
es that crept
> > > > > > > +unnoticed when the "enabler" concept was introduced (after =
the original
> > > > > > > +implementation of the system call filter table).
> > > > > > > +
> > > > > > > +Here is a list of the issues which are resolved here:
> > > > > > > +
> > > > > > > +- Split lttng_syscalls_unregister into an unregister and de=
stroy
> > > > > > > +  function, thus awaiting for a grace period (and therefore=
 quiescence
> > > > > > > +  of the users) after unregistering the system call tracepo=
ints before
> > > > > > > +  freeing the system call filter data structures. This effe=
ctively fixes
> > > > > > > +  a use-after-free.
> > > > > > > +
> > > > > > > +- The state for enabling "all" system calls vs enabling spe=
cific system
> > > > > > > +  calls (and sequences of enable-disable) was incorrect wit=
h respect to
> > > > > > > +  the "enablers" semantic. This is solved by always trackin=
g the
> > > > > > > +  bitmap of enabled system calls, and keeping this bitmap e=
ven when
> > > > > > > +  enabling all system calls. The sc_filter is now always al=
located
> > > > > > > +  before system call tracing is registered to tracepoints, =
which means
> > > > > > > +  it does not need to be RCU dereferenced anymore.
> > > > > > > +
> > > > > > > +Padding fields in the ABI are reserved to select whether to=
:
> > > > > > > +
> > > > > > > +- Trace either native or compat system call (or both, which=
 is the
> > > > > > > +  behavior currently implemented),
> > > > > > > +- Trace either system call entry or exit (or both, which is=
 the
> > > > > > > +  behavior currently implemented),
> > > > > > > +- Select the system call to trace by name (behavior current=
ly
> > > > > > > +  implemented) or by system call number,
> > > > > > > +
> > > > > > > +Upstream-Status: Backport
> > > > > > > +
> > > > > > > +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficio=
s.com>
> > > > > > > +---
> > > > > > > + lttng-abi.c      |  43 ++++++
> > > > > > > + lttng-abi.h      |  26 ++++
> > > > > > > + lttng-events.c   | 112 +++++++++++++--
> > > > > > > + lttng-events.h   |  31 ++++-
> > > > > > > + lttng-syscalls.c | 348 +++++++++++++++++++++++++----------=
------------
> > > > > > > + 5 files changed, 380 insertions(+), 180 deletions(-)
> > > > > > > +
> > > > > > > +diff --git a/lttng-abi.c b/lttng-abi.c
> > > > > > > +index 64ea99d..b33879d 100644
> > > > > > > +--- a/lttng-abi.c
> > > > > > > ++++ b/lttng-abi.c
> > > > > > > +@@ -1264,6 +1264,46 @@ nomem:
> > > > > > > +       return ret;
> > > > > > > + }
> > > > > > > +
> > > > > > > ++static
> > > > > > > ++int lttng_abi_validate_event_param(struct lttng_kernel_eve=
nt *event_param)
> > > > > > > ++{
> > > > > > > ++      /* Limit ABI to implemented features. */
> > > > > > > ++      switch (event_param->instrumentation) {
> > > > > > > ++      case LTTNG_KERNEL_SYSCALL:
> > > > > > > ++              switch (event_param->u.syscall.entryexit) {
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ENTRYEXIT:
> > > > > > > ++                      break;
> > > > > > > ++              default:
> > > > > > > ++                      return -EINVAL;
> > > > > > > ++              }
> > > > > > > ++              switch (event_param->u.syscall.abi) {
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ABI_ALL:
> > > > > > > ++                      break;
> > > > > > > ++              default:
> > > > > > > ++                      return -EINVAL;
> > > > > > > ++              }
> > > > > > > ++              switch (event_param->u.syscall.match) {
> > > > > > > ++              case LTTNG_SYSCALL_MATCH_NAME:
> > > > > > > ++                      break;
> > > > > > > ++              default:
> > > > > > > ++                      return -EINVAL;
> > > > > > > ++              }
> > > > > > > ++              break;
> > > > > > > ++
> > > > > > > ++      case LTTNG_KERNEL_TRACEPOINT:   /* Fallthrough */
> > > > > > > ++      case LTTNG_KERNEL_KPROBE:       /* Fallthrough */
> > > > > > > ++      case LTTNG_KERNEL_KRETPROBE:    /* Fallthrough */
> > > > > > > ++      case LTTNG_KERNEL_NOOP:         /* Fallthrough */
> > > > > > > ++      case LTTNG_KERNEL_UPROBE:
> > > > > > > ++              break;
> > > > > > > ++
> > > > > > > ++      case LTTNG_KERNEL_FUNCTION:     /* Fallthrough */
> > > > > > > ++      default:
> > > > > > > ++              return -EINVAL;
> > > > > > > ++      }
> > > > > > > ++      return 0;
> > > > > > > ++}
> > > > > > > ++
> > > > > > > + static
> > > > > > > + int lttng_abi_create_event(struct file *channel_file,
> > > > > > > +                          struct lttng_kernel_event *event_=
param)
> > > > > > > +@@ -1305,6 +1345,9 @@ int lttng_abi_create_event(struct fil=
e *channel_file,
> > > > > > > +               ret =3D -EOVERFLOW;
> > > > > > > +               goto refcount_error;
> > > > > > > +       }
> > > > > > > ++      ret =3D lttng_abi_validate_event_param(event_param);
> > > > > > > ++      if (ret)
> > > > > > > ++              goto event_error;
> > > > > > > +       if (event_param->instrumentation =3D=3D LTTNG_KERNEL=
_TRACEPOINT
> > > > > > > +                       || event_param->instrumentation =3D=
=3D LTTNG_KERNEL_SYSCALL) {
> > > > > > > +               struct lttng_enabler *enabler;
> > > > > > > +diff --git a/lttng-abi.h b/lttng-abi.h
> > > > > > > +index 1d356ab..51d60e5 100644
> > > > > > > +--- a/lttng-abi.h
> > > > > > > ++++ b/lttng-abi.h
> > > > > > > +@@ -90,6 +90,31 @@ struct lttng_kernel_event_callsite {
> > > > > > > +       } u;
> > > > > > > + } __attribute__((packed));
> > > > > > > +
> > > > > > > ++enum lttng_kernel_syscall_entryexit {
> > > > > > > ++      LTTNG_KERNEL_SYSCALL_ENTRYEXIT =3D 0,
> > > > > > > ++      LTTNG_KERNEL_SYSCALL_ENTRY =3D 1,         /* Not imp=
lemented. */
> > > > > > > ++      LTTNG_KERNEL_SYSCALL_EXIT =3D 2,          /* Not imp=
lemented. */
> > > > > > > ++};
> > > > > > > ++
> > > > > > > ++enum lttng_kernel_syscall_abi {
> > > > > > > ++      LTTNG_KERNEL_SYSCALL_ABI_ALL =3D 0,
> > > > > > > ++      LTTNG_KERNEL_SYSCALL_ABI_NATIVE =3D 1,    /* Not imp=
lemented. */
> > > > > > > ++      LTTNG_KERNEL_SYSCALL_ABI_COMPAT =3D 2,    /* Not imp=
lemented. */
> > > > > > > ++};
> > > > > > > ++
> > > > > > > ++enum lttng_kernel_syscall_match {
> > > > > > > ++      LTTNG_SYSCALL_MATCH_NAME =3D 0,
> > > > > > > ++      LTTNG_SYSCALL_MATCH_NR =3D 1,             /* Not imp=
lemented. */
> > > > > > > ++};
> > > > > > > ++
> > > > > > > ++struct lttng_kernel_syscall {
> > > > > > > ++      uint8_t entryexit;      /* enum lttng_kernel_syscall=
_entryexit */
> > > > > > > ++      uint8_t abi;            /* enum lttng_kernel_syscall=
_abi */
> > > > > > > ++      uint8_t match;          /* enum lttng_kernel_syscall=
_match */
> > > > > > > ++      uint8_t padding;
> > > > > > > ++      uint32_t nr;            /* For LTTNG_SYSCALL_MATCH_N=
R */
> > > > > > > ++} __attribute__((packed));
> > > > > > > ++
> > > > > > > + /*
> > > > > > > +  * For syscall tracing, name =3D "*" means "enable all".
> > > > > > > +  */
> > > > > > > +@@ -106,6 +131,7 @@ struct lttng_kernel_event {
> > > > > > > +               struct lttng_kernel_kprobe kprobe;
> > > > > > > +               struct lttng_kernel_function_tracer ftrace;
> > > > > > > +               struct lttng_kernel_uprobe uprobe;
> > > > > > > ++              struct lttng_kernel_syscall syscall;
> > > > > > > +               char padding[LTTNG_KERNEL_EVENT_PADDING2];
> > > > > > > +       } u;
> > > > > > > + } __attribute__((packed));
> > > > > > > +diff --git a/lttng-events.c b/lttng-events.c
> > > > > > > +index d719294..4c0b04a 100644
> > > > > > > +--- a/lttng-events.c
> > > > > > > ++++ b/lttng-events.c
> > > > > > > +@@ -201,6 +201,10 @@ void lttng_session_destroy(struct lttn=
g_session *session)
> > > > > > > +               WARN_ON(ret);
> > > > > > > +       }
> > > > > > > +       synchronize_trace();    /* Wait for in-flight events=
 to complete */
> > > > > > > ++      list_for_each_entry(chan, &session->chan, list) {
> > > > > > > ++              ret =3D lttng_syscalls_destroy(chan);
> > > > > > > ++              WARN_ON(ret);
> > > > > > > ++      }
> > > > > > > +       list_for_each_entry_safe(enabler, tmpenabler,
> > > > > > > +                       &session->enablers_head, node)
> > > > > > > +               lttng_enabler_destroy(enabler);
> > > > > > > +@@ -740,6 +744,28 @@ struct lttng_event *_lttng_event_creat=
e(struct lttng_channel *chan,
> > > > > > > +               event->enabled =3D 0;
> > > > > > > +               event->registered =3D 0;
> > > > > > > +               event->desc =3D event_desc;
> > > > > > > ++              switch (event_param->u.syscall.entryexit) {
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ENTRYEXIT:
> > > > > > > ++                      ret =3D -EINVAL;
> > > > > > > ++                      goto register_error;
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ENTRY:
> > > > > > > ++                      event->u.syscall.entryexit =3D LTTNG=
_SYSCALL_ENTRY;
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_EXIT:
> > > > > > > ++                      event->u.syscall.entryexit =3D LTTNG=
_SYSCALL_EXIT;
> > > > > > > ++                      break;
> > > > > > > ++              }
> > > > > > > ++              switch (event_param->u.syscall.abi) {
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ABI_ALL:
> > > > > > > ++                      ret =3D -EINVAL;
> > > > > > > ++                      goto register_error;
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ABI_NATIVE:
> > > > > > > ++                      event->u.syscall.abi =3D LTTNG_SYSCA=
LL_ABI_NATIVE;
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ABI_COMPAT:
> > > > > > > ++                      event->u.syscall.abi =3D LTTNG_SYSCA=
LL_ABI_COMPAT;
> > > > > > > ++                      break;
> > > > > > > ++              }
> > > > > > > +               if (!event->desc) {
> > > > > > > +                       ret =3D -EINVAL;
> > > > > > > +                       goto register_error;
> > > > > > > +@@ -826,8 +852,7 @@ void register_event(struct lttng_event =
*event)
> > > > > > > +                                                 event);
> > > > > > > +               break;
> > > > > > > +       case LTTNG_KERNEL_SYSCALL:
> > > > > > > +-              ret =3D lttng_syscall_filter_enable(event->c=
han,
> > > > > > > +-                      desc->name);
> > > > > > > ++              ret =3D lttng_syscall_filter_enable(event->c=
han, event);
> > > > > > > +               break;
> > > > > > > +       case LTTNG_KERNEL_KPROBE:
> > > > > > > +       case LTTNG_KERNEL_UPROBE:
> > > > > > > +@@ -870,8 +895,7 @@ int _lttng_event_unregister(struct lttn=
g_event *event)
> > > > > > > +               ret =3D 0;
> > > > > > > +               break;
> > > > > > > +       case LTTNG_KERNEL_SYSCALL:
> > > > > > > +-              ret =3D lttng_syscall_filter_disable(event->=
chan,
> > > > > > > +-                      desc->name);
> > > > > > > ++              ret =3D lttng_syscall_filter_disable(event->=
chan, event);
> > > > > > > +               break;
> > > > > > > +       case LTTNG_KERNEL_NOOP:
> > > > > > > +               ret =3D 0;
> > > > > > > +@@ -1203,39 +1227,87 @@ int lttng_desc_match_enabler(const =
struct lttng_event_desc *desc,
> > > > > > > +               struct lttng_enabler *enabler)
> > > > > > > + {
> > > > > > > +       const char *desc_name, *enabler_name;
> > > > > > > ++      bool compat =3D false, entry =3D false;
> > > > > > > +
> > > > > > > +       enabler_name =3D enabler->event_param.name;
> > > > > > > +       switch (enabler->event_param.instrumentation) {
> > > > > > > +       case LTTNG_KERNEL_TRACEPOINT:
> > > > > > > +               desc_name =3D desc->name;
> > > > > > > ++              switch (enabler->type) {
> > > > > > > ++              case LTTNG_ENABLER_STAR_GLOB:
> > > > > > > ++                      return lttng_match_enabler_star_glob=
(desc_name, enabler_name);
> > > > > > > ++              case LTTNG_ENABLER_NAME:
> > > > > > > ++                      return lttng_match_enabler_name(desc=
_name, enabler_name);
> > > > > > > ++              default:
> > > > > > > ++                      return -EINVAL;
> > > > > > > ++              }
> > > > > > > +               break;
> > > > > > > +       case LTTNG_KERNEL_SYSCALL:
> > > > > > > +               desc_name =3D desc->name;
> > > > > > > +-              if (!strncmp(desc_name, "compat_", strlen("c=
ompat_")))
> > > > > > > ++              if (!strncmp(desc_name, "compat_", strlen("c=
ompat_"))) {
> > > > > > > +                       desc_name +=3D strlen("compat_");
> > > > > > > ++                      compat =3D true;
> > > > > > > ++              }
> > > > > > > +               if (!strncmp(desc_name, "syscall_exit_",
> > > > > > > +                               strlen("syscall_exit_"))) {
> > > > > > > +                       desc_name +=3D strlen("syscall_exit_=
");
> > > > > > > +               } else if (!strncmp(desc_name, "syscall_entr=
y_",
> > > > > > > +                               strlen("syscall_entry_"))) {
> > > > > > > +                       desc_name +=3D strlen("syscall_entry=
_");
> > > > > > > ++                      entry =3D true;
> > > > > > > +               } else {
> > > > > > > +                       WARN_ON_ONCE(1);
> > > > > > > +                       return -EINVAL;
> > > > > > > +               }
> > > > > > > ++              switch (enabler->event_param.u.syscall.entry=
exit) {
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ENTRYEXIT:
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ENTRY:
> > > > > > > ++                      if (!entry)
> > > > > > > ++                              return 0;
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_EXIT:
> > > > > > > ++                      if (entry)
> > > > > > > ++                              return 0;
> > > > > > > ++                      break;
> > > > > > > ++              default:
> > > > > > > ++                      return -EINVAL;
> > > > > > > ++              }
> > > > > > > ++              switch (enabler->event_param.u.syscall.abi) =
{
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ABI_ALL:
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ABI_NATIVE:
> > > > > > > ++                      if (compat)
> > > > > > > ++                              return 0;
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_KERNEL_SYSCALL_ABI_COMPAT:
> > > > > > > ++                      if (!compat)
> > > > > > > ++                              return 0;
> > > > > > > ++                      break;
> > > > > > > ++              default:
> > > > > > > ++                      return -EINVAL;
> > > > > > > ++              }
> > > > > > > ++              switch (enabler->event_param.u.syscall.match=
) {
> > > > > > > ++              case LTTNG_SYSCALL_MATCH_NAME:
> > > > > > > ++                      switch (enabler->type) {
> > > > > > > ++                      case LTTNG_ENABLER_STAR_GLOB:
> > > > > > > ++                              return lttng_match_enabler_s=
tar_glob(desc_name, enabler_name);
> > > > > > > ++                      case LTTNG_ENABLER_NAME:
> > > > > > > ++                              return lttng_match_enabler_n=
ame(desc_name, enabler_name);
> > > > > > > ++                      default:
> > > > > > > ++                              return -EINVAL;
> > > > > > > ++                      }
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_SYSCALL_MATCH_NR:
> > > > > > > ++                      return -EINVAL; /* Not implemented. =
*/
> > > > > > > ++              default:
> > > > > > > ++                      return -EINVAL;
> > > > > > > ++              }
> > > > > > > +               break;
> > > > > > > +       default:
> > > > > > > +               WARN_ON_ONCE(1);
> > > > > > > +               return -EINVAL;
> > > > > > > +       }
> > > > > > > +-      switch (enabler->type) {
> > > > > > > +-      case LTTNG_ENABLER_STAR_GLOB:
> > > > > > > +-              return lttng_match_enabler_star_glob(desc_na=
me, enabler_name);
> > > > > > > +-      case LTTNG_ENABLER_NAME:
> > > > > > > +-              return lttng_match_enabler_name(desc_name, e=
nabler_name);
> > > > > > > +-      default:
> > > > > > > +-              return -EINVAL;
> > > > > > > +-      }
> > > > > > > + }
> > > > > > > +
> > > > > > > + static
> > > > > > > +@@ -1361,9 +1433,21 @@ void lttng_create_event_if_missing(s=
truct lttng_enabler *enabler)
> > > > > > > + static
> > > > > > > + int lttng_enabler_ref_events(struct lttng_enabler *enabler=
)
> > > > > > > + {
> > > > > > > +-      struct lttng_session *session =3D enabler->chan->ses=
sion;
> > > > > > > ++      struct lttng_channel *chan =3D enabler->chan;
> > > > > > > ++      struct lttng_session *session =3D chan->session;
> > > > > > > +       struct lttng_event *event;
> > > > > > > +
> > > > > > > ++      if (enabler->event_param.instrumentation =3D=3D LTTN=
G_KERNEL_SYSCALL &&
> > > > > > > ++                      enabler->event_param.u.syscall.entry=
exit =3D=3D LTTNG_KERNEL_SYSCALL_ENTRYEXIT &&
> > > > > > > ++                      enabler->event_param.u.syscall.abi =
=3D=3D LTTNG_KERNEL_SYSCALL_ABI_ALL &&
> > > > > > > ++                      enabler->event_param.u.syscall.match=
 =3D=3D LTTNG_SYSCALL_MATCH_NAME &&
> > > > > > > ++                      !strcmp(enabler->event_param.name, "=
*")) {
> > > > > > > ++              if (enabler->enabled)
> > > > > > > ++                      WRITE_ONCE(chan->syscall_all, 1);
> > > > > > > ++              else
> > > > > > > ++                      WRITE_ONCE(chan->syscall_all, 0);
> > > > > > > ++      }
> > > > > > > ++
> > > > > > > +       /* First ensure that probe events are created for th=
is enabler. */
> > > > > > > +       lttng_create_event_if_missing(enabler);
> > > > > > > +
> > > > > > > +diff --git a/lttng-events.h b/lttng-events.h
> > > > > > > +index a36a312..d4d9976 100644
> > > > > > > +--- a/lttng-events.h
> > > > > > > ++++ b/lttng-events.h
> > > > > > > +@@ -292,6 +292,16 @@ struct lttng_uprobe_handler {
> > > > > > > +       struct list_head node;
> > > > > > > + };
> > > > > > > +
> > > > > > > ++enum lttng_syscall_entryexit {
> > > > > > > ++      LTTNG_SYSCALL_ENTRY,
> > > > > > > ++      LTTNG_SYSCALL_EXIT,
> > > > > > > ++};
> > > > > > > ++
> > > > > > > ++enum lttng_syscall_abi {
> > > > > > > ++      LTTNG_SYSCALL_ABI_NATIVE,
> > > > > > > ++      LTTNG_SYSCALL_ABI_COMPAT,
> > > > > > > ++};
> > > > > > > ++
> > > > > > > + /*
> > > > > > > +  * lttng_event structure is referred to by the tracing fas=
t path. It must be
> > > > > > > +  * kept small.
> > > > > > > +@@ -318,6 +328,11 @@ struct lttng_event {
> > > > > > > +                       struct inode *inode;
> > > > > > > +                       struct list_head head;
> > > > > > > +               } uprobe;
> > > > > > > ++              struct {
> > > > > > > ++                      char *syscall_name;
> > > > > > > ++                      enum lttng_syscall_entryexit entryex=
it;
> > > > > > > ++                      enum lttng_syscall_abi abi;
> > > > > > > ++              } syscall;
> > > > > > > +       } u;
> > > > > > > +       struct list_head list;          /* Event list in ses=
sion */
> > > > > > > +       unsigned int metadata_dumped:1;
> > > > > > > +@@ -457,10 +472,10 @@ struct lttng_channel {
> > > > > > > +       struct lttng_syscall_filter *sc_filter;
> > > > > > > +       int header_type;                /* 0: unset, 1: comp=
act, 2: large */
> > > > > > > +       enum channel_type channel_type;
> > > > > > > ++      int syscall_all;
> > > > > > > +       unsigned int metadata_dumped:1,
> > > > > > > +               sys_enter_registered:1,
> > > > > > > +               sys_exit_registered:1,
> > > > > > > +-              syscall_all:1,
> > > > > > > +               tstate:1;               /* Transient enable =
state */
> > > > > > > + };
> > > > > > > +
> > > > > > > +@@ -653,10 +668,11 @@ void lttng_clock_unref(void);
> > > > > > > + #if defined(CONFIG_HAVE_SYSCALL_TRACEPOINTS)
> > > > > > > + int lttng_syscalls_register(struct lttng_channel *chan, vo=
id *filter);
> > > > > > > + int lttng_syscalls_unregister(struct lttng_channel *chan);
> > > > > > > ++int lttng_syscalls_destroy(struct lttng_channel *chan);
> > > > > > > + int lttng_syscall_filter_enable(struct lttng_channel *chan=
,
> > > > > > > +-              const char *name);
> > > > > > > ++              struct lttng_event *event);
> > > > > > > + int lttng_syscall_filter_disable(struct lttng_channel *cha=
n,
> > > > > > > +-              const char *name);
> > > > > > > ++              struct lttng_event *event);
> > > > > > > + long lttng_channel_syscall_mask(struct lttng_channel *chan=
nel,
> > > > > > > +               struct lttng_kernel_syscall_mask __user *usy=
scall_mask);
> > > > > > > + #else
> > > > > > > +@@ -670,14 +686,19 @@ static inline int lttng_syscalls_unre=
gister(struct lttng_channel *chan)
> > > > > > > +       return 0;
> > > > > > > + }
> > > > > > > +
> > > > > > > ++static inline int lttng_syscalls_destroy(struct lttng_chan=
nel *chan)
> > > > > > > ++{
> > > > > > > ++      return 0;
> > > > > > > ++}
> > > > > > > ++
> > > > > > > + static inline int lttng_syscall_filter_enable(struct lttng=
_channel *chan,
> > > > > > > +-              const char *name)
> > > > > > > ++              struct lttng_event *event);
> > > > > > > + {
> > > > > > > +       return -ENOSYS;
> > > > > > > + }
> > > > > > > +
> > > > > > > + static inline int lttng_syscall_filter_disable(struct lttn=
g_channel *chan,
> > > > > > > +-              const char *name)
> > > > > > > ++              struct lttng_event *event);
> > > > > > > + {
> > > > > > > +       return -ENOSYS;
> > > > > > > + }
> > > > > > > +diff --git a/lttng-syscalls.c b/lttng-syscalls.c
> > > > > > > +index 97f1ba9..26cead6 100644
> > > > > > > +--- a/lttng-syscalls.c
> > > > > > > ++++ b/lttng-syscalls.c
> > > > > > > +@@ -367,8 +367,10 @@ const struct trace_syscall_entry compa=
t_sc_exit_table[] =3D {
> > > > > > > + #undef CREATE_SYSCALL_TABLE
> > > > > > > +
> > > > > > > + struct lttng_syscall_filter {
> > > > > > > +-      DECLARE_BITMAP(sc, NR_syscalls);
> > > > > > > +-      DECLARE_BITMAP(sc_compat, NR_compat_syscalls);
> > > > > > > ++      DECLARE_BITMAP(sc_entry, NR_syscalls);
> > > > > > > ++      DECLARE_BITMAP(sc_exit, NR_syscalls);
> > > > > > > ++      DECLARE_BITMAP(sc_compat_entry, NR_compat_syscalls);
> > > > > > > ++      DECLARE_BITMAP(sc_compat_exit, NR_compat_syscalls);
> > > > > > > + };
> > > > > > > +
> > > > > > > + static void syscall_entry_unknown(struct lttng_event *even=
t,
> > > > > > > +@@ -391,29 +393,23 @@ void syscall_entry_probe(void *__data=
, struct pt_regs *regs, long id)
> > > > > > > +       size_t table_len;
> > > > > > > +
> > > > > > > +       if (unlikely(in_compat_syscall())) {
> > > > > > > +-              struct lttng_syscall_filter *filter;
> > > > > > > +-
> > > > > > > +-              filter =3D lttng_rcu_dereference(chan->sc_fi=
lter);
> > > > > > > +-              if (filter) {
> > > > > > > +-                      if (id < 0 || id >=3D NR_compat_sysc=
alls
> > > > > > > +-                              || !test_bit(id, filter->sc_=
compat)) {
> > > > > > > +-                              /* System call filtered out.=
 */
> > > > > > > +-                              return;
> > > > > > > +-                      }
> > > > > > > ++              struct lttng_syscall_filter *filter =3D chan=
->sc_filter;
> > > > > > > ++
> > > > > > > ++              if (id < 0 || id >=3D NR_compat_syscalls
> > > > > > > ++                      || (!READ_ONCE(chan->syscall_all) &&=
 !test_bit(id, filter->sc_compat_entry))) {
> > > > > > > ++                      /* System call filtered out. */
> > > > > > > ++                      return;
> > > > > > > +               }
> > > > > > > +               table =3D compat_sc_table;
> > > > > > > +               table_len =3D ARRAY_SIZE(compat_sc_table);
> > > > > > > +               unknown_event =3D chan->sc_compat_unknown;
> > > > > > > +       } else {
> > > > > > > +-              struct lttng_syscall_filter *filter;
> > > > > > > +-
> > > > > > > +-              filter =3D lttng_rcu_dereference(chan->sc_fi=
lter);
> > > > > > > +-              if (filter) {
> > > > > > > +-                      if (id < 0 || id >=3D NR_syscalls
> > > > > > > +-                              || !test_bit(id, filter->sc)=
) {
> > > > > > > +-                              /* System call filtered out.=
 */
> > > > > > > +-                              return;
> > > > > > > +-                      }
> > > > > > > ++              struct lttng_syscall_filter *filter =3D chan=
->sc_filter;
> > > > > > > ++
> > > > > > > ++              if (id < 0 || id >=3D NR_syscalls
> > > > > > > ++                      || (!READ_ONCE(chan->syscall_all) &&=
 !test_bit(id, filter->sc_entry))) {
> > > > > > > ++                      /* System call filtered out. */
> > > > > > > ++                      return;
> > > > > > > +               }
> > > > > > > +               table =3D sc_table;
> > > > > > > +               table_len =3D ARRAY_SIZE(sc_table);
> > > > > > > +@@ -545,29 +541,23 @@ void syscall_exit_probe(void *__data,=
 struct pt_regs *regs, long ret)
> > > > > > > +
> > > > > > > +       id =3D syscall_get_nr(current, regs);
> > > > > > > +       if (unlikely(in_compat_syscall())) {
> > > > > > > +-              struct lttng_syscall_filter *filter;
> > > > > > > +-
> > > > > > > +-              filter =3D lttng_rcu_dereference(chan->sc_fi=
lter);
> > > > > > > +-              if (filter) {
> > > > > > > +-                      if (id < 0 || id >=3D NR_compat_sysc=
alls
> > > > > > > +-                              || !test_bit(id, filter->sc_=
compat)) {
> > > > > > > +-                              /* System call filtered out.=
 */
> > > > > > > +-                              return;
> > > > > > > +-                      }
> > > > > > > ++              struct lttng_syscall_filter *filter =3D chan=
->sc_filter;
> > > > > > > ++
> > > > > > > ++              if (id < 0 || id >=3D NR_compat_syscalls
> > > > > > > ++                      || (!READ_ONCE(chan->syscall_all) &&=
 !test_bit(id, filter->sc_compat_exit))) {
> > > > > > > ++                      /* System call filtered out. */
> > > > > > > ++                      return;
> > > > > > > +               }
> > > > > > > +               table =3D compat_sc_exit_table;
> > > > > > > +               table_len =3D ARRAY_SIZE(compat_sc_exit_tabl=
e);
> > > > > > > +               unknown_event =3D chan->compat_sc_exit_unkno=
wn;
> > > > > > > +       } else {
> > > > > > > +-              struct lttng_syscall_filter *filter;
> > > > > > > +-
> > > > > > > +-              filter =3D lttng_rcu_dereference(chan->sc_fi=
lter);
> > > > > > > +-              if (filter) {
> > > > > > > +-                      if (id < 0 || id >=3D NR_syscalls
> > > > > > > +-                              || !test_bit(id, filter->sc)=
) {
> > > > > > > +-                              /* System call filtered out.=
 */
> > > > > > > +-                              return;
> > > > > > > +-                      }
> > > > > > > ++              struct lttng_syscall_filter *filter =3D chan=
->sc_filter;
> > > > > > > ++
> > > > > > > ++              if (id < 0 || id >=3D NR_syscalls
> > > > > > > ++                      || (!READ_ONCE(chan->syscall_all) &&=
 !test_bit(id, filter->sc_exit))) {
> > > > > > > ++                      /* System call filtered out. */
> > > > > > > ++                      return;
> > > > > > > +               }
> > > > > > > +               table =3D sc_exit_table;
> > > > > > > +               table_len =3D ARRAY_SIZE(sc_exit_table);
> > > > > > > +@@ -713,27 +703,23 @@ int fill_table(const struct trace_sys=
call_entry *table, size_t table_len,
> > > > > > > +               memset(&ev, 0, sizeof(ev));
> > > > > > > +               switch (type) {
> > > > > > > +               case SC_TYPE_ENTRY:
> > > > > > > +-                      strncpy(ev.name, SYSCALL_ENTRY_STR,
> > > > > > > +-                              LTTNG_KERNEL_SYM_NAME_LEN);
> > > > > > > ++                      ev.u.syscall.entryexit =3D LTTNG_KER=
NEL_SYSCALL_ENTRY;
> > > > > > > ++                      ev.u.syscall.abi =3D LTTNG_KERNEL_SY=
SCALL_ABI_NATIVE;
> > > > > > > +                       break;
> > > > > > > +               case SC_TYPE_EXIT:
> > > > > > > +-                      strncpy(ev.name, SYSCALL_EXIT_STR,
> > > > > > > +-                              LTTNG_KERNEL_SYM_NAME_LEN);
> > > > > > > ++                      ev.u.syscall.entryexit =3D LTTNG_KER=
NEL_SYSCALL_EXIT;
> > > > > > > ++                      ev.u.syscall.abi =3D LTTNG_KERNEL_SY=
SCALL_ABI_NATIVE;
> > > > > > > +                       break;
> > > > > > > +               case SC_TYPE_COMPAT_ENTRY:
> > > > > > > +-                      strncpy(ev.name, COMPAT_SYSCALL_ENTR=
Y_STR,
> > > > > > > +-                              LTTNG_KERNEL_SYM_NAME_LEN);
> > > > > > > ++                      ev.u.syscall.entryexit =3D LTTNG_KER=
NEL_SYSCALL_ENTRY;
> > > > > > > ++                      ev.u.syscall.abi =3D LTTNG_KERNEL_SY=
SCALL_ABI_COMPAT;
> > > > > > > +                       break;
> > > > > > > +               case SC_TYPE_COMPAT_EXIT:
> > > > > > > +-                      strncpy(ev.name, COMPAT_SYSCALL_EXIT=
_STR,
> > > > > > > +-                              LTTNG_KERNEL_SYM_NAME_LEN);
> > > > > > > +-                      break;
> > > > > > > +-              default:
> > > > > > > +-                      BUG_ON(1);
> > > > > > > ++                      ev.u.syscall.entryexit =3D LTTNG_KER=
NEL_SYSCALL_EXIT;
> > > > > > > ++                      ev.u.syscall.abi =3D LTTNG_KERNEL_SY=
SCALL_ABI_COMPAT;
> > > > > > > +                       break;
> > > > > > > +               }
> > > > > > > +-              strncat(ev.name, desc->name,
> > > > > > > +-                      LTTNG_KERNEL_SYM_NAME_LEN - strlen(e=
v.name) - 1);
> > > > > > > ++              strncpy(ev.name, desc->name, LTTNG_KERNEL_SY=
M_NAME_LEN);
> > > > > > > +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] =3D '=
\0';
> > > > > > > +               ev.instrumentation =3D LTTNG_KERNEL_SYSCALL;
> > > > > > > +               chan_table[i] =3D _lttng_event_create(chan, =
&ev, filter,
> > > > > > > +@@ -803,6 +789,8 @@ int lttng_syscalls_register(struct lttn=
g_channel *chan, void *filter)
> > > > > > > +               strncpy(ev.name, desc->name, LTTNG_KERNEL_SY=
M_NAME_LEN);
> > > > > > > +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] =3D '=
\0';
> > > > > > > +               ev.instrumentation =3D LTTNG_KERNEL_SYSCALL;
> > > > > > > ++              ev.u.syscall.entryexit =3D LTTNG_KERNEL_SYSC=
ALL_ENTRY;
> > > > > > > ++              ev.u.syscall.abi =3D LTTNG_KERNEL_SYSCALL_AB=
I_NATIVE;
> > > > > > > +               chan->sc_unknown =3D _lttng_event_create(cha=
n, &ev, filter,
> > > > > > > +                                               desc,
> > > > > > > +                                               ev.instrumen=
tation);
> > > > > > > +@@ -820,6 +808,8 @@ int lttng_syscalls_register(struct lttn=
g_channel *chan, void *filter)
> > > > > > > +               strncpy(ev.name, desc->name, LTTNG_KERNEL_SY=
M_NAME_LEN);
> > > > > > > +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] =3D '=
\0';
> > > > > > > +               ev.instrumentation =3D LTTNG_KERNEL_SYSCALL;
> > > > > > > ++              ev.u.syscall.entryexit =3D LTTNG_KERNEL_SYSC=
ALL_ENTRY;
> > > > > > > ++              ev.u.syscall.abi =3D LTTNG_KERNEL_SYSCALL_AB=
I_COMPAT;
> > > > > > > +               chan->sc_compat_unknown =3D _lttng_event_cre=
ate(chan, &ev, filter,
> > > > > > > +                                               desc,
> > > > > > > +                                               ev.instrumen=
tation);
> > > > > > > +@@ -837,6 +827,8 @@ int lttng_syscalls_register(struct lttn=
g_channel *chan, void *filter)
> > > > > > > +               strncpy(ev.name, desc->name, LTTNG_KERNEL_SY=
M_NAME_LEN);
> > > > > > > +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] =3D '=
\0';
> > > > > > > +               ev.instrumentation =3D LTTNG_KERNEL_SYSCALL;
> > > > > > > ++              ev.u.syscall.entryexit =3D LTTNG_KERNEL_SYSC=
ALL_EXIT;
> > > > > > > ++              ev.u.syscall.abi =3D LTTNG_KERNEL_SYSCALL_AB=
I_COMPAT;
> > > > > > > +               chan->compat_sc_exit_unknown =3D _lttng_even=
t_create(chan, &ev,
> > > > > > > +                                               filter, desc=
,
> > > > > > > +                                               ev.instrumen=
tation);
> > > > > > > +@@ -854,6 +846,8 @@ int lttng_syscalls_register(struct lttn=
g_channel *chan, void *filter)
> > > > > > > +               strncpy(ev.name, desc->name, LTTNG_KERNEL_SY=
M_NAME_LEN);
> > > > > > > +               ev.name[LTTNG_KERNEL_SYM_NAME_LEN - 1] =3D '=
\0';
> > > > > > > +               ev.instrumentation =3D LTTNG_KERNEL_SYSCALL;
> > > > > > > ++              ev.u.syscall.entryexit =3D LTTNG_KERNEL_SYSC=
ALL_EXIT;
> > > > > > > ++              ev.u.syscall.abi =3D LTTNG_KERNEL_SYSCALL_AB=
I_NATIVE;
> > > > > > > +               chan->sc_exit_unknown =3D _lttng_event_creat=
e(chan, &ev, filter,
> > > > > > > +                                               desc, ev.ins=
trumentation);
> > > > > > > +               WARN_ON_ONCE(!chan->sc_exit_unknown);
> > > > > > > +@@ -883,6 +877,14 @@ int lttng_syscalls_register(struct ltt=
ng_channel *chan, void *filter)
> > > > > > > +       if (ret)
> > > > > > > +               return ret;
> > > > > > > + #endif
> > > > > > > ++
> > > > > > > ++      if (!chan->sc_filter) {
> > > > > > > ++              chan->sc_filter =3D kzalloc(sizeof(struct lt=
tng_syscall_filter),
> > > > > > > ++                              GFP_KERNEL);
> > > > > > > ++              if (!chan->sc_filter)
> > > > > > > ++                      return -ENOMEM;
> > > > > > > ++      }
> > > > > > > ++
> > > > > > > +       if (!chan->sys_enter_registered) {
> > > > > > > +               ret =3D lttng_wrapper_tracepoint_probe_regis=
ter("sys_enter",
> > > > > > > +                               (void *) syscall_entry_probe=
, chan);
> > > > > > > +@@ -930,7 +932,11 @@ int lttng_syscalls_unregister(struct l=
ttng_channel *chan)
> > > > > > > +                       return ret;
> > > > > > > +               chan->sys_exit_registered =3D 0;
> > > > > > > +       }
> > > > > > > +-      /* lttng_event destroy will be performed by lttng_se=
ssion_destroy() */
> > > > > > > ++      return 0;
> > > > > > > ++}
> > > > > > > ++
> > > > > > > ++int lttng_syscalls_destroy(struct lttng_channel *chan)
> > > > > > > ++{
> > > > > > > +       kfree(chan->sc_table);
> > > > > > > +       kfree(chan->sc_exit_table);
> > > > > > > + #ifdef CONFIG_COMPAT
> > > > > > > +@@ -993,136 +999,150 @@ uint32_t get_sc_tables_len(void)
> > > > > > > +       return ARRAY_SIZE(sc_table) + ARRAY_SIZE(compat_sc_t=
able);
> > > > > > > + }
> > > > > > > +
> > > > > > > +-int lttng_syscall_filter_enable(struct lttng_channel *chan=
,
> > > > > > > +-              const char *name)
> > > > > > > ++static
> > > > > > > ++const char *get_syscall_name(struct lttng_event *event)
> > > > > > > + {
> > > > > > > +-      int syscall_nr, compat_syscall_nr, ret;
> > > > > > > +-      struct lttng_syscall_filter *filter;
> > > > > > > ++      size_t prefix_len =3D 0;
> > > > > > > +
> > > > > > > +-      WARN_ON_ONCE(!chan->sc_table);
> > > > > > > ++      WARN_ON_ONCE(event->instrumentation !=3D LTTNG_KERNE=
L_SYSCALL);
> > > > > > > +
> > > > > > > +-      if (!name) {
> > > > > > > +-              /* Enable all system calls by removing filte=
r */
> > > > > > > +-              if (chan->sc_filter) {
> > > > > > > +-                      filter =3D chan->sc_filter;
> > > > > > > +-                      rcu_assign_pointer(chan->sc_filter, =
NULL);
> > > > > > > +-                      synchronize_trace();
> > > > > > > +-                      kfree(filter);
> > > > > > > ++      switch (event->u.syscall.entryexit) {
> > > > > > > ++      case LTTNG_SYSCALL_ENTRY:
> > > > > > > ++              switch (event->u.syscall.abi) {
> > > > > > > ++              case LTTNG_SYSCALL_ABI_NATIVE:
> > > > > > > ++                      prefix_len =3D strlen(SYSCALL_ENTRY_=
STR);
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_SYSCALL_ABI_COMPAT:
> > > > > > > ++                      prefix_len =3D strlen(COMPAT_SYSCALL=
_ENTRY_STR);
> > > > > > > ++                      break;
> > > > > > > +               }
> > > > > > > +-              chan->syscall_all =3D 1;
> > > > > > > +-              return 0;
> > > > > > > +-      }
> > > > > > > +-
> > > > > > > +-      if (!chan->sc_filter) {
> > > > > > > +-              if (chan->syscall_all) {
> > > > > > > +-                      /*
> > > > > > > +-                       * All syscalls are already enabled.
> > > > > > > +-                       */
> > > > > > > +-                      return -EEXIST;
> > > > > > > ++              break;
> > > > > > > ++      case LTTNG_SYSCALL_EXIT:
> > > > > > > ++              switch (event->u.syscall.abi) {
> > > > > > > ++              case LTTNG_SYSCALL_ABI_NATIVE:
> > > > > > > ++                      prefix_len =3D strlen(SYSCALL_EXIT_S=
TR);
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_SYSCALL_ABI_COMPAT:
> > > > > > > ++                      prefix_len =3D strlen(COMPAT_SYSCALL=
_EXIT_STR);
> > > > > > > ++                      break;
> > > > > > > +               }
> > > > > > > +-              filter =3D kzalloc(sizeof(struct lttng_sysca=
ll_filter),
> > > > > > > +-                              GFP_KERNEL);
> > > > > > > +-              if (!filter)
> > > > > > > +-                      return -ENOMEM;
> > > > > > > +-      } else {
> > > > > > > +-              filter =3D chan->sc_filter;
> > > > > > > ++              break;
> > > > > > > +       }
> > > > > > > +-      syscall_nr =3D get_syscall_nr(name);
> > > > > > > +-      compat_syscall_nr =3D get_compat_syscall_nr(name);
> > > > > > > +-      if (syscall_nr < 0 && compat_syscall_nr < 0) {
> > > > > > > +-              ret =3D -ENOENT;
> > > > > > > +-              goto error;
> > > > > > > ++      WARN_ON_ONCE(prefix_len =3D=3D 0);
> > > > > > > ++      return event->desc->name + prefix_len;
> > > > > > > ++}
> > > > > > > ++
> > > > > > > ++int lttng_syscall_filter_enable(struct lttng_channel *chan=
,
> > > > > > > ++              struct lttng_event *event)
> > > > > > > ++{
> > > > > > > ++      struct lttng_syscall_filter *filter =3D chan->sc_fil=
ter;
> > > > > > > ++      const char *syscall_name;
> > > > > > > ++      unsigned long *bitmap;
> > > > > > > ++      int syscall_nr;
> > > > > > > ++
> > > > > > > ++      WARN_ON_ONCE(!chan->sc_table);
> > > > > > > ++
> > > > > > > ++      syscall_name =3D get_syscall_name(event);
> > > > > > > ++
> > > > > > > ++      switch (event->u.syscall.abi) {
> > > > > > > ++      case LTTNG_SYSCALL_ABI_NATIVE:
> > > > > > > ++              syscall_nr =3D get_syscall_nr(syscall_name);
> > > > > > > ++              break;
> > > > > > > ++      case LTTNG_SYSCALL_ABI_COMPAT:
> > > > > > > ++              syscall_nr =3D get_compat_syscall_nr(syscall=
_name);
> > > > > > > ++              break;
> > > > > > > ++      default:
> > > > > > > ++              return -EINVAL;
> > > > > > > +       }
> > > > > > > +-      if (syscall_nr >=3D 0) {
> > > > > > > +-              if (test_bit(syscall_nr, filter->sc)) {
> > > > > > > +-                      ret =3D -EEXIST;
> > > > > > > +-                      goto error;
> > > > > > > ++      if (syscall_nr < 0)
> > > > > > > ++              return -ENOENT;
> > > > > > > ++
> > > > > > > ++
> > > > > > > ++      switch (event->u.syscall.entryexit) {
> > > > > > > ++      case LTTNG_SYSCALL_ENTRY:
> > > > > > > ++              switch (event->u.syscall.abi) {
> > > > > > > ++              case LTTNG_SYSCALL_ABI_NATIVE:
> > > > > > > ++                      bitmap =3D filter->sc_entry;
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_SYSCALL_ABI_COMPAT:
> > > > > > > ++                      bitmap =3D filter->sc_compat_entry;
> > > > > > > ++                      break;
> > > > > > > +               }
> > > > > > > +-              bitmap_set(filter->sc, syscall_nr, 1);
> > > > > > > +-      }
> > > > > > > +-      if (compat_syscall_nr >=3D 0) {
> > > > > > > +-              if (test_bit(compat_syscall_nr, filter->sc_c=
ompat)) {
> > > > > > > +-                      ret =3D -EEXIST;
> > > > > > > +-                      goto error;
> > > > > > > ++              break;
> > > > > > > ++      case LTTNG_SYSCALL_EXIT:
> > > > > > > ++              switch (event->u.syscall.abi) {
> > > > > > > ++              case LTTNG_SYSCALL_ABI_NATIVE:
> > > > > > > ++                      bitmap =3D filter->sc_exit;
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_SYSCALL_ABI_COMPAT:
> > > > > > > ++                      bitmap =3D filter->sc_compat_exit;
> > > > > > > ++                      break;
> > > > > > > +               }
> > > > > > > +-              bitmap_set(filter->sc_compat, compat_syscall=
_nr, 1);
> > > > > > > ++              break;
> > > > > > > ++      default:
> > > > > > > ++              return -EINVAL;
> > > > > > > +       }
> > > > > > > +-      if (!chan->sc_filter)
> > > > > > > +-              rcu_assign_pointer(chan->sc_filter, filter);
> > > > > > > ++      if (test_bit(syscall_nr, bitmap))
> > > > > > > ++              return -EEXIST;
> > > > > > > ++      bitmap_set(bitmap, syscall_nr, 1);
> > > > > > > +       return 0;
> > > > > > > +-
> > > > > > > +-error:
> > > > > > > +-      if (!chan->sc_filter)
> > > > > > > +-              kfree(filter);
> > > > > > > +-      return ret;
> > > > > > > + }
> > > > > > > +
> > > > > > > + int lttng_syscall_filter_disable(struct lttng_channel *cha=
n,
> > > > > > > +-              const char *name)
> > > > > > > ++              struct lttng_event *event)
> > > > > > > + {
> > > > > > > +-      int syscall_nr, compat_syscall_nr, ret;
> > > > > > > +-      struct lttng_syscall_filter *filter;
> > > > > > > ++      struct lttng_syscall_filter *filter =3D chan->sc_fil=
ter;
> > > > > > > ++      const char *syscall_name;
> > > > > > > ++      unsigned long *bitmap;
> > > > > > > ++      int syscall_nr;
> > > > > > > +
> > > > > > > +       WARN_ON_ONCE(!chan->sc_table);
> > > > > > > +
> > > > > > > +-      if (!chan->sc_filter) {
> > > > > > > +-              if (!chan->syscall_all)
> > > > > > > +-                      return -EEXIST;
> > > > > > > +-              filter =3D kzalloc(sizeof(struct lttng_sysca=
ll_filter),
> > > > > > > +-                              GFP_KERNEL);
> > > > > > > +-              if (!filter)
> > > > > > > +-                      return -ENOMEM;
> > > > > > > +-              /* Trace all system calls, then apply disabl=
e. */
> > > > > > > +-              bitmap_set(filter->sc, 0, NR_syscalls);
> > > > > > > +-              bitmap_set(filter->sc_compat, 0, NR_compat_s=
yscalls);
> > > > > > > +-      } else {
> > > > > > > +-              filter =3D chan->sc_filter;
> > > > > > > ++      syscall_name =3D get_syscall_name(event);
> > > > > > > ++
> > > > > > > ++      switch (event->u.syscall.abi) {
> > > > > > > ++      case LTTNG_SYSCALL_ABI_NATIVE:
> > > > > > > ++              syscall_nr =3D get_syscall_nr(syscall_name);
> > > > > > > ++              break;
> > > > > > > ++      case LTTNG_SYSCALL_ABI_COMPAT:
> > > > > > > ++              syscall_nr =3D get_compat_syscall_nr(syscall=
_name);
> > > > > > > ++              break;
> > > > > > > ++      default:
> > > > > > > ++              return -EINVAL;
> > > > > > > +       }
> > > > > > > ++      if (syscall_nr < 0)
> > > > > > > ++              return -ENOENT;
> > > > > > > +
> > > > > > > +-      if (!name) {
> > > > > > > +-              /* Fail if all syscalls are already disabled=
. */
> > > > > > > +-              if (bitmap_empty(filter->sc, NR_syscalls)
> > > > > > > +-                      && bitmap_empty(filter->sc_compat,
> > > > > > > +-                              NR_compat_syscalls)) {
> > > > > > > +-                      ret =3D -EEXIST;
> > > > > > > +-                      goto error;
> > > > > > > +-              }
> > > > > > > +
> > > > > > > +-              /* Disable all system calls */
> > > > > > > +-              bitmap_clear(filter->sc, 0, NR_syscalls);
> > > > > > > +-              bitmap_clear(filter->sc_compat, 0, NR_compat=
_syscalls);
> > > > > > > +-              goto apply_filter;
> > > > > > > +-      }
> > > > > > > +-      syscall_nr =3D get_syscall_nr(name);
> > > > > > > +-      compat_syscall_nr =3D get_compat_syscall_nr(name);
> > > > > > > +-      if (syscall_nr < 0 && compat_syscall_nr < 0) {
> > > > > > > +-              ret =3D -ENOENT;
> > > > > > > +-              goto error;
> > > > > > > +-      }
> > > > > > > +-      if (syscall_nr >=3D 0) {
> > > > > > > +-              if (!test_bit(syscall_nr, filter->sc)) {
> > > > > > > +-                      ret =3D -EEXIST;
> > > > > > > +-                      goto error;
> > > > > > > ++      switch (event->u.syscall.entryexit) {
> > > > > > > ++      case LTTNG_SYSCALL_ENTRY:
> > > > > > > ++              switch (event->u.syscall.abi) {
> > > > > > > ++              case LTTNG_SYSCALL_ABI_NATIVE:
> > > > > > > ++                      bitmap =3D filter->sc_entry;
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_SYSCALL_ABI_COMPAT:
> > > > > > > ++                      bitmap =3D filter->sc_compat_entry;
> > > > > > > ++                      break;
> > > > > > > +               }
> > > > > > > +-              bitmap_clear(filter->sc, syscall_nr, 1);
> > > > > > > +-      }
> > > > > > > +-      if (compat_syscall_nr >=3D 0) {
> > > > > > > +-              if (!test_bit(compat_syscall_nr, filter->sc_=
compat)) {
> > > > > > > +-                      ret =3D -EEXIST;
> > > > > > > +-                      goto error;
> > > > > > > ++              break;
> > > > > > > ++      case LTTNG_SYSCALL_EXIT:
> > > > > > > ++              switch (event->u.syscall.abi) {
> > > > > > > ++              case LTTNG_SYSCALL_ABI_NATIVE:
> > > > > > > ++                      bitmap =3D filter->sc_exit;
> > > > > > > ++                      break;
> > > > > > > ++              case LTTNG_SYSCALL_ABI_COMPAT:
> > > > > > > ++                      bitmap =3D filter->sc_compat_exit;
> > > > > > > ++                      break;
> > > > > > > +               }
> > > > > > > +-              bitmap_clear(filter->sc_compat, compat_sysca=
ll_nr, 1);
> > > > > > > ++              break;
> > > > > > > ++      default:
> > > > > > > ++              return -EINVAL;
> > > > > > > +       }
> > > > > > > +-apply_filter:
> > > > > > > +-      if (!chan->sc_filter)
> > > > > > > +-              rcu_assign_pointer(chan->sc_filter, filter);
> > > > > > > +-      chan->syscall_all =3D 0;
> > > > > > > +-      return 0;
> > > > > > > ++      if (!test_bit(syscall_nr, bitmap))
> > > > > > > ++              return -EEXIST;
> > > > > > > ++      bitmap_clear(bitmap, syscall_nr, 1);
> > > > > > > +
> > > > > > > +-error:
> > > > > > > +-      if (!chan->sc_filter)
> > > > > > > +-              kfree(filter);
> > > > > > > +-      return ret;
> > > > > > > ++      return 0;
> > > > > > > + }
> > > > > > > +
> > > > > > > + static
> > > > > > > +@@ -1236,6 +1256,9 @@ const struct file_operations lttng_sy=
scall_list_fops =3D {
> > > > > > > +       .release =3D seq_release,
> > > > > > > + };
> > > > > > > +
> > > > > > > ++/*
> > > > > > > ++ * A syscall is enabled if it is traced for either entry o=
r exit.
> > > > > > > ++ */
> > > > > > > + long lttng_channel_syscall_mask(struct lttng_channel *chan=
nel,
> > > > > > > +               struct lttng_kernel_syscall_mask __user *usy=
scall_mask)
> > > > > > > + {
> > > > > > > +@@ -1262,8 +1285,9 @@ long lttng_channel_syscall_mask(struc=
t lttng_channel *channel,
> > > > > > > +               char state;
> > > > > > > +
> > > > > > > +               if (channel->sc_table) {
> > > > > > > +-                      if (filter)
> > > > > > > +-                              state =3D test_bit(bit, filt=
er->sc);
> > > > > > > ++                      if (!READ_ONCE(channel->syscall_all)=
 && filter)
> > > > > > > ++                              state =3D test_bit(bit, filt=
er->sc_entry)
> > > > > > > ++                                      || test_bit(bit, fil=
ter->sc_exit);
> > > > > > > +                       else
> > > > > > > +                               state =3D 1;
> > > > > > > +               } else {
> > > > > > > +@@ -1275,9 +1299,11 @@ long lttng_channel_syscall_mask(stru=
ct lttng_channel *channel,
> > > > > > > +               char state;
> > > > > > > +
> > > > > > > +               if (channel->compat_sc_table) {
> > > > > > > +-                      if (filter)
> > > > > > > ++                      if (!READ_ONCE(channel->syscall_all)=
 && filter)
> > > > > > > +                               state =3D test_bit(bit - ARR=
AY_SIZE(sc_table),
> > > > > > > +-                                              filter->sc_c=
ompat);
> > > > > > > ++                                              filter->sc_c=
ompat_entry)
> > > > > > > ++                                      || test_bit(bit - AR=
RAY_SIZE(sc_table),
> > > > > > > ++                                              filter->sc_c=
ompat_exit);
> > > > > > > +                       else
> > > > > > > +                               state =3D 1;
> > > > > > > +               } else {
> > > > > > > +--
> > > > > > > +2.19.1
> > > > > > > +
> > > > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.=
bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> > > > > > > index 0e1a209ce8..e36b327a08 100644
> > > > > > > --- a/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> > > > > > > +++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.2.bb
> > > > > > > @@ -11,6 +11,16 @@ include lttng-platforms.inc
> > > > > > >  SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV}.ta=
r.bz2 \
> > > > > > >             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINT=
S-is-not-en.patch \
> > > > > > >             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> > > > > > > +           file://0001-Kconfig-fix-dependency-issue-when-bu=
ilding-in-tree-w.patch \
> > > > > > > +           file://0002-fix-Move-mmutrace.h-into-the-mmu-sub=
-directory-v5.9.patch \
> > > > > > > +           file://0003-fix-KVM-x86-mmu-Make-kvm_mmu_page-de=
finition-and-acc.patch \
> > > > > > > +           file://0004-fix-ext4-limit-the-length-of-per-ino=
de-prealloc-list.patch \
> > > > > > > +           file://0005-fix-ext4-indicate-via-a-block-bitmap=
-read-is-prefetc.patch \
> > > > > > > +           file://0006-fix-removal-of-smp_-read_barrier_dep=
ends-v5.9.patch \
> > > > > > > +           file://0007-fix-writeback-Drop-I_DIRTY_TIME_EXPI=
RE-v5.9.patch \
> > > > > > > +           file://0008-fix-writeback-Fix-sync-livelock-due-=
to-b_dirty_time-.patch \
> > > > > > > +           file://0009-fix-version-ranges-for-ext4_discard_=
preallocations-a.patch \
> > > > > > > +           file://0010-Fix-system-call-filter-table.patch \
> > > > > > >             "
> > > > > > >
> > > > > > >  SRC_URI[sha256sum] =3D "df50bc3bd58679705714f17721acf619a8b=
0cedc694f8a97052aa5099626feca"
> > > > > > > @@ -36,7 +46,7 @@ SRC_URI_class-devupstream =3D "git://git.l=
ttng.org/lttng-modules;branch=3Dstable-2.1
> > > > > > >             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINT=
S-is-not-en.patch \
> > > > > > >             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> > > > > > >             "
> > > > > > > -SRCREV_class-devupstream =3D "57ccbfa6a8a79c7b84394c2097efa=
f7935607aa5"
> > > > > > > +SRCREV_class-devupstream =3D "ad594e3a953db1b0c3c059fde45b5=
a5494f6be78"
> > > > > > >  PV_class-devupstream =3D "2.12.2+git${SRCPV}"
> > > > > > >  S_class-devupstream =3D "${WORKDIR}/git"
> > > > > > >  SRCREV_FORMAT ?=3D "lttng_git"
> > > > > > > --
> > > > > > > 2.19.1
> > > > > > >
> > > > > > >
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > - Thou shalt not follow the NULL pointer, for chaos and madness =
await
> > > > > thee at its end
> > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >=20
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
