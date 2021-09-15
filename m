Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web08.9191.1631718414028851357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 08:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V3hwcvMj;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id a25so3065485vso.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3h4cpPKH759CuUaWOyEnNv1j2zGEk3QNQ6YrpW9z1Uc=;
        b=V3hwcvMjfSvrEmC3CNsF6OFm2hMIvaTjZM1pFpU143DVNA7T0BvPg80xOQtdhT5679
         vwFkFeJ8oMP8fOugApKugHTfudqvjruP+yea+i2GCJyWexlW0Gdo1D+oiIJOtut+ibCX
         YHcNPvkXlzdxnvcW/wGD8/vaG5vw6lF2QWLBItITwiXAxrpNhBRwWKaVVYcnuoun3Dxl
         O/JZaJZ+KL84c/2WkBalxadJY7CDVDx70DIGypwDbE8sHayl/ZxDMFIgIW8BWYq1vdWr
         lgS+DMgRSNkv1zfUO9FKu5TP0Q4yxlZHhkjDCLY80jDNFLl7mokiOPOTeNrrFyqyeeIS
         a6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3h4cpPKH759CuUaWOyEnNv1j2zGEk3QNQ6YrpW9z1Uc=;
        b=A7hKNhBK2B6BIcmYGRkiua+C4X8s0cOMld4XjU1uX3vBnHBUw+mhxZbLEsnGeu1st2
         TCOC6i4lcbwFRu97xHRY6VfIb4m7YswV+HB8E+gdTk754aLC2a/fcaCMwjnol8JRqYMZ
         H71mVrhlbzwDRBLBEbR9V0U7C8eW/z6zasDaaZJCbwSniN69pMq7muwX1IGi2V69Xf79
         MojADJSLpy9MI2lsN/j1ZdM+xp8up94E/eTV4sx8J0jiHjvgWONPb9FD9eIkKYLQXXT+
         1385o2mu/L5fe+8fHWVXd2Gjl569sMEEMszTXd8lVHzHb2vhB19xAzTjM+U/c4xlKx2i
         7k1w==
X-Gm-Message-State: AOAM533sggT76OcLR2nBBzwL3aV/aifMWVrdgVpExthAm2kf9GZfkxeg
	Nkbb5wwu8WuOwc+HyivYyw1H3ALxYNWtHMGMmy0=
X-Google-Smtp-Source: ABdhPJz/irKr5xzQ/5Ers7IFcwvwfdCbcByQQinVUq3aNTMWCasDFFk0Ut13K+LB34b9Gn3axKNFZXi2xZpzRCERghQ=
X-Received: by 2002:a05:6102:a83:: with SMTP id n3mr334489vsg.40.1631718413140;
 Wed, 15 Sep 2021 08:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210908140219.19249-1-ranjitsinhrathod1991@gmail.com> <CAOSpxdbipM+VBMEFfyF4aS-AnpMJEEKsDUb9zTRhCLdTqM40Yg@mail.gmail.com>
In-Reply-To: <CAOSpxdbipM+VBMEFfyF4aS-AnpMJEEKsDUb9zTRhCLdTqM40Yg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 15 Sep 2021 17:06:42 +0200
Message-ID: <CANNYZj_M-k-F4eB6GOxaaNext05h4FGLaT59G92N6YMDXrb=nw@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] rpm: Handle proper return value to avoid major issues and removing unnecessary code
To: Steve Sakoman <steve@sakoman.com>
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Content-Type: multipart/alternative; boundary="0000000000006386b805cc0a0c17"

--0000000000006386b805cc0a0c17
Content-Type: text/plain; charset="UTF-8"

At this point I have to note that I am removing the patch altogether with
the upcoming upgrade of rpm to 4.17, as I'm also switching the compression
format to zstd, and the patch is generally difficult to maintain and
rebase. If you care about xz compression, please do work with upstream to
get it merged there.

Alex

On Wed, 15 Sept 2021 at 16:59, Steve Sakoman <steve@sakoman.com> wrote:

