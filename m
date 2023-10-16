Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B033DCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 07:17:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.112374.1697440673159009111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 00:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mWPcj4Uf;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40776b20031so19281695e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 00:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697440671; x=1698045471; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g3zvsNHDTb7YqAYikYMDo0+WKNwv2J1+RnmIUXMp4rk=;
        b=mWPcj4UfQyIHM0NJ4TEdsdH776snc/jx+SKJUpxauDU4ggtApBJd77x02AK12sm/EK
         gEAIf3SOHcwXqaG/EHNX/FSro5BEclBmcMJjVzewEJ73Qc9OpYyBIO22IV7XEGv/I9MM
         PMdyBtVj5gAfu0B8Zn/Tl7/EpPuw9URdqtEXohSyp457rJfl9BJMz9OLqyvsYEzNT+J9
         Hv7gX2vIprw3bTJ7bb/eAwW86YRvvbnyfbmaMrG77AF0A3Pr4DqE3ADPKnY+CAjIE3WH
         R5rtdL0fvqmmVmUF1tHBPre8W2GHjN6NG3DB5xSo2uKl1jsJpkzdqNdMajDQ8M1XOC3U
         HJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697440671; x=1698045471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3zvsNHDTb7YqAYikYMDo0+WKNwv2J1+RnmIUXMp4rk=;
        b=Z5g/eyHgOiu4HEhkHava4EijoZ2YJIs3tiPfeGlyb4pvaP48+2ouekv+Sv/UMHpzYO
         5U0sNzaw15RplPcWXKM2FpNNGIBORhnmJAEn13CyXb2y9vIVODlmmQaQ/FgjccRGMhDQ
         x+W4/lIdeRK6VfkaeV4q1dDYm12JzuwBHVA4B0f3cJOIxNtrIQgz6EXdLPGNf/bmaxTI
         eGl6f+cZwPol929peUcwSb2v2NSwr7bRUEUKwBNpgMy3keojVGLvAYkbMU3XZ8tT5Vmz
         1iqEBcr2AtvfNnuYc7Uo8+YLdPQzfSDHv/P4SYLJrSjJ/Q9DdFyHRKJrION8qWFYrP53
         vdhw==
X-Gm-Message-State: AOJu0Yy2I49cZrh7t2vN3KZEUR+36AkJgYKoawgIEZzf/Q4hn2Ef/svv
	xyJDjNuzn237IhMHPE9b6yRquLr/e4yf8+f/mck=
X-Google-Smtp-Source: AGHT+IHEG4MFNVBPUxJHPESwmSZ9N5ONss2sIcCdVKu/tWp0uPikixbIHc2XE+K+uDW59OVCJPheL3IFNbLBpKnJdXY=
X-Received: by 2002:a05:600c:446:b0:401:bdd7:49ae with SMTP id
 s6-20020a05600c044600b00401bdd749aemr28033051wmb.18.1697440671118; Mon, 16
 Oct 2023 00:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231016063302.18188-1-badganchipv@gmail.com>
In-Reply-To: <20231016063302.18188-1-badganchipv@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Oct 2023 09:17:39 +0200
Message-ID: <CA+chaQdrbkktcrvWJmLbPHZG8tQgEn99TmWx1c97wocazpgbig@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] libwebp: Fix CVE-2023-4863 for libwebp
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	rajmohan r <rajmohan.r@kpit.com>, Pawan Badganchi <Pawan.Badganchi@kpit.com>
Content-Type: multipart/alternative; boundary="0000000000003ab9360607d0342c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 07:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189262

--0000000000003ab9360607d0342c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I believe this one is already fixed in dunfell:
https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3D2ab=
6568d35e3d68f77a73bf56eb2d38aa6ada236

Notice that it references different CVE
id:https://nvd.nist.gov/vuln/detail/CVE-2023-5129
which was marked as a rejected duplicate
of:https://nvd.nist.gov/vuln/detail/CVE-2023-4863
but it's the same issue.

And also references different upstream
patch:https://github.com/webmproject/libwebp/commit/902bc9190331343b2017211=
debcec8d2ab87e17a
andhttps://github.com/webmproject/libwebp/commit/2af26267cdfcb63a88e5c74a85=
927a12d6ca1d76
where the later is "(cherry picked from commit 902bc91)" from 'v1.3.2' tag
later merged back to 'main' branch, but otherwise it's identical
commit (except one extra space in indentation).


Please rebase your change on recent dunfell and maybe just update the
CVE ID in meta/recipes-multimedia/webp/files/CVE-2023-5129.patch and
its filename, maybe with explanation above.




On Mon, Oct 16, 2023 at 8:33=E2=80=AFAM Pawan Badganchi <badganchipv@gmail.=
com>
wrote:

