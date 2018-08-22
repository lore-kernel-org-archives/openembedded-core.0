Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5D33F79000
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:15:22 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id m11-v6so2501210oic.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=m7sWGMXWrwUM43JT9JhC23ovHoOTYCjIAcZL/2uj2YM=;
	b=y1YqzSHTt/Y5GZLWaA8y8/JmXJkjCvIouQY6ZaKwchsPr6PYdSA9T0ciIqFojGCFDu
	3go51uXWbPvLE/WJ3obPRBZYAmxwd5D7ctBbTKfFuO82/awJtyrguHlzXqHS2YqRge1f
	9cf1p6CB2a255Dolfzm3/35SYTLMxdWv+vh4seIZ6elKkUwGV27yBw1TPJXfRKQVwA9l
	DjjOnuUQSfAmxJuDGwoaoPsbggnVmpiWNTdai3ga8nEXPYXuqcitTYKcbULUQZsHiZ9C
	5NR4pRtXOC4zSAUQW28BgVpVM3T37/tAqlwm3NORAuEZ/0v7eescEHJvxsFng1rkH+h2
	MBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m7sWGMXWrwUM43JT9JhC23ovHoOTYCjIAcZL/2uj2YM=;
	b=CGrkEOJ3a3hDG2SXTwX4zx4vlcv/eh32UBbFcSGKLvecSlRT4D8qxSUd6fBVNI0inw
	NHQLRL86jFoelW/s4ae/aJlTGWNE7G5OfnMFGtCRCUoE+q9ZApWhOa0EH5GvbPi9IcPK
	1hFu49DN/a617HJo9rUZxxsNT1nd4wKd8wHhk1uWGNSh6+kO2EjgAfM7QhmiEFydxV7L
	yO9kt6RCuS3rNJbXoDOSLJOdO78WzX9dK9m5hPgJHSuUm98aHKw5A5t1BDfRaUFOijis
	udWbWeiKVDPkkLY1AYunmonUOYudhEYSk3yDvsv7eTnhNcOZOTsXrNIMqwRBupflLsgN
	ivsw==
X-Gm-Message-State: APzg51D0wwfTR/Ekp7dMw3TSQ8jQAF8Aj7eBdAYNORuiMEw0R2lCKp2M
	gPexqsgRXByq4gxj8cN48D/bIqk7cJw=
X-Google-Smtp-Source: ANB0VdZKXILuAjs8XLcdod/y+bwc9i1TD5TmR8iLcgOOPD4JNYVqdjwoepsIYZBfxP8MWulTnjM0cQ==
X-Received: by 2002:a54:4784:: with SMTP id
	o4-v6mr3208842oic.101.1534936523203; 
	Wed, 22 Aug 2018 04:15:23 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	e205-v6sm1656620oia.9.2018.08.22.04.15.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:15:22 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:44:57 +0530
Message-Id: <1534936500-11509-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] libsndfile1: CVE-2017-14245 CVE-2017-14246
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
X-List-Received-Date: Wed, 22 Aug 2018 11:15:22 -0000

sfe_copy_data_fp: check value of "max" variable for being normal
and check elements of the data[] array for being finite.

Both checks use functions provided by the <math.h> header as declared
by the C99 standard.

Fixes #317
CVE-2017-14245
CVE-2017-14246

