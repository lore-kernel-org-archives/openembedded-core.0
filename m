Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 902487F501
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:33 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id q24so2971764plr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SIPFAwUPZxPzWuRhlz2Fx94j7PErYSp4AvSJF4k6fSA=;
	b=I98TI+fH3gY3bCIBiPKINiCm9X5iI9muMviZpCDf6lKVPc6R9eqQwiIbN/VgYsLcg3
	/7vMaQm/5JVWIf4I52X278GmKb4/Oc5YvDvy5a+H04ti+uBP+CV+cNTWLYDe08uq6hYj
	b0LSek7Q/E+zBL2x0p+VD29CpXsdLAFrRUpRQU7tF7UMVjGZbWvLg9DDBJYE908JgUu0
	LZQOFz2faRG3q9b/TJsEzuvp0T51rQlvHbpSjmE943waA5TYJw6RKTiBxTdjISiFLUU0
	MWiYjTFNN+D+t2y8qONLodS25mPmrNpQ11BqCC15SD6CbRt6N3lKAyNAAaILRb2XF8Oy
	4C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SIPFAwUPZxPzWuRhlz2Fx94j7PErYSp4AvSJF4k6fSA=;
	b=GTQtbBZOLCHpvPvUM6KY4nUbd3uIuvZ0i3T1bZUq88RibzSJDa/nq+wP4Qk2GvneC4
	kM3ysJGjS5nTADnGQp7y6/O7OeOajrHJBdjoSij+VhWYRuME4NGMKiHIBrldu7E0wBiE
	rz0+hH91OiQ5fnwohqGXV13eOvahnGXxU1OWAocSYPB2r5ENU37naMj/4EFdKEC2QCMf
	fwYSyMKhpOAFTvNAZ+Nqp6nWUprdIqfU8Sl5Qg2E+Lq3fhF9ve9ulNo/MniZ0dOelh76
	vV9Q0g9Zk4kp3mEu4/zo0bryqRzG6rbKTdbl9o0SIRWQC3LQjMz2g901J/RR05k15z4H
	4hpQ==
X-Gm-Message-State: APjAAAWebKl/PpwII+SeD6iE2zXYguDExbv6buO49T+wm6KrhaZL/tIV
	S4ne2ND/a1J1mODConpwC5q6oJ75
X-Google-Smtp-Source: APXvYqyGISmzW062ef/BtG8GZqBSQ5LMQFdeBZC2eIrsMjCNiM0N67KoWJMoZ1Y/ynXUhRPsFMyH7g==
X-Received: by 2002:a17:902:d906:: with SMTP id
	c6mr10325835plz.237.1570722574002; 
	Thu, 10 Oct 2019 08:49:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:16 -0700
Message-Id: <7857d85db69bcb2cb94399a22de6903263e52965.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570722439.git.akuster808@gmail.com>
References: <cover.1570722439.git.akuster808@gmail.com>
Subject: [thud 04/12] unzip: fix CVE-2019-13232
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Oct 2019 15:49:33 -0000

From: Dan Tran <dantran@microsoft.com>

Signed-off-by: Dan Tran <dantran@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../unzip/unzip/CVE-2019-13232_p1.patch            |  33 ++
 .../unzip/unzip/CVE-2019-13232_p2.patch            | 356 +++++++++++++++++++++
 .../unzip/unzip/CVE-2019-13232_p3.patch            | 121 +++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   3 +
 4 files changed, 513 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch

diff --git a/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch b/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch
new file mode 100644
index 0000000..d485a1b
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch
@@ -0,0 +1,33 @@
+From 080d52c3c9416c731f637f9c6e003961ef43f079 Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Mon, 27 May 2019 08:20:32 -0700
+Subject: [PATCH 1/3] Fix bug in undefer_input() that misplaced the input
+ state.
+
+CVE: CVE-2019-13232
+Upstream-Status: Backport
+[https://github.com/madler/unzip/commit/41beb477c5744bc396fa1162ee0c14218ec12213]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ fileio.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/fileio.c b/fileio.c
+index 7605a29..14460f3 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -532,8 +532,10 @@ void undefer_input(__G)
+          * This condition was checked when G.incnt_leftover was set > 0 in
+          * defer_leftover_input(), and it is NOT allowed to touch G.csize
+          * before calling undefer_input() when (G.incnt_leftover > 0)
+-         * (single exception: see read_byte()'s  "G.csize <= 0" handling) !!
++         * (single exception: see readbyte()'s  "G.csize <= 0" handling) !!
+          */
++        if (G.csize < 0L)
++            G.csize = 0L;
+         G.incnt = G.incnt_leftover + (int)G.csize;
+         G.inptr = G.inptr_leftover - (int)G.csize;
+         G.incnt_leftover = 0;
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
diff --git a/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch b/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch
new file mode 100644
index 0000000..41037a8
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch
@@ -0,0 +1,356 @@
+From 1aae47fa8935654a84403768f32c03ecbb1be470 Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Tue, 11 Jun 2019 22:01:18 -0700
+Subject: [PATCH 2/3] Detect and reject a zip bomb using overlapped entries.
+
+This detects an invalid zip file that has at least one entry that
+overlaps with another entry or with the central directory to the
+end of the file. A Fifield zip bomb uses overlapped local entries
+to vastly increase the potential inflation ratio. Such an invalid
+zip file is rejected.
+
+See https://www.bamsoftware.com/hacks/zipbomb/ for David Fifield's
+analysis, construction, and examples of such zip bombs.
+
+The detection maintains a list of covered spans of the zip files
+so far, where the central directory to the end of the file and any
+bytes preceding the first entry at zip file offset zero are
+considered covered initially. Then as each entry is decompressed
+or tested, it is considered covered. When a new entry is about to
+be processed, its initial offset is checked to see if it is
+contained by a covered span. If so, the zip file is rejected as
+invalid.
+
+This commit depends on a preceding commit: "Fix bug in
+undefer_input() that misplaced the input state."
+
+CVE: CVE-2019-13232
+Upstream-Status: Backport
+[https://github.com/madler/unzip/commit/47b3ceae397d21bf822bc2ac73052a4b1daf8e1c]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ extract.c | 190 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ globals.c |   1 +
+ globals.h |   3 +
+ process.c |  10 +++
+ unzip.h   |   1 +
+ 5 files changed, 204 insertions(+), 1 deletion(-)
+
+diff --git a/extract.c b/extract.c
+index 24db2a8..2bb72ba 100644
+--- a/extract.c
++++ b/extract.c
+@@ -321,6 +321,125 @@ static ZCONST char Far UnsupportedExtraField[] =
+   "\nerror:  unsupported extra-field compression type (%u)--skipping\n";
+ static ZCONST char Far BadExtraFieldCRC[] =
+   "error [%s]:  bad extra-field CRC %08lx (should be %08lx)\n";
++static ZCONST char Far NotEnoughMemCover[] =
++  "error: not enough memory for bomb detection\n";
++static ZCONST char Far OverlappedComponents[] =
++  "error: invalid zip file with overlapped components (possible zip bomb)\n";
++
++
++
++
++
++/* A growable list of spans. */
++typedef zoff_t bound_t;
++typedef struct {
++    bound_t beg;        /* start of the span */
++    bound_t end;        /* one past the end of the span */
++} span_t;
++typedef struct {
++    span_t *span;       /* allocated, distinct, and sorted list of spans */
++    size_t num;         /* number of spans in the list */
++    size_t max;         /* allocated number of spans (num <= max) */
++} cover_t;
++
++/*
++ * Return the index of the first span in cover whose beg is greater than val.
++ * If there is no such span, then cover->num is returned.
++ */
++static size_t cover_find(cover, val)
++    cover_t *cover;
++    bound_t val;
++{
++    size_t lo = 0, hi = cover->num;
++    while (lo < hi) {
++        size_t mid = (lo + hi) >> 1;
++        if (val < cover->span[mid].beg)
++            hi = mid;
++        else
++            lo = mid + 1;
++    }
++    return hi;
++}
++
++/* Return true if val lies within any one of the spans in cover. */
++static int cover_within(cover, val)
++    cover_t *cover;
++    bound_t val;
++{
++    size_t pos = cover_find(cover, val);
++    return pos > 0 && val < cover->span[pos - 1].end;
++}
++
++/*
++ * Add a new span to the list, but only if the new span does not overlap any
++ * spans already in the list. The new span covers the values beg..end-1. beg
++ * must be less than end.
++ *
++ * Keep the list sorted and merge adjacent spans. Grow the allocated space for
++ * the list as needed. On success, 0 is returned. If the new span overlaps any
++ * existing spans, then 1 is returned and the new span is not added to the
++ * list. If the new span is invalid because beg is greater than or equal to
++ * end, then -1 is returned. If the list needs to be grown but the memory
++ * allocation fails, then -2 is returned.
++ */
++static int cover_add(cover, beg, end)
++    cover_t *cover;
++    bound_t beg;
++    bound_t end;
++{
++    size_t pos;
++    int prec, foll;
++
++    if (beg >= end)
++    /* The new span is invalid. */
++        return -1;
++
++    /* Find where the new span should go, and make sure that it does not
++       overlap with any existing spans. */
++    pos = cover_find(cover, beg);
++    if ((pos > 0 && beg < cover->span[pos - 1].end) ||
++        (pos < cover->num && end > cover->span[pos].beg))
++        return 1;
++
++    /* Check for adjacencies. */
++    prec = pos > 0 && beg == cover->span[pos - 1].end;
++    foll = pos < cover->num && end == cover->span[pos].beg;
++    if (prec && foll) {
++        /* The new span connects the preceding and following spans. Merge the
++           following span into the preceding span, and delete the following
++           span. */
++        cover->span[pos - 1].end = cover->span[pos].end;
++        cover->num--;
++        memmove(cover->span + pos, cover->span + pos + 1,
++                (cover->num - pos) * sizeof(span_t));
++    }
++    else if (prec)
++        /* The new span is adjacent only to the preceding span. Extend the end
++           of the preceding span. */
++        cover->span[pos - 1].end = end;
++    else if (foll)
++        /* The new span is adjacent only to the following span. Extend the
++           beginning of the following span. */
++        cover->span[pos].beg = beg;
++    else {
++        /* The new span has gaps between both the preceding and the following
++           spans. Assure that there is room and insert the span.  */
++        if (cover->num == cover->max) {
++            size_t max = cover->max == 0 ? 16 : cover->max << 1;
++            span_t *span = realloc(cover->span, max * sizeof(span_t));
++            if (span == NULL)
++                return -2;
++            cover->span = span;
++            cover->max = max;
++        }
++        memmove(cover->span + pos + 1, cover->span + pos,
++                (cover->num - pos) * sizeof(span_t));
++        cover->num++;
++        cover->span[pos].beg = beg;
++        cover->span[pos].end = end;
++    }
++    return 0;
++}
+ 
+ 
+ 
+@@ -376,6 +495,29 @@ int extract_or_test_files(__G)    /* return PK-type error code */
+     }
+ #endif /* !SFX || SFX_EXDIR */
+ 
++    /* One more: initialize cover structure for bomb detection. Start with a
++       span that covers the central directory though the end of the file. */
++    if (G.cover == NULL) {
++        G.cover = malloc(sizeof(cover_t));
++        if (G.cover == NULL) {
++            Info(slide, 0x401, ((char *)slide,
++              LoadFarString(NotEnoughMemCover)));
++            return PK_MEM;
++        }
++        ((cover_t *)G.cover)->span = NULL;
++        ((cover_t *)G.cover)->max = 0;
++    }
++    ((cover_t *)G.cover)->num = 0;
++    if ((G.extra_bytes != 0 &&
++         cover_add((cover_t *)G.cover, 0, G.extra_bytes) != 0) ||
++        cover_add((cover_t *)G.cover,
++                  G.extra_bytes + G.ecrec.offset_start_central_directory,
++                  G.ziplen) != 0) {
++        Info(slide, 0x401, ((char *)slide,
++          LoadFarString(NotEnoughMemCover)));
++        return PK_MEM;
++    }
++
+ /*---------------------------------------------------------------------------
+     The basic idea of this function is as follows.  Since the central di-
+     rectory lies at the end of the zipfile and the member files lie at the
+@@ -593,7 +735,8 @@ int extract_or_test_files(__G)    /* return PK-type error code */
+             if (error > error_in_archive)
+                 error_in_archive = error;
+             /* ...and keep going (unless disk full or user break) */
+-            if (G.disk_full > 1 || error_in_archive == IZ_CTRLC) {
++            if (G.disk_full > 1 || error_in_archive == IZ_CTRLC ||
++                error == PK_BOMB) {
+                 /* clear reached_end to signal premature stop ... */
+                 reached_end = FALSE;
+                 /* ... and cancel scanning the central directory */
+@@ -1062,6 +1205,11 @@ static int extract_or_test_entrylist(__G__ numchunk,
+ 
+         /* seek_zipf(__G__ pInfo->offset);  */
+         request = G.pInfo->offset + G.extra_bytes;
++        if (cover_within((cover_t *)G.cover, request)) {
++            Info(slide, 0x401, ((char *)slide,
++              LoadFarString(OverlappedComponents)));
++            return PK_BOMB;
++        }
+         inbuf_offset = request % INBUFSIZ;
+         bufstart = request - inbuf_offset;
+ 
+@@ -1593,6 +1741,18 @@ reprompt:
+             return IZ_CTRLC;        /* cancel operation by user request */
+         }
+ #endif
++        error = cover_add((cover_t *)G.cover, request,
++                          G.cur_zipfile_bufstart + (G.inptr - G.inbuf));
++        if (error < 0) {
++            Info(slide, 0x401, ((char *)slide,
++              LoadFarString(NotEnoughMemCover)));
++            return PK_MEM;
++        }
++        if (error != 0) {
++            Info(slide, 0x401, ((char *)slide,
++              LoadFarString(OverlappedComponents)));
++            return PK_BOMB;
++        }
+ #ifdef MACOS  /* MacOS is no preemptive OS, thus call event-handling by hand */
+         UserStop();
+ #endif
+@@ -1994,6 +2154,34 @@ static int extract_or_test_member(__G)    /* return PK-type error code */
+     }
+ 
+     undefer_input(__G);
++
++    if ((G.lrec.general_purpose_bit_flag & 8) != 0) {
++        /* skip over data descriptor (harder than it sounds, due to signature
++         * ambiguity)
++         */
++#       define SIG 0x08074b50
++#       define LOW 0xffffffff
++        uch buf[12];
++        unsigned shy = 12 - readbuf((char *)buf, 12);
++        ulg crc = shy ? 0 : makelong(buf);
++        ulg clen = shy ? 0 : makelong(buf + 4);
++        ulg ulen = shy ? 0 : makelong(buf + 8); /* or high clen if ZIP64 */
++        if (crc == SIG &&                       /* if not SIG, no signature */
++            (G.lrec.crc32 != SIG ||             /* if not SIG, have signature */
++             (clen == SIG &&                    /* if not SIG, no signature */
++              ((G.lrec.csize & LOW) != SIG ||   /* if not SIG, have signature */
++               (ulen == SIG &&                  /* if not SIG, no signature */
++                (G.zip64 ? G.lrec.csize >> 32 : G.lrec.ucsize) != SIG
++                                                /* if not SIG, have signature */
++                )))))
++                   /* skip four more bytes to account for signature */
++                   shy += 4 - readbuf((char *)buf, 4);
++        if (G.zip64)
++            shy += 8 - readbuf((char *)buf, 8); /* skip eight more for ZIP64 */
++        if (shy)
++            error = PK_ERR;
++    }
++
+     return error;
+ 
+ } /* end function extract_or_test_member() */
+diff --git a/globals.c b/globals.c
+index fa8cca5..1e0f608 100644
+--- a/globals.c
++++ b/globals.c
+@@ -181,6 +181,7 @@ Uz_Globs *globalsCtor()
+ # if (!defined(NO_TIMESTAMPS))
+     uO.D_flag=1;    /* default to '-D', no restoration of dir timestamps */
+ # endif
++    G.cover = NULL;     /* not allocated yet */
+ #endif
+ 
+     uO.lflag=(-1);
+diff --git a/globals.h b/globals.h
+index 11b7215..2bdcdeb 100644
+--- a/globals.h
++++ b/globals.h
+@@ -260,12 +260,15 @@ typedef struct Globals {
+     ecdir_rec       ecrec;         /* used in unzip.c, extract.c */
+     z_stat   statbuf;              /* used by main, mapname, check_for_newer */
+ 
++    int zip64;                     /* true if Zip64 info in extra field */
++
+     int      mem_mode;
+     uch      *outbufptr;           /* extract.c static */
+     ulg      outsize;              /* extract.c static */
+     int      reported_backslash;   /* extract.c static */
+     int      disk_full;
+     int      newfile;
++    void     **cover;              /* used in extract.c for bomb detection */
+ 
+     int      didCRlast;            /* fileio static */
+     ulg      numlines;             /* fileio static: number of lines printed */
+diff --git a/process.c b/process.c
+index a3c1a4d..208619c 100644
+--- a/process.c
++++ b/process.c
+@@ -637,6 +637,13 @@ void free_G_buffers(__G)     /* releases all memory allocated in global vars */
+     }
+ #endif
+ 
++    /* Free the cover span list and the cover structure. */
++    if (G.cover != NULL) {
++        free(*(G.cover));
++        free(G.cover);
++        G.cover = NULL;
++    }
++
+ } /* end function free_G_buffers() */
+ 
+ 
+@@ -1905,6 +1912,7 @@ int getZip64Data(__G__ ef_buf, ef_len)
+ 
+ #define Z64FLGS 0xffff
+ #define Z64FLGL 0xffffffff
++    G.zip64 = FALSE;
+ 
+     if (ef_len == 0 || ef_buf == NULL)
+         return PK_COOL;
+@@ -1964,6 +1972,8 @@ int getZip64Data(__G__ ef_buf, ef_len)
+             G.crec.disk_number_start = (zuvl_t)makelong(offset + ef_buf);
+             offset += 4;
+           }
++
++          G.zip64 = TRUE;
+ #if 0
+           break;                /* Expect only one EF_PKSZ64 block. */
+ #endif /* 0 */
+diff --git a/unzip.h b/unzip.h
+index 5b2a326..ed24a5b 100644
+--- a/unzip.h
++++ b/unzip.h
+@@ -645,6 +645,7 @@ typedef struct _Uzp_cdir_Rec {
+ #define PK_NOZIP           9   /* zipfile not found */
+ #define PK_PARAM          10   /* bad or illegal parameters specified */
+ #define PK_FIND           11   /* no files found */
++#define PK_BOMB           12   /* likely zip bomb */
+ #define PK_DISK           50   /* disk full */
+ #define PK_EOF            51   /* unexpected EOF */
+ 
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
diff --git a/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch b/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch
new file mode 100644
index 0000000..fd26fdd
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch
@@ -0,0 +1,121 @@
+From be88aa4811af47ca06d8b7dcda294f899eba70ea Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Thu, 25 Jul 2019 20:43:17 -0700
+Subject: [PATCH 3/3] Do not raise a zip bomb alert for a misplaced central
+ directory.
+
+There is a zip-like file in the Firefox distribution, omni.ja,
+which is a zip container with the central directory placed at the
+start of the file instead of after the local entries as required
+by the zip standard. This commit marks the actual location of the
+central directory, as well as the end of central directory records,
+as disallowed locations. This now permits such containers to not
+raise a zip bomb alert, where in fact there are no overlaps.
+
+CVE: CVE-2019-13232
+Upstream-Status: Backport
+[https://github.com/madler/unzip/commit/6d351831be705cc26d897db44f878a978f4138fc]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ extract.c | 25 +++++++++++++++++++------
+ process.c |  6 ++++++
+ unzpriv.h | 10 ++++++++++
+ 3 files changed, 35 insertions(+), 6 deletions(-)
+
+diff --git a/extract.c b/extract.c
+index 2bb72ba..a9dcca8 100644
+--- a/extract.c
++++ b/extract.c
+@@ -495,8 +495,11 @@ int extract_or_test_files(__G)    /* return PK-type error code */
+     }
+ #endif /* !SFX || SFX_EXDIR */
+ 
+-    /* One more: initialize cover structure for bomb detection. Start with a
+-       span that covers the central directory though the end of the file. */
++    /* One more: initialize cover structure for bomb detection. Start with
++       spans that cover any extra bytes at the start, the central directory,
++       the end of central directory record (including the Zip64 end of central
++       directory locator, if present), and the Zip64 end of central directory
++       record, if present. */
+     if (G.cover == NULL) {
+         G.cover = malloc(sizeof(cover_t));
+         if (G.cover == NULL) {
+@@ -508,15 +511,25 @@ int extract_or_test_files(__G)    /* return PK-type error code */
+         ((cover_t *)G.cover)->max = 0;
+     }
+     ((cover_t *)G.cover)->num = 0;
+-    if ((G.extra_bytes != 0 &&
+-         cover_add((cover_t *)G.cover, 0, G.extra_bytes) != 0) ||
+-        cover_add((cover_t *)G.cover,
++    if (cover_add((cover_t *)G.cover,
+                   G.extra_bytes + G.ecrec.offset_start_central_directory,
+-                  G.ziplen) != 0) {
++                  G.extra_bytes + G.ecrec.offset_start_central_directory +
++                  G.ecrec.size_central_directory) != 0) {
+         Info(slide, 0x401, ((char *)slide,
+           LoadFarString(NotEnoughMemCover)));
+         return PK_MEM;
+     }
++    if ((G.extra_bytes != 0 &&
++         cover_add((cover_t *)G.cover, 0, G.extra_bytes) != 0) ||
++        (G.ecrec.have_ecr64 &&
++         cover_add((cover_t *)G.cover, G.ecrec.ec64_start,
++                   G.ecrec.ec64_end) != 0) ||
++        cover_add((cover_t *)G.cover, G.ecrec.ec_start,
++                  G.ecrec.ec_end) != 0) {
++        Info(slide, 0x401, ((char *)slide,
++          LoadFarString(OverlappedComponents)));
++        return PK_BOMB;
++    }
+ 
+ /*---------------------------------------------------------------------------
+     The basic idea of this function is as follows.  Since the central di-
+diff --git a/process.c b/process.c
+index 208619c..5f8f6c6 100644
+--- a/process.c
++++ b/process.c
+@@ -1408,6 +1408,10 @@ static int find_ecrec64(__G__ searchlen)         /* return PK-class error */
+ 
+     /* Now, we are (almost) sure that we have a Zip64 archive. */
+     G.ecrec.have_ecr64 = 1;
++    G.ecrec.ec_start -= ECLOC64_SIZE+4;
++    G.ecrec.ec64_start = ecrec64_start_offset;
++    G.ecrec.ec64_end = ecrec64_start_offset +
++                       12 + makeint64(&byterec[ECREC64_LENGTH]);
+ 
+     /* Update the "end-of-central-dir offset" for later checks. */
+     G.real_ecrec_offset = ecrec64_start_offset;
+@@ -1542,6 +1546,8 @@ static int find_ecrec(__G__ searchlen)          /* return PK-class error */
+       makelong(&byterec[OFFSET_START_CENTRAL_DIRECTORY]);
+     G.ecrec.zipfile_comment_length =
+       makeword(&byterec[ZIPFILE_COMMENT_LENGTH]);
++    G.ecrec.ec_start = G.real_ecrec_offset;
++    G.ecrec.ec_end = G.ecrec.ec_start + 22 + G.ecrec.zipfile_comment_length;
+ 
+     /* Now, we have to read the archive comment, BEFORE the file pointer
+        is moved away backwards to seek for a Zip64 ECLOC64 structure.
+diff --git a/unzpriv.h b/unzpriv.h
+index c8d3eab..5e177c7 100644
+--- a/unzpriv.h
++++ b/unzpriv.h
+@@ -2185,6 +2185,16 @@ typedef struct VMStimbuf {
+        int have_ecr64;                  /* valid Zip64 ecdir-record exists */
+        int is_zip64_archive;            /* Zip64 ecdir-record is mandatory */
+        ush zipfile_comment_length;
++       zusz_t ec_start, ec_end;         /* offsets of start and end of the
++                                           end of central directory record,
++                                           including if present the Zip64
++                                           end of central directory locator,
++                                           which immediately precedes the
++                                           end of central directory record */
++       zusz_t ec64_start, ec64_end;     /* if have_ecr64 is true, then these
++                                           are the offsets of the start and
++                                           end of the Zip64 end of central
++                                           directory record */
+    } ecdir_rec;
+ 
+ 
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index daba722..464d73d 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -22,6 +22,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://symlink.patch \
 	file://0001-unzip-fix-CVE-2018-1000035.patch \
 	file://CVE-2018-18384.patch \
+	file://CVE-2019-13232_p1.patch \
+	file://CVE-2019-13232_p2.patch \
+        file://CVE-2019-13232_p3.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.7.4