> On Wed, Sep 8, 2021 at 4:02 AM Ranjitsinh Rathod
> <ranjitsinhrathod1991@gmail.com> wrote:
> >
> > From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> >
> > Change in 2 patch as below to avoid critical issues
> > 1) 0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> > Handled return values of getrlimit() and lzma_cputhreads() functions
> > to avoid unexpected behaviours like devide by zero and potential read
> > of uninitialized variable 'virtual_memory'
> > Upstream-Status: Pending [merge of multithreading patches to upstream]
>
> This does look like a good fix.  Are these changes to the patch from
> upstream?
>
> Once upstream has accepted the change we should change the status from
> "pending", but for now this is ok.
>
> > 2) CVE-2021-3421.patch
> > Removed RPMSIGTAG_FILESIGNATURES and RPMSIGTAG_FILESIGNATURELENGTH as
> > it is not needed during backporting of original patch.
> > Upstream-Status: Backport [
> https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21
> ]
>
> Removing these unused definitions doesn't really seem like a critical
> issue. I'd prefer to leave the CVE patch in its original form.
>
> Could you submit a V2 with this change?
>
> Thanks!
>
> Steve
>
> > Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > ---
> >  ...rict-virtual-memory-usage-if-limit-s.patch | 25 ++++++++-------
> >  .../rpm/files/CVE-2021-3421.patch             | 32 +++----------------
> >  2 files changed, 19 insertions(+), 38 deletions(-)
> >
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> > index 6454785254..dc3f74fecd 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> > @@ -11,36 +11,39 @@ CPU thread.
> >  Upstream-Status: Pending [merge of multithreading patches to upstream]
> >
> >  Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> >  ---
> > - rpmio/rpmio.c | 34 ++++++++++++++++++++++++++++++++++
> > - 1 file changed, 34 insertions(+)
> > + rpmio/rpmio.c | 36 ++++++++++++++++++++++++++++++++++++
> > + 1 file changed, 36 insertions(+)
> >
> >  diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
> >  index e051c98..b3c56b6 100644
> >  --- a/rpmio/rpmio.c
> >  +++ b/rpmio/rpmio.c
> > -@@ -845,6 +845,40 @@ static LZFILE *lzopen_internal(const char *mode,
> int fd, int xz)
> > +@@ -845,6 +845,42 @@ static LZFILE *lzopen_internal(const char *mode,
> int fd, int xz)
> >                 }
> >   #endif
> >
> > -+              struct rlimit virtual_memory;
> > -+              getrlimit(RLIMIT_AS, &virtual_memory);
> > -+              if (virtual_memory.rlim_cur != RLIM_INFINITY) {
> > ++              struct rlimit virtual_memory = {RLIM_INFINITY ,
> RLIM_INFINITY};
> > ++              int status = getrlimit(RLIMIT_AS, &virtual_memory);
> > ++              if ((status != -1) && (virtual_memory.rlim_cur !=
> RLIM_INFINITY)) {
> >  +                      const uint64_t virtual_memlimit =
> virtual_memory.rlim_cur;
> > ++                      uint32_t threads_max = lzma_cputhreads();
> >  +                      const uint64_t virtual_memlimit_per_cpu_thread =
> > -+                              virtual_memlimit / lzma_cputhreads();
> > -+                      uint64_t memory_usage_virt;
> > ++                              virtual_memlimit / ((threads_max == 0) ?
> 1 : threads_max);
> >  +                      rpmlog(RPMLOG_NOTICE, "XZ: virtual memory
> restricted to %lu and "
> >  +                             "per CPU thread %lu\n", virtual_memlimit,
> virtual_memlimit_per_cpu_thread);
> > ++                      uint64_t memory_usage_virt;
> >  +                      /* keep reducing the number of compression
> threads until memory
> >  +                         usage falls below the limit per CPU thread*/
> >  +                      while ((memory_usage_virt =
> lzma_stream_encoder_mt_memusage(&mt_options)) >
> >  +                             virtual_memlimit_per_cpu_thread) {
> > -+                              /* If number of threads goes down to
> zero lzma_stream_encoder will
> > -+                               * will return UINT64_MAX. We must check
> here to avoid an infinite loop.
> > ++                              /* If number of threads goes down to
> zero or in case of any other error
> > ++                               * lzma_stream_encoder_mt_memusage will
> return UINT64_MAX. We must check
> > ++                               * for both the cases here to avoid an
> infinite loop.
> >  +                               * If we get into situation that one
> thread requires more virtual memory
> >  +                               * than available we set one thread,
> print error message and try anyway. */
> > -+                              if (--mt_options.threads == 0) {
> > ++                              if ((--mt_options.threads == 0) ||
> (memory_usage_virt == UINT64_MAX)) {
> >  +                                      mt_options.threads = 1;
> >  +                                      rpmlog(RPMLOG_WARNING,
> >  +                                             "XZ: Could not adjust
> number of threads to get below "
> > diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
> b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
> > index b1a05b6863..d2ad5eabac 100644
> > --- a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
> > +++ b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
> > @@ -22,16 +22,16 @@ Fixes: CVE-2021-3421, CVE-2021-20271
> >  Upstream-Status: Backport [
> https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21
> ]
> >  CVE: CVE-2021-3421
> >  Signed-off-by: Minjae Kim <flowergom@gmail.com>
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> >  ---
> > - lib/package.c | 115 ++++++++++++++++++++++++--------------------------
> > - lib/rpmtag.h  |   4 ++
> > - 2 files changed, 58 insertions(+), 61 deletions(-)
> > + lib/package.c | 113 ++++++++++++++++++++++++--------------------------
> > + 1 file changed, 52 insertions(+), 61 deletions(-)
> >
> >  diff --git a/lib/package.c b/lib/package.c
> >  index 081123d84e..7c26ea323f 100644
> >  --- a/lib/package.c
> >  +++ b/lib/package.c
> > -@@ -20,76 +20,68 @@
> > +@@ -20,76 +20,67 @@
> >
> >   #include "debug.h"
> >
> > @@ -46,8 +46,6 @@ index 081123d84e..7c26ea323f 100644
> >  +    { RPMSIGTAG_GPG, RPMTAG_SIGGPG, 0 },
> >  +    /* { RPMSIGTAG_PGP5, RPMTAG_SIGPGP5, 0 }, */ /* long obsolete,
> dont use */
> >  +    { RPMSIGTAG_PAYLOADSIZE, RPMTAG_ARCHIVESIZE, 1 },
> > -+    { RPMSIGTAG_FILESIGNATURES, RPMTAG_FILESIGNATURES, 0 },
> > -+    { RPMSIGTAG_FILESIGNATURELENGTH, RPMTAG_FILESIGNATURELENGTH, 1 },
> >  +    { RPMSIGTAG_SHA1, RPMTAG_SHA1HEADER, 1 },
> >  +    { RPMSIGTAG_SHA256, RPMTAG_SHA256HEADER, 1 },
> >  +    { RPMSIGTAG_DSA, RPMTAG_DSAHEADER, 0 },
> > @@ -61,6 +59,7 @@ index 081123d84e..7c26ea323f 100644
> >    * Translate and merge legacy signature tags into header.
> >    * @param h           header (dest)
> >    * @param sigh                signature header (src)
> > ++ * @return            failing tag number, 0 on success
> >    */
> >   static
> >  -void headerMergeLegacySigs(Header h, Header sigh)
> > @@ -170,27 +169,6 @@ index 081123d84e..7c26ea323f 100644
> >             applyRetrofits(h);
> >
> >             /* Bump reference count for return. */
> > -diff --git a/lib/rpmtag.h b/lib/rpmtag.h
> > -index 8c718b31b5..d562572c6f 100644
> > ---- a/lib/rpmtag.h
> > -+++ b/lib/rpmtag.h
> > -@@ -65,6 +65,8 @@ typedef enum rpmTag_e {
> > -     RPMTAG_LONGARCHIVESIZE    = RPMTAG_SIG_BASE+15,   /* l */
> > -     /* RPMTAG_SIG_BASE+16 reserved */
> > -     RPMTAG_SHA256HEADER               = RPMTAG_SIG_BASE+17,   /* s */
> > -+    /* RPMTAG_SIG_BASE+18 reserved for RPMSIGTAG_FILESIGNATURES */
> > -+    /* RPMTAG_SIG_BASE+19 reserved for RPMSIGTAG_FILESIGNATURELENGTH */
> > -
> > -     RPMTAG_NAME               = 1000, /* s */
> > - #define       RPMTAG_N        RPMTAG_NAME     /* s */
> > -@@ -422,6 +424,8 @@ typedef enum rpmSigTag_e {
> > -     RPMSIGTAG_LONGSIZE        = RPMTAG_LONGSIGSIZE,   /*!< internal
> Header+Payload size (64bit) in bytes. */
> > -     RPMSIGTAG_LONGARCHIVESIZE = RPMTAG_LONGARCHIVESIZE, /*!< internal
> uncompressed payload size (64bit) in bytes. */
> > -     RPMSIGTAG_SHA256  = RPMTAG_SHA256HEADER,
> > -+    RPMSIGTAG_FILESIGNATURES            = RPMTAG_SIG_BASE + 18,
> > -+    RPMSIGTAG_FILESIGNATURELENGTH       = RPMTAG_SIG_BASE + 19,
> > - } rpmSigTag;
> > -
> >
> >  --
> >  2.17.1
> > --
> > 2.17.1
> >
> >
> >
> >
>
> 
>
>

--0000000000006386b805cc0a0c17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>At this point I have to note that I am removing the p=
atch altogether with the upcoming upgrade of rpm to 4.17, as I&#39;m also s=
witching the compression format to zstd, and the patch is generally difficu=
lt to maintain and rebase. If you care about xz compression, please do work=
 with upstream to get it merged there.</div><div><br></div><div>Alex<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, 15 Sept 2021 at 16:59, Steve Sakoman &lt;<a href=3D"mailto:steve=
@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Sep 8, 2021 at 4:02 AM Ranjitsinh =
Rathod<br>
&lt;<a href=3D"mailto:ranjitsinhrathod1991@gmail.com" target=3D"_blank">ran=
jitsinhrathod1991@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kpit.c=
om" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt;<br>
&gt; Change in 2 patch as below to avoid critical issues<br>
&gt; 1) 0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch<br>
&gt; Handled return values of getrlimit() and lzma_cputhreads() functions<b=
r>
&gt; to avoid unexpected behaviours like devide by zero and potential read<=
br>
&gt; of uninitialized variable &#39;virtual_memory&#39;<br>
&gt; Upstream-Status: Pending [merge of multithreading patches to upstream]=
<br>
<br>
This does look like a good fix.=C2=A0 Are these changes to the patch from u=
pstream?<br>
<br>
Once upstream has accepted the change we should change the status from<br>
&quot;pending&quot;, but for now this is ok.<br>
<br>
&gt; 2) CVE-2021-3421.patch<br>
&gt; Removed RPMSIGTAG_FILESIGNATURES and RPMSIGTAG_FILESIGNATURELENGTH as<=
br>
&gt; it is not needed during backporting of original patch.<br>
&gt; Upstream-Status: Backport [<a href=3D"https://github.com/rpm-software-=
management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/rpm-software-management/rpm/co=
mmit/d6a86b5e69e46cc283b1e06c92343319beb42e21</a>]<br>
<br>
Removing these unused definitions doesn&#39;t really seem like a critical<b=
r>
issue. I&#39;d prefer to leave the CVE patch in its original form.<br>
<br>
Could you submit a V2 with this change?<br>
<br>
Thanks!<br>
<br>
Steve<br>
<br>
&gt; Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rath=
od@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...rict-virtual-memory-usage-if-limit-s.patch | 25 ++++++++-----=
--<br>
&gt;=C2=A0 .../rpm/files/CVE-2021-3421.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 32 +++----------------<br>
&gt;=C2=A0 2 files changed, 19 insertions(+), 38 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict=
-virtual-memory-usage-if-limit-s.patch b/meta/recipes-devtools/rpm/files/00=
01-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch<br>
&gt; index 6454785254..dc3f74fecd 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtua=
l-memory-usage-if-limit-s.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtua=
l-memory-usage-if-limit-s.patch<br>
&gt; @@ -11,36 +11,39 @@ CPU thread.<br>
&gt;=C2=A0 Upstream-Status: Pending [merge of multithreading patches to ups=
tream]<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Peter Bergin &lt;<a href=3D"mailto:peter@berginko=
nsult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt;<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - rpmio/rpmio.c | 34 ++++++++++++++++++++++++++++++++++<br>
&gt; - 1 file changed, 34 insertions(+)<br>
&gt; + rpmio/rpmio.c | 36 ++++++++++++++++++++++++++++++++++++<br>
&gt; + 1 file changed, 36 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c<br>
&gt;=C2=A0 index e051c98..b3c56b6 100644<br>
&gt;=C2=A0 --- a/rpmio/rpmio.c<br>
&gt;=C2=A0 +++ b/rpmio/rpmio.c<br>
&gt; -@@ -845,6 +845,40 @@ static LZFILE *lzopen_internal(const char *mode,=
 int fd, int xz)<br>
&gt; +@@ -845,6 +845,42 @@ static LZFILE *lzopen_internal(const char *mode,=
 int fd, int xz)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rlimit virtu=
al_memory;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getrlimit(RLIMIT_AS=
, &amp;virtual_memory);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virtual_memory.=
rlim_cur !=3D RLIM_INFINITY) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rlimit virtu=
al_memory =3D {RLIM_INFINITY , RLIM_INFINITY};<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int status =3D getr=
limit(RLIMIT_AS, &amp;virtual_memory);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((status !=3D -1=
) &amp;&amp; (virtual_memory.rlim_cur !=3D RLIM_INFINITY)) {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const uint64_t virtual_memlimit =3D virtual_memory.rlim_cur;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t threads_max =3D lzma_cputhreads();<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const uint64_t virtual_memlimit_per_cpu_thread =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual_memlimit / lzma_cputhreads()=
;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint64_t memory_usage_virt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual_memlimit / ((threads_max =3D=
=3D 0) ? 1 : threads_max);<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 rpmlog(RPMLOG_NOTICE, &quot;XZ: virtual memory restricted to =
%lu and &quot;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;per CPU thread %lu\n&quot;, =
virtual_memlimit, virtual_memlimit_per_cpu_thread);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint64_t memory_usage_virt;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* keep reducing the number of compression threads until memo=
ry<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0usage falls below the limit per CPU thread*/<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 while ((memory_usage_virt =3D lzma_stream_encoder_mt_memusage=
(&amp;mt_options)) &gt;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual_memlimit_per_cpu_thread) {=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If number of threads goes down to=
 zero lzma_stream_encoder will<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* will return UINT64_MAX. We m=
ust check here to avoid an infinite loop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If number of threads goes down to=
 zero or in case of any other error<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* lzma_stream_encoder_mt_memus=
age will return UINT64_MAX. We must check<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for both the cases here to a=
void an infinite loop.<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If we get into situation =
that one thread requires more virtual memory<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* than available we set one=
 thread, print error message and try anyway. */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (--mt_options.threads =3D=3D 0) {=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((--mt_options.threads =3D=3D 0) =
|| (memory_usage_virt =3D=3D UINT64_MAX)) {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mt_op=
tions.threads =3D 1;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlo=
g(RPMLOG_WARNING,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;XZ: Could not adjust number of threads to get=
 below &quot;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch b/met=
a/recipes-devtools/rpm/files/CVE-2021-3421.patch<br>
&gt; index b1a05b6863..d2ad5eabac 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch<br>
&gt; @@ -22,16 +22,16 @@ Fixes: CVE-2021-3421, CVE-2021-20271<br>
&gt;=C2=A0 Upstream-Status: Backport [<a href=3D"https://github.com/rpm-sof=
tware-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software-managemen=
t/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21</a>]<br>
&gt;=C2=A0 CVE: CVE-2021-3421<br>
&gt;=C2=A0 Signed-off-by: Minjae Kim &lt;<a href=3D"mailto:flowergom@gmail.=
com" target=3D"_blank">flowergom@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - lib/package.c | 115 ++++++++++++++++++++++++------------------------=
--<br>
&gt; - lib/rpmtag.h=C2=A0 |=C2=A0 =C2=A04 ++<br>
&gt; - 2 files changed, 58 insertions(+), 61 deletions(-)<br>
&gt; + lib/package.c | 113 ++++++++++++++++++++++++------------------------=
--<br>
&gt; + 1 file changed, 52 insertions(+), 61 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/lib/package.c b/lib/package.c<br>
&gt;=C2=A0 index 081123d84e..7c26ea323f 100644<br>
&gt;=C2=A0 --- a/lib/package.c<br>
&gt;=C2=A0 +++ b/lib/package.c<br>
&gt; -@@ -20,76 +20,68 @@<br>
&gt; +@@ -20,76 +20,67 @@<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#include &quot;debug.h&quot;<br>
&gt;<br>
&gt; @@ -46,8 +46,6 @@ index 081123d84e..7c26ea323f 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 { RPMSIGTAG_GPG, RPMTAG_SIGGPG, 0 },<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 /* { RPMSIGTAG_PGP5, RPMTAG_SIGPGP5, 0 }, */ /* l=
ong obsolete, dont use */<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 { RPMSIGTAG_PAYLOADSIZE, RPMTAG_ARCHIVESIZE, 1 },=
<br>
&gt; -+=C2=A0 =C2=A0 { RPMSIGTAG_FILESIGNATURES, RPMTAG_FILESIGNATURES, 0 }=
,<br>
&gt; -+=C2=A0 =C2=A0 { RPMSIGTAG_FILESIGNATURELENGTH, RPMTAG_FILESIGNATUREL=
ENGTH, 1 },<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 { RPMSIGTAG_SHA1, RPMTAG_SHA1HEADER, 1 },<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 { RPMSIGTAG_SHA256, RPMTAG_SHA256HEADER, 1 },<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 { RPMSIGTAG_DSA, RPMTAG_DSAHEADER, 0 },<br>
&gt; @@ -61,6 +59,7 @@ index 081123d84e..7c26ea323f 100644<br>
&gt;=C2=A0 =C2=A0 * Translate and merge legacy signature tags into header.<=
br>
&gt;=C2=A0 =C2=A0 * @param h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0header=
 (dest)<br>
&gt;=C2=A0 =C2=A0 * @param sigh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 signature header (src)<br>
&gt; ++ * @return=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 failing tag numb=
er, 0 on success<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0static<br>
&gt;=C2=A0 -void headerMergeLegacySigs(Header h, Header sigh)<br>
&gt; @@ -170,27 +169,6 @@ index 081123d84e..7c26ea323f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0applyRetrofits(h);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Bump reference count=
 for return. */<br>
&gt; -diff --git a/lib/rpmtag.h b/lib/rpmtag.h<br>
&gt; -index 8c718b31b5..d562572c6f 100644<br>
&gt; ---- a/lib/rpmtag.h<br>
&gt; -+++ b/lib/rpmtag.h<br>
&gt; -@@ -65,6 +65,8 @@ typedef enum rpmTag_e {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RPMTAG_LONGARCHIVESIZE=C2=A0 =C2=A0 =3D RPMTAG_SI=
G_BASE+15,=C2=A0 =C2=A0/* l */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* RPMTAG_SIG_BASE+16 reserved */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RPMTAG_SHA256HEADER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D RPMTAG_SIG_BASE+17,=C2=A0 =C2=A0/* s */<br>
&gt; -+=C2=A0 =C2=A0 /* RPMTAG_SIG_BASE+18 reserved for RPMSIGTAG_FILESIGNA=
TURES */<br>
&gt; -+=C2=A0 =C2=A0 /* RPMTAG_SIG_BASE+19 reserved for RPMSIGTAG_FILESIGNA=
TURELENGTH */<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RPMTAG_NAME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 1000, /* s */<br>
&gt; - #define=C2=A0 =C2=A0 =C2=A0 =C2=A0RPMTAG_N=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 RPMTAG_NAME=C2=A0 =C2=A0 =C2=A0/* s */<br>
&gt; -@@ -422,6 +424,8 @@ typedef enum rpmSigTag_e {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RPMSIGTAG_LONGSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 RPMTAG_LONGSIGSIZE,=C2=A0 =C2=A0/*!&lt; internal Header+Payload size (64bi=
t) in bytes. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RPMSIGTAG_LONGARCHIVESIZE =3D RPMTAG_LONGARCHIVES=
IZE, /*!&lt; internal uncompressed payload size (64bit) in bytes. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RPMSIGTAG_SHA256=C2=A0 =3D RPMTAG_SHA256HEADER,<b=
r>
&gt; -+=C2=A0 =C2=A0 RPMSIGTAG_FILESIGNATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D RPMTAG_SIG_BASE + 18,<br>
&gt; -+=C2=A0 =C2=A0 RPMSIGTAG_FILESIGNATURELENGTH=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D RPMTAG_SIG_BASE + 19,<br>
&gt; - } rpmSigTag;<br>
&gt; -<br>
&gt;<br>
&gt;=C2=A0 --<br>
&gt;=C2=A0 2.17.1<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000006386b805cc0a0c17--
