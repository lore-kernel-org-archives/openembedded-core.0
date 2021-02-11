Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.11042.1613061222526248471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=s+uUA6TU;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.44, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f44.google.com with SMTP id m13so4739129wro.12
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 08:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6+0cIG5PNzEzYLMJuod7gZ2I7J7py7IZI/1IJwY4iV0=;
        b=s+uUA6TUy+BJRn1anyVQGIh99CTrSNw74F2+a1Vqq9gV6o6o0R6y3WZHy4kN9QPJiW
         rsmVHhGOsmNBtnjlY6HPH6JdwM5jF78yZe/dt3bnqCw+ueaWUdXQ4FifiUvn76XOFsxT
         xA6HMmxOFhwKs+JJBddB5oyF3FWW4ZhMfuXDMNQRx59cjV7jgRrGQUMbcmLkcLfLN482
         GspOJ4OSiA55lM0NsG5PT2cypOUVpd70nncXMF7eJ78MqYy2lkkL4A+tgyhQtJDVXFUz
         1MTuvx3XsIOxButw2z1Vt6Vi6TAS3iTtVKjnk6NaPG+I9fo6KZizXjIJCTkplVXTviQt
         CUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+0cIG5PNzEzYLMJuod7gZ2I7J7py7IZI/1IJwY4iV0=;
        b=F9pkQxFn+dWC7mncNdmWvL2FTYiAmKHbhW/tPfXUwR0iIRe2kIxVjS2QoLodfyFPjy
         I+yMO0/PRJy93TzunZcpPc16zV/pdYFjmHGseJpxf4HLMZTKvJqwA1H6xjCJSYjjdk4V
         eK+bjQcbomStqinIcbnugh02dUm/sx9aUMsWM7i0M0INRwjn/tz+EpwK0G2GpLNMy2dX
         8xdTogYgwTVNxg91K7u/rZMt0BJLT1aumy3XdH89y3/lMQ/oLggAs5tyP7C9wjzV92uf
         0BIQ49Og/vcIo5VF9R8+zCBYFOJWJtPpOCtV3F1MJvDYZ+7uUFPXV26u+eWKMwCdGSHo
         AK0Q==
X-Gm-Message-State: AOAM530zHLSvzXF4iDb45tWyY4+hChZPYwi9ZQXAgDF4YcLG3N1aRzP7
	doi20ZLVUNczSB4edZaIwieOryU9ahitvktL7Cg1AA==
X-Google-Smtp-Source: ABdhPJz5XFyeW+/oEk1RGQ31pbk62qSep7I+6KcJW0i8+xcZIA793bl0HT409FqsH3jPlaf4ZOSzMrnW91qQroSAo5A=
X-Received: by 2002:a5d:47af:: with SMTP id 15mr6428721wrb.205.1613061220839;
 Thu, 11 Feb 2021 08:33:40 -0800 (PST)
MIME-Version: 1.0
References: <1662BCABA54EAE5B.31788@lists.openembedded.org>
 <CAPoiz9w2QC3rkKbgXa5N5ZsTTqH7hvHTDa=wMJyy-aqxMBvd6w@mail.gmail.com> <CAGDS+nmVLo0-39v-WPszKFQwVKxkoyd=4QrsmuOuLMCvCZwYHg@mail.gmail.com>
In-Reply-To: <CAGDS+nmVLo0-39v-WPszKFQwVKxkoyd=4QrsmuOuLMCvCZwYHg@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 11 Feb 2021 06:33:28 -1000
Message-ID: <CAOSpxdYOOFDj_bpOXP8CTpiNBcyxtsGDvJwmDWoQ0e_ZS=E+aA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH dunfell] gcc-9.3.inc: Fix potential runtime crash
To: Steve Sakoman <sakoman@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 11, 2021 at 6:30 AM Steve Sakoman <sakoman@gmail.com> wrote:
>
> On Thu, Feb 11, 2021 at 6:09 AM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Sorry, the subject should have "dunfell" in it
>
> No worries, I got it!

But as Ross pointed out you'll need to add the missing patch header
info before I can merge it ...

Steve

