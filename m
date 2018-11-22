Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 562656C596
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:54 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q18so9673873wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ck9QJWp+vO3YB/pyQ4tAogvXQIq1PvK7PBJ9ixpQtd8=;
	b=WhpFzimPXfgv2zjZJDGKkN62adSwppKRxsy2t4N2/NO9xKebG4uqbfSMKRXbQ31wRK
	SW36UKd3hKW2n5bVHKiOop+xSerTHwfCM3F1GCYgfLPCAjLf6FmaVhoYz/MZIKoKJxAn
	NJEgNSqAjX2FP90O/l/hs/VX3OVAj31wkHHG8G2yY+HXcrQTW0o2t8b7AZ4Gqgm6GCjc
	95HbmJpKfHJk474uHGOw12RNFfRaaSKZDDJTKWm0nmt2bKz+S12/gj3DcFtVRbpkDcL0
	/xlGQczHPzlvaDLZJm2kdEm9N/qh1dk+xjZqucI4bKnnFSl4tkYEv61bWo7TcJhWJDbG
	1FPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ck9QJWp+vO3YB/pyQ4tAogvXQIq1PvK7PBJ9ixpQtd8=;
	b=dm1jIw30fAIHCl1r5Ho3fx4MUARFLB+FRn4DjP5B9apUqNVIT+c8WhNRwWhQwMUakX
	cEkmwTWGfosTC305DfnsWltkzgzEgXuh9qFgTT4JdpT7wGwvvlWywAHp6Y2FtQxo2isV
	7Cda4E2SKCsHw/qU99jB+3Br/kRtK7mNBU9A5bv1j0svchZ4v18nWCpb53HLLY5cT11y
	TyvF726NjxlWuVszXCipyq8uFhOF5Xd7QXMCgQrUAuW+/RR9/vGh/PzBCWX+puDm1vIG
	Bx8wOadPj/yPlayuyFDF0WmaG8evDpwd6zyG/UBYoNSNrFS9GgeVGYPvNwmon7w2Y1xd
	Ox2Q==
X-Gm-Message-State: AA+aEWZXN7dhK3NqRd6oLgrXagcKA0jI8o+62EREuXx5ygF4CnV+IJ96
	O0kbP9q+sSRXDmxzZjeiY2YmDqeg
X-Google-Smtp-Source: AFSGD/XLzYBc9/K5tXrdeLkrFoJr6ZmDOHy9GcIKZOKYNBz+iFog+Vdvu3N5FNRk9bXTmeR6eKU5Og==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr9744022wrv.80.1542901314005; 
	Thu, 22 Nov 2018 07:41:54 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:25 +0100
Message-Id: <20181122154136.121480-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/16] tiff: update to 4.0.10
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
X-List-Received-Date: Thu, 22 Nov 2018 15:41:54 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libtiff/files/CVE-2017-17095.patch        |  46 -----
 .../libtiff/files/CVE-2017-18013.patch        |  42 -----
 .../libtiff/files/CVE-2017-9935.patch         | 160 ----------------
 .../libtiff/files/CVE-2018-10963.patch        |  39 ----
 .../libtiff/files/CVE-2018-5784.patch         | 135 -------------
 .../libtiff/files/CVE-2018-7456.patch         | 178 ------------------
 .../libtiff/files/CVE-2018-8905.patch         |  61 ------
 .../libtiff/files/libtool2.patch              |  19 +-
 .../libtiff/{tiff_4.0.9.bb => tiff_4.0.10.bb} |  15 +-
 9 files changed, 16 insertions(+), 679 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-17095.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-18013.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2017-9935.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-5784.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-7456.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2018-8905.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.9.bb => tiff_4.0.10.bb} (80%)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-17095.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-17095.patch
