Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.33198.1597619908424103685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 16:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aM4Yp1/a;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id t10so15630028ejs.8
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U8s96qPKtXNHjsJMG/j8MNMQn0j25izrxBS5+2FBy4w=;
        b=aM4Yp1/aZEyLWAGJOjliXoAc5Nt0iS3qUs4HAtK62yb8T48iyCZvLMXq6FbOrN6IfF
         DTQlR99I/1MpPC3tw7izfMjPubJKMgU+YXPRIEYYE3vlq6UZXg/Cy0Dj+uKwhC2rayBb
         729YXcaRknfF3FRztErvNFBLY2cbnKwphv4mRGbzVZSzzKE+fbz0H1eRzYGGXAHOMLFL
         V4CDJyoZXzUlm0tx57HsWVh3kwdxgtazLoY9IMRA1wDoW3zU9KgvcSyT+hmMGhRaynLS
         8iiuAU2DJ+HiVaQDS2qPszNQoJNU+h2RIGdQ71zfQqw+b0CwBNp5DpYZuuyhbxEIWviB
         nX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U8s96qPKtXNHjsJMG/j8MNMQn0j25izrxBS5+2FBy4w=;
        b=Kbgy5Hq8KuXr/LqCv7CHxW+QrDiy9rULUIVfV5gA+hTBljLe+3RXlE3AUPcimTv3qD
         4hbw4QV7un36Nd7Vu/WYCuw+xAMF1LodtslJTU3b5vnrmRULji0UpomSdp/tnvrzDMf2
         NtLiGb9Ft7flm0twqsXEcbleV8trzs3BpdB1//8UsdwRvrHHvpaOb8WD5rw++0aK52Gn
         9ZY6K789h1P8h8j6F9W5bXFlExgfi7yMTs9m8gRNjI4kAzlzAaBdfuXMU4oveemkbGbI
         pfNjon+b7ftdFNimSuT2ITI5AiQJUOXV0FxPeyeZT1Cvy6SgyNy9/WJiHe8yjRH0C8BR
         KbrQ==
X-Gm-Message-State: AOAM5302uby+nq0HcvP1qsPqYuSupP5a+/gSMe0Ju/LIM8hBGGD5QF7X
	3dUDu69kjgpA7vIIsVD+t2SrCwU7Y9dbF8h7bxY=
X-Google-Smtp-Source: ABdhPJwD1rAPRAA2s36NPQicIoASKsZ6YnMzBCQTG+QDrV3hHhbD64QYssDNumUq8+IHsTOOwIkg4HVw2mqyQUxe8kI=
X-Received: by 2002:a17:906:4a0d:: with SMTP id w13mr5301760eju.247.1597619907002;
 Sun, 16 Aug 2020 16:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200816070814.1303004-1-raj.khem@gmail.com> <20200816070814.1303004-3-raj.khem@gmail.com>
 <CADkTA4MAmRH9g7EHyhKbgBgBUD0LFwDORL6TL_Z-+L_kg5ig-A@mail.gmail.com> <CAMKF1soL0agojKVxZ34LfrLKdWDtU5vtcyN5DL8F=ZL=o4NL4g@mail.gmail.com>
In-Reply-To: <CAMKF1soL0agojKVxZ34LfrLKdWDtU5vtcyN5DL8F=ZL=o4NL4g@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 16 Aug 2020 19:18:15 -0400
Message-ID: <CADkTA4NGJ3+N8q6L4Hq9XgfOsMMXBDW7rvL7MMsBdgJM5O3pFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] linux-yocto: Backport a patch to fix perf with -fno-common
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000b062305ad06df83"

--0000000000000b062305ad06df83
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 16, 2020 at 7:15 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Aug 16, 2020 at 3:30 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> >
> >
> > On Sun, Aug 16, 2020 at 3:08 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Temp fix until linux-yocto picks it up
> >>
> >
> > These really need to be submitted to the linux-yocto mailing list as
> proper patches.
> >
> > When they are submitted like this, it requires me to extract the patch,
> or hunt up the original commit, see if it has already been submitted to
> linux-stable (and if not, it should be), apply it to the kernel, revert
> this commit if it happens to have merged and then finally do my update.
> >
>
> I know, it was a ad-hoc fix for autobuilders if RP wanted to try
>

No worries. I should have realized as well. Itchy trigger finger as I work
through the final v5.8 issues :D

Bruce



