Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.32163.1597617060006433537
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 15:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RGaUeC+7;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id i26so10824430edv.4
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 15:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N6SftStrxWfEvh4X8PuwdKJiunHlIBUkumDFR5ldgHk=;
        b=RGaUeC+7uQxDg8B5A1rHXRLm/vcOdHYc4VgZcnXW/r2ahrvy+GstGGCr6SsWUlGcIv
         PaKCUVBLU9Ne1OUgvwsppuCIhhws3r+xz2SCAVnuNrtH+x6nNrpGXJpbTZm1MtxTizrj
         8fCZBE5WEzOOHIWzxYzRGmG2bgb9YnOuysg0DvC7uxn2YPNDZ1JRMwdNfbUAqVMCi5pa
         +HTMVLUhucBqEwShkSyLsqA99QZLTljHYJ/n8IR5cesbW5OWn0W+FjE6l0TKTmKrIXM/
         rfaJHjTY3jQ2yQRaS76PaQsHlx4AT712nw11GrGF0tGwD0xhmemlKmtqwHQJOtM8l1iB
         sI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6SftStrxWfEvh4X8PuwdKJiunHlIBUkumDFR5ldgHk=;
        b=VSiHqN2CdYi5w5XLCgLU+cmPBWhBvwPiJ0Sb/3fy9b09yjEed4bTxH3maXUY2fkNoD
         vCg6Tz3ESxG39ASnC+mgZdp5RSvutyov9HhrWkhKqMqUHSBmqMQpzMFCtDxmHAB4modP
         OGVmOc+m4H6GwqEC11bPHTffyZ2QsoLhm3sjrImmeyBCKQLtTFkp9gnys3/M0tDqxmkb
         SeB4Ca9lFuCdMiT+Q9rrt0WF9FPLkBRCEbamI61l/XscDXf1GidyS1bHYCOEdaA56YYX
         u+uJz05fuijy3aEtAfD9CHJYtnCwq9Z88V/m6X+HjTvVbn1XQW2wx3/68/AGeC8utA+6
         dXrA==
X-Gm-Message-State: AOAM533VLviC0Lj5336ZRIySqv7M1IH+oAPoq0arnPbdia0tY2/EXP2e
	7nytLAOFrjd53Q6nfCf/dRANVGCcHsFO7fKr9Sw=
X-Google-Smtp-Source: ABdhPJxjLyoomRO1O0Nbbw7BUI8v623+t+gBXZV+PBLXFihplkfN5q1HNsTN3rY6uqFCtDjRSZzkTQ4icnzLFB6SPBY=
X-Received: by 2002:aa7:d7d7:: with SMTP id e23mr11922142eds.347.1597617058430;
 Sun, 16 Aug 2020 15:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200816070814.1303004-1-raj.khem@gmail.com> <20200816070814.1303004-3-raj.khem@gmail.com>
In-Reply-To: <20200816070814.1303004-3-raj.khem@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 16 Aug 2020 18:30:47 -0400
Message-ID: <CADkTA4MAmRH9g7EHyhKbgBgBUD0LFwDORL6TL_Z-+L_kg5ig-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] linux-yocto: Backport a patch to fix perf with -fno-common
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000041445105ad063577"

--00000000000041445105ad063577
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 16, 2020 at 3:08 AM Khem Raj <raj.khem@gmail.com> wrote:

> Temp fix until linux-yocto picks it up
>
>
These really need to be submitted to the linux-yocto mailing list as proper
patches.

When they are submitted like this, it requires me to extract the patch, or
hunt up the original commit, see if it has already been submitted to
linux-stable (and if not, it should be), apply it to the kernel, revert
this commit if it happens to have merged and then finally do my update.

or, it could be submitted to linux-yocto like any patch, and it will be
applied and show up with the next update.

I'll take care of getting this into linux-yocto with my update that is
coming later today.

Cheers,

Bruce



> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-definition-of-traceid_list-global-v.patch | 66 +++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  2 +
>  2 files changed, 68 insertions(+)
>  create mode 100644
> meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
>
> diff --git
> a/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
> b/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
> new file mode 100644
> index 0000000000..0fc9876501
> --- /dev/null
> +++
> b/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
> @@ -0,0 +1,66 @@
> +From 168200b6d6ea0cb5765943ec5da5b8149701f36a Mon Sep 17 00:00:00 2001
> +From: Leo Yan <leo.yan@linaro.org>
> +Date: Tue, 5 May 2020 21:36:42 +0800
> +Subject: [PATCH] perf cs-etm: Move definition of 'traceid_list' global
> + variable from header file
> +
> +The variable 'traceid_list' is defined in the header file cs-etm.h,
> +if multiple C files include cs-etm.h the compiler might complaint for
> +multiple definition of 'traceid_list'.
> +
> +To fix multiple definition error, move the definition of 'traceid_list'
> +into cs-etm.c.
> +
> +Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
> +Reported-by: Thomas Backlund <tmb@mageia.org>
> +Signed-off-by: Leo Yan <leo.yan@linaro.org>
> +Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> +Reviewed-by: Mike Leach <mike.leach@linaro.org>
> +Tested-by: Mike Leach <mike.leach@linaro.org>
> +Tested-by: Thomas Backlund <tmb@mageia.org>
> +Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> +Cc: Jiri Olsa <jolsa@redhat.com>
> +Cc: Mark Rutland <mark.rutland@arm.com>
> +Cc: Namhyung Kim <namhyung@kernel.org>
> +Cc: Peter Zijlstra <peterz@infradead.org>
> +Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
> +Cc: Tor Jeremiassen <tor@ti.com>
> +Cc: linux-arm-kernel@lists.infradead.org
> +Link:
> http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.org
> +Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> +---
> + tools/perf/util/cs-etm.c | 3 +++
> + tools/perf/util/cs-etm.h | 3 ---
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> +index 3c802fde4954..c283223fb31f 100644
> +--- a/tools/perf/util/cs-etm.c
> ++++ b/tools/perf/util/cs-etm.c
> +@@ -94,6 +94,9 @@ struct cs_etm_queue {
> +       struct cs_etm_traceid_queue **traceid_queues;
> + };
> +
> ++/* RB tree for quick conversion between traceID and metadata pointers */
> ++static struct intlist *traceid_list;
> ++
> + static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
> + static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
> + static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
> +diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
> +index 650ecc2a6349..4ad925d6d799 100644
> +--- a/tools/perf/util/cs-etm.h
> ++++ b/tools/perf/util/cs-etm.h
> +@@ -114,9 +114,6 @@ enum cs_etm_isa {
> +       CS_ETM_ISA_T32,
> + };
> +
> +-/* RB tree for quick conversion between traceID and metadata pointers */
> +-struct intlist *traceid_list;
> +-
> + struct cs_etm_queue;
> +
> + struct cs_etm_packet {
> +--
> +2.28.0
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> index f85c54e7f7..5a3180f36d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -32,6 +32,8 @@ SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRA>
>  SRC_URI_append_qemuppc64 = " file://defconfig"
>  CFLAGS += "-Wno-error"
>
> +SRC_URI_append = "
> file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch"
> +
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>  LINUX_VERSION ?= "5.4.57"
>
> --
> 2.28.0
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000041445105ad063577
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Aug 16, 2020 at 3:08 AM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Temp fix until linux-yoct=
o picks it up<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">These really need to be submitted to the linux-yocto mail=
ing list as proper patches.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">When they are submitted like this, it requires me to extract the patch, =
or hunt up the original commit, see if it has already been submitted to lin=
ux-stable (and if not, it should be), apply it to the kernel, revert this c=
ommit if it happens to have merged and then finally do my update.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">or, it could be submitted to linux=
-yocto like any patch, and it will be applied and show up with the next upd=
ate.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll take care o=
f getting this into linux-yocto with my update that is coming later today.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-definition-of-traceid_list-global-v.patch | 66 +++++++++++++++++=
++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a>=C2=A0 |=C2=A0 2 +=
<br>
=C2=A02 files changed, 68 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/0001-perf-cs-etm-=
Move-definition-of-traceid_list-global-v.patch<br>
<br>
diff --git a/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definit=
ion-of-traceid_list-global-v.patch b/meta/recipes-kernel/linux/files/0001-p=
erf-cs-etm-Move-definition-of-traceid_list-global-v.patch<br>
new file mode 100644<br>
index 0000000000..0fc9876501<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/0001-perf-cs-etm-Move-definition-of-=
traceid_list-global-v.patch<br>
@@ -0,0 +1,66 @@<br>
+From 168200b6d6ea0cb5765943ec5da5b8149701f36a Mon Sep 17 00:00:00 2001<br=
>
+From: Leo Yan &lt;<a href=3D"mailto:leo.yan@linaro.org" target=3D"_blank"=
>leo.yan@linaro.org</a>&gt;<br>
+Date: Tue, 5 May 2020 21:36:42 +0800<br>
+Subject: [PATCH] perf cs-etm: Move definition of &#39;traceid_list&#39; g=
lobal<br>
+ variable from header file<br>
+<br>
+The variable &#39;traceid_list&#39; is defined in the header file cs-etm.=
h,<br>
+if multiple C files include cs-etm.h the compiler might complaint for<br>
+multiple definition of &#39;traceid_list&#39;.<br>
+<br>
+To fix multiple definition error, move the definition of &#39;traceid_lis=
t&#39;<br>
+into cs-etm.c.<br>
+<br>
+Fixes: cd8bfd8c973e (&quot;perf tools: Add processing of coresight metada=
ta&quot;)<br>
+Reported-by: Thomas Backlund &lt;<a href=3D"mailto:tmb@mageia.org" target=
=
=3D"_blank">tmb@mageia.org</a>&gt;<br>
+Signed-off-by: Leo Yan &lt;<a href=3D"mailto:leo.yan@linaro.org" target=
=3D"_blank">leo.yan@linaro.org</a>&gt;<br>
+Reviewed-by: Mathieu Poirier &lt;<a href=3D"mailto:mathieu.poirier@linaro=
.org" target=3D"_blank">mathieu.poirier@linaro.org</a>&gt;<br>
+Reviewed-by: Mike Leach &lt;<a href=3D"mailto:mike.leach@linaro.org" targ=
et=3D"_blank">mike.leach@linaro.org</a>&gt;<br>
+Tested-by: Mike Leach &lt;<a href=3D"mailto:mike.leach@linaro.org" target=
=
=3D"_blank">mike.leach@linaro.org</a>&gt;<br>
+Tested-by: Thomas Backlund &lt;<a href=3D"mailto:tmb@mageia.org" target=
=3D"_blank">tmb@mageia.org</a>&gt;<br>
+Cc: Alexander Shishkin &lt;<a href=3D"mailto:alexander.shishkin@linux.int=
el.com" target=3D"_blank">alexander.shishkin@linux.intel.com</a>&gt;<br>
+Cc: Jiri Olsa &lt;<a href=3D"mailto:jolsa@redhat.com" target=3D"_blank">j=
olsa@redhat.com</a>&gt;<br>
+Cc: Mark Rutland &lt;<a href=3D"mailto:mark.rutland@arm.com" target=3D"_b=
lank">mark.rutland@arm.com</a>&gt;<br>
+Cc: Namhyung Kim &lt;<a href=3D"mailto:namhyung@kernel.org" target=3D"_bl=
ank">namhyung@kernel.org</a>&gt;<br>
+Cc: Peter Zijlstra &lt;<a href=3D"mailto:peterz@infradead.org" target=3D"=
_blank">peterz@infradead.org</a>&gt;<br>
+Cc: Suzuki Poulouse &lt;<a href=3D"mailto:suzuki.poulose@arm.com" target=
=3D"_blank">suzuki.poulose@arm.com</a>&gt;<br>
+Cc: Tor Jeremiassen &lt;<a href=3D"mailto:tor@ti.com" target=3D"_blank">t=
or@ti.com</a>&gt;<br>
+Cc: <a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_bl=
ank">linux-arm-kernel@lists.infradead.org</a><br>
+Link: <a href=3D"http://lore.kernel.org/lkml/20200505133642.4756-1-leo.ya=
n@linaro.org" rel=3D"noreferrer" target=3D"_blank">http://lore.kernel.org/l=
kml/20200505133642.4756-1-leo.yan@linaro.org</a><br>
+Signed-off-by: Arnaldo Carvalho de Melo &lt;<a href=3D"mailto:acme@redhat=
.com" target=3D"_blank">acme@redhat.com</a>&gt;<br>
+---<br>
+ tools/perf/util/cs-etm.c | 3 +++<br>
+ tools/perf/util/cs-etm.h | 3 ---<br>
+ 2 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c<br>
+index 3c802fde4954..c283223fb31f 100644<br>
+--- a/tools/perf/util/cs-etm.c<br>
++++ b/tools/perf/util/cs-etm.c<br>
+@@ -94,6 +94,9 @@ struct cs_etm_queue {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cs_etm_traceid_queue **traceid_queues;<=
br>
+ };<br>
+ <br>
++/* RB tree for quick conversion between traceID and metadata pointers */=
<br>
++static struct intlist *traceid_list;<br>
++<br>
+ static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);<br>
+ static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);<br>
+ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,<=
br>
+diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h<br>
+index 650ecc2a6349..4ad925d6d799 100644<br>
+--- a/tools/perf/util/cs-etm.h<br>
++++ b/tools/perf/util/cs-etm.h<br>
+@@ -114,9 +114,6 @@ enum cs_etm_isa {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CS_ETM_ISA_T32,<br>
+ };<br>
+ <br>
+-/* RB tree for quick conversion between traceID and metadata pointers */=
<br>
+-struct intlist *traceid_list;<br>
+-<br>
+ struct cs_etm_queue;<br>
+ <br>
+ struct cs_etm_packet {<br>
+-- <br>
+2.28.0<br>
+<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a> b/meta/recip=
es-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">linux-yocto_5.4.bb</a><br>
index f85c54e7f7..5a3180f36d 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a><br>
@@ -32,6 +32,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproje=
ct.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=3D"noreferrer"=
 target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine;bran=
ch=3D${KBRA</a><br>
=C2=A0SRC_URI_append_qemuppc64 =3D &quot; file://defconfig&quot;<br>
=C2=A0CFLAGS +=3D &quot;-Wno-error&quot;<br>
<br>
+SRC_URI_append =3D &quot; file://0001-perf-cs-etm-Move-definition-of-trac=
eid_list-global-v.patch&quot;<br>
+<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815ee2795b2f4230=
826c0c6b8814&quot;<br>
=C2=A0LINUX_VERSION ?=3D &quot;5.4.57&quot;<br>
<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--00000000000041445105ad063577--
