Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web09.28556.1628803432721037790
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 14:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iIXX32Ic;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id a93so14676498ybi.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7CCBv1gLWxZU1MlPxBZEY6J6jU+ebcwHVIZWTsbiGTI=;
        b=iIXX32IcD5QrzAZQ9xMM2Npgyu+31eXgUaisSEbzP06/s3MITZWb+qTxa5d2C0MmiX
         6qIrC54UUUd3IziNgNhLbKxwRPROFPl7Z9ld1ot2sBXk+B/jJzc15ALU1wT1Ob+Dyx/9
         UevbxF+2cnGwKPcZ27Wb3S+hIaYGDGVytlPKiiEkPzYceUCR0RefY1rBC5+UJ6grFP2f
         iobXE6V4wDyLuPxARKDy9lf2ZGoMQJZw/9TzPbDlGhl6egMq5q2KjAmOXlIW7eDiZ0BP
         edpM9as3a+9X6B4z6y5U7Zk8H0OrDGF/V5yBwK61semNYMabh2VXwn0KQ9vnVAdl7EWQ
         Na7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7CCBv1gLWxZU1MlPxBZEY6J6jU+ebcwHVIZWTsbiGTI=;
        b=T8x8WbSCtLpKFEEu0HvdRD1fjJ4YUWokBUI2lj9GBujHWQFs+Mgr/BDnmJSmcfuzxp
         higPMXuMWT7UKeHACoB0VVoKGGQXnLJLw3cvL1YXKboDc9QHohzqKuLLcW3AVUjiUuPF
         vCXVanpRk7lSq6F8NfmCNXl3EQ048sDUrvLz8LMa9hxoaksdtSFrrZkjDAz+8eGjO4lr
         3le47yGaRMih319waun2QvphpFwkpKgm4FQZDP6sr/KZpx2LMF4mqjO+l9Pbscs12bps
         Xz+/SM0SVJaJGrCbnN9m0wopqPpzB3ciP3jx4lJoTa0+PslWIxTZ7laE5a3xvzDx8aRp
         kM+w==
X-Gm-Message-State: AOAM531R2IUCqCwvTNdRFlyas5kbQT9HommllFb3rfErmZIubWv67m1u
	bnn53iU2teLlaummDQucE+fp2zYCUat/Cnn4QbE=
X-Google-Smtp-Source: ABdhPJyUpXbBWMFtvJM+Yk33b+xvlqjsKGPpFAnxUzLAcV3SgWRqCgSSZ4TuKoUNWgV4amPWztAolXVI6eq7XZDsROU=
X-Received: by 2002:a25:3604:: with SMTP id d4mr7475663yba.523.1628803431919;
 Thu, 12 Aug 2021 14:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <1628762256-3816-1-git-send-email-purushottam.choudhary@kpit.com>
In-Reply-To: <1628762256-3816-1-git-send-email-purushottam.choudhary@kpit.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 12 Aug 2021 11:23:40 -1000
Message-ID: <CAGDS+n=QAZBHESyFmgU9VyuLwvJ_XfBRc53qP38bnX4dE0AzSA@mail.gmail.com>
Subject: Re: [poky][dunfell][PATCH] lighttpd: Add patch for reuse large memory chunks
To: Purushottam Choudhary <purushottam.choudhary@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Mikko Rapeli <Mikko.Rapeli@bmw.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Your patch doesn't apply to dunfell head:

Applying: lighttpd: Add patch for reuse large memory chunks
Using index info to reconstruct a base tree...
error: patch failed:
meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-depend=
ency-instead-of-config.patch:6
error: meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre=
-dependency-instead-of-config.patch:
patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 lighttpd: Add patch for reuse large memory chunks