deleted file mode 100644
index 9b9962ed352..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2017-17095.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9171da596c88e6a2dadcab4a3a89dddd6e1b4655 Mon Sep 17 00:00:00 2001
-From: Nathan Baker <elitebadger@gmail.com>
-Date: Thu, 25 Jan 2018 21:28:15 +0000
-Subject: [PATCH] Add workaround to pal2rgb buffer overflow.
-
-CVE: CVE-2017-17095
-
-Upstream-Status: Backport (unchanged) [gitlab.com/libtiff/libtiff/commit/9171da5...]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com.
-
----
- tools/pal2rgb.c |   17 +++++++++++++++--
- 1 file changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/tools/pal2rgb.c b/tools/pal2rgb.c
-index 0423598..01fcf94 100644
---- a/tools/pal2rgb.c
-+++ b/tools/pal2rgb.c
-@@ -182,8 +182,21 @@ main(int argc, char* argv[])
- 	{ unsigned char *ibuf, *obuf;
- 	  register unsigned char* pp;
- 	  register uint32 x;
--	  ibuf = (unsigned char*)_TIFFmalloc(TIFFScanlineSize(in));
--	  obuf = (unsigned char*)_TIFFmalloc(TIFFScanlineSize(out));
-+	  tmsize_t tss_in = TIFFScanlineSize(in);
-+	  tmsize_t tss_out = TIFFScanlineSize(out);
-+	  if (tss_out / tss_in < 3) {
-+		/*
-+		 * BUG 2750: The following code does not know about chroma
-+		 * subsampling of JPEG data. It assumes that the output buffer is 3x
-+		 * the length of the input buffer due to exploding the palette into
-+		 * RGB tuples. If this assumption is incorrect, it could lead to a
-+		 * buffer overflow. Go ahead and fail now to prevent that.
-+		 */
-+		fprintf(stderr, "Could not determine correct image size for output. Exiting.\n");
-+		return -1;
-+      }
-+	  ibuf = (unsigned char*)_TIFFmalloc(tss_in);
-+	  obuf = (unsigned char*)_TIFFmalloc(tss_out);
- 	  switch (config) {
- 	  case PLANARCONFIG_CONTIG:
- 		for (row = 0; row < imagelength; row++) {
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-18013.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-18013.patch
deleted file mode 100644
index 878e0de9597..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2017-18013.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 293c8b0298e91d20ba51291e2351ab7d110671d0 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sun, 31 Dec 2017 15:09:41 +0100
-Subject: [PATCH] libtiff/tif_print.c: TIFFPrintDirectory(): fix null pointer
- dereference on corrupted file. Fixes
- http://bugzilla.maptools.org/show_bug.cgi?id=2770
-
-Upstream-Status: Backport
-[https://gitlab.com/libtiff/libtiff/commit/c6f41df7b581402dfba3c19a1e3df4454c551a01]
-
-CVE: CVE-2017-18013
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- libtiff/tif_print.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libtiff/tif_print.c b/libtiff/tif_print.c
-index 24d4b98..f494cfb 100644
---- a/libtiff/tif_print.c
-+++ b/libtiff/tif_print.c
-@@ -667,13 +667,13 @@ TIFFPrintDirectory(TIFF* tif, FILE* fd, long flags)
- #if defined(__WIN32__) && (defined(_MSC_VER) || defined(__MINGW32__))
- 			fprintf(fd, "    %3lu: [%8I64u, %8I64u]\n",
- 			    (unsigned long) s,
--			    (unsigned __int64) td->td_stripoffset[s],
--			    (unsigned __int64) td->td_stripbytecount[s]);
-+			    td->td_stripoffset ? (unsigned __int64) td->td_stripoffset[s] : 0,
-+			    td->td_stripbytecount ? (unsigned __int64) td->td_stripbytecount[s] : 0);
- #else
- 			fprintf(fd, "    %3lu: [%8llu, %8llu]\n",
- 			    (unsigned long) s,
--			    (unsigned long long) td->td_stripoffset[s],
--			    (unsigned long long) td->td_stripbytecount[s]);
-+			    td->td_stripoffset ? (unsigned long long) td->td_stripoffset[s] : 0,
-+			    td->td_stripbytecount ? (unsigned long long) td->td_stripbytecount[s] : 0);
- #endif
- 	}
- }
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2017-9935.patch b/meta/recipes-multimedia/libtiff/files/CVE-2017-9935.patch
deleted file mode 100644
index 60684dd2a68..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2017-9935.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From abb0055d21c52a9925314d5b0628fb2b6307619c Mon Sep 17 00:00:00 2001
-From: Brian May <brian@linuxpenguins.xyz>
-Date: Thu, 7 Dec 2017 07:46:47 +1100
-Subject: [PATCH] tiff2pdf: Fix CVE-2017-9935
-
-Fix for http://bugzilla.maptools.org/show_bug.cgi?id=2704
-
-This vulnerability - at least for the supplied test case - is because we
-assume that a tiff will only have one transfer function that is the same
-for all pages. This is not required by the TIFF standards.
-
-We than read the transfer function for every page.  Depending on the
-transfer function, we allocate either 2 or 4 bytes to the XREF buffer.
-We allocate this memory after we read in the transfer function for the
-page.
-
-For the first exploit - POC1, this file has 3 pages. For the first page
-we allocate 2 extra extra XREF entries. Then for the next page 2 more
-entries. Then for the last page the transfer function changes and we
-allocate 4 more entries.
-
-When we read the file into memory, we assume we have 4 bytes extra for
-each and every page (as per the last transfer function we read). Which
-is not correct, we only have 2 bytes extra for the first 2 pages. As a
-result, we end up writing past the end of the buffer.
-
-There are also some related issues that this also fixes. For example,
-TIFFGetField can return uninitalized pointer values, and the logic to
-detect a N=3 vs N=1 transfer function seemed rather strange.
-
-It is also strange that we declare the transfer functions to be of type
-float, when the standard says they are unsigned 16 bit values. This is
-fixed in another patch.
-
-This patch will check to ensure that the N value for every transfer
-function is the same for every page. If this changes, we abort with an
-error. In theory, we should perhaps check that the transfer function
-itself is identical for every page, however we don't do that due to the
-confusion of the type of the data in the transfer function.
-
-Upstream-Status: Backport
-[https://gitlab.com/libtiff/libtiff/commit/3dd8f6a357981a4090f126ab9025056c938b6940]
-
-CVE: CVE-2017-9935
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- libtiff/tif_dir.c |  3 +++
- tools/tiff2pdf.c  | 65 +++++++++++++++++++++++++++++++++++++------------------
- 2 files changed, 47 insertions(+), 21 deletions(-)
-
-diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
-index f00f808..c36a5f3 100644
---- a/libtiff/tif_dir.c
-+++ b/libtiff/tif_dir.c
-@@ -1067,6 +1067,9 @@ _TIFFVGetField(TIFF* tif, uint32 tag, va_list ap)
- 			if (td->td_samplesperpixel - td->td_extrasamples > 1) {
- 				*va_arg(ap, uint16**) = td->td_transferfunction[1];
- 				*va_arg(ap, uint16**) = td->td_transferfunction[2];
-+			} else {
-+				*va_arg(ap, uint16**) = NULL;
-+				*va_arg(ap, uint16**) = NULL;
- 			}
- 			break;
- 		case TIFFTAG_REFERENCEBLACKWHITE:
-diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
-index 454befb..0b5973e 100644
---- a/tools/tiff2pdf.c
-+++ b/tools/tiff2pdf.c
-@@ -1047,6 +1047,8 @@ void t2p_read_tiff_init(T2P* t2p, TIFF* input){
- 	uint16 pagen=0;
- 	uint16 paged=0;
- 	uint16 xuint16=0;
-+	uint16 tiff_transferfunctioncount=0;
-+	float* tiff_transferfunction[3];
- 
- 	directorycount=TIFFNumberOfDirectories(input);
- 	t2p->tiff_pages = (T2P_PAGE*) _TIFFmalloc(TIFFSafeMultiply(tmsize_t,directorycount,sizeof(T2P_PAGE)));
-@@ -1147,26 +1149,48 @@ void t2p_read_tiff_init(T2P* t2p, TIFF* input){
-                 }
- #endif
- 		if (TIFFGetField(input, TIFFTAG_TRANSFERFUNCTION,
--                                 &(t2p->tiff_transferfunction[0]),
--                                 &(t2p->tiff_transferfunction[1]),
--                                 &(t2p->tiff_transferfunction[2]))) {
--			if((t2p->tiff_transferfunction[1] != (float*) NULL) &&
--                           (t2p->tiff_transferfunction[2] != (float*) NULL) &&
--                           (t2p->tiff_transferfunction[1] !=
--                            t2p->tiff_transferfunction[0])) {
--				t2p->tiff_transferfunctioncount = 3;
--				t2p->tiff_pages[i].page_extra += 4;
--				t2p->pdf_xrefcount += 4;
--			} else {
--				t2p->tiff_transferfunctioncount = 1;
--				t2p->tiff_pages[i].page_extra += 2;
--				t2p->pdf_xrefcount += 2;
--			}
--			if(t2p->pdf_minorversion < 2)
--				t2p->pdf_minorversion = 2;
-+                                 &(tiff_transferfunction[0]),
-+                                 &(tiff_transferfunction[1]),
-+                                 &(tiff_transferfunction[2]))) {
-+
-+                        if((tiff_transferfunction[1] != (float*) NULL) &&
-+                           (tiff_transferfunction[2] != (float*) NULL)
-+                          ) {
-+                            tiff_transferfunctioncount=3;
-+                        } else {
-+                            tiff_transferfunctioncount=1;
-+                        }
-                 } else {
--			t2p->tiff_transferfunctioncount=0;
-+			tiff_transferfunctioncount=0;
- 		}
-+
-+                if (i > 0){
-+                    if (tiff_transferfunctioncount != t2p->tiff_transferfunctioncount){
-+                        TIFFError(
-+                            TIFF2PDF_MODULE,
-+                            "Different transfer function on page %d",
-+                            i);
-+                        t2p->t2p_error = T2P_ERR_ERROR;
-+                        return;
-+                    }
-+                }
-+
-+                t2p->tiff_transferfunctioncount = tiff_transferfunctioncount;
-+                t2p->tiff_transferfunction[0] = tiff_transferfunction[0];
-+                t2p->tiff_transferfunction[1] = tiff_transferfunction[1];
-+                t2p->tiff_transferfunction[2] = tiff_transferfunction[2];
-+                if(tiff_transferfunctioncount == 3){
-+                        t2p->tiff_pages[i].page_extra += 4;
-+                        t2p->pdf_xrefcount += 4;
-+                        if(t2p->pdf_minorversion < 2)
-+                                t2p->pdf_minorversion = 2;
-+                } else if (tiff_transferfunctioncount == 1){
-+                        t2p->tiff_pages[i].page_extra += 2;
-+                        t2p->pdf_xrefcount += 2;
-+                        if(t2p->pdf_minorversion < 2)
-+                                t2p->pdf_minorversion = 2;
-+                }
-+
- 		if( TIFFGetField(
- 			input, 
- 			TIFFTAG_ICCPROFILE, 
-@@ -1828,9 +1852,8 @@ void t2p_read_tiff_data(T2P* t2p, TIFF* input){
- 			 &(t2p->tiff_transferfunction[1]),
- 			 &(t2p->tiff_transferfunction[2]))) {
- 		if((t2p->tiff_transferfunction[1] != (float*) NULL) &&
--                   (t2p->tiff_transferfunction[2] != (float*) NULL) &&
--                   (t2p->tiff_transferfunction[1] !=
--                    t2p->tiff_transferfunction[0])) {
-+                   (t2p->tiff_transferfunction[2] != (float*) NULL)
-+                  ) {
- 			t2p->tiff_transferfunctioncount=3;
- 		} else {
- 			t2p->tiff_transferfunctioncount=1;
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
deleted file mode 100644
index 7252298b520..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2018-10963.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From de144fd228e4be8aa484c3caf3d814b6fa88c6d9 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 12 May 2018 14:24:15 +0200
-Subject: [PATCH] TIFFWriteDirectorySec: avoid assertion. Fixes
- http://bugzilla.maptools.org/show_bug.cgi?id=2795.
- CVE-2018-10963
-
----
-CVE: CVE-2018-10963
-
-Upstream-Status: Backport [gitlab.com/libtiff/libtiff/commit/de144f...]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- libtiff/tif_dirwrite.c |    7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
-index 2430de6..c15a28d 100644
---- a/libtiff/tif_dirwrite.c
-+++ b/libtiff/tif_dirwrite.c
-@@ -695,8 +695,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64* pdiroff)
- 								}
- 								break;
- 							default:
--								assert(0);   /* we should never get here */
--								break;
-+								TIFFErrorExt(tif->tif_clientdata,module,
-+								            "Cannot write tag %d (%s)",
-+								            TIFFFieldTag(o),
-+                                                                            o->field_name ? o->field_name : "unknown");
-+								goto bad;
- 						}
- 					}
- 				}
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-5784.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-5784.patch
deleted file mode 100644
index 406001d579a..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2018-5784.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 6cdea15213be6b67d9f8380c7bb40e325d3adace Mon Sep 17 00:00:00 2001
-From: Nathan Baker <nathanb@lenovo-chrome.com>
-Date: Tue, 6 Feb 2018 10:13:57 -0500
-Subject: [PATCH] Fix for bug 2772
-
-It is possible to craft a TIFF document where the IFD list is circular,
-leading to an infinite loop while traversing the chain. The libtiff
-directory reader has a failsafe that will break out of this loop after
-reading 65535 directory entries, but it will continue processing,
-consuming time and resources to process what is essentially a bogus TIFF
-document.
-
-This change fixes the above behavior by breaking out of processing when
-a TIFF document has >= 65535 directories and terminating with an error.
-
-Upstream-Status: Backport
-[https://gitlab.com/libtiff/libtiff/commit/473851d211cf8805a161820337ca74cc9615d6ef]
-
-CVE: CVE-2018-5784
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- contrib/addtiffo/tif_overview.c | 14 +++++++++++++-
- tools/tiff2pdf.c                | 10 ++++++++++
- tools/tiffcrop.c                | 13 +++++++++++--
- 3 files changed, 34 insertions(+), 3 deletions(-)
-
-diff --git a/contrib/addtiffo/tif_overview.c b/contrib/addtiffo/tif_overview.c
-index c61ffbb..03b3573 100644
---- a/contrib/addtiffo/tif_overview.c
-+++ b/contrib/addtiffo/tif_overview.c
-@@ -65,6 +65,8 @@
- #  define MAX(a,b)      ((a>b) ? a : b)
- #endif
- 
-+#define TIFF_DIR_MAX  65534
-+
- void TIFFBuildOverviews( TIFF *, int, int *, int, const char *,
-                          int (*)(double,void*), void * );
- 
-@@ -91,6 +93,7 @@ uint32 TIFF_WriteOverview( TIFF *hTIFF, uint32 nXSize, uint32 nYSize,
- {
-     toff_t	nBaseDirOffset;
-     toff_t	nOffset;
-+    tdir_t	iNumDir;
- 
-     (void) bUseSubIFDs;
- 
-@@ -147,7 +150,16 @@ uint32 TIFF_WriteOverview( TIFF *hTIFF, uint32 nXSize, uint32 nYSize,
-         return 0;
- 
-     TIFFWriteDirectory( hTIFF );
--    TIFFSetDirectory( hTIFF, (tdir_t) (TIFFNumberOfDirectories(hTIFF)-1) );
-+    iNumDir = TIFFNumberOfDirectories(hTIFF);
-+    if( iNumDir > TIFF_DIR_MAX )
-+    {
-+        TIFFErrorExt( TIFFClientdata(hTIFF),
-+                      "TIFF_WriteOverview",
-+                      "File `%s' has too many directories.\n",
-+                      TIFFFileName(hTIFF) );
-+        exit(-1);
-+    }
-+    TIFFSetDirectory( hTIFF, (tdir_t) (iNumDir - 1) );
- 
-     nOffset = TIFFCurrentDirOffset( hTIFF );
- 
-diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
-index 0b5973e..ef5d6a0 100644
---- a/tools/tiff2pdf.c
-+++ b/tools/tiff2pdf.c
-@@ -68,6 +68,8 @@ extern int getopt(int, char**, char*);
- 
- #define PS_UNIT_SIZE	72.0F
- 
-+#define TIFF_DIR_MAX    65534
-+
- /* This type is of PDF color spaces. */
- typedef enum {
- 	T2P_CS_BILEVEL = 0x01,	/* Bilevel, black and white */
-@@ -1051,6 +1053,14 @@ void t2p_read_tiff_init(T2P* t2p, TIFF* input){
- 	float* tiff_transferfunction[3];
- 
- 	directorycount=TIFFNumberOfDirectories(input);
-+	if(directorycount > TIFF_DIR_MAX) {
-+		TIFFError(
-+			TIFF2PDF_MODULE,
-+			"TIFF contains too many directories, %s",
-+			TIFFFileName(input));
-+		t2p->t2p_error = T2P_ERR_ERROR;
-+		return;
-+	}
- 	t2p->tiff_pages = (T2P_PAGE*) _TIFFmalloc(TIFFSafeMultiply(tmsize_t,directorycount,sizeof(T2P_PAGE)));
- 	if(t2p->tiff_pages==NULL){
- 		TIFFError(
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index c69177e..c60cb38 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -217,6 +217,8 @@ extern int getopt(int argc, char * const argv[], const char *optstring);
- #define DUMP_TEXT   1
- #define DUMP_RAW    2
- 
-+#define TIFF_DIR_MAX  65534
-+
- /* Offsets into buffer for margins and fixed width and length segments */
- struct offset {
-   uint32  tmargin;
-@@ -2233,7 +2235,7 @@ main(int argc, char* argv[])
-     pageNum = -1;
-   else
-     total_images = 0;
--  /* read multiple input files and write to output file(s) */
-+  /* Read multiple input files and write to output file(s) */
-   while (optind < argc - 1)
-     {
-     in = TIFFOpen (argv[optind], "r");
-@@ -2241,7 +2243,14 @@ main(int argc, char* argv[])
-       return (-3);
- 
-     /* If only one input file is specified, we can use directory count */
--    total_images = TIFFNumberOfDirectories(in); 
-+    total_images = TIFFNumberOfDirectories(in);
-+    if (total_images > TIFF_DIR_MAX)
-+      {
-+      TIFFError (TIFFFileName(in), "File contains too many directories");
-+      if (out != NULL)
-+        (void) TIFFClose(out);
-+      return (1);
-+      }
-     if (image_count == 0)
-       {
-       dirnum = 0;
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-7456.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-7456.patch
deleted file mode 100644
index 2c11f93d138..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2018-7456.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From be4c85b16e8801a16eec25e80eb9f3dd6a96731b Mon Sep 17 00:00:00 2001
-From: Hugo Lefeuvre <hle@debian.org>
-Date: Sun, 8 Apr 2018 14:07:08 -0400
-Subject: [PATCH] Fix NULL pointer dereference in TIFFPrintDirectory
-
-The TIFFPrintDirectory function relies on the following assumptions,
-supposed to be guaranteed by the specification:
-
-(a) A Transfer Function field is only present if the TIFF file has
-    photometric type < 3.
-
-(b) If SamplesPerPixel > Color Channels, then the ExtraSamples field
-    has count SamplesPerPixel - (Color Channels) and contains
-    information about supplementary channels.
-
-While respect of (a) and (b) are essential for the well functioning of
-TIFFPrintDirectory, no checks are realized neither by the callee nor
-by TIFFPrintDirectory itself. Hence, following scenarios might happen
-and trigger the NULL pointer dereference:
-
-(1) TIFF File of photometric type 4 or more has illegal Transfer
-    Function field.
-
-(2) TIFF File has photometric type 3 or less and defines a
-    SamplesPerPixel field such that SamplesPerPixel > Color Channels
-    without defining all extra samples in the ExtraSamples fields.
-
-In this patch, we address both issues with respect of the following
-principles:
-
-(A) In the case of (1), the defined transfer table should be printed
-    safely even if it isn't 'legal'. This allows us to avoid expensive
-    checks in TIFFPrintDirectory. Also, it is quite possible that
-    an alternative photometric type would be developed (not part of the
-    standard) and would allow definition of Transfer Table. We want
-    libtiff to be able to handle this scenario out of the box.
-
-(B) In the case of (2), the transfer table should be printed at its
-    right size, that is if TIFF file has photometric type Palette
-    then the transfer table should have one row and not three, even
-    if two extra samples are declared.
-
-In order to fulfill (A) we simply add a new 'i < 3' end condition to
-the broken TIFFPrintDirectory loop. This makes sure that in any case
-where (b) would be respected but not (a), everything stays fine.
-
-(B) is fulfilled by the loop condition
-'i < td->td_samplesperpixel - td->td_extrasamples'. This is enough as
-long as (b) is respected.
-
-Naturally, we also make sure (b) is respected. This is done in the
-TIFFReadDirectory function by making sure any non-color channel is
-counted in ExtraSamples.
-
-This commit addresses CVE-2018-7456.
-
----
-CVE: CVE-2018-7456
-
-Upstream-Status: Backport [gitlab.com/libtiff/libtiff/commit/be4c85b...]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- libtiff/tif_dirread.c |   62 +++++++++++++++++++++++++++++++++++++++++++++++++
- libtiff/tif_print.c   |    2 +-
- 2 files changed, 63 insertions(+), 1 deletion(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 6baa7b3..af5b84a 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -165,6 +165,7 @@ static int TIFFFetchStripThing(TIFF* tif, TIFFDirEntry* dir, uint32 nstrips, uin
- static int TIFFFetchSubjectDistance(TIFF*, TIFFDirEntry*);
- static void ChopUpSingleUncompressedStrip(TIFF*);
- static uint64 TIFFReadUInt64(const uint8 *value);
-+static int _TIFFGetMaxColorChannels(uint16 photometric);
- 
- static int _TIFFFillStrilesInternal( TIFF *tif, int loadStripByteCount );
- 
-@@ -3505,6 +3506,35 @@ static void TIFFReadDirEntryOutputErr(TIFF* tif, enum TIFFReadDirEntryErr err, c
- }
- 
- /*
-+ * Return the maximum number of color channels specified for a given photometric
-+ * type. 0 is returned if photometric type isn't supported or no default value
-+ * is defined by the specification.
-+ */
-+static int _TIFFGetMaxColorChannels( uint16 photometric )
-+{
-+    switch (photometric) {
-+	case PHOTOMETRIC_PALETTE:
-+	case PHOTOMETRIC_MINISWHITE:
-+	case PHOTOMETRIC_MINISBLACK:
-+            return 1;
-+	case PHOTOMETRIC_YCBCR:
-+	case PHOTOMETRIC_RGB:
-+	case PHOTOMETRIC_CIELAB:
-+            return 3;
-+	case PHOTOMETRIC_SEPARATED:
-+	case PHOTOMETRIC_MASK:
-+            return 4;
-+	case PHOTOMETRIC_LOGL:
-+	case PHOTOMETRIC_LOGLUV:
-+	case PHOTOMETRIC_CFA:
-+	case PHOTOMETRIC_ITULAB:
-+	case PHOTOMETRIC_ICCLAB:
-+	default:
-+            return 0;
-+    }
-+}
-+
-+/*
-  * Read the next TIFF directory from a file and convert it to the internal
-  * format. We read directories sequentially.
-  */
-@@ -3520,6 +3550,7 @@ TIFFReadDirectory(TIFF* tif)
- 	uint32 fii=FAILED_FII;
-         toff_t nextdiroff;
-     int bitspersample_read = FALSE;
-+        int color_channels;
- 
- 	tif->tif_diroff=tif->tif_nextdiroff;
- 	if (!TIFFCheckDirOffset(tif,tif->tif_nextdiroff))
-@@ -4024,6 +4055,37 @@ TIFFReadDirectory(TIFF* tif)
- 			}
- 		}
- 	}
-+
-+	/*
-+	 * Make sure all non-color channels are extrasamples.
-+	 * If it's not the case, define them as such.
-+	 */
-+        color_channels = _TIFFGetMaxColorChannels(tif->tif_dir.td_photometric);
-+        if (color_channels && tif->tif_dir.td_samplesperpixel - tif->tif_dir.td_extrasamples > color_channels) {
-+                uint16 old_extrasamples;
-+                uint16 *new_sampleinfo;
-+
-+                TIFFWarningExt(tif->tif_clientdata,module, "Sum of Photometric type-related "
-+                    "color channels and ExtraSamples doesn't match SamplesPerPixel. "
-+                    "Defining non-color channels as ExtraSamples.");
-+
-+                old_extrasamples = tif->tif_dir.td_extrasamples;
-+                tif->tif_dir.td_extrasamples = (tif->tif_dir.td_samplesperpixel - color_channels);
-+
-+                // sampleinfo should contain information relative to these new extra samples
-+                new_sampleinfo = (uint16*) _TIFFcalloc(tif->tif_dir.td_extrasamples, sizeof(uint16));
-+                if (!new_sampleinfo) {
-+                    TIFFErrorExt(tif->tif_clientdata, module, "Failed to allocate memory for "
-+                                "temporary new sampleinfo array (%d 16 bit elements)",
-+                                tif->tif_dir.td_extrasamples);
-+                    goto bad;
-+                }
-+
-+                memcpy(new_sampleinfo, tif->tif_dir.td_sampleinfo, old_extrasamples * sizeof(uint16));
-+                _TIFFsetShortArray(&tif->tif_dir.td_sampleinfo, new_sampleinfo, tif->tif_dir.td_extrasamples);
-+                _TIFFfree(new_sampleinfo);
-+        }
-+
- 	/*
- 	 * Verify Palette image has a Colormap.
- 	 */
-diff --git a/libtiff/tif_print.c b/libtiff/tif_print.c
-index 8deceb2..1d86adb 100644
---- a/libtiff/tif_print.c
-+++ b/libtiff/tif_print.c
-@@ -544,7 +544,7 @@ TIFFPrintDirectory(TIFF* tif, FILE* fd, long flags)
- 				uint16 i;
- 				fprintf(fd, "    %2ld: %5u",
- 				    l, td->td_transferfunction[0][l]);
--				for (i = 1; i < td->td_samplesperpixel; i++)
-+				for (i = 1; i < td->td_samplesperpixel - td->td_extrasamples && i < 3; i++)
- 					fprintf(fd, " %5u",
- 					    td->td_transferfunction[i][l]);
- 				fputc('\n', fd);
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2018-8905.patch b/meta/recipes-multimedia/libtiff/files/CVE-2018-8905.patch
deleted file mode 100644
index 962646dbe09..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2018-8905.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 58a898cb4459055bb488ca815c23b880c242a27d Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 12 May 2018 15:32:31 +0200
-Subject: [PATCH] LZWDecodeCompat(): fix potential index-out-of-bounds write.
- Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2780 /
- CVE-2018-8905
-
-The fix consists in using the similar code LZWDecode() to validate we
-don't write outside of the output buffer.
-
----
-CVE: CVE-2018-8905
-
-Upstream-Status: Backport [gitlab.com/libtiff/libtiff/commit/58a898...]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- libtiff/tif_lzw.c |   18 ++++++++++++------
- 1 file changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
-index 4ccb443..94d85e3 100644
---- a/libtiff/tif_lzw.c
-+++ b/libtiff/tif_lzw.c
-@@ -602,6 +602,7 @@ LZWDecodeCompat(TIFF* tif, uint8* op0, tmsize_t occ0, uint16 s)
- 	char *tp;
- 	unsigned char *bp;
- 	int code, nbits;
-+	int len;
- 	long nextbits, nextdata, nbitsmask;
- 	code_t *codep, *free_entp, *maxcodep, *oldcodep;
- 
-@@ -753,13 +754,18 @@ LZWDecodeCompat(TIFF* tif, uint8* op0, tmsize_t occ0, uint16 s)
- 				}  while (--occ);
- 				break;
- 			}
--			assert(occ >= codep->length);
--			op += codep->length;
--			occ -= codep->length;
--			tp = op;
-+			len = codep->length;
-+			tp = op + len;
- 			do {
--				*--tp = codep->value;
--			} while( (codep = codep->next) != NULL );
-+				int t;
-+				--tp;
-+				t = codep->value;
-+				codep = codep->next;
-+				*tp = (char)t;
-+			} while (codep && tp > op);
-+			assert(occ >= len);
-+			op += len;
-+			occ -= len;
- 		} else {
- 			*op++ = (char)code;
- 			occ--;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/libtiff/files/libtool2.patch b/meta/recipes-multimedia/libtiff/files/libtool2.patch
index a84c6889627..96233b46c94 100644
--- a/meta/recipes-multimedia/libtiff/files/libtool2.patch
+++ b/meta/recipes-multimedia/libtiff/files/libtool2.patch
@@ -1,16 +1,21 @@
+From 5b893206e0a0d529ba2d0caf58cfffc03bccb598 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <hrw@openedhand.com>
+Date: Sat, 14 Jun 2008 13:42:22 +0000
+Subject: [PATCH] tiff: make it work after libtool upgrade
+
 Upstream-Status: Inappropriate [configuration]
 
 ---
- configure.ac |    2 +-
+ configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: tiff-4.0.9/configure.ac
-===================================================================
---- tiff-4.0.9.orig/configure.ac
-+++ tiff-4.0.9/configure.ac
-@@ -27,7 +27,7 @@ dnl Process this file with autoconf to p
+diff --git a/configure.ac b/configure.ac
+index c7b02e2..ae1c964 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,7 +27,7 @@ dnl Process this file with autoconf to produce a configure script.
  AC_PREREQ(2.64)
- AC_INIT([LibTIFF Software],[4.0.9],[tiff@lists.maptools.org],[tiff])
+ AC_INIT([LibTIFF Software],[4.0.10],[tiff@lists.maptools.org],[tiff])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR(m4)
 +dnl AC_CONFIG_MACRO_DIR(m4)
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
similarity index 80%
rename from meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
index 93beddb4dab..152fa819a5b 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.10.bb
@@ -6,17 +6,10 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
-           file://CVE-2017-9935.patch \
-           file://CVE-2017-18013.patch \
-           file://CVE-2018-5784.patch \
-           file://CVE-2018-10963.patch \
-           file://CVE-2018-8905.patch \
-           file://CVE-2018-7456.patch \
-           file://CVE-2017-17095.patch \
-          "
-
-SRC_URI[md5sum] = "54bad211279cc93eb4fca31ba9bfdc79"
-SRC_URI[sha256sum] = "6e7bdeec2c310734e734d19aae3a71ebe37a4d842e0e23dbb1b8921c0026cfcd"
+           "
+
+SRC_URI[md5sum] = "114192d7ebe537912a2b97408832e7fd"
+SRC_URI[sha256sum] = "2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