> > On Thu, Feb 11, 2021 at 10:57 AM Jon Mason via lists.openembedded.org
> > <jdmason=kudzu.us@lists.openembedded.org> wrote:
> > >
> > > GCCv9 tree vectorization code is faulty and can cause random crashes at
> > > runtime (when using -O3).  Add the backported patch to address this
> > > issue.
> > >
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  meta/recipes-devtools/gcc/gcc-9.3.inc         |   1 +
> > >  ...-PR-tree-optimization-97236-fix-bad-.patch | 116 ++++++++++++++++++
> > >  2 files changed, 117 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
> > > index 4c54ba250aba..1c8e3df51d91 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-9.3.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
> > > @@ -72,6 +72,7 @@ SRC_URI = "\
> > >             file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
> > >             file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
> > >             file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
> > > +           file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch \
> > >  "
> > >  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> > >  SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
> > > diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > > new file mode 100644
> > > index 000000000000..9020aa6c3a1e
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
> > > @@ -0,0 +1,116 @@
> > > +From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001
> > > +From: Matthias Klose <doko@ubuntu.com>
> > > +Date: Tue, 6 Oct 2020 13:41:37 +0200
> > > +Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use of
> > > + VMAT_CONTIGUOUS
> > > +
> > > +This avoids using VMAT_CONTIGUOUS with single-element interleaving
> > > +when using V1mode vectors.  Instead keep VMAT_ELEMENTWISE but
> > > +continue to avoid load-lanes and gathers.
> > > +
> > > +2020-10-01  Richard Biener  <rguenther@suse.de>
> > > +
> > > +       PR tree-optimization/97236
> > > +       * tree-vect-stmts.c (get_group_load_store_type): Keep
> > > +       VMAT_ELEMENTWISE for single-element vectors.
> > > +
> > > +       * gcc.dg/vect/pr97236.c: New testcase.
> > > +
> > > +(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)
> > > +---
> > > + gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++
> > > + gcc/tree-vect-stmts.c               | 20 ++++++--------
> > > + 2 files changed, 52 insertions(+), 11 deletions(-)
> > > + create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c
> > > +
> > > +diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/vect/pr97236.c
> > > +new file mode 100644
> > > +index 000000000000..9d3dc20d953d
> > > +--- /dev/null
> > > ++++ b/gcc/testsuite/gcc.dg/vect/pr97236.c
> > > +@@ -0,0 +1,43 @@
> > > ++typedef unsigned char __uint8_t;
> > > ++typedef __uint8_t uint8_t;
> > > ++typedef struct plane_t {
> > > ++  uint8_t *p_pixels;
> > > ++  int i_lines;
> > > ++  int i_pitch;
> > > ++} plane_t;
> > > ++
> > > ++typedef struct {
> > > ++  plane_t p[5];
> > > ++} picture_t;
> > > ++
> > > ++#define N 4
> > > ++
> > > ++void __attribute__((noipa))
> > > ++picture_Clone(picture_t *picture, picture_t *res)
> > > ++{
> > > ++  for (int i = 0; i < N; i++) {
> > > ++    res->p[i].p_pixels = picture->p[i].p_pixels;
> > > ++    res->p[i].i_lines = picture->p[i].i_lines;
> > > ++    res->p[i].i_pitch = picture->p[i].i_pitch;
> > > ++  }
> > > ++}
> > > ++
> > > ++int
> > > ++main()
> > > ++{
> > > ++  picture_t aaa, bbb;
> > > ++  uint8_t pixels[10] = {1, 1, 1, 1, 1, 1, 1, 1};
> > > ++
> > > ++  for (unsigned i = 0; i < N; i++)
> > > ++    aaa.p[i].p_pixels = pixels;
> > > ++
> > > ++  picture_Clone (&aaa, &bbb);
> > > ++
> > > ++  uint8_t c = 0;
> > > ++  for (unsigned i = 0; i < N; i++)
> > > ++    c += bbb.p[i].p_pixels[0];
> > > ++
> > > ++  if (c != N)
> > > ++    __builtin_abort ();
> > > ++  return 0;
> > > ++}
> > > +diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c
> > > +index 507f81b0a0e8..ffbba3441de2 100644
> > > +--- a/gcc/tree-vect-stmts.c
> > > ++++ b/gcc/tree-vect-stmts.c
> > > +@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info, tree vectype, bool slp,
> > > +         /* First cope with the degenerate case of a single-element
> > > +            vector.  */
> > > +         if (known_eq (TYPE_VECTOR_SUBPARTS (vectype), 1U))
> > > +-          *memory_access_type = VMAT_CONTIGUOUS;
> > > ++          ;
> > > +
> > > +         /* Otherwise try using LOAD/STORE_LANES.  */
> > > +-        if (*memory_access_type == VMAT_ELEMENTWISE
> > > +-            && (vls_type == VLS_LOAD
> > > +-                ? vect_load_lanes_supported (vectype, group_size, masked_p)
> > > +-                : vect_store_lanes_supported (vectype, group_size,
> > > +-                                              masked_p)))
> > > ++        else if (vls_type == VLS_LOAD
> > > ++                 ? vect_load_lanes_supported (vectype, group_size, masked_p)
> > > ++                 : vect_store_lanes_supported (vectype, group_size,
> > > ++                                               masked_p))
> > > +           {
> > > +             *memory_access_type = VMAT_LOAD_STORE_LANES;
> > > +             overrun_p = would_overrun_p;
> > > +           }
> > > +
> > > +         /* If that fails, try using permuting loads.  */
> > > +-        if (*memory_access_type == VMAT_ELEMENTWISE
> > > +-            && (vls_type == VLS_LOAD
> > > +-                ? vect_grouped_load_supported (vectype, single_element_p,
> > > +-                                               group_size)
> > > +-                : vect_grouped_store_supported (vectype, group_size)))
> > > ++        else if (vls_type == VLS_LOAD
> > > ++                 ? vect_grouped_load_supported (vectype, single_element_p,
> > > ++                                                group_size)
> > > ++                 : vect_grouped_store_supported (vectype, group_size))
> > > +           {
> > > +             *memory_access_type = VMAT_CONTIGUOUS_PERMUTE;
> > > +             overrun_p = would_overrun_p;
> > > +--
> > > +2.20.1
> > > +
> > > --
> > > 2.20.1
> > >
> > >
> > >
> > >
> >
> >
> >
>
> 
>