On Wed, Aug 11, 2021 at 11:57 PM Purushottam Choudhary
<purushottam.choudhary@kpit.com> wrote:
>
> Added 0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
> to fix large memory usage for large file downloads
> from dynamic backends reuse or release large memory chunks.
>
> This issue is caused by a bug in the lighttpd 1.4.55 version and
> has been fixed in lighttpd 1.4.58. Hence, it is not needed for
> master and hardknott branch because lighttpd has 1.4.59 version.
>
> Link: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisi=
ons/7ba521ffb4959f6f74a609d5d4acafc29a038337
>
> Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
> ---
>  ...fig-for-pcre-dependency-instead-of-config.patch |  10 +-
>  ...large-mem-chunks-fix-mem-usage-fixes-3033.patch | 224 +++++++++++++++=
++++++
>  meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb  |   1 +
>  3 files changed, 229 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-reu=
se-large-mem-chunks-fix-mem-usage-fixes-3033.patch
>
> diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-=
for-pcre-dependency-instead-of-config.patch b/meta/recipes-extended/lighttp=
d/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
> index f17bdce..81bee7b 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcr=
e-dependency-instead-of-config.patch
> +++ b/meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcr=
e-dependency-instead-of-config.patch
> @@ -1,4 +1,4 @@
> -From 22afc5d9aaa215c3c87ba21c77d47da44ab3b113 Mon Sep 17 00:00:00 2001
> +From e777e2627f7c2c681fbc0a194768f101e0a8fc8f Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 26 Aug 2016 18:20:32 +0300
>  Subject: [PATCH] Use pkg-config for pcre dependency instead of -config s=
cript.
> @@ -6,15 +6,16 @@ Subject: [PATCH] Use pkg-config for pcre dependency ins=
tead of -config script.
>  RP 2014/5/22
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   configure.ac | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 5383cec..c29a902 100644
> +index dbddfb9..62cf17f 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -651,10 +651,18 @@ AC_ARG_WITH([pcre],
> +@@ -748,10 +748,18 @@ AC_ARG_WITH([pcre],
>   )
>   AC_MSG_RESULT([$WITH_PCRE])
>
> @@ -37,6 +38,3 @@ index 5383cec..c29a902 100644
>     else
>       AC_PATH_PROG([PCRECONFIG], [pcre-config])
>       if test -n "$PCRECONFIG"; then
> ---
> -2.15.0
> -
> diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-larg=
e-mem-chunks-fix-mem-usage-fixes-3033.patch b/meta/recipes-extended/lighttp=
d/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
> new file mode 100644
> index 0000000..cfd4129
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-c=
hunks-fix-mem-usage-fixes-3033.patch
> @@ -0,0 +1,224 @@
> +From 270ffeab77473d2ab30d4d09a9738b47bafb639b Mon Sep 17 00:00:00 2001
> +From: Glenn Strauss <gstrauss@gluelogic.com>
> +Date: Wed, 23 Dec 2020 23:14:47 -0500
> +Subject: [PATCH] reuse large mem chunks (fix mem usage) (fixes #3033)
> +
> +(cherry picked from commit 7ba521ffb4959f6f74a609d5d4acafc29a038337)
> +
> +(thx flynn)
> +
> +fix large memory usage for large file downloads from dynamic backends
> +
> +reuse or release large memory chunks
> +
> +x-ref:
> +  "Memory Growth with PUT and full buffered streams"
> +  https://redmine.lighttpd.net/issues/3033
> +
> +Upstream-Status: Backport
> +Comment: No hunk refreshed
> +https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/7=
ba521ffb4959f6f74a609d5d4acafc29a038337
> +Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
> +
> +---
> + src/chunk.c            | 99 ++++++++++++++++++++++++++++++++++++++++---=
-------
> + src/chunk.h            |  2 +
> + src/http-header-glue.c |  2 +-
> + 3 files changed, 82 insertions(+), 21 deletions(-)
> +
> +diff --git a/src/chunk.c b/src/chunk.c
> +index 09dd3f1..ffb3795 100644
> +--- a/src/chunk.c
> ++++ b/src/chunk.c
> +@@ -28,16 +28,20 @@
> + static size_t chunk_buf_sz =3D 4096;
> + static chunk *chunks, *chunks_oversized;
> + static chunk *chunk_buffers;
> ++static int chunks_oversized_n;
> + static array *chunkqueue_default_tempdirs =3D NULL;
> + static off_t chunkqueue_default_tempfile_size =3D DEFAULT_TEMPFILE_SIZE=
;
> +
> + void chunkqueue_set_chunk_size (size_t sz)
> + {
> +-    chunk_buf_sz =3D sz > 0 ? ((sz + 1023) & ~1023uL) : 4096;
> ++    size_t x =3D 1024;
> ++    while (x < sz && x < (1u << 30)) x <<=3D 1;
> ++    chunk_buf_sz =3D sz > 0 ? x : 4096;
> + }
> +
> + void chunkqueue_set_tempdirs_default_reset (void)
> + {
> ++    chunk_buf_sz =3D 8192;
> +     chunkqueue_default_tempdirs =3D NULL;
> +     chunkqueue_default_tempfile_size =3D DEFAULT_TEMPFILE_SIZE;
> + }
> +@@ -120,15 +124,49 @@ static void chunk_free(chunk *c) {
> +       free(c);
> + }
> +
> +-buffer * chunk_buffer_acquire(void) {
> ++static chunk * chunk_pop_oversized(size_t sz) {
> ++    /* future: might have buckets of certain sizes, up to socket buf si=
zes */
> ++    if (chunks_oversized && chunks_oversized->mem->size >=3D sz) {
> ++        --chunks_oversized_n;
> ++        chunk *c =3D chunks_oversized;
> ++        chunks_oversized =3D c->next;
> ++        return c;
> ++    }
> ++    return NULL;
> ++}
> ++
> ++static void chunk_push_oversized(chunk * const c, const size_t sz) {
> ++    if (chunks_oversized_n < 64 && chunk_buf_sz >=3D 4096) {
> ++        ++chunks_oversized_n;
> ++        chunk **co =3D &chunks_oversized;
> ++        while (*co && sz < (*co)->mem->size) co =3D &(*co)->next;
> ++        c->next =3D *co;
> ++        *co =3D c;
> ++    }
> ++    else
> ++        chunk_free(c);
> ++}
> ++
> ++static buffer * chunk_buffer_acquire_sz(size_t sz) {
> +     chunk *c;
> +     buffer *b;
> +-    if (chunks) {
> +-        c =3D chunks;
> +-        chunks =3D c->next;
> ++    if (sz <=3D chunk_buf_sz) {
> ++        if (chunks) {
> ++            c =3D chunks;
> ++            chunks =3D c->next;
> ++        }
> ++        else
> ++            c =3D chunk_init(chunk_buf_sz);
> ++            /* future: might choose to pop from chunks_oversized, if av=
ailable
> ++             * (even if larger than sz) rather than allocating new chun=
k
> ++             * (and if doing so, might replace chunks_oversized_n) */
> +     }
> +     else {
> +-        c =3D chunk_init(chunk_buf_sz);
> ++        /*(round up to nearest chunk_buf_sz)*/
> ++        sz =3D (sz + (chunk_buf_sz-1)) & ~(chunk_buf_sz-1);
> ++        c =3D chunk_pop_oversized(sz);
> ++        if (NULL =3D=3D c)
> ++            c =3D chunk_init(sz);
> +     }
> +     c->next =3D chunk_buffers;
> +     chunk_buffers =3D c;
> +@@ -137,21 +175,47 @@ buffer * chunk_buffer_acquire(void) {
> +     return b;
> + }
> +
> ++buffer * chunk_buffer_acquire(void) {
> ++    return chunk_buffer_acquire_sz(chunk_buf_sz);
> ++}
> ++
> + void chunk_buffer_release(buffer *b) {
> +     if (NULL =3D=3D b) return;
> +-    if (b->size >=3D chunk_buf_sz && chunk_buffers) {
> ++    if (chunk_buffers) {
> +         chunk *c =3D chunk_buffers;
> +         chunk_buffers =3D c->next;
> +         c->mem =3D b;
> +-        c->next =3D chunks;
> +-        chunks =3D c;
> +         buffer_clear(b);
> ++        if (b->size =3D=3D chunk_buf_sz) {
> ++            c->next =3D chunks;
> ++            chunks =3D c;
> ++        }
> ++        else if (b->size > chunk_buf_sz)
> ++            chunk_push_oversized(c, b->size);
> ++        else
> ++            chunk_free(c);
> +     }
> +     else {
> +         buffer_free(b);
> +     }
> + }
> +
> ++size_t chunk_buffer_prepare_append(buffer * const b, size_t sz) {
> ++    if (sz > chunk_buffer_string_space(b)) {
> ++        sz +=3D b->used ? b->used : 1;
> ++        buffer * const cb =3D chunk_buffer_acquire_sz(sz);
> ++        /* swap buffer contents and copy original b->ptr into larger b-=
>ptr */
> ++        /*(this does more than buffer_move())*/
> ++        buffer tb =3D *b;
> ++        *b =3D *cb;
> ++        *cb =3D tb;
> ++        if ((b->used =3D tb.used))
> ++            memcpy(b->ptr, tb.ptr, tb.used);
> ++        chunk_buffer_release(cb);
> ++    }
> ++    return chunk_buffer_string_space(b);
> ++}
> ++
> + static chunk * chunk_acquire(size_t sz) {
> +     if (sz <=3D chunk_buf_sz) {
> +         if (chunks) {
> +@@ -162,13 +226,10 @@ static chunk * chunk_acquire(size_t sz) {
> +         sz =3D chunk_buf_sz;
> +     }
> +     else {
> +-        sz =3D (sz + 8191) & ~8191uL;
> +-        /* future: might have buckets of certain sizes, up to socket bu=
f sizes*/
> +-        if (chunks_oversized && chunks_oversized->mem->size >=3D sz) {
> +-            chunk *c =3D chunks_oversized;
> +-            chunks_oversized =3D c->next;
> +-            return c;
> +-        }
> ++        /*(round up to nearest chunk_buf_sz)*/
> ++        sz =3D (sz + (chunk_buf_sz-1)) & ~(chunk_buf_sz-1);
> ++        chunk *c =3D chunk_pop_oversized(sz);
> ++        if (c) return c;
> +     }
> +
> +     return chunk_init(sz);
> +@@ -183,10 +244,7 @@ static void chunk_release(chunk *c) {
> +     }
> +     else if (sz > chunk_buf_sz) {
> +         chunk_reset(c);
> +-        chunk **co =3D &chunks_oversized;
> +-        while (*co && sz < (*co)->mem->size) co =3D &(*co)->next;
> +-        c->next =3D *co;
> +-        *co =3D c;
> ++        chunk_push_oversized(c, sz);
> +     }
> +     else {
> +         chunk_free(c);
> +@@ -205,6 +263,7 @@ void chunkqueue_chunk_pool_clear(void)
> +         chunk_free(c);
> +     }
> +     chunks_oversized =3D NULL;
> ++    chunks_oversized_n =3D 0;
> + }
> +
> + void chunkqueue_chunk_pool_free(void)
> +diff --git a/src/chunk.h b/src/chunk.h
> +index 4c6b7e4..93f343c 100644
> +--- a/src/chunk.h
> ++++ b/src/chunk.h
> +@@ -50,6 +50,8 @@ typedef struct {
> + buffer * chunk_buffer_acquire(void);
> + void chunk_buffer_release(buffer *b);
> +
> ++size_t chunk_buffer_prepare_append (buffer *b, size_t sz);
> ++
> + void chunkqueue_chunk_pool_clear(void);
> + void chunkqueue_chunk_pool_free(void);
> +
> +diff --git a/src/http-header-glue.c b/src/http-header-glue.c
> +index d54f00c..2231fba 100644
> +--- a/src/http-header-glue.c
> ++++ b/src/http-header-glue.c
> +@@ -1267,7 +1267,7 @@ handler_t http_response_read(server *srv, connecti=
on *con, http_response_opts *o
> +         if (avail < toread) {
> +             /*(add avail+toread to reduce allocations when ioctl EOPNOT=
SUPP)*/
> +             avail =3D avail ? avail - 1 + toread : toread;
> +-            buffer_string_prepare_append(b, avail);
> ++            avail =3D chunk_buffer_prepare_append(b, avail);
> +         }
> +
> +         n =3D read(fd, b->ptr+buffer_string_length(b), avail);
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb b/meta/rec=
ipes-extended/lighttpd/lighttpd_1.4.55.bb
> index 35a268a..5329465 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/rele=
ases-1.4.x/lighttpd-${PV}.t
>          file://lighttpd.conf \
>          file://lighttpd \
>          file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config=
.patch \
> +        file://0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033=
.patch \
>          "
>
>  SRC_URI[md5sum] =3D "be4bda2c28bcbdac6eb941528f6edf03"
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
