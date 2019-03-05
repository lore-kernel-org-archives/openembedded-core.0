Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 19C707C13C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 13:17:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q1so9430963wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Q2KMYdaDUerEvCBkz5LI6T1rhrHzMnvshRDi8HvgCIo=;
	b=MxmCqHDLl26TNeIUT4etnHWFQ36HuXxGzlrhdHs93QW4koUra/UVkx2WvkcJFlR/cD
	JP6nfqF4upYFLCjiqmH9MbHv46NigDKc2KOEk/tlhI80xXFWMZuEPOL9VQHWhnCr7431
	JBKVizfXwkNXYgabzy6C5eeTYhJfGreV7gBMsI1hRlABqhcgO1Oo/ltbD4pR/r+b0io4
	8Fbb648RXztYIz43Ttw+pLr6sK8vZBSK9IaxIXtcQd2aKlbKhbVGsuuPUHrcFbTzTtn/
	ZygsOfMH9jNuv26maFN6pCM+DuowK62hS/iA31+NTGTgFyNGaEvYhvC2iLwWlJz5QfrO
	5fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q2KMYdaDUerEvCBkz5LI6T1rhrHzMnvshRDi8HvgCIo=;
	b=oXv/fjuD/fGFYFmocmy1TIPqZ0JRrEAo2F1LjNtAJHjxYUm/xB/Pf7iidEy2qmYRnc
	QwykKHsg9jS9eqfdf8+9JGPHq4wSLx8ECpH3wbGLOpIOBXFk3j0hrT1+nZRKu1e/QjqO
	AgRvz68r030e8NqlJUN9JjMHTUPyLHRANhOYAjClOKmnTKTybR+oMCpSNuHdRwWiN+rc
	WodpkOktGgQdWZvxEWXCQU4Kv8NfiIfBNtv7bm/VJtHsD5hbDnPAMp5DibIp+v9TKCD4
	bzcBmTR/F2c5uTFfuQpbUsJA3p9+hhExBFglbnrsx1gEgUJ282hgBCSwDxxjIf6AgdNo
	4iDA==
X-Gm-Message-State: APjAAAWBGzqJ79a4ru78proYIqFFVyx7yoWH03i6j5T2WQRogXVZGyNU
	d00B7qLcz4RijuUNl1qQHEbaIpTxlak=
X-Google-Smtp-Source: APXvYqx79k/OrGiuLUlf/gy5H1dt4TtunXlmtusRlopYykmi9efayBauYCYAXbRaT1a8qREhVadWXQ==
X-Received: by 2002:a5d:6112:: with SMTP id v18mr15960810wrt.207.1551791838061;
	Tue, 05 Mar 2019 05:17:18 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n129sm10478842wmf.21.2019.03.05.05.17.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 05:17:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 13:17:07 +0000
Message-Id: <20190305131707.16305-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libsndfile1: update security patches
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
X-List-Received-Date: Tue, 05 Mar 2019 13:17:18 -0000

Remove CVE-2017-14245-14246.patch as this papers over the problem instead of
solving it, and was rejected upstream.

0001-a-ulaw-fix-multiple-buffer-overflows-432 also solves CVE-2017-14245 and
-14246 properly.

Add patch for CVE-2017-12562 and CVE-2018-19758.

Refresh CVE-2018-13139.patch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-a-ulaw-fix-multiple-buffer-overflows-432.patch |  18 ++-
 .../libsndfile/libsndfile1/CVE-2017-12562.patch    |  96 ++++++++++++++++
 .../libsndfile1/CVE-2017-14245-14246.patch         | 121 ---------------------
 .../libsndfile/libsndfile1/CVE-2018-13139.patch    |  30 ++---
 .../libsndfile/libsndfile1/CVE-2018-19758.patch    |  34 ++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |   3 +-
 6 files changed, 160 insertions(+), 142 deletions(-)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-12562.patch
 delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19758.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch
index c3f44ca235b..a4679cef2a0 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch
@@ -1,3 +1,15 @@
+This patch fixes #429 (CVE-2018-19661 CVE-2018-19662) and #344 (CVE-2017-17456
+CVE-2017-17457). As per
+https://github.com/erikd/libsndfile/issues/344#issuecomment-448504425 it also
+fixes #317 (CVE-2017-14245 CVE-2017-14246).
+
+CVE: CVE-2017-14245 CVE-2017-14246
+CVE: CVE-2017-17456 CVE-2017-17457
+CVE: CVE-2018-19661 CVE-2018-19662
+
+Upstream-Status: Backport [8ddc442d539ca775d80cdbc7af17a718634a743f]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 From 39453899fe1bb39b2e041fdf51a85aecd177e9c7 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 7 Jan 2019 15:55:03 +0800
@@ -17,12 +29,6 @@ In this case, arbitrarily set the buffer value to 0.
 This commit fixes #429 (CVE-2018-19661 and CVE-2018-19662) and
 fixes #344 (CVE-2017-17456 and CVE-2017-17457).
 
