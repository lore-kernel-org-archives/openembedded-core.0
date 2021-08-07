Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web09.1475.1628296445954241435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 17:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kiSAK2IJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id m193so18200181ybf.9
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 17:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Si++h9b+g2tUMoaXa7sk5c8w8PSW68gYwaga3U4aOTU=;
        b=kiSAK2IJH4qNUEE8ASReaFF23oKLiogj99tDYwOb7BDBX8hhgFoFey4JNc40jW6F4L
         VcQQApKvehJxdvjHjj0P769r7TWHfmi4dr38fuPfTb5nTpxBxkh35iYjOaGANM+27Dwe
         jKrXBpvUG+Dy2zsWfTNQfdsU67WDi51KVp6QfpCcX3vSPNc6rO2mNNPtd4NP9tcXUJA3
         I5Bqh0kiFk+Xf+NwNbcsQo6uZXrIGwNPs7NxSsVIDZ01Jer5HJiMccZIQes225sS9REX
         vPht3xbJslfpEWg0+SyC6EHk+LOQ0dTy0dkb3Yzn6G6gp63+eLDvmd8Qta+4XTV7DouY
         OX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Si++h9b+g2tUMoaXa7sk5c8w8PSW68gYwaga3U4aOTU=;
        b=ilsYB+KGJD9v39PuAQ0d91KNkAKcrSkmva139HdTlu4iGGjaxfr3BJMjJqTRhVwMVT
         EqlBFfl3Lc6psiHdLLvWJzm3q1xNt0OIyz3N1NusIiHUkix6Va6DdBP53xFMgGzLqcfO
         ktbtFumCXmvlCcBJ15LVP+CtUIg19PtEeTa+XW4K5z/GAsM09USvVNVFoxxULcTN0e0u
         QoAzP0UcCwSG5tequDJETLXg0zDZ9cbzjy17ZDqR6fFy7xfX44b648l6nZ+Gd12Aw2bS
         cPW/QR+5frA8cvioHceDwqciYAFTs+0A5cxHO9zXAeZHj38ZJ9pK604Np6Aw1OPk+V0i
         GeLg==
X-Gm-Message-State: AOAM533GAbadbbQxb1XoqNo7Y71VqqG8k+qfYp8Zm7g4yDsDk39SGdzi
	DVHEY4skSWSPpdcVskmhcPnD6LNhTggWQyvAN3M=
X-Google-Smtp-Source: ABdhPJxHC4IpJlDcAmn/3CKZSOD/fv0A35kZgmPE7t7dZaDxdWsgsCXJfU0mqo36v9GJ6767y47Ot68mbvAsQioZFLQ=
X-Received: by 2002:a25:b84e:: with SMTP id b14mr16193830ybm.237.1628296445120;
 Fri, 06 Aug 2021 17:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <1628232880-3676-1-git-send-email-purushottam.choudhary@kpit.com>
In-Reply-To: <1628232880-3676-1-git-send-email-purushottam.choudhary@kpit.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 6 Aug 2021 14:33:52 -1000
Message-ID: <CAGDS+nnFqpTuRXbcTng9yK2g9U2aB8xp3SuN+F+3e4WR8Dk4Eg@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] lighttpd: Add patch for reuse large memory chunks
To: Purushottam choudhary <purushottam.choudhary@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Mikko Rapeli <Mikko.Rapeli@bmw.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 5, 2021 at 8:55 PM Purushottam choudhary
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

This patch is throwing warnings on the autobuilder:

Applying patch 0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.pa=
tch
patching file src/chunk.c
Hunk #2 succeeded at 124 with fuzz 1.
patching file src/chunk.h
patching file src/http-header-glue.c

The context lines in the patches can be updated with devtool:

    devtool modify lighttpd
    devtool finish --force-patch-refresh lighttpd <layer_path>

Could you fix this and send a V2 so that we can have clean builds on
the autobuilder?

Thanks!

Steve


> Signed-off-by: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>
> ---
>  ...large-mem-chunks-fix-mem-usage-fixes-3033.patch | 225 +++++++++++++++=
++++++
>  meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb  |   1 +
>  2 files changed, 226 insertions(+)
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-reu=
se-large-mem-chunks-fix-mem-usage-fixes-3033.patch
>
> diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-larg=
e-mem-chunks-fix-mem-usage-fixes-3033.patch b/meta/recipes-extended/lighttp=
d/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
> new file mode 100644
> index 0000000..c4e4a60
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-c=
hunks-fix-mem-usage-fixes-3033.patch
> @@ -0,0 +1,225 @@
> +From 40dadb863fd105c4a66b598c2423b1eb11b1f26e Mon Sep 17 00:00:00 2001
> +From: Glenn Strauss <gstrauss@gluelogic.com>
> +Date: Wed, 23 Dec 2020 23:14:47 -0500
> +Subject: [PATCH] [core] reuse large mem chunks (fix mem usage) (fixes #3=
033)
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
> +---
> + src/chunk.c            | 99 +++++++++++++++++++++++++++++++++---------
> + src/chunk.h            |  2 +
> + src/http-header-glue.c |  2 +-
> + 3 files changed, 82 insertions(+), 21 deletions(-)
> +
> +diff --git a/src/chunk.c b/src/chunk.c
> +index 09dd3f14..ffb37951 100644
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
> +index 4c6b7e47..93f343c3 100644
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
> +index d54f00cf..2231fba9 100644
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
> +--
> +2.32.0
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
>
>=20
>
