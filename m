Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30986.1795560751874853920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ANYnqfHc;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a358881793so2633158f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560750; x=1796165550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7xXJUfKr59/fjhFgS5EHW2pkCDuihLM+ahBn2WGVId8=;
        b=ANYnqfHcH0+7CnpPAoATUy/jgZFgwNwE470B+1SmamnJ03hC8j13XzLnAVUHAim7vX
         /LtFd3zuMr2vjX7p7kf8PISYIdnNRxHva9d9DDwSSdCESN3OWtYRWWI5pNVlfd2pWvYn
         YrSGsC4dHq5rVtP/u/N6aVL/4WHotUJ4mcEap2VQsgbGq6bYNbEI28T95YU2Mrm9SKeT
         8bCvKWqNhES+sRl8ZuG+l8/7XDuyDqT2dKho3jXTSsOU1aPriwQehpgOeZeY8AM7yuvU
         W0ThieKSD4TKUGwbNnRr7SQIzUUwREfJv33E5A89iIAimQrS/l+L4Lpr7gp/BX+wQ2/F
         fFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560750; x=1796165550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7xXJUfKr59/fjhFgS5EHW2pkCDuihLM+ahBn2WGVId8=;
        b=TJCB3OYP2zSBp0cqqEAKOijXjTSkAjVyiT5p+Uh9cTYpIwFWIh9ECYpvXzrnPmgybD
         iaxv8BuSErRor0c+2lBtr0ROYPnJkNYK5QAIYunNCW8e+qTIIUClOf9q1K/McljDipvO
         /a/WZTwZOmK8iWiqIkZXaGVPJlGFan+9XBDeJnYnrc/59GweW40FCn5QMKbSOunsIpKR
         +HFaX+trbUvBAZiivwraSsBwFjVSrWtz8UhWpxKigA+Cq7+L0j2iCP5Dnp8+0odRV43A
         Bn2gg3/syV4UWmWkRgzIui5RpNt3MH2Fk+i/wZZBpXaWN4ZSNs/SjA4D1ro59QYz+lB+
         ez5g==
X-Gm-Message-State: APuU4Z/AEOuKUUnoBkI5rqYlmSTnu5CSzaJJalXlxLCnw0BAOBjxuRyV
	PTHHUBUM9/E//AAcEP8ZrikMxKjKo+6gcUHIravcFzCfu92aLT6xIxj8FBwRiT4w9CQKJptVDNY
	XxHZCUlY=
X-Gm-Gg: AZFdTZejtybDOGDMg7fk0tRDr2oYN++vvTh03SSO8OUetHXYaGRLoRBbfuqCSmrBYnP
	XcKl6p9VyPgsq/l1maP8hasKXlvFnopRkqKsIwwC41E8Ifaurzg/qdI3bXpdTW3Y8R0oc33nndh
	aBdhJlJn0oernd+o9+hTi0Itzk9qtK6bJIROWjiMr1a4HDFyQz2wLooqQsR0LIEi4OdWiwTu5Pu
	tYjD8YQ7bjYOaLOZ5Jp16LYv3S7u/WRemmuYapqlVPYsRit3MkVnFYQ8qyaAmKtK+gtuXCMeHOq
	B3mGNsklRcFZniIfzm5u57/Q9P2V3AwjqSO8u+10xoMS3e3A7fh4D0BRK1rIcWn3IRxsI+JziUN
	SEJk+EvRwdMZ9DZ8eW7Ho6vYmx8uqcqt2y1cpZUFov9l/fnsLb8IbEG/wo4gNtqseRae4hrZeiG
	mZtSclkraxB85/ddJdyyaYhHEduxKXZhvrA+WHJDdtNfJGSphdKr60njQXIdxrn6rlp7g2r830s
	0JuqGTHLM7s6cblttRM6G4vWHRMobwaY4zJmXDNHO3uNDc/UMZxE3Wa0VcgDXQCHZ4isDW3O5x1
	aCq35aNyGkK+uhfTCAqh8/iP+N5rWSErI0dHzWbcjSlqnI//4TPuvLdm76j8F37cbBvo6AvsCx7
	S+reTJfCmN5Onmaok1JdD1EfH1JDd
X-Received: by 2002:a05:6000:470c:b0:4a7:593a:f421 with SMTP id ffacd0b85a97d-4abb73b557amr29246512f8f.47.1795560749923;
        Tue, 24 Nov 2026 14:52:29 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 18/21] libsndfile1: patch CVE-2026-109828