-Upstream-Status: Backport[https://github.com/erikd/libsndfile/
-commit/585cc28a93be27d6938f276af0011401b9f7c0ca]
-
-CVE: CVE-2017-17456 CVE-2017-17457 CVE-2018-19661 CVE-2018-19662
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  src/alaw.c | 9 +++++++--
  src/ulaw.c | 9 +++++++--
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-12562.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-12562.patch
new file mode 100644
index 00000000000..491dae31148
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-12562.patch
@@ -0,0 +1,96 @@
+Heap-based Buffer Overflow in the psf_binheader_writef function in common.c in
+libsndfile through 1.0.28 allows remote attackers to cause a denial of service
+(application crash) or possibly have unspecified other impact.
+
+CVE: CVE-2017-12562
+Upstream-Status: Backport [cf7a8182c2642c50f1cf90dddea9ce96a8bad2e8]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From b6a9d7e95888ffa77d8c75ce3f03e6c7165587cd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rn=20Heusipp?= <osmanx@problemloesungsmaschine.de>
+Date: Wed, 14 Jun 2017 12:25:40 +0200
+Subject: [PATCH] src/common.c: Fix heap buffer overflows when writing strings
+ in binheader
+
+Fixes the following problems:
+ 1. Case 's' only enlarges the buffer by 16 bytes instead of size bytes.
+ 2. psf_binheader_writef() enlarges the header buffer (if needed) prior to the
+    big switch statement by an amount (16 bytes) which is enough for all cases
+    where only a single value gets added. Cases 's', 'S', 'p' however
+    additionally write an arbitrary length block of data and again enlarge the
+    buffer to the required amount. However, the required space calculation does
+    not take into account the size of the length field which gets output before
+    the data.
+ 3. Buffer size requirement calculation in case 'S' does not account for the
+    padding byte ("size += (size & 1) ;" happens after the calculation which
+    uses "size").
+ 4. Case 'S' can overrun the header buffer by 1 byte when no padding is
+    involved
+    ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + 1) ;" while
+    the buffer is only guaranteed to have "size" space available).
+ 5. "psf->header.ptr [psf->header.indx] = 0 ;" in case 'S' always writes 1 byte
+    beyond the space which is guaranteed to be allocated in the header buffer.
+ 6. Case 's' can overrun the provided source string by 1 byte if padding is
+    involved ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size) ;"
+    where "size" is "strlen (strptr) + 1" (which includes the 0 terminator,
+    plus optionally another 1 which is padding and not guaranteed to be
+    readable via the source string pointer).
+
+Closes: https://github.com/erikd/libsndfile/issues/292
+---
+ src/common.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/src/common.c b/src/common.c
+index 1a6204ca..6b2a2ee9 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -681,16 +681,16 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *format, ...)
+ 					/* Write a C string (guaranteed to have a zero terminator). */
+ 					strptr = va_arg (argptr, char *) ;
+ 					size = strlen (strptr) + 1 ;
+-					size += (size & 1) ;
+ 
+-					if (psf->header.indx + (sf_count_t) size >= psf->header.len && psf_bump_header_allocation (psf, 16))
++					if (psf->header.indx + 4 + (sf_count_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_allocation (psf, 4 + size + (size & 1)))
+ 						return count ;
+ 
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+-						header_put_be_int (psf, size) ;
++						header_put_be_int (psf, size + (size & 1)) ;
+ 					else
+-						header_put_le_int (psf, size) ;
++						header_put_le_int (psf, size + (size & 1)) ;
+ 					memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size) ;
++					size += (size & 1) ;
+ 					psf->header.indx += size ;
+ 					psf->header.ptr [psf->header.indx - 1] = 0 ;
+ 					count += 4 + size ;
+@@ -703,16 +703,15 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *format, ...)
+ 					*/
+ 					strptr = va_arg (argptr, char *) ;
+ 					size = strlen (strptr) ;
+-					if (psf->header.indx + (sf_count_t) size > psf->header.len && psf_bump_header_allocation (psf, size))
++					if (psf->header.indx + 4 + (sf_count_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_allocation (psf, 4 + size + (size & 1)))
+ 						return count ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						header_put_be_int (psf, size) ;
+ 					else
+ 						header_put_le_int (psf, size) ;
+-					memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + 1) ;
++					memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + (size & 1)) ;
+ 					size += (size & 1) ;
+ 					psf->header.indx += size ;
+-					psf->header.ptr [psf->header.indx] = 0 ;
+ 					count += 4 + size ;
+ 					break ;
+ 
+@@ -724,7 +723,7 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *format, ...)
+ 					size = (size & 1) ? size : size + 1 ;
+ 					size = (size > 254) ? 254 : size ;
+ 
+-					if (psf->header.indx + (sf_count_t) size > psf->header.len && psf_bump_header_allocation (psf, size))
++					if (psf->header.indx + 1 + (sf_count_t) size > psf->header.len && psf_bump_header_allocation (psf, 1 + size))
+ 						return count ;
+ 
+ 					header_put_byte (psf, size) ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch
deleted file mode 100644
index a17ec21f986..00000000000
--- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 2d54514a4f6437b67829717c05472d2e3300a258 Mon Sep 17 00:00:00 2001
-From: Fabian Greffrath <fabian@greffrath.com>
-Date: Wed, 27 Sep 2017 14:46:17 +0200
-Subject: [PATCH] sfe_copy_data_fp: check value of "max" variable for being
- normal
-
-and check elements of the data[] array for being finite.
-
-Both checks use functions provided by the <math.h> header as declared
-by the C99 standard.
-
-Fixes #317
-CVE: CVE-2017-14245
-CVE: CVE-2017-14246
-
-Upstream-Status: Backport [https://github.com/fabiangreffrath/libsndfile/commit/2d54514a4f6437b67829717c05472d2e3300a258]
-
-Signed-off-by: Fabian Greffrath <fabian@greffrath.com>
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
----
- programs/common.c          | 20 ++++++++++++++++----
- programs/common.h          |  2 +-
- programs/sndfile-convert.c |  6 +++++-
- 3 files changed, 22 insertions(+), 6 deletions(-)
-
-diff --git a/programs/common.c b/programs/common.c
-index a21e62c..a249a58 100644
---- a/programs/common.c
-+++ b/programs/common.c
-@@ -36,6 +36,7 @@
- #include <string.h>
- #include <ctype.h>
- #include <stdint.h>
-+#include <math.h>
- 
- #include <sndfile.h>
- 
-@@ -45,7 +46,7 @@
- 
- #define	MIN(x, y)	((x) < (y) ? (x) : (y))
- 
--void
-+int
- sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize)
- {	static double	data [BUFFER_LEN], max ;
- 	int		frames, readcount, k ;
-@@ -54,6 +55,8 @@ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize
- 	readcount = frames ;
- 
- 	sf_command (infile, SFC_CALC_SIGNAL_MAX, &max, sizeof (max)) ;
-+	if (!isnormal (max)) /* neither zero, subnormal, infinite, nor NaN */
-+		return 1 ;
- 
- 	if (!normalize && max < 1.0)
- 	{	while (readcount > 0)
-@@ -67,12 +70,16 @@ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize
- 		while (readcount > 0)
- 		{	readcount = sf_readf_double (infile, data, frames) ;
- 			for (k = 0 ; k < readcount * channels ; k++)
--				data [k] /= max ;
-+			{	data [k] /= max ;
-+
-+				if (!isfinite (data [k])) /* infinite or NaN */
-+					return 1;
-+				}
- 			sf_writef_double (outfile, data, readcount) ;
- 			} ;
- 		} ;
- 
--	return ;
-+	return 0 ;
- } /* sfe_copy_data_fp */
- 
- void
-@@ -252,7 +259,12 @@ sfe_apply_metadata_changes (const char * filenames [2], const METADATA_INFO * in
- 
- 		/* If the input file is not the same as the output file, copy the data. */
- 		if ((infileminor == SF_FORMAT_DOUBLE) || (infileminor == SF_FORMAT_FLOAT))
--			sfe_copy_data_fp (outfile, infile, sfinfo.channels, SF_FALSE) ;
-+		{	if (sfe_copy_data_fp (outfile, infile, sfinfo.channels, SF_FALSE) != 0)
-+			{	printf ("Error : Not able to decode input file '%s'\n", filenames [0]) ;
-+				error_code = 1 ;
-+				goto cleanup_exit ;
-+				} ;
-+			}
- 		else
- 			sfe_copy_data_int (outfile, infile, sfinfo.channels) ;
- 		} ;
-diff --git a/programs/common.h b/programs/common.h
-index eda2d7d..986277e 100644
---- a/programs/common.h
-+++ b/programs/common.h
-@@ -62,7 +62,7 @@ typedef SF_BROADCAST_INFO_VAR (2048) SF_BROADCAST_INFO_2K ;
- 
- void sfe_apply_metadata_changes (const char * filenames [2], const METADATA_INFO * info) ;
- 
--void sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize) ;
-+int sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize) ;
- 
- void sfe_copy_data_int (SNDFILE *outfile, SNDFILE *infile, int channels) ;
- 
-diff --git a/programs/sndfile-convert.c b/programs/sndfile-convert.c
-index dff7f79..e6de593 100644
---- a/programs/sndfile-convert.c
-+++ b/programs/sndfile-convert.c
-@@ -335,7 +335,11 @@ main (int argc, char * argv [])
- 			|| (outfileminor == SF_FORMAT_DOUBLE) || (outfileminor == SF_FORMAT_FLOAT)
- 			|| (infileminor == SF_FORMAT_DOUBLE) || (infileminor == SF_FORMAT_FLOAT)
- 			|| (infileminor == SF_FORMAT_VORBIS) || (outfileminor == SF_FORMAT_VORBIS))
--		sfe_copy_data_fp (outfile, infile, sfinfo.channels, normalize) ;
-+	{	if (sfe_copy_data_fp (outfile, infile, sfinfo.channels, normalize) != 0)
-+		{	printf ("Error : Not able to decode input file %s.\n", infilename) ;
-+			return 1 ;
-+			} ;
-+		}
- 	else
- 		sfe_copy_data_int (outfile, infile, sfinfo.channels) ;
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch
index 4ae3674df15..707373d4140 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch
@@ -1,23 +1,25 @@
-From 5473aeef7875e54bd0f786fbdd259a35aaee875c Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 10 Oct 2018 08:59:30 +0800
-Subject: [PATCH] libsndfile1: patch for CVE-2018-13139
+CVE: CVE-2018-13139
+Upstream-Status: Backport [9dc989eb89cd697e19897afa616d6ab0debe4822]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-Upstream-Status: Backport [https://github.com/bwarden/libsndfile/
-commit/df18323c622b54221ee7ace74b177cdcccc152d7]
+From 9dc989eb89cd697e19897afa616d6ab0debe4822 Mon Sep 17 00:00:00 2001
+From: "Brett T. Warden" <brett.t.warden@intel.com>
+Date: Tue, 28 Aug 2018 12:01:17 -0700
+Subject: [PATCH] Check MAX_CHANNELS in sndfile-deinterleave
 