Affects libsndfile1 = 1.0.28

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libsndfile1/CVE-2017-14245-14246.patch         | 121 +++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch
new file mode 100644
index 0000000..a17ec21
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.patch
@@ -0,0 +1,121 @@
+From 2d54514a4f6437b67829717c05472d2e3300a258 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Wed, 27 Sep 2017 14:46:17 +0200
+Subject: [PATCH] sfe_copy_data_fp: check value of "max" variable for being
+ normal
+
+and check elements of the data[] array for being finite.
+
+Both checks use functions provided by the <math.h> header as declared
+by the C99 standard.
+
+Fixes #317
+CVE: CVE-2017-14245
+CVE: CVE-2017-14246
+
+Upstream-Status: Backport [https://github.com/fabiangreffrath/libsndfile/commit/2d54514a4f6437b67829717c05472d2e3300a258]
+
+Signed-off-by: Fabian Greffrath <fabian@greffrath.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ programs/common.c          | 20 ++++++++++++++++----
+ programs/common.h          |  2 +-
+ programs/sndfile-convert.c |  6 +++++-
+ 3 files changed, 22 insertions(+), 6 deletions(-)
+
+diff --git a/programs/common.c b/programs/common.c
+index a21e62c..a249a58 100644
+--- a/programs/common.c
++++ b/programs/common.c
+@@ -36,6 +36,7 @@
+ #include <string.h>
+ #include <ctype.h>
+ #include <stdint.h>
++#include <math.h>
+ 
+ #include <sndfile.h>
+ 
+@@ -45,7 +46,7 @@
+ 
+ #define	MIN(x, y)	((x) < (y) ? (x) : (y))
+ 
+-void
++int
+ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize)
+ {	static double	data [BUFFER_LEN], max ;
+ 	int		frames, readcount, k ;
+@@ -54,6 +55,8 @@ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize
+ 	readcount = frames ;
+ 
+ 	sf_command (infile, SFC_CALC_SIGNAL_MAX, &max, sizeof (max)) ;
++	if (!isnormal (max)) /* neither zero, subnormal, infinite, nor NaN */
++		return 1 ;
+ 
+ 	if (!normalize && max < 1.0)
+ 	{	while (readcount > 0)
+@@ -67,12 +70,16 @@ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize
+ 		while (readcount > 0)
+ 		{	readcount = sf_readf_double (infile, data, frames) ;
+ 			for (k = 0 ; k < readcount * channels ; k++)
+-				data [k] /= max ;
++			{	data [k] /= max ;
++
++				if (!isfinite (data [k])) /* infinite or NaN */
++					return 1;
++				}
+ 			sf_writef_double (outfile, data, readcount) ;
+ 			} ;
+ 		} ;
+ 
+-	return ;
++	return 0 ;
+ } /* sfe_copy_data_fp */
+ 
+ void
+@@ -252,7 +259,12 @@ sfe_apply_metadata_changes (const char * filenames [2], const METADATA_INFO * in
+ 
+ 		/* If the input file is not the same as the output file, copy the data. */
+ 		if ((infileminor == SF_FORMAT_DOUBLE) || (infileminor == SF_FORMAT_FLOAT))
+-			sfe_copy_data_fp (outfile, infile, sfinfo.channels, SF_FALSE) ;
++		{	if (sfe_copy_data_fp (outfile, infile, sfinfo.channels, SF_FALSE) != 0)
++			{	printf ("Error : Not able to decode input file '%s'\n", filenames [0]) ;
++				error_code = 1 ;
++				goto cleanup_exit ;
++				} ;
++			}
+ 		else
+ 			sfe_copy_data_int (outfile, infile, sfinfo.channels) ;
+ 		} ;
+diff --git a/programs/common.h b/programs/common.h
+index eda2d7d..986277e 100644
+--- a/programs/common.h
++++ b/programs/common.h
+@@ -62,7 +62,7 @@ typedef SF_BROADCAST_INFO_VAR (2048) SF_BROADCAST_INFO_2K ;
+ 
+ void sfe_apply_metadata_changes (const char * filenames [2], const METADATA_INFO * info) ;
+ 
+-void sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize) ;
++int sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int normalize) ;
+ 
+ void sfe_copy_data_int (SNDFILE *outfile, SNDFILE *infile, int channels) ;
+ 
+diff --git a/programs/sndfile-convert.c b/programs/sndfile-convert.c
+index dff7f79..e6de593 100644
+--- a/programs/sndfile-convert.c
++++ b/programs/sndfile-convert.c
+@@ -335,7 +335,11 @@ main (int argc, char * argv [])
+ 			|| (outfileminor == SF_FORMAT_DOUBLE) || (outfileminor == SF_FORMAT_FLOAT)
+ 			|| (infileminor == SF_FORMAT_DOUBLE) || (infileminor == SF_FORMAT_FLOAT)
+ 			|| (infileminor == SF_FORMAT_VORBIS) || (outfileminor == SF_FORMAT_VORBIS))
+-		sfe_copy_data_fp (outfile, infile, sfinfo.channels, normalize) ;
++	{	if (sfe_copy_data_fp (outfile, infile, sfinfo.channels, normalize) != 0)
++		{	printf ("Error : Not able to decode input file %s.\n", infilename) ;
++			return 1 ;
++			} ;
++		}
+ 	else
+ 		sfe_copy_data_int (outfile, infile, sfinfo.channels) ;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 281ac82..c6f2a46 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-8361-8365.patch \
            file://CVE-2017-8362.patch \
            file://CVE-2017-8363.patch \
+           file://CVE-2017-14245-14246.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.7.4