> From: rajmohan r <rajmohan.r@kpit.com>
>
> Add patch to fix CVE-2023-4863
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2023-4863
>
> https://github.com/webmproject/libwebp/commit/902bc9190331343b2017211debc=
ec8d2ab87e17a
>
> Upstream-Status: Pending
>
> Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> ---
>  .../webp/files/CVE-2023-4863.patch            | 363 ++++++++++++++++++
>  meta/recipes-multimedia/webp/libwebp_1.1.0.bb |   1 +
>  2 files changed, 364 insertions(+)
>  create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.patc=
h
>
> diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> new file mode 100644
> index 0000000000..416e0419ae
> --- /dev/null
> +++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> @@ -0,0 +1,363 @@
> +From 902bc9190331343b2017211debcec8d2ab87e17a Mon Sep 17 00:00:00 2001
> +From: Vincent Rabaud <vrabaud@google.com>
> +Date: Thu, 7 Sep 2023 21:16:03 +0200
> +Subject: [PATCH] Fix OOB write in BuildHuffmanTable.
> +
> +First, BuildHuffmanTable is called to check if the data is valid.
> +If it is and the table is not big enough, more memory is allocated.
> +
> +This will make sure that valid (but unoptimized because of unbalanced
> +codes) streams are still decodable.
> +
> +Bug: chromium:1479274
> +Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741
> +
> +CVE: CVE-2023-4863
> +Upstream-Status: Backport [
> https://github.com/webmproject/libwebp/commit/902bc9190331343b2017211debc=
ec8d2ab87e17a
> ]
> +Comment: Refreshed hunk from vp8l_dec.c
> +
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +---
> + src/dec/vp8l_dec.c        | 46 ++++++++++---------
> + src/dec/vp8li_dec.h       |  2 +-
> + src/utils/huffman_utils.c | 97 +++++++++++++++++++++++++++++++--------
> + src/utils/huffman_utils.h | 27 +++++++++--
> + 4 files changed, 129 insertions(+), 43 deletions(-)
> +
> +diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
> +index 4501216298..5ab34f56cd 100644
> +--- a/src/dec/vp8l_dec.c
> ++++ b/src/dec/vp8l_dec.c
> +@@ -253,11 +253,11 @@
> +   int symbol;
> +   int max_symbol;
> +   int prev_code_len =3D DEFAULT_CODE_LENGTH;
> +-  HuffmanCode table[1 << LENGTHS_TABLE_BITS];
> ++  HuffmanTables tables;
> +
> +-  if (!VP8LBuildHuffmanTable(table, LENGTHS_TABLE_BITS,
> +-                             code_length_code_lengths,
> +-                             NUM_CODE_LENGTH_CODES)) {
> ++  if (!VP8LHuffmanTablesAllocate(1 << LENGTHS_TABLE_BITS, &tables) ||
> ++      !VP8LBuildHuffmanTable(&tables, LENGTHS_TABLE_BITS,
> ++                             code_length_code_lengths,
> NUM_CODE_LENGTH_CODES)) {
> +     goto End;
> +   }
> +
> +@@ -277,7 +277,7 @@
> +     int code_len;
> +     if (max_symbol-- =3D=3D 0) break;
> +     VP8LFillBitWindow(br);
> +-    p =3D &table[VP8LPrefetchBits(br) & LENGTHS_TABLE_MASK];
> ++    p =3D &tables.curr_segment->start[VP8LPrefetchBits(br) &
> LENGTHS_TABLE_MASK];
> +     VP8LSetBitPos(br, br->bit_pos_ + p->bits);
> +     code_len =3D p->value;
> +     if (code_len < kCodeLengthLiterals) {
> +@@ -300,6 +300,7 @@
> +   ok =3D 1;
> +
> +  End:
> ++  VP8LHuffmanTablesDeallocate(&tables);
> +   if (!ok) dec->status_ =3D VP8_STATUS_BITSTREAM_ERROR;
> +   return ok;
> + }
> +@@ -307,7 +308,8 @@
> + // 'code_lengths' is pre-allocated temporary buffer, used for creating
> Huffman
> + // tree.
> + static int ReadHuffmanCode(int alphabet_size, VP8LDecoder* const dec,
> +-                           int* const code_lengths, HuffmanCode* const
> table) {
> ++                           int* const code_lengths,
> ++                           HuffmanTables* const table) {
> +   int ok =3D 0;
> +   int size =3D 0;
> +   VP8LBitReader* const br =3D &dec->br_;
> +@@ -362,8 +364,7 @@
> +   VP8LMetadata* const hdr =3D &dec->hdr_;
> +   uint32_t* huffman_image =3D NULL;
> +   HTreeGroup* htree_groups =3D NULL;
> +-  HuffmanCode* huffman_tables =3D NULL;
> +-  HuffmanCode* huffman_table =3D NULL;
> ++  HuffmanTables* huffman_tables =3D &hdr->huffman_tables_;
> +   int num_htree_groups =3D 1;
> +   int num_htree_groups_max =3D 1;
> +   int max_alphabet_size =3D 0;
> +@@ -372,6 +372,10 @@
> +   int* mapping =3D NULL;
> +   int ok =3D 0;
> +
> ++  // Check the table has been 0 initialized (through InitMetadata).
> ++  assert(huffman_tables->root.start =3D=3D NULL);
> ++  assert(huffman_tables->curr_segment =3D=3D NULL);
> ++
> +   if (allow_recursion && VP8LReadBits(br, 1)) {
> +     // use meta Huffman codes.
> +     const int huffman_precision =3D VP8LReadBits(br, 3) + 2;
> +@@ -434,16 +439,15 @@
> +
> +   code_lengths =3D (int*)WebPSafeCalloc((uint64_t)max_alphabet_size,
> +                                       sizeof(*code_lengths));
> +-  huffman_tables =3D (HuffmanCode*)WebPSafeMalloc(num_htree_groups *
> table_size,
> +-                                                sizeof(*huffman_tables)=
);
> +   htree_groups =3D VP8LHtreeGroupsNew(num_htree_groups);
> +
> +-  if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL || huffman_t=
ables =3D=3D
> NULL) {
> ++  if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL ||
> ++      !VP8LHuffmanTablesAllocate(num_htree_groups * table_size,
> ++                                 huffman_tables)) {
> +     dec->status_ =3D VP8_STATUS_OUT_OF_MEMORY;
> +     goto Error;
> +   }
> +
> +-  huffman_table =3D huffman_tables;
> +   for (i =3D 0; i < num_htree_groups_max; ++i) {
> +     // If the index "i" is unused in the Huffman image, just make sure
> the
> +     // coefficients are valid but do not store them.
> +@@ -468,19 +472,20 @@
> +       int max_bits =3D 0;
> +       for (j =3D 0; j < HUFFMAN_CODES_PER_META_CODE; ++j) {
> +         int alphabet_size =3D kAlphabetSize[j];
> +-        htrees[j] =3D huffman_table;
> +         if (j =3D=3D 0 && color_cache_bits > 0) {
> +           alphabet_size +=3D (1 << color_cache_bits);
> +         }
> +-        size =3D ReadHuffmanCode(alphabet_size, dec, code_lengths,
> huffman_table);
> ++        size =3D
> ++            ReadHuffmanCode(alphabet_size, dec, code_lengths,
> huffman_tables);
> ++        htrees[j] =3D huffman_tables->curr_segment->curr_table;
> +         if (size =3D=3D 0) {
> +           goto Error;
> +         }
> +         if (is_trivial_literal && kLiteralMap[j] =3D=3D 1) {
> +-          is_trivial_literal =3D (huffman_table->bits =3D=3D 0);
> ++          is_trivial_literal =3D (htrees[j]->bits =3D=3D 0);
> +         }
> +-        total_size +=3D huffman_table->bits;
> +-        huffman_table +=3D size;
> ++        total_size +=3D htrees[j]->bits;
> ++        huffman_tables->curr_segment->curr_table +=3D size;
> +         if (j <=3D ALPHA) {
> +           int local_max_bits =3D code_lengths[0];
> +           int k;
> +@@ -515,14 +520,13 @@
> +   hdr->huffman_image_ =3D huffman_image;
> +   hdr->num_htree_groups_ =3D num_htree_groups;
> +   hdr->htree_groups_ =3D htree_groups;
> +-  hdr->huffman_tables_ =3D huffman_tables;
> +
> +  Error:
> +   WebPSafeFree(code_lengths);
> +   WebPSafeFree(mapping);
> +   if (!ok) {
> +     WebPSafeFree(huffman_image);
> +-    WebPSafeFree(huffman_tables);
> ++    VP8LHuffmanTablesDeallocate(huffman_tables);
> +     VP8LHtreeGroupsFree(htree_groups);
> +   }
> +   return ok;
> +@@ -1358,7 +1362,7 @@
> +   assert(hdr !=3D NULL);
> +
> +   WebPSafeFree(hdr->huffman_image_);
> +-  WebPSafeFree(hdr->huffman_tables_);
> ++  VP8LHuffmanTablesDeallocate(&hdr->huffman_tables_);
> +   VP8LHtreeGroupsFree(hdr->htree_groups_);
> +   VP8LColorCacheClear(&hdr->color_cache_);
> +   VP8LColorCacheClear(&hdr->saved_color_cache_);
> +@@ -1673,7 +1673,7 @@
> +
> +   if (dec =3D=3D NULL) return 0;
> +
> +-  assert(dec->hdr_.huffman_tables_ !=3D NULL);
> ++  assert(dec->hdr_.huffman_tables_.root.start !=3D NULL);
> +   assert(dec->hdr_.htree_groups_ !=3D NULL);
> +   assert(dec->hdr_.num_htree_groups_ > 0);
> +
> +diff --git a/src/dec/vp8li_dec.h b/src/dec/vp8li_dec.h
> +index 72b2e86120..32540a4b88 100644
> +--- a/src/dec/vp8li_dec.h
> ++++ b/src/dec/vp8li_dec.h
> +@@ -51,7 +51,7 @@ typedef struct {
> +   uint32_t*       huffman_image_;
> +   int             num_htree_groups_;
> +   HTreeGroup*     htree_groups_;
> +-  HuffmanCode*    huffman_tables_;
> ++  HuffmanTables   huffman_tables_;
> + } VP8LMetadata;
> +
> + typedef struct VP8LDecoder VP8LDecoder;
> +diff --git a/src/utils/huffman_utils.c b/src/utils/huffman_utils.c
> +index 90c2fbf7c1..cf73abd437 100644
> +--- a/src/utils/huffman_utils.c
> ++++ b/src/utils/huffman_utils.c
> +@@ -177,21 +177,24 @@ static int BuildHuffmanTable(HuffmanCode* const
> root_table, int root_bits,
> +       if (num_open < 0) {
> +         return 0;
> +       }
> +-      if (root_table =3D=3D NULL) continue;
> +       for (; count[len] > 0; --count[len]) {
> +         HuffmanCode code;
> +         if ((key & mask) !=3D low) {
> +-          table +=3D table_size;
> ++          if (root_table !=3D NULL) table +=3D table_size;
> +           table_bits =3D NextTableBitSize(count, len, root_bits);
> +           table_size =3D 1 << table_bits;
> +           total_size +=3D table_size;
> +           low =3D key & mask;
> +-          root_table[low].bits =3D (uint8_t)(table_bits + root_bits);
> +-          root_table[low].value =3D (uint16_t)((table - root_table) - l=
ow);
> ++          if (root_table !=3D NULL) {
> ++            root_table[low].bits =3D (uint8_t)(table_bits + root_bits);
> ++            root_table[low].value =3D (uint16_t)((table - root_table) -
> low);
> ++          }
> ++        }
> ++        if (root_table !=3D NULL) {
> ++          code.bits =3D (uint8_t)(len - root_bits);
> ++          code.value =3D (uint16_t)sorted[symbol++];
> ++          ReplicateValue(&table[key >> root_bits], step, table_size,
> code);
> +         }
> +-        code.bits =3D (uint8_t)(len - root_bits);
> +-        code.value =3D (uint16_t)sorted[symbol++];
> +-        ReplicateValue(&table[key >> root_bits], step, table_size, code=
);
> +         key =3D GetNextKey(key, len);
> +       }
> +     }
> +@@ -211,25 +214,83 @@ static int BuildHuffmanTable(HuffmanCode* const
> root_table, int root_bits,
> +   ((1 << MAX_CACHE_BITS) + NUM_LITERAL_CODES + NUM_LENGTH_CODES)
> + // Cut-off value for switching between heap and stack allocation.
> + #define SORTED_SIZE_CUTOFF 512
> +-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
> ++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bit=
s,
> +                           const int code_lengths[], int
> code_lengths_size) {
> +-  int total_size;
> ++  const int total_size =3D
> ++      BuildHuffmanTable(NULL, root_bits, code_lengths,
> code_lengths_size, NULL);
> +   assert(code_lengths_size <=3D MAX_CODE_LENGTHS_SIZE);
> +-  if (root_table =3D=3D NULL) {
> +-    total_size =3D BuildHuffmanTable(NULL, root_bits,
> +-                                   code_lengths, code_lengths_size,
> NULL);
> +-  } else if (code_lengths_size <=3D SORTED_SIZE_CUTOFF) {
> ++  if (total_size =3D=3D 0 || root_table =3D=3D NULL) return total_size;
> ++
> ++  if (root_table->curr_segment->curr_table + total_size >=3D
> ++      root_table->curr_segment->start + root_table->curr_segment->size)=
 {
> ++    // If 'root_table' does not have enough memory, allocate a new
> segment.
> ++    // The available part of root_table->curr_segment is left unused
> because we
> ++    // need a contiguous buffer.
> ++    const int segment_size =3D root_table->curr_segment->size;
> ++    struct HuffmanTablesSegment* next =3D
> ++        (HuffmanTablesSegment*)WebPSafeMalloc(1, sizeof(*next));
> ++    if (next =3D=3D NULL) return 0;
> ++    // Fill the new segment.
> ++    // We need at least 'total_size' but if that value is small, it is
> better to
> ++    // allocate a big chunk to prevent more allocations later.
> 'segment_size' is
> ++    // therefore chosen (any other arbitrary value could be chosen).
> ++    next->size =3D total_size > segment_size ? total_size : segment_siz=
e;
> ++    next->start =3D
> ++        (HuffmanCode*)WebPSafeMalloc(next->size, sizeof(*next->start));
> ++    if (next->start =3D=3D NULL) {
> ++      WebPSafeFree(next);
> ++      return 0;
> ++    }
> ++    next->curr_table =3D next->start;
> ++    next->next =3D NULL;
> ++    // Point to the new segment.
> ++    root_table->curr_segment->next =3D next;
> ++    root_table->curr_segment =3D next;
> ++  }
> ++  if (code_lengths_size <=3D SORTED_SIZE_CUTOFF) {
> +     // use local stack-allocated array.
> +     uint16_t sorted[SORTED_SIZE_CUTOFF];
> +-    total_size =3D BuildHuffmanTable(root_table, root_bits,
> +-                                   code_lengths, code_lengths_size,
> sorted);
> +-  } else {   // rare case. Use heap allocation.
> ++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
> ++                      code_lengths, code_lengths_size, sorted);
> ++  } else {  // rare case. Use heap allocation.
> +     uint16_t* const sorted =3D
> +         (uint16_t*)WebPSafeMalloc(code_lengths_size, sizeof(*sorted));
> +     if (sorted =3D=3D NULL) return 0;
> +-    total_size =3D BuildHuffmanTable(root_table, root_bits,
> +-                                   code_lengths, code_lengths_size,
> sorted);
> ++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
> ++                      code_lengths, code_lengths_size, sorted);
> +     WebPSafeFree(sorted);
> +   }
> +   return total_size;
> + }
> ++
> ++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables) =
{
> ++  // Have 'segment' point to the first segment for now, 'root'.
> ++  HuffmanTablesSegment* const root =3D &huffman_tables->root;
> ++  huffman_tables->curr_segment =3D root;
> ++  // Allocate root.
> ++  root->start =3D (HuffmanCode*)WebPSafeMalloc(size, sizeof(*root->star=
t));
> ++  if (root->start =3D=3D NULL) return 0;
> ++  root->curr_table =3D root->start;
> ++  root->next =3D NULL;
> ++  root->size =3D size;
> ++  return 1;
> ++}
> ++
> ++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables) {
> ++  HuffmanTablesSegment *current, *next;
> ++  if (huffman_tables =3D=3D NULL) return;
> ++  // Free the root node.
> ++  current =3D &huffman_tables->root;
> ++  next =3D current->next;
> ++  WebPSafeFree(current->start);
> ++  current->start =3D NULL;
> ++  current->next =3D NULL;
> ++  current =3D next;
> ++  // Free the following nodes.
> ++  while (current !=3D NULL) {
> ++    next =3D current->next;
> ++    WebPSafeFree(current->start);
> ++    WebPSafeFree(current);
> ++    current =3D next;
> ++  }
> ++}
> +diff --git a/src/utils/huffman_utils.h b/src/utils/huffman_utils.h
> +index 13b7ad1ac4..98415c5328 100644
> +--- a/src/utils/huffman_utils.h
> ++++ b/src/utils/huffman_utils.h
> +@@ -43,6 +43,29 @@ typedef struct {
> +                     // or non-literal symbol otherwise
> + } HuffmanCode32;
> +
> ++// Contiguous memory segment of HuffmanCodes.
> ++typedef struct HuffmanTablesSegment {
> ++  HuffmanCode* start;
> ++  // Pointer to where we are writing into the segment. Starts at 'start=
'
> and
> ++  // cannot go beyond 'start' + 'size'.
> ++  HuffmanCode* curr_table;
> ++  // Pointer to the next segment in the chain.
> ++  struct HuffmanTablesSegment* next;
> ++  int size;
> ++} HuffmanTablesSegment;
> ++
> ++// Chained memory segments of HuffmanCodes.
> ++typedef struct HuffmanTables {
> ++  HuffmanTablesSegment root;
> ++  // Currently processed segment. At first, this is 'root'.
> ++  HuffmanTablesSegment* curr_segment;
> ++} HuffmanTables;
> ++
> ++// Allocates a HuffmanTables with 'size' contiguous HuffmanCodes.
> Returns 0 on
> ++// memory allocation error, 1 otherwise.
> ++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables);
> ++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables);
> ++
> + #define HUFFMAN_PACKED_BITS 6
> + #define HUFFMAN_PACKED_TABLE_SIZE (1u << HUFFMAN_PACKED_BITS)
> +
> +@@ -78,9 +101,7 @@ void VP8LHtreeGroupsFree(HTreeGroup* const
> htree_groups);
> + // the huffman table.
> + // Returns built table size or 0 in case of error (invalid tree or
> + // memory error).
> +-// If root_table is NULL, it returns 0 if a lookup cannot be built,
> something
> +-// > 0 otherwise (but not the table size).
> +-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
> ++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bit=
s,
> +                           const int code_lengths[], int
> code_lengths_size);
> +
> + #ifdef __cplusplus
> diff --git a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
> b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
> index 27c5d92c92..36e7ca38f8 100644
> --- a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
> +++ b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
> @@ -22,6 +22,7 @@ UPSTREAM_CHECK_URI =3D "
> http://downloads.webmproject.org/releases/webp/index.html"
>  SRC_URI +=3D " \
>      file://CVE-2023-1999.patch \
>      file://CVE-2023-5129.patch \
> +    file://CVE-2023-4863.patch \
>  "
>
>  EXTRA_OECONF =3D " \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189258):
> https://lists.openembedded.org/g/openembedded-core/message/189258
> Mute This Topic: https://lists.openembedded.org/mt/101991053/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003ab9360607d0342c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I believe this one is already fixed in dunfell:<div><a hre=
f=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&amp=
;id=3D2ab6568d35e3d68f77a73bf56eb2d38aa6ada236">https://git.openembedded.or=
g/openembedded-core/commit/?h=3Ddunfell&amp;id=3D2ab6568d35e3d68f77a73bf56e=
b2d38aa6ada236</a><br></div><div><br></div><div><pre class=3D"gmail-plainte=
xt" style=3D"font-variant-numeric:inherit;font-variant-east-asian:inherit;f=
ont-variant-alternates:inherit;font-stretch:inherit;font-size:13.006px;line=
-height:inherit;font-family:inherit;font-kerning:inherit;font-feature-setti=
ngs:inherit;margin-top:0px;margin-bottom:0px;color:rgb(33,33,33)">Notice th=
at it references different CVE id:
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-5129" rel=3D"noopener"=
 target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-5129</a>