-CVE: CVE-2018-13139
+Allocated buffer has space for only 16 channels. Verify that input file
+meets this limit.
 
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Fixes #397
 ---
- programs/sndfile-deinterleave.c | 6 ++++++
- 1 file changed, 6 insertions(+)
+ programs/sndfile-deinterleave.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/programs/sndfile-deinterleave.c b/programs/sndfile-deinterleave.c
-index e27593e..721bee7 100644
+index e27593e2..cb497e1f 100644
 --- a/programs/sndfile-deinterleave.c
 +++ b/programs/sndfile-deinterleave.c
-@@ -89,6 +89,12 @@ main (int argc, char **argv)
+@@ -89,6 +89,13 @@ main (int argc, char **argv)
  		exit (1) ;
  		} ;
  
@@ -27,9 +29,9 @@ index e27593e..721bee7 100644
 +		exit (1) ;
 +		} ;
 +
++
  	state.channels = sfinfo.channels ;
  	sfinfo.channels = 1 ;
  
 -- 
-2.7.4
-
+2.11.0
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19758.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19758.patch
new file mode 100644
index 00000000000..c3586f9dfc8
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19758.patch
@@ -0,0 +1,34 @@
+There is a heap-based buffer over-read at wav.c in wav_write_header in
+libsndfile 1.0.28 that will cause a denial of service.
+
+CVE: CVE-2018-19758
+Upstream-Status: Backport [42132c543358cee9f7c3e9e9b15bb6c1063a608e]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From c12173b0197dd0c5cfa2cd27977e982d2ae59486 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Tue, 1 Jan 2019 20:11:46 +1100
+Subject: [PATCH] src/wav.c: Fix heap read overflow
+
+This is CVE-2018-19758.
+
+Closes: https://github.com/erikd/libsndfile/issues/435
+---
+ src/wav.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/wav.c b/src/wav.c
+index e8405b55..6fb94ae8 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -1094,6 +1094,8 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
+ 		psf_binheader_writef (psf, "44", 0, 0) ; /* SMTPE format */
+ 		psf_binheader_writef (psf, "44", psf->instrument->loop_count, 0) ;
+ 
++		/* Loop count is signed 16 bit number so we limit it range to something sensible. */
++		psf->instrument->loop_count &= 0x7fff ;
+ 		for (tmp = 0 ; tmp < psf->instrument->loop_count ; tmp++)
+ 		{	int type ;
+ 
+-- 
+2.11.0
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 9700f4a6e75..eb2c719d8da 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -10,11 +10,12 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-8361-8365.patch \
            file://CVE-2017-8362.patch \
            file://CVE-2017-8363.patch \
-           file://CVE-2017-14245-14246.patch \
            file://CVE-2017-14634.patch \
            file://CVE-2018-13139.patch \
            file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
            file://CVE-2018-19432.patch \
+           file://CVE-2017-12562.patch \
+           file://CVE-2018-19758.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.11.0