Date: Tue, 24 Nov 2026 23:51:25 +0100
Message-ID: <74391007365b5f2b2258ac8de70d14be48a937eb.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251098
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] which clsed [2] linked from [3].

Also pick a refactoring commit which is required for a clean
cherry-pick.

[1] https://github.com/libsndfile/libsndfile/pull/1170
[2] https://github.com/libsndfile/libsndfile/issues/1169
[3] https://nvd.nist.gov/vuln/detail/cve-2026-109828

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6c80a8917e6c815cea297d2aa6c7d715f07c57d9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsndfile1/CVE-2026-109828-01.patch      | 234 ++++++++++++++++++
 .../libsndfile1/CVE-2026-109828-02.patch      |  26 ++
 .../libsndfile/libsndfile1_1.2.2.bb           |   2 +
 3 files changed, 262 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-02.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-01.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-01.patch
new file mode 100644
index 00000000000..61acc37c2dc
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-01.patch
@@ -0,0 +1,234 @@
+From 59babedce8fa8eb1000ecb3c87a5dd4a1190ad9e Mon Sep 17 00:00:00 2001
+From: iceray-Li <108821718+iceray00@users.noreply.github.com>
+Date: Tue, 22 Sep 2026 06:05:03 +0000
+Subject: [PATCH] aiff, wav, wavlike: index the cue array through a pointer
+
+The cue array of an SF_CUES struct is allocated with room for the actual cue
+count (SF_CUES_VAR_SIZE()), but the public SF_CUES type declares it with a
+fixed length of 100 (SF_CUES_VAR (100)).  Compilers therefore assume that
+cue_points [] holds 100 elements, and UBSan's array-bounds check flags every
+access beyond that even though the allocation is larger:
+
+    src/aiff.c:823:8:  runtime error: index 100 out of bounds for type 'SF_CUE_POINT [100]'
+    src/aiff.c:943:38: runtime error: index 100 out of bounds for type 'SF_CUE_POINT [100]'
+    src/wav.c:524:8:   runtime error: index 100 out of bounds for type 'SF_CUE_POINT [100]'
+
+The declared bound is also the reason the CVE-2022-33064 report (issue #832)
+is still open.  The accesses themselves are inside the allocation: the cue
+count is capped at 2500 by wav.c and aiff.c, psf_cues_alloc() reserves
+cue_count * sizeof (SF_CUE_POINT) bytes, and the same inputs are clean under
+ASan, so no validation of the file can make the diagnostic disappear.
+
+Add psf_cues_points(), which hands out the first element of the array as an
+ordinary pointer, and use it at every place that subscripts cue_points [].
+The layout of the public SF_CUES struct, the API it exposes and the file
+handling are unchanged.
+
+Tested with ossfuzz/sndfile_fuzzer and ossfuzz/sndfile_alt_fuzzer built with
+-fsanitize=address,undefined: the crafted AIFF and WAV inputs abort in
+src/aiff.c and src/wav.c before the change and are clean after it.
+
+CVE: CVE-2026-109828
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/59babedce8fa8eb1000ecb3c87a5dd4a1190ad9e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/aiff.c    | 36 ++++++++++++++++++++----------------
+ src/common.h  | 10 ++++++++++
+ src/wav.c     | 23 +++++++++++++----------
+ src/wavlike.c |  5 +++--
+ 4 files changed, 46 insertions(+), 28 deletions(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index e36b21e0..39c3221d 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -403,6 +403,7 @@ aiff_read_header (SF_PRIVATE *psf, COMM_CHUNK *comm_fmt)
+ 	int			k, found_chunk = 0, done = 0, error = 0 ;
+ 	char		*cptr ;
+ 	int			instr_found = 0, mark_found = 0 ;
++	SF_CUE_POINT *cue_points = NULL ;
+ 
+ 	if (psf->filelength > 0xFFFFFFFFLL)
+ 		psf_log_printf (psf, "Warning : filelength > 0xffffffff. This is bad!!!!\n") ;
+@@ -813,6 +814,8 @@ aiff_read_header (SF_PRIVATE *psf, COMM_CHUNK *comm_fmt)
+ 						if ((psf->cues = psf_cues_alloc (mark_count)) == NULL)
+ 							return SFE_MALLOC_FAILED ;
+ 
++						cue_points = psf_cues_points (psf->cues) ;
++
+ 						for (n = 0 ; n < mark_count && bytesread < chunk_size ; n++)
+ 						{	uint32_t pstr_len ;
+ 							uint8_t ch ;
+@@ -820,12 +823,12 @@ aiff_read_header (SF_PRIVATE *psf, COMM_CHUNK *comm_fmt)
+ 							bytesread += psf_binheader_readf (psf, "E241", &mark_id, &position, &ch) ;
+ 							psf_log_printf (psf, "   Mark ID  : %u\n   Position : %u\n", mark_id, position) ;
+ 
+-							psf->cues->cue_points [n].indx = mark_id ;
+-							psf->cues->cue_points [n].position = 0 ;
+-							psf->cues->cue_points [n].fcc_chunk = MAKE_MARKER ('d', 'a', 't', 'a') ; /* always data */
+-							psf->cues->cue_points [n].chunk_start = 0 ;
+-							psf->cues->cue_points [n].block_start = 0 ;
+-							psf->cues->cue_points [n].sample_offset = position ;
++							cue_points [n].indx = mark_id ;
++							cue_points [n].position = 0 ;
++							cue_points [n].fcc_chunk = MAKE_MARKER ('d', 'a', 't', 'a') ; /* always data */
++							cue_points [n].chunk_start = 0 ;
++							cue_points [n].block_start = 0 ;
++							cue_points [n].sample_offset = position ;
+ 
+ 							pstr_len = (ch & 1) ? ch : ch + 1 ;
+ 
+@@ -841,7 +844,7 @@ aiff_read_header (SF_PRIVATE *psf, COMM_CHUNK *comm_fmt)
+ 
+ 							psf_log_printf (psf, "   Name     : %s\n", ubuf.scbuf) ;
+ 
+-							psf_strlcpy (psf->cues->cue_points [n].name, sizeof (psf->cues->cue_points [n].name), ubuf.cbuf) ;
++							psf_strlcpy (cue_points [n].name, sizeof (cue_points [n].name), ubuf.cbuf) ;
+ 
+ 							paiff->markstr [n].markerID = mark_id ;
+ 							paiff->markstr [n].position = position ;
+@@ -940,14 +943,14 @@ aiff_read_header (SF_PRIVATE *psf, COMM_CHUNK *comm_fmt)
+ 
+ 			for (j = 0 ; j < psf->cues->cue_count - (uint32_t) (psf->instrument->loop_count * 2) ; j ++)
+ 			{	/* This simply copies the information in cues above loop positions and writes it at current count instead */
+-				psf->cues->cue_points [j].indx = psf->cues->cue_points [j + psf->instrument->loop_count * 2].indx ;
+-				psf->cues->cue_points [j].position = psf->cues->cue_points [j + psf->instrument->loop_count * 2].position ;
+-				psf->cues->cue_points [j].fcc_chunk = psf->cues->cue_points [j + psf->instrument->loop_count * 2].fcc_chunk ;
+-				psf->cues->cue_points [j].chunk_start = psf->cues->cue_points [j + psf->instrument->loop_count * 2].chunk_start ;
+-				psf->cues->cue_points [j].block_start = psf->cues->cue_points [j + psf->instrument->loop_count * 2].block_start ;
+-				psf->cues->cue_points [j].sample_offset = psf->cues->cue_points [j + psf->instrument->loop_count * 2].sample_offset ;
++				cue_points [j].indx = cue_points [j + psf->instrument->loop_count * 2].indx ;
++				cue_points [j].position = cue_points [j + psf->instrument->loop_count * 2].position ;
++				cue_points [j].fcc_chunk = cue_points [j + psf->instrument->loop_count * 2].fcc_chunk ;
++				cue_points [j].chunk_start = cue_points [j + psf->instrument->loop_count * 2].chunk_start ;
++				cue_points [j].block_start = cue_points [j + psf->instrument->loop_count * 2].block_start ;
++				cue_points [j].sample_offset = cue_points [j + psf->instrument->loop_count * 2].sample_offset ;
+ 				for (str_index = 0 ; str_index < 256 ; str_index++)
+-					psf->cues->cue_points [j].name [str_index] = psf->cues->cue_points [j + psf->instrument->loop_count * 2].name [str_index] ;
++					cue_points [j].name [str_index] = cue_points [j + psf->instrument->loop_count * 2].name [str_index] ;
+ 				} ;
+ 			psf->cues->cue_count -= psf->instrument->loop_count * 2 ;
+ 			} else
+@@ -1461,10 +1464,11 @@ aiff_write_header (SF_PRIVATE *psf, int calc_length)
+ 	{	/* There are cues but no loops */
+ 		uint32_t idx ;
+ 		int totalStringLength = 0, stringLength ;
++		SF_CUE_POINT *cue_points = psf_cues_points (psf->cues) ;
+ 
+ 		/* Here we count how many bytes will the pascal strings need */
+ 		for (idx = 0 ; idx < psf->cues->cue_count ; idx++)
+-		{	stringLength = strlen (psf->cues->cue_points [idx].name) + 1 ; /* We'll count the first byte also of every pascal string */
++		{	stringLength = strlen (cue_points [idx].name) + 1 ; /* We'll count the first byte also of every pascal string */
+ 			totalStringLength += stringLength + (stringLength % 2 == 0 ? 0 : 1) ;
+ 			} ;
+ 
+@@ -1472,7 +1476,7 @@ aiff_write_header (SF_PRIVATE *psf, int calc_length)
+ 			BHWm (MARK_MARKER), BHW4 (2 + psf->cues->cue_count * (2 + 4) + totalStringLength), BHW2 (psf->cues->cue_count)) ;
+ 
+ 		for (idx = 0 ; idx < psf->cues->cue_count ; idx++)
+-			psf_binheader_writef (psf, "E24p", BHW2 (psf->cues->cue_points [idx].indx), BHW4 (psf->cues->cue_points [idx].sample_offset), BHWp (psf->cues->cue_points [idx].name)) ;
++			psf_binheader_writef (psf, "E24p", BHW2 (cue_points [idx].indx), BHW4 (cue_points [idx].sample_offset), BHWp (cue_points [idx].name)) ;
+ 		} ;
+ 
+ 	if (psf->strings.flags & SF_STR_LOCATE_START)
+diff --git a/src/common.h b/src/common.h
+index 01f6ae09..ee6844b8 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -989,6 +989,16 @@ SF_CUES * psf_cues_dup (const void * ptr, size_t datasize) ;
+ SF_CUES * psf_cues_alloc (uint32_t cue_count) ;
+ void psf_get_cues (SF_PRIVATE * psf, void * data, size_t datasize) ;
+ 
++/* The cue array is allocated with room for the actual cue count (see
++** psf_cues_alloc()), but the public SF_CUES type declares it with a fixed
++** length of 100.  Index it through a pointer so that compilers do not flag
++** accesses to the longer, correctly allocated array (issue #832).
++*/
++static inline SF_CUE_POINT *
++psf_cues_points (SF_CUES *cues)
++{	return cues->cue_points ;
++} /* psf_cues_points */
++
+ SF_INSTRUMENT * psf_instrument_alloc (void) ;
+ 
+ void	psf_sanitize_string (char * cptr, int len) ;
+diff --git a/src/wav.c b/src/wav.c
+index 80dda4e1..f206bc34 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -484,6 +484,7 @@ wav_read_header	(SF_PRIVATE *psf, int *blockalign, int *framesperblock)
+ 
+ 					{	uint32_t thisread, bytesread, cue_count, position, offset ;
+ 						int id, chunk_id, chunk_start, block_start, cue_index ;
++						SF_CUE_POINT *cue_points ;
+ 
+ 						bytesread = psf_binheader_readf (psf, "4", &cue_count) ;
+ 						psf_log_printf (psf, "%M : %u\n", marker, chunk_size) ;
+@@ -504,6 +505,7 @@ wav_read_header	(SF_PRIVATE *psf, int *blockalign, int *framesperblock)
+ 						if ((psf->cues = psf_cues_alloc (cue_count)) == NULL)
+ 							return SFE_MALLOC_FAILED ;
+ 
++						cue_points = psf_cues_points (psf->cues) ;
+ 						cue_index = 0 ;
+ 
+ 						while (cue_count)
+@@ -521,13 +523,13 @@ wav_read_header	(SF_PRIVATE *psf, int *blockalign, int *framesperblock)
+ 							else if (cue_index == 10)
+ 								psf_log_printf (psf,	"   (Skipping)\n") ;
+ 
+-							psf->cues->cue_points [cue_index].indx = id ;
+-							psf->cues->cue_points [cue_index].position = position ;
+-							psf->cues->cue_points [cue_index].fcc_chunk = chunk_id ;
+-							psf->cues->cue_points [cue_index].chunk_start = chunk_start ;
+-							psf->cues->cue_points [cue_index].block_start = block_start ;
+-							psf->cues->cue_points [cue_index].sample_offset = offset ;
+-							psf->cues->cue_points [cue_index].name [0] = '\0' ;
++							cue_points [cue_index].indx = id ;
++							cue_points [cue_index].position = position ;
++							cue_points [cue_index].fcc_chunk = chunk_id ;
++							cue_points [cue_index].chunk_start = chunk_start ;
++							cue_points [cue_index].block_start = block_start ;
++							cue_points [cue_index].sample_offset = offset ;
++							cue_points [cue_index].name [0] = '\0' ;
+ 							cue_count -- ;
+ 							cue_index ++ ;
+ 							} ;
+@@ -1210,13 +1212,14 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
+ 
+ 	if (psf->cues != NULL)
+ 	{	uint32_t k ;
++		SF_CUE_POINT *cue_points = psf_cues_points (psf->cues) ;
+ 
+ 		psf_binheader_writef (psf, "em44", BHWm (cue_MARKER), BHW4 (4 + psf->cues->cue_count * 6 * 4), BHW4 (psf->cues->cue_count)) ;
+ 
+ 		for (k = 0 ; k < psf->cues->cue_count ; k++)
+-			psf_binheader_writef (psf, "e44m444", BHW4 (psf->cues->cue_points [k].indx), BHW4 (psf->cues->cue_points [k].position),
+-						BHWm (psf->cues->cue_points [k].fcc_chunk), BHW4 (psf->cues->cue_points [k].chunk_start),
+-						BHW4 (psf->cues->cue_points [k].block_start), BHW4 (psf->cues->cue_points [k].sample_offset)) ;
++			psf_binheader_writef (psf, "e44m444", BHW4 (cue_points [k].indx), BHW4 (cue_points [k].position),
++						BHWm (cue_points [k].fcc_chunk), BHW4 (cue_points [k].chunk_start),
++						BHW4 (cue_points [k].block_start), BHW4 (cue_points [k].sample_offset)) ;
+ 		} ;
+ 
+ 	if (psf->instrument != NULL)
+diff --git a/src/wavlike.c b/src/wavlike.c
+index 05691323..0c3577a8 100644
+--- a/src/wavlike.c
++++ b/src/wavlike.c
+@@ -1060,13 +1060,14 @@ wavlike_subchunk_parse (SF_PRIVATE *psf, int chunk, uint32_t chunk_length)
+ 
+ 						if (psf->cues)
+  						{	unsigned int i = 0 ;
++							SF_CUE_POINT *cue_points = psf_cues_points (psf->cues) ;
+ 
+ 							/* find id to store label */
+-							while (i < psf->cues->cue_count && psf->cues->cue_points [i].indx != mark_id)
++							while (i < psf->cues->cue_count && cue_points [i].indx != mark_id)
+ 								i++ ;
+ 
+ 							if (i < psf->cues->cue_count)
+-								memcpy (psf->cues->cue_points [i].name, buffer, sizeof (psf->cues->cue_points [i].name)) ;
++								memcpy (cue_points [i].name, buffer, sizeof (cue_points [i].name)) ;
+ 							} ;
+ 						} ;
+ 					break ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-02.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-02.patch
new file mode 100644
index 00000000000..dab12f04ace
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-02.patch
@@ -0,0 +1,26 @@
+From 1ccd2a18826722c3aa9ed54122ebff20e3b92b10 Mon Sep 17 00:00:00 2001
+From: Ilias Aberkane <user.name>
+Date: Fri, 25 Sep 2026 13:38:54 +0200
+Subject: [PATCH] wavlike: copy only the labl bytes actually read into cue
+ names
+
+CVE: CVE-2026-109828
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/1ccd2a18826722c3aa9ed54122ebff20e3b92b10]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/wavlike.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/wavlike.c b/src/wavlike.c
+index 0c3577a8..9d99b74a 100644
+--- a/src/wavlike.c
++++ b/src/wavlike.c
+@@ -1067,7 +1067,7 @@ wavlike_subchunk_parse (SF_PRIVATE *psf, int chunk, uint32_t chunk_length)
+ 								i++ ;
+ 
+ 							if (i < psf->cues->cue_count)
+-								memcpy (cue_points [i].name, buffer, sizeof (cue_points [i].name)) ;
++								psf_strlcpy (cue_points [i].name, sizeof (cue_points [i].name), buffer) ;
+ 							} ;
+ 						} ;
+ 					break ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 2c3e28dc1c8..75242c34050 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -17,6 +17,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://CVE-2026-37555.patch \
            file://CVE-2024-50613.patch \
            file://CVE-2025-52194.patch \
+           file://CVE-2026-109828-01.patch \
+           file://CVE-2026-109828-02.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