>
> > or, it could be submitted to linux-yocto like any patch, and it will be
> applied and show up with the next update.
> >
> > I'll take care of getting this into linux-yocto with my update that is
> coming later today.
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  ...-definition-of-traceid_list-global-v.patch | 66 +++++++++++++++++++
> >>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  2 +
> >>  2 files changed, 68 insertions(+)
> >>  create mode 100644
> meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
> >>
> >> diff --git
> a/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
> b/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
> >> new file mode 100644
> >> index 0000000000..0fc9876501
> >> --- /dev/null
> >> +++
> b/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
> >> @@ -0,0 +1,66 @@
> >> +From 168200b6d6ea0cb5765943ec5da5b8149701f36a Mon Sep 17 00:00:00 2001
> >> +From: Leo Yan <leo.yan@linaro.org>
> >> +Date: Tue, 5 May 2020 21:36:42 +0800
> >> +Subject: [PATCH] perf cs-etm: Move definition of 'traceid_list' global
> >> + variable from header file
> >> +
> >> +The variable 'traceid_list' is defined in the header file cs-etm.h,
> >> +if multiple C files include cs-etm.h the compiler might complaint for
> >> +multiple definition of 'traceid_list'.
> >> +
> >> +To fix multiple definition error, move the definition of 'traceid_list'
> >> +into cs-etm.c.
> >> +
> >> +Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight
> metadata")
> >> +Reported-by: Thomas Backlund <tmb@mageia.org>
> >> +Signed-off-by: Leo Yan <leo.yan@linaro.org>
> >> +Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> +Reviewed-by: Mike Leach <mike.leach@linaro.org>
> >> +Tested-by: Mike Leach <mike.leach@linaro.org>
> >> +Tested-by: Thomas Backlund <tmb@mageia.org>
> >> +Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> >> +Cc: Jiri Olsa <jolsa@redhat.com>
> >> +Cc: Mark Rutland <mark.rutland@arm.com>
> >> +Cc: Namhyung Kim <namhyung@kernel.org>
> >> +Cc: Peter Zijlstra <peterz@infradead.org>
> >> +Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
> >> +Cc: Tor Jeremiassen <tor@ti.com>
> >> +Cc: linux-arm-kernel@lists.infradead.org
> >> +Link:
> http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.org
> >> +Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> >> +---
> >> + tools/perf/util/cs-etm.c | 3 +++
> >> + tools/perf/util/cs-etm.h | 3 ---
> >> + 2 files changed, 3 insertions(+), 3 deletions(-)
> >> +
> >> +diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> >> +index 3c802fde4954..c283223fb31f 100644
> >> +--- a/tools/perf/util/cs-etm.c
> >> ++++ b/tools/perf/util/cs-etm.c
> >> +@@ -94,6 +94,9 @@ struct cs_etm_queue {
> >> +       struct cs_etm_traceid_queue **traceid_queues;
> >> + };
> >> +
> >> ++/* RB tree for quick conversion between traceID and metadata pointers
> */
> >> ++static struct intlist *traceid_list;
> >> ++
> >> + static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
> >> + static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
> >> + static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace
> *etm,
> >> +diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
> >> +index 650ecc2a6349..4ad925d6d799 100644
> >> +--- a/tools/perf/util/cs-etm.h
> >> ++++ b/tools/perf/util/cs-etm.h
> >> +@@ -114,9 +114,6 @@ enum cs_etm_isa {
> >> +       CS_ETM_ISA_T32,
> >> + };
> >> +
> >> +-/* RB tree for quick conversion between traceID and metadata pointers
> */
> >> +-struct intlist *traceid_list;
> >> +-
> >> + struct cs_etm_queue;
> >> +
> >> + struct cs_etm_packet {
> >> +--
> >> +2.28.0
> >> +
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> index f85c54e7f7..5a3180f36d 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> @@ -32,6 +32,8 @@ SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRA>
> >>  SRC_URI_append_qemuppc64 = " file://defconfig"
> >>  CFLAGS += "-Wno-error"
> >>
> >> +SRC_URI_append = "
> file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch"
> >> +
> >>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >>  LINUX_VERSION ?= "5.4.57"
> >>
> >> --
> >> 2.28.0
> >>
> >> 
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000b062305ad06df83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Aug 16, 2020 at 7:15 PM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Aug 16, 2020 at 3=
:30 PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" targe=
t=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Sun, Aug 16, 2020 at 3:08 AM Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Temp fix until linux-yocto picks it up<br>
&gt;&gt;<br>
&gt;<br>
&gt; These really need to be submitted to the linux-yocto mailing list as =
proper patches.<br>
&gt;<br>
&gt; When they are submitted like this, it requires me to extract the patc=
h, or hunt up the original commit, see if it has already been submitted to =
linux-stable (and if not, it should be), apply it to the kernel, revert thi=
s commit if it happens to have merged and then finally do my update.<br>
&gt;<br>
<br>
I know, it was a ad-hoc fix for autobuilders if RP wanted to try<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">No worries. I should have realized as well. Itchy trigger finger as =
I work through the final v5.8 issues :D</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt; or, it could be submitted to linux-yocto like any patch, and it will =
be applied and show up with the next update.<br>
&gt;<br>
&gt; I&#39;ll take care of getting this into linux-yocto with my update th=
at is coming later today.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...-definition-of-traceid_list-global-v.patch | 66 ++++++++=
+++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a>=C2=A0 |=C2=
=
=A0 2 +<br>
&gt;&gt;=C2=A0 2 files changed, 68 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-kernel/linux/files/0001-per=
f-cs-etm-Move-definition-of-traceid_list-global-v.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Mov=
e-definition-of-traceid_list-global-v.patch b/meta/recipes-kernel/linux/fil=
es/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..0fc9876501<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-defin=
ition-of-traceid_list-global-v.patch<br>
&gt;&gt; @@ -0,0 +1,66 @@<br>
&gt;&gt; +From 168200b6d6ea0cb5765943ec5da5b8149701f36a Mon Sep 17 00:00:0=
0 2001<br>
&gt;&gt; +From: Leo Yan &lt;<a href=3D"mailto:leo.yan@linaro.org" target=
=3D"_blank">leo.yan@linaro.org</a>&gt;<br>
&gt;&gt; +Date: Tue, 5 May 2020 21:36:42 +0800<br>
&gt;&gt; +Subject: [PATCH] perf cs-etm: Move definition of &#39;traceid_li=
st&#39; global<br>
&gt;&gt; + variable from header file<br>
&gt;&gt; +<br>
&gt;&gt; +The variable &#39;traceid_list&#39; is defined in the header fil=
e cs-etm.h,<br>
&gt;&gt; +if multiple C files include cs-etm.h the compiler might complain=
t for<br>
&gt;&gt; +multiple definition of &#39;traceid_list&#39;.<br>
&gt;&gt; +<br>
&gt;&gt; +To fix multiple definition error, move the definition of &#39;tr=
aceid_list&#39;<br>
&gt;&gt; +into cs-etm.c.<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes: cd8bfd8c973e (&quot;perf tools: Add processing of coresig=
ht metadata&quot;)<br>
&gt;&gt; +Reported-by: Thomas Backlund &lt;<a href=3D"mailto:tmb@mageia.or=
g" target=3D"_blank">tmb@mageia.org</a>&gt;<br>
&gt;&gt; +Signed-off-by: Leo Yan &lt;<a href=3D"mailto:leo.yan@linaro.org"=
 target=3D"_blank">leo.yan@linaro.org</a>&gt;<br>
&gt;&gt; +Reviewed-by: Mathieu Poirier &lt;<a href=3D"mailto:mathieu.poiri=
er@linaro.org" target=3D"_blank">mathieu.poirier@linaro.org</a>&gt;<br>
&gt;&gt; +Reviewed-by: Mike Leach &lt;<a href=3D"mailto:mike.leach@linaro.=
org" target=3D"_blank">mike.leach@linaro.org</a>&gt;<br>
&gt;&gt; +Tested-by: Mike Leach &lt;<a href=3D"mailto:mike.leach@linaro.or=
g" target=3D"_blank">mike.leach@linaro.org</a>&gt;<br>
&gt;&gt; +Tested-by: Thomas Backlund &lt;<a href=3D"mailto:tmb@mageia.org"=
 target=3D"_blank">tmb@mageia.org</a>&gt;<br>
&gt;&gt; +Cc: Alexander Shishkin &lt;<a href=3D"mailto:alexander.shishkin@=
linux.intel.com" target=3D"_blank">alexander.shishkin@linux.intel.com</a>&g=
t;<br>
&gt;&gt; +Cc: Jiri Olsa &lt;<a href=3D"mailto:jolsa@redhat.com" target=3D"=
_blank">jolsa@redhat.com</a>&gt;<br>
&gt;&gt; +Cc: Mark Rutland &lt;<a href=3D"mailto:mark.rutland@arm.com" tar=
get=3D"_blank">mark.rutland@arm.com</a>&gt;<br>
&gt;&gt; +Cc: Namhyung Kim &lt;<a href=3D"mailto:namhyung@kernel.org" targ=
et=3D"_blank">namhyung@kernel.org</a>&gt;<br>
&gt;&gt; +Cc: Peter Zijlstra &lt;<a href=3D"mailto:peterz@infradead.org" t=
arget=3D"_blank">peterz@infradead.org</a>&gt;<br>
&gt;&gt; +Cc: Suzuki Poulouse &lt;<a href=3D"mailto:suzuki.poulose@arm.com=
" target=3D"_blank">suzuki.poulose@arm.com</a>&gt;<br>
&gt;&gt; +Cc: Tor Jeremiassen &lt;<a href=3D"mailto:tor@ti.com" target=3D"=
_blank">tor@ti.com</a>&gt;<br>
&gt;&gt; +Cc: <a href=3D"mailto:linux-arm-kernel@lists.infradead.org" targ=
et=3D"_blank">linux-arm-kernel@lists.infradead.org</a><br>
&gt;&gt; +Link: <a href=3D"http://lore.kernel.org/lkml/20200505133642.4756=
-1-leo.yan@linaro.org" rel=3D"noreferrer" target=3D"_blank">http://lore.ker=
nel.org/lkml/20200505133642.4756-1-leo.yan@linaro.org</a><br>
&gt;&gt; +Signed-off-by: Arnaldo Carvalho de Melo &lt;<a href=3D"mailto:ac=
me@redhat.com" target=3D"_blank">acme@redhat.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + tools/perf/util/cs-etm.c | 3 +++<br>
&gt;&gt; + tools/perf/util/cs-etm.h | 3 ---<br>
&gt;&gt; + 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c=
<br>
&gt;&gt; +index 3c802fde4954..c283223fb31f 100644<br>
&gt;&gt; +--- a/tools/perf/util/cs-etm.c<br>
&gt;&gt; ++++ b/tools/perf/util/cs-etm.c<br>
&gt;&gt; +@@ -94,6 +94,9 @@ struct cs_etm_queue {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cs_etm_traceid_queue **traceid=
_queues;<br>
&gt;&gt; + };<br>
&gt;&gt; +<br>
&gt;&gt; ++/* RB tree for quick conversion between traceID and metadata po=
inters */<br>
&gt;&gt; ++static struct intlist *traceid_list;<br>
&gt;&gt; ++<br>
&gt;&gt; + static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);<=
br>
&gt;&gt; + static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);=
<br>
&gt;&gt; + static int cs_etm__process_timeless_queues(struct cs_etm_auxtra=
ce *etm,<br>
&gt;&gt; +diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h=
<br>
&gt;&gt; +index 650ecc2a6349..4ad925d6d799 100644<br>
&gt;&gt; +--- a/tools/perf/util/cs-etm.h<br>
&gt;&gt; ++++ b/tools/perf/util/cs-etm.h<br>
&gt;&gt; +@@ -114,9 +114,6 @@ enum cs_etm_isa {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CS_ETM_ISA_T32,<br>
&gt;&gt; + };<br>
&gt;&gt; +<br>
&gt;&gt; +-/* RB tree for quick conversion between traceID and metadata po=
inters */<br>
&gt;&gt; +-struct intlist *traceid_list;<br>
&gt;&gt; +-<br>
&gt;&gt; + struct cs_etm_queue;<br>
&gt;&gt; +<br>
&gt;&gt; + struct cs_etm_packet {<br>
&gt;&gt; +--<br>
&gt;&gt; +2.28.0<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yo=
cto_5.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a> b/m=
eta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=3D"noref=
errer" target=3D"_blank">linux-yocto_5.4.bb</a><br>
&gt;&gt; index f85c54e7f7..5a3180f36d 100644<br>
&gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a><br>
&gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a><br>
&gt;&gt; @@ -32,6 +32,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.y=
octoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmac=
hine;branch=3D${KBRA</a><br>
&gt;&gt;=C2=A0 SRC_URI_append_qemuppc64 =3D &quot; file://defconfig&quot;<=
br>
&gt;&gt;=C2=A0 CFLAGS +=3D &quot;-Wno-error&quot;<br>
&gt;&gt;<br>
&gt;&gt; +SRC_URI_append =3D &quot; file://0001-perf-cs-etm-Move-definitio=
n-of-traceid_list-global-v.patch&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815ee27=
95b2f4230826c0c6b8814&quot;<br>
&gt;&gt;=C2=A0 LINUX_VERSION ?=3D &quot;5.4.57&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.28.0<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--0000000000000b062305ad06df83--