which was marked as a rejected duplicate of:
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-4863" rel=3D"noopener"=
 target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-4863</a>
but it&#39;s the same issue.

And also references different upstream patch:
<a href=3D"https://github.com/webmproject/libwebp/commit/902bc9190331343b20=
17211debcec8d2ab87e17a" rel=3D"noopener" target=3D"_blank">https://github.c=
om/webmproject/libwebp/commit/902bc9190331343b2017211debcec8d2ab87e17a</a>
and
<a href=3D"https://github.com/webmproject/libwebp/commit/2af26267cdfcb63a88=
e5c74a85927a12d6ca1d76" rel=3D"noopener" target=3D"_blank">https://github.c=
om/webmproject/libwebp/commit/2af26267cdfcb63a88e5c74a85927a12d6ca1d76</a>
where the later is &quot;(cherry picked from commit 902bc91)&quot; from &#3=
9;v1.3.2&#39; tag
later merged back to &#39;main&#39; branch, but otherwise it&#39;s identica=
l
commit (except one extra space in indentation).</pre><pre class=3D"gmail-pl=
aintext" style=3D"font-variant-numeric:inherit;font-variant-east-asian:inhe=
rit;font-variant-alternates:inherit;font-stretch:inherit;font-size:13.006px=
;line-height:inherit;font-family:inherit;font-kerning:inherit;font-feature-=
settings:inherit;margin-top:0px;margin-bottom:0px;color:rgb(33,33,33)"><br>=
</pre><pre class=3D"gmail-plaintext" style=3D"font-variant-numeric:inherit;=
font-variant-east-asian:inherit;font-variant-alternates:inherit;font-stretc=
h:inherit;font-size:13.006px;line-height:inherit;font-family:inherit;font-k=
erning:inherit;font-feature-settings:inherit;margin-top:0px;margin-bottom:0=
px;color:rgb(33,33,33)">Please rebase your change on recent dunfell and may=
be just update the CVE ID in meta/recipes-multimedia/webp/files/CVE-2023-51=
29.patch and its filename, maybe with explanation above.</pre></div><div><b=
r></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Oct 16, 2023 at 8:33=E2=80=AFAM Pawan Badgan=
chi &lt;<a href=3D"mailto:badganchipv@gmail.com">badganchipv@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 rajmohan r &lt;<a href=3D"mailto:rajmohan.r@kpit.com" target=3D"_blank">ra=
jmohan.r@kpit.com</a>&gt;<br>
<br>
Add patch to fix CVE-2023-4863<br>
<br>
Reference:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-4863" rel=3D"noreferre=
r" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-4863</a><br>
<a href=3D"https://github.com/webmproject/libwebp/commit/902bc9190331343b20=
17211debcec8d2ab87e17a" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/webmproject/libwebp/commit/902bc9190331343b2017211debcec8d2ab87e17a</a=
><br>
<br>
Upstream-Status: Pending<br>
<br>
Signed-off-by: Pawan Badganchi &lt;<a href=3D"mailto:Pawan.Badganchi@kpit.c=
om" target=3D"_blank">Pawan.Badganchi@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../webp/files/CVE-2023-4863.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 363 ++++++++++++++++++<br>
=C2=A0meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libwebp_1.1.0.bb</a> |=C2=A0 =C2=A01 +<br=
>
=C2=A02 files changed, 364 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.p=
atch<br>
<br>
diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch b/meta/=
recipes-multimedia/webp/files/CVE-2023-4863.patch<br>
new file mode 100644<br>
index 0000000000..416e0419ae<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch<br>
@@ -0,0 +1,363 @@<br>
+From 902bc9190331343b2017211debcec8d2ab87e17a Mon Sep 17 00:00:00 2001<br>
+From: Vincent Rabaud &lt;<a href=3D"mailto:vrabaud@google.com" target=3D"_=
blank">vrabaud@google.com</a>&gt;<br>
+Date: Thu, 7 Sep 2023 21:16:03 +0200<br>
+Subject: [PATCH] Fix OOB write in BuildHuffmanTable.<br>
+<br>
+First, BuildHuffmanTable is called to check if the data is valid.<br>
+If it is and the table is not big enough, more memory is allocated.<br>
+<br>
+This will make sure that valid (but unoptimized because of unbalanced<br>
+codes) streams are still decodable.<br>
+<br>
+Bug: chromium:1479274<br>
+Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741<br>
+<br>
+CVE: CVE-2023-4863<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/webmproject/libwe=
bp/commit/902bc9190331343b2017211debcec8d2ab87e17a" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/webmproject/libwebp/commit/902bc9190331343=
b2017211debcec8d2ab87e17a</a>]<br>
+Comment: Refreshed hunk from vp8l_dec.c<br>
+<br>
+Signed-off-by: Pawan Badganchi &lt;<a href=3D"mailto:Pawan.Badganchi@kpit.=
com" target=3D"_blank">Pawan.Badganchi@kpit.com</a>&gt;<br>
+---<br>
+ src/dec/vp8l_dec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 46 ++++++++++---------<br=
>
+ src/dec/vp8li_dec.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ src/utils/huffman_utils.c | 97 +++++++++++++++++++++++++++++++--------<br=
>
+ src/utils/huffman_utils.h | 27 +++++++++--<br>
+ 4 files changed, 129 insertions(+), 43 deletions(-)<br>
+<br>
+diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c<br>
+index 4501216298..5ab34f56cd 100644<br>
+--- a/src/dec/vp8l_dec.c<br>
++++ b/src/dec/vp8l_dec.c<br>
+@@ -253,11 +253,11 @@<br>
+=C2=A0 =C2=A0int symbol;<br>
+=C2=A0 =C2=A0int max_symbol;<br>
+=C2=A0 =C2=A0int prev_code_len =3D DEFAULT_CODE_LENGTH;<br>
+-=C2=A0 HuffmanCode table[1 &lt;&lt; LENGTHS_TABLE_BITS];<br>
++=C2=A0 HuffmanTables tables;<br>
+ <br>
+-=C2=A0 if (!VP8LBuildHuffmanTable(table, LENGTHS_TABLE_BITS,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code_length_code_lengths,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NUM_CODE_LENGTH_CODES)) {<br>
++=C2=A0 if (!VP8LHuffmanTablesAllocate(1 &lt;&lt; LENGTHS_TABLE_BITS, &amp=
;tables) ||<br>
++=C2=A0 =C2=A0 =C2=A0 !VP8LBuildHuffmanTable(&amp;tables, LENGTHS_TABLE_BI=
TS,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code_length_code_lengths, NUM_CODE_LENGTH_CO=
DES)) {<br>
+=C2=A0 =C2=A0 =C2=A0goto End;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+@@ -277,7 +277,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0int code_len;<br>
+=C2=A0 =C2=A0 =C2=A0if (max_symbol-- =3D=3D 0) break;<br>
+=C2=A0 =C2=A0 =C2=A0VP8LFillBitWindow(br);<br>
+-=C2=A0 =C2=A0 p =3D &amp;table[VP8LPrefetchBits(br) &amp; LENGTHS_TABLE_M=
ASK];<br>
++=C2=A0 =C2=A0 p =3D &amp;tables.curr_segment-&gt;start[VP8LPrefetchBits(b=
r) &amp; LENGTHS_TABLE_MASK];<br>
+=C2=A0 =C2=A0 =C2=A0VP8LSetBitPos(br, br-&gt;bit_pos_ + p-&gt;bits);<br>
+=C2=A0 =C2=A0 =C2=A0code_len =3D p-&gt;value;<br>
+=C2=A0 =C2=A0 =C2=A0if (code_len &lt; kCodeLengthLiterals) {<br>
+@@ -300,6 +300,7 @@<br>
+=C2=A0 =C2=A0ok =3D 1;<br>
+ <br>
+=C2=A0 End:<br>
++=C2=A0 VP8LHuffmanTablesDeallocate(&amp;tables);<br>
+=C2=A0 =C2=A0if (!ok) dec-&gt;status_ =3D VP8_STATUS_BITSTREAM_ERROR;<br>
+=C2=A0 =C2=A0return ok;<br>
+ }<br>
+@@ -307,7 +308,8 @@<br>
+ // &#39;code_lengths&#39; is pre-allocated temporary buffer, used for cre=
ating Huffman<br>
+ // tree.<br>
+ static int ReadHuffmanCode(int alphabet_size, VP8LDecoder* const dec,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int* const code_lengths, HuffmanCode* const table) =
{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int* const code_lengths,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0HuffmanTables* const table) {<br>
+=C2=A0 =C2=A0int ok =3D 0;<br>
+=C2=A0 =C2=A0int size =3D 0;<br>
+=C2=A0 =C2=A0VP8LBitReader* const br =3D &amp;dec-&gt;br_;<br>
+@@ -362,8 +364,7 @@<br>
+=C2=A0 =C2=A0VP8LMetadata* const hdr =3D &amp;dec-&gt;hdr_;<br>
+=C2=A0 =C2=A0uint32_t* huffman_image =3D NULL;<br>
+=C2=A0 =C2=A0HTreeGroup* htree_groups =3D NULL;<br>
+-=C2=A0 HuffmanCode* huffman_tables =3D NULL;<br>
+-=C2=A0 HuffmanCode* huffman_table =3D NULL;<br>
++=C2=A0 HuffmanTables* huffman_tables =3D &amp;hdr-&gt;huffman_tables_;<br=
>
+=C2=A0 =C2=A0int num_htree_groups =3D 1;<br>
+=C2=A0 =C2=A0int num_htree_groups_max =3D 1;<br>
+=C2=A0 =C2=A0int max_alphabet_size =3D 0;<br>
+@@ -372,6 +372,10 @@<br>
+=C2=A0 =C2=A0int* mapping =3D NULL;<br>
+=C2=A0 =C2=A0int ok =3D 0;<br>
+ <br>
++=C2=A0 // Check the table has been 0 initialized (through InitMetadata).<=
br>
++=C2=A0 assert(huffman_tables-&gt;root.start =3D=3D NULL);<br>
++=C2=A0 assert(huffman_tables-&gt;curr_segment =3D=3D NULL);<br>
++<br>
+=C2=A0 =C2=A0if (allow_recursion &amp;&amp; VP8LReadBits(br, 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0// use meta Huffman codes.<br>
+=C2=A0 =C2=A0 =C2=A0const int huffman_precision =3D VP8LReadBits(br, 3) + =
2;<br>
+@@ -434,16 +439,15 @@<br>
+ <br>
+=C2=A0 =C2=A0code_lengths =3D (int*)WebPSafeCalloc((uint64_t)max_alphabet_=
size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(*c=
ode_lengths));<br>
+-=C2=A0 huffman_tables =3D (HuffmanCode*)WebPSafeMalloc(num_htree_groups *=
 table_size,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 sizeof(*huffman_tables));<br>
+=C2=A0 =C2=A0htree_groups =3D VP8LHtreeGroupsNew(num_htree_groups);<br>
+ <br>
+-=C2=A0 if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL || huffma=
n_tables =3D=3D NULL) {<br>
++=C2=A0 if (htree_groups =3D=3D NULL || code_lengths =3D=3D NULL ||<br>
++=C2=A0 =C2=A0 =C2=A0 !VP8LHuffmanTablesAllocate(num_htree_groups * table_=
size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0huffman_tables)) {<br>
+=C2=A0 =C2=A0 =C2=A0dec-&gt;status_ =3D VP8_STATUS_OUT_OF_MEMORY;<br>
+=C2=A0 =C2=A0 =C2=A0goto Error;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 huffman_table =3D huffman_tables;<br>
+=C2=A0 =C2=A0for (i =3D 0; i &lt; num_htree_groups_max; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0// If the index &quot;i&quot; is unused in the Huffman=
 image, just make sure the<br>
+=C2=A0 =C2=A0 =C2=A0// coefficients are valid but do not store them.<br>
+@@ -468,19 +472,20 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int max_bits =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt; HUFFMAN_CODES_PER_META_COD=
E; ++j) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int alphabet_size =3D kAlphabetSize[j];<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 htrees[j] =3D huffman_table;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (j =3D=3D 0 &amp;&amp; color_cache_bi=
ts &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alphabet_size +=3D (1 &lt;&lt; co=
lor_cache_bits);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D ReadHuffmanCode(alphabet_size, dec, =
code_lengths, huffman_table);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ReadHuffmanCode(alphabet_size, =
dec, code_lengths, huffman_tables);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 htrees[j] =3D huffman_tables-&gt;curr_segment=
-&gt;curr_table;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto Error;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_trivial_literal &amp;&amp; kLiter=
alMap[j] =3D=3D 1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_trivial_literal =3D (huffman_table-=
&gt;bits =3D=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_trivial_literal =3D (htrees[j]-&gt;=
bits =3D=3D 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_size +=3D huffman_table-&gt;bits;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 huffman_table +=3D size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 total_size +=3D htrees[j]-&gt;bits;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 huffman_tables-&gt;curr_segment-&gt;curr_tabl=
e +=3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (j &lt;=3D ALPHA) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int local_max_bits =3D code_lengt=
hs[0];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int k;<br>
+@@ -515,14 +520,13 @@<br>
+=C2=A0 =C2=A0hdr-&gt;huffman_image_ =3D huffman_image;<br>
+=C2=A0 =C2=A0hdr-&gt;num_htree_groups_ =3D num_htree_groups;<br>
+=C2=A0 =C2=A0hdr-&gt;htree_groups_ =3D htree_groups;<br>
+-=C2=A0 hdr-&gt;huffman_tables_ =3D huffman_tables;<br>
+ <br>
+=C2=A0 Error:<br>
+=C2=A0 =C2=A0WebPSafeFree(code_lengths);<br>
+=C2=A0 =C2=A0WebPSafeFree(mapping);<br>
+=C2=A0 =C2=A0if (!ok) {<br>
+=C2=A0 =C2=A0 =C2=A0WebPSafeFree(huffman_image);<br>
+-=C2=A0 =C2=A0 WebPSafeFree(huffman_tables);<br>
++=C2=A0 =C2=A0 VP8LHuffmanTablesDeallocate(huffman_tables);<br>
+=C2=A0 =C2=A0 =C2=A0VP8LHtreeGroupsFree(htree_groups);<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0return ok;<br>
+@@ -1358,7 +1362,7 @@<br>
+=C2=A0 =C2=A0assert(hdr !=3D NULL);<br>
+ <br>
+=C2=A0 =C2=A0WebPSafeFree(hdr-&gt;huffman_image_);<br>
+-=C2=A0 WebPSafeFree(hdr-&gt;huffman_tables_);<br>
++=C2=A0 VP8LHuffmanTablesDeallocate(&amp;hdr-&gt;huffman_tables_);<br>
+=C2=A0 =C2=A0VP8LHtreeGroupsFree(hdr-&gt;htree_groups_);<br>
+=C2=A0 =C2=A0VP8LColorCacheClear(&amp;hdr-&gt;color_cache_);<br>
+=C2=A0 =C2=A0VP8LColorCacheClear(&amp;hdr-&gt;saved_color_cache_);<br>
+@@ -1673,7 +1673,7 @@<br>
+ <br>
+=C2=A0 =C2=A0if (dec =3D=3D NULL) return 0;<br>
+ <br>
+-=C2=A0 assert(dec-&gt;hdr_.huffman_tables_ !=3D NULL);<br>
++=C2=A0 assert(dec-&gt;hdr_.huffman_tables_.root.start !=3D NULL);<br>
+=C2=A0 =C2=A0assert(dec-&gt;hdr_.htree_groups_ !=3D NULL);<br>
+=C2=A0 =C2=A0assert(dec-&gt;hdr_.num_htree_groups_ &gt; 0);<br>
+ <br>
+diff --git a/src/dec/vp8li_dec.h b/src/dec/vp8li_dec.h<br>
+index 72b2e86120..32540a4b88 100644<br>
+--- a/src/dec/vp8li_dec.h<br>
++++ b/src/dec/vp8li_dec.h<br>
+@@ -51,7 +51,7 @@ typedef struct {<br>
+=C2=A0 =C2=A0uint32_t*=C2=A0 =C2=A0 =C2=A0 =C2=A0huffman_image_;<br>
+=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_htree_=
groups_;<br>
+=C2=A0 =C2=A0HTreeGroup*=C2=A0 =C2=A0 =C2=A0htree_groups_;<br>
+-=C2=A0 HuffmanCode*=C2=A0 =C2=A0 huffman_tables_;<br>
++=C2=A0 HuffmanTables=C2=A0 =C2=A0huffman_tables_;<br>
+ } VP8LMetadata;<br>
+ <br>
+ typedef struct VP8LDecoder VP8LDecoder;<br>
+diff --git a/src/utils/huffman_utils.c b/src/utils/huffman_utils.c<br>
+index 90c2fbf7c1..cf73abd437 100644<br>
+--- a/src/utils/huffman_utils.c<br>
++++ b/src/utils/huffman_utils.c<br>
+@@ -177,21 +177,24 @@ static int BuildHuffmanTable(HuffmanCode* const root=
_table, int root_bits,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_open &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 if (root_table =3D=3D NULL) continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (; count[len] &gt; 0; --count[len]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HuffmanCode code;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((key &amp; mask) !=3D low) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 table +=3D table_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (root_table !=3D NULL) table +=3D t=
able_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0table_bits =3D NextTableBitSize(c=
ount, len, root_bits);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0table_size =3D 1 &lt;&lt; table_b=
its;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total_size +=3D table_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0low =3D key &amp; mask;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root_table[low].bits =3D (uint8_t)(tab=
le_bits + root_bits);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root_table[low].value =3D (uint16_t)((=
table - root_table) - low);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (root_table !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root_table[low].bits =3D (uint8=
_t)(table_bits + root_bits);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root_table[low].value =3D (uint=
16_t)((table - root_table) - low);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (root_table !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code.bits =3D (uint8_t)(len - root_bit=
s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code.value =3D (uint16_t)sorted[symbol=
++];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ReplicateValue(&amp;table[key &gt;&gt;=
 root_bits], step, table_size, code);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 code.bits =3D (uint8_t)(len - root_bits);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 code.value =3D (uint16_t)sorted[symbol++];<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ReplicateValue(&amp;table[key &gt;&gt; root_b=
its], step, table_size, code);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0key =3D GetNextKey(key, len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -211,25 +214,83 @@ static int BuildHuffmanTable(HuffmanCode* const root=
_table, int root_bits,<br>
+=C2=A0 =C2=A0((1 &lt;&lt; MAX_CACHE_BITS) + NUM_LITERAL_CODES + NUM_LENGTH=
_CODES)<br>
+ // Cut-off value for switching between heap and stack allocation.<br>
+ #define SORTED_SIZE_CUTOFF 512<br>
+-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,<b=
r>
++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bits,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const int code_lengths[], int code_lengths_size) {<=
br>
+-=C2=A0 int total_size;<br>
++=C2=A0 const int total_size =3D<br>
++=C2=A0 =C2=A0 =C2=A0 BuildHuffmanTable(NULL, root_bits, code_lengths, cod=
e_lengths_size, NULL);<br>
+=C2=A0 =C2=A0assert(code_lengths_size &lt;=3D MAX_CODE_LENGTHS_SIZE);<br>
+-=C2=A0 if (root_table =3D=3D NULL) {<br>
+-=C2=A0 =C2=A0 total_size =3D BuildHuffmanTable(NULL, root_bits,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code_lengths, code_leng=
ths_size, NULL);<br>
+-=C2=A0 } else if (code_lengths_size &lt;=3D SORTED_SIZE_CUTOFF) {<br>
++=C2=A0 if (total_size =3D=3D 0 || root_table =3D=3D NULL) return total_si=
ze;<br>
++<br>
++=C2=A0 if (root_table-&gt;curr_segment-&gt;curr_table + total_size &gt;=
=3D<br>
++=C2=A0 =C2=A0 =C2=A0 root_table-&gt;curr_segment-&gt;start + root_table-&=
gt;curr_segment-&gt;size) {<br>
++=C2=A0 =C2=A0 // If &#39;root_table&#39; does not have enough memory, all=
ocate a new segment.<br>
++=C2=A0 =C2=A0 // The available part of root_table-&gt;curr_segment is lef=
t unused because we<br>
++=C2=A0 =C2=A0 // need a contiguous buffer.<br>
++=C2=A0 =C2=A0 const int segment_size =3D root_table-&gt;curr_segment-&gt;=
size;<br>
++=C2=A0 =C2=A0 struct HuffmanTablesSegment* next =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (HuffmanTablesSegment*)WebPSafeMalloc(1, size=
of(*next));<br>
++=C2=A0 =C2=A0 if (next =3D=3D NULL) return 0;<br>
++=C2=A0 =C2=A0 // Fill the new segment.<br>
++=C2=A0 =C2=A0 // We need at least &#39;total_size&#39; but if that value =
is small, it is better to<br>
++=C2=A0 =C2=A0 // allocate a big chunk to prevent more allocations later. =
&#39;segment_size&#39; is<br>
++=C2=A0 =C2=A0 // therefore chosen (any other arbitrary value could be cho=
sen).<br>
++=C2=A0 =C2=A0 next-&gt;size =3D total_size &gt; segment_size ? total_size=
 : segment_size;<br>
++=C2=A0 =C2=A0 next-&gt;start =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (HuffmanCode*)WebPSafeMalloc(next-&gt;size, s=
izeof(*next-&gt;start));<br>
++=C2=A0 =C2=A0 if (next-&gt;start =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 WebPSafeFree(next);<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 next-&gt;curr_table =3D next-&gt;start;<br>
++=C2=A0 =C2=A0 next-&gt;next =3D NULL;<br>
++=C2=A0 =C2=A0 // Point to the new segment.<br>
++=C2=A0 =C2=A0 root_table-&gt;curr_segment-&gt;next =3D next;<br>
++=C2=A0 =C2=A0 root_table-&gt;curr_segment =3D next;<br>
++=C2=A0 }<br>
++=C2=A0 if (code_lengths_size &lt;=3D SORTED_SIZE_CUTOFF) {<br>
+=C2=A0 =C2=A0 =C2=A0// use local stack-allocated array.<br>
+=C2=A0 =C2=A0 =C2=A0uint16_t sorted[SORTED_SIZE_CUTOFF];<br>
+-=C2=A0 =C2=A0 total_size =3D BuildHuffmanTable(root_table, root_bits,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code_lengths, code_leng=
ths_size, sorted);<br>
+-=C2=A0 } else {=C2=A0 =C2=A0// rare case. Use heap allocation.<br>
++=C2=A0 =C2=A0 BuildHuffmanTable(root_table-&gt;curr_segment-&gt;curr_tabl=
e, root_bits,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 code_lengths, code_lengths_size, sorted);<br>
++=C2=A0 } else {=C2=A0 // rare case. Use heap allocation.<br>
+=C2=A0 =C2=A0 =C2=A0uint16_t* const sorted =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint16_t*)WebPSafeMalloc(code_lengths_s=
ize, sizeof(*sorted));<br>
+=C2=A0 =C2=A0 =C2=A0if (sorted =3D=3D NULL) return 0;<br>
+-=C2=A0 =C2=A0 total_size =3D BuildHuffmanTable(root_table, root_bits,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code_lengths, code_leng=
ths_size, sorted);<br>
++=C2=A0 =C2=A0 BuildHuffmanTable(root_table-&gt;curr_segment-&gt;curr_tabl=
e, root_bits,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 code_lengths, code_lengths_size, sorted);<br>
+=C2=A0 =C2=A0 =C2=A0WebPSafeFree(sorted);<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0return total_size;<br>
+ }<br>
++<br>
++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables) {<=
br>
++=C2=A0 // Have &#39;segment&#39; point to the first segment for now, &#39=
;root&#39;.<br>
++=C2=A0 HuffmanTablesSegment* const root =3D &amp;huffman_tables-&gt;root;=
<br>
++=C2=A0 huffman_tables-&gt;curr_segment =3D root;<br>
++=C2=A0 // Allocate root.<br>
++=C2=A0 root-&gt;start =3D (HuffmanCode*)WebPSafeMalloc(size, sizeof(*root=
-&gt;start));<br>
++=C2=A0 if (root-&gt;start =3D=3D NULL) return 0;<br>
++=C2=A0 root-&gt;curr_table =3D root-&gt;start;<br>
++=C2=A0 root-&gt;next =3D NULL;<br>
++=C2=A0 root-&gt;size =3D size;<br>
++=C2=A0 return 1;<br>
++}<br>
++<br>
++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables) {<b=
r>
++=C2=A0 HuffmanTablesSegment *current, *next;<br>
++=C2=A0 if (huffman_tables =3D=3D NULL) return;<br>
++=C2=A0 // Free the root node.<br>
++=C2=A0 current =3D &amp;huffman_tables-&gt;root;<br>
++=C2=A0 next =3D current-&gt;next;<br>
++=C2=A0 WebPSafeFree(current-&gt;start);<br>
++=C2=A0 current-&gt;start =3D NULL;<br>
++=C2=A0 current-&gt;next =3D NULL;<br>
++=C2=A0 current =3D next;<br>
++=C2=A0 // Free the following nodes.<br>
++=C2=A0 while (current !=3D NULL) {<br>
++=C2=A0 =C2=A0 next =3D current-&gt;next;<br>
++=C2=A0 =C2=A0 WebPSafeFree(current-&gt;start);<br>
++=C2=A0 =C2=A0 WebPSafeFree(current);<br>
++=C2=A0 =C2=A0 current =3D next;<br>
++=C2=A0 }<br>
++}<br>
+diff --git a/src/utils/huffman_utils.h b/src/utils/huffman_utils.h<br>
+index 13b7ad1ac4..98415c5328 100644<br>
+--- a/src/utils/huffman_utils.h<br>
++++ b/src/utils/huffman_utils.h<br>
+@@ -43,6 +43,29 @@ typedef struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0// or non-literal symbol otherwise<br>
+ } HuffmanCode32;<br>
+ <br>
++// Contiguous memory segment of HuffmanCodes.<br>
++typedef struct HuffmanTablesSegment {<br>
++=C2=A0 HuffmanCode* start;<br>
++=C2=A0 // Pointer to where we are writing into the segment. Starts at &#3=
9;start&#39; and<br>
++=C2=A0 // cannot go beyond &#39;start&#39; + &#39;size&#39;.<br>
++=C2=A0 HuffmanCode* curr_table;<br>
++=C2=A0 // Pointer to the next segment in the chain.<br>
++=C2=A0 struct HuffmanTablesSegment* next;<br>
++=C2=A0 int size;<br>
++} HuffmanTablesSegment;<br>
++<br>
++// Chained memory segments of HuffmanCodes.<br>
++typedef struct HuffmanTables {<br>
++=C2=A0 HuffmanTablesSegment root;<br>
++=C2=A0 // Currently processed segment. At first, this is &#39;root&#39;.<=
br>
++=C2=A0 HuffmanTablesSegment* curr_segment;<br>
++} HuffmanTables;<br>
++<br>
++// Allocates a HuffmanTables with &#39;size&#39; contiguous HuffmanCodes.=
 Returns 0 on<br>
++// memory allocation error, 1 otherwise.<br>
++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables);<b=
r>
++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables);<br=
>
++<br>
+ #define HUFFMAN_PACKED_BITS 6<br>
+ #define HUFFMAN_PACKED_TABLE_SIZE (1u &lt;&lt; HUFFMAN_PACKED_BITS)<br>
+ <br>
+@@ -78,9 +101,7 @@ void VP8LHtreeGroupsFree(HTreeGroup* const htree_groups=
);<br>
+ // the huffman table.<br>
+ // Returns built table size or 0 in case of error (invalid tree or<br>
+ // memory error).<br>
+-// If root_table is NULL, it returns 0 if a lookup cannot be built, somet=
hing<br>
+-// &gt; 0 otherwise (but not the table size).<br>
+-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,<b=
r>
++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bits,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const int code_lengths[], int code_lengths_size);<b=
r>
+ <br>
+ #ifdef __cplusplus<br>
diff --git a/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">libwebp_1.1.0.bb</a> b/meta/recipes=
-multimedia/webp/<a href=3D"http://libwebp_1.1.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libwebp_1.1.0.bb</a><br>
index 27c5d92c92..36e7ca38f8 100644<br>
--- a/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libwebp_1.1.0.bb</a><br>
+++ b/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libwebp_1.1.0.bb</a><br>
@@ -22,6 +22,7 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://downloads.=
webmproject.org/releases/webp/index.html" rel=3D"noreferrer" target=3D"_bla=
nk">http://downloads.webmproject.org/releases/webp/index.html</a>&quot;<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-1999.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2023-5129.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-4863.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot; \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189258): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189258" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189258</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101991053/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101991053/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000003ab9360607d0342c--

