Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CFEC7EE31
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:49 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3377.1685672559458481188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=19vuWr+P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-652a6bf4e6aso395446b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672558; x=1688264558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0F/OzLl1EPD00b1NI1jLQHtge3aU+odfR0DOXS09vtY=;
        b=19vuWr+PJLIwidl3VGnSdQe045JI+FDPUyeC/T71NfCqbYKTc+3b4mHakK3buyAYIC
         hLakcMMmO1FuB7vfEJ29qbZoHcR8BWdleJmcXIlcffO8JdGSRNwrwzON0GzCcRm+iY4p
         Xd5BdZWdHV+VW2vfWgeV93ysHY/wn14gePoyOk4S2LaeyZ3i/vMHiZqKsdlmIg+bElHG
         e+dIa7/FBcbR6lsPnuTffRPwqMQMj2wtb2BsOKpNZuIiK/S6dPrInZedCoDBZ7gltKsQ
         +d+xyvrRdjtyT4BisTmupxmXWhL6asuUjtpw1Bg2X5/AWwM43Wct5il4/L5DZIpkJZx7
         Y5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672558; x=1688264558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0F/OzLl1EPD00b1NI1jLQHtge3aU+odfR0DOXS09vtY=;
        b=NwwSH6I6e4220hN5tfWXNShnb1QyEBBms3saD1Atw3hPadQr/MGNNbA3v9uB2snjNX
         E6wp0BUknBeJ/JxCiNJImoJ+7FGxXuNNNKDX0VAXVSI1VtqZT3bl+H3bFzawyJgziEXz
         Gmf5FcnrZMnqq5O7iJuZvvQsDr4UaP7baWCIObmrnla40CqlGXRl8NXE6FWTr+n6FwHg
         3HqgTqno8rnNbFXk9a2NREtUVJd4afR7nCm1h+zRTJciObck6ky222JPeDoYZDBnurHU
         2l9RCqPm3HYsPz+tMyfSasuUZy/LEqC4zxl+qGk0umXZjGQO65cwq/DxVr/RBtD4SUQX
         2qtQ==
X-Gm-Message-State: AC+VfDzczzjUfeMTwahACB2kwPJ7plQ5LiO0X3pgm+zp+oGvZF0w64ws
	dR1extojbyLtbaZb6FH2cJiQOLaZJEaModF0uYA=
X-Google-Smtp-Source: ACHHUZ6dGoFP/y9f9WmwBcCFLFQ2xxHkgPZKDVDRryIruy3Gi6vkTR2mlQ+KdipZMZDo8FmtE8rDQw==
X-Received: by 2002:a05:6a00:1915:b0:64f:3fc8:5d26 with SMTP id y21-20020a056a00191500b0064f3fc85d26mr9389553pfi.9.1685672558272;
        Thu, 01 Jun 2023 19:22:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/13] tiff: Remove unused patch from tiff
Date: Thu,  1 Jun 2023 16:22:08 -1000
Message-Id: <b61e75037ed92e6bf4d9d506ffedfc5d50085522.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182132

From: nikhil <nikhilar2410@gmail.com>

Remove 0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
file from tiff as it was removed while upgrading tiff from
4.4.0 -> 4.5.0

Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c53abdb5ce9cdbfb0f9e48b64b800c45549d18a6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 267 ------------------
 1 file changed, 267 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch

diff --git a/meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch b/meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
deleted file mode 100644
index 17b37be041..0000000000
--- a/meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
+++ /dev/null
@@ -1,267 +0,0 @@
-From f00484b9519df933723deb38fff943dc291a793d Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Tue, 30 Aug 2022 16:56:48 +0200
-Subject: [PATCH] Revised handling of TIFFTAG_INKNAMES and related
- TIFFTAG_NUMBEROFINKS value
-
-In order to solve the buffer overflow issues related to TIFFTAG_INKNAMES and related TIFFTAG_NUMBEROFINKS value, a revised handling of those tags within LibTiff is proposed:
-
-Behaviour for writing:
-    `NumberOfInks`  MUST fit to the number of inks in the `InkNames` string.
-    `NumberOfInks` is automatically set when `InkNames` is set.
-    If `NumberOfInks` is different to the number of inks within `InkNames` string, that will be corrected and a warning is issued.
-    If `NumberOfInks` is not equal to samplesperpixel only a warning will be issued.
-
-Behaviour for reading:
-    When reading `InkNames` from a TIFF file, the `NumberOfInks` will be set automatically to the number of inks in `InkNames` string.
-    If `NumberOfInks` is different to the number of inks within `InkNames` string, that will be corrected and a warning is issued.
-    If  `NumberOfInks` is not equal to samplesperpixel only a warning will be issued.
-
-This allows the safe use of the NumberOfInks value to read out the InkNames without buffer overflow
-
-This MR will close the following issues:  #149, #150, #152, #168 (to be checked), #250, #269, #398 and #456.
-
-It also fixes the old bug at http://bugzilla.maptools.org/show_bug.cgi?id=2599, for which the limitation of `NumberOfInks = SPP` was introduced, which is in my opinion not necessary and does not solve the general issue.
-
-CVE: CVE-2022-3599 CVE-2022-4645
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246.patch]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
----
- libtiff/tif_dir.c      | 119 ++++++++++++++++++++++++-----------------
- libtiff/tif_dir.h      |   2 +
- libtiff/tif_dirinfo.c  |   2 +-
- libtiff/tif_dirwrite.c |   5 ++
- libtiff/tif_print.c    |   4 ++
- 5 files changed, 82 insertions(+), 50 deletions(-)
-
-diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
-index 793e8a79..816f7756 100644
---- a/libtiff/tif_dir.c
-+++ b/libtiff/tif_dir.c
-@@ -136,32 +136,30 @@ setExtraSamples(TIFF* tif, va_list ap, uint32_t* v)
- }
- 
- /*
-- * Confirm we have "samplesperpixel" ink names separated by \0.  Returns 
-+ * Count ink names separated by \0.  Returns
-  * zero if the ink names are not as expected.
-  */
--static uint32_t
--checkInkNamesString(TIFF* tif, uint32_t slen, const char* s)
-+static uint16_t
-+countInkNamesString(TIFF *tif, uint32_t slen, const char *s)
- {
--	TIFFDirectory* td = &tif->tif_dir;
--	uint16_t i = td->td_samplesperpixel;
-+	uint16_t i = 0;
-+	const char *ep = s + slen;
-+	const char *cp = s;
- 
- 	if (slen > 0) {
--		const char* ep = s+slen;
--		const char* cp = s;
--		for (; i > 0; i--) {
-+		do {
- 			for (; cp < ep && *cp != '\0'; cp++) {}
- 			if (cp >= ep)
- 				goto bad;
- 			cp++;				/* skip \0 */
--		}
--		return ((uint32_t)(cp - s));
-+			i++;
-+		} while (cp < ep);
-+		return (i);
- 	}
- bad:
- 	TIFFErrorExt(tif->tif_clientdata, "TIFFSetField",
--	    "%s: Invalid InkNames value; expecting %"PRIu16" names, found %"PRIu16,
--	    tif->tif_name,
--	    td->td_samplesperpixel,
--	    (uint16_t)(td->td_samplesperpixel-i));
-+		"%s: Invalid InkNames value; no NUL at given buffer end location %"PRIu32", after %"PRIu16" ink",
-+		tif->tif_name, slen, i);
- 	return (0);
- }
- 
-@@ -478,13 +476,61 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap)
- 		_TIFFsetFloatArray(&td->td_refblackwhite, va_arg(ap, float*), 6);
- 		break;
- 	case TIFFTAG_INKNAMES:
--		v = (uint16_t) va_arg(ap, uint16_vap);
--		s = va_arg(ap, char*);
--		v = checkInkNamesString(tif, v, s);
--		status = v > 0;
--		if( v > 0 ) {
--			_TIFFsetNString(&td->td_inknames, s, v);
--			td->td_inknameslen = v;
-+		{
-+			v = (uint16_t) va_arg(ap, uint16_vap);
-+			s = va_arg(ap, char*);
-+			uint16_t ninksinstring;
-+			ninksinstring = countInkNamesString(tif, v, s);
-+			status = ninksinstring > 0;
-+			if(ninksinstring > 0 ) {
-+				_TIFFsetNString(&td->td_inknames, s, v);
-+				td->td_inknameslen = v;
-+				/* Set NumberOfInks to the value ninksinstring */
-+				if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS))
-+				{
-+					if (td->td_numberofinks != ninksinstring) {
-+						TIFFErrorExt(tif->tif_clientdata, module,
-+							"Warning %s; Tag %s:\n  Value %"PRIu16" of NumberOfInks is different from the number of inks %"PRIu16".\n  -> NumberOfInks value adapted to %"PRIu16"",
-+							tif->tif_name, fip->field_name, td->td_numberofinks, ninksinstring, ninksinstring);
-+						td->td_numberofinks = ninksinstring;
-+					}
-+				} else {
-+					td->td_numberofinks = ninksinstring;
-+					TIFFSetFieldBit(tif, FIELD_NUMBEROFINKS);
-+				}
-+				if (TIFFFieldSet(tif, FIELD_SAMPLESPERPIXEL))
-+				{
-+					if (td->td_numberofinks != td->td_samplesperpixel) {
-+						TIFFErrorExt(tif->tif_clientdata, module,
-+							"Warning %s; Tag %s:\n  Value %"PRIu16" of NumberOfInks is different from the SamplesPerPixel value %"PRIu16"",
-+							tif->tif_name, fip->field_name, td->td_numberofinks, td->td_samplesperpixel);
-+					}
-+				}
-+			}
-+		}
-+		break;
-+	case TIFFTAG_NUMBEROFINKS:
-+		v = (uint16_t)va_arg(ap, uint16_vap);
-+		/* If InkNames already set also NumberOfInks is set accordingly and should be equal */
-+		if (TIFFFieldSet(tif, FIELD_INKNAMES))
-+		{
-+			if (v != td->td_numberofinks) {
-+				TIFFErrorExt(tif->tif_clientdata, module,
-+					"Error %s; Tag %s:\n  It is not possible to set the value %"PRIu32" for NumberOfInks\n  which is different from the number of inks in the InkNames tag (%"PRIu16")",
-+					tif->tif_name, fip->field_name, v, td->td_numberofinks);
-+				/* Do not set / overwrite number of inks already set by InkNames case accordingly. */
-+				status = 0;
-+			}
-+		} else {
-+			td->td_numberofinks = (uint16_t)v;
-+			if (TIFFFieldSet(tif, FIELD_SAMPLESPERPIXEL))
-+			{
-+				if (td->td_numberofinks != td->td_samplesperpixel) {
-+					TIFFErrorExt(tif->tif_clientdata, module,
-+						"Warning %s; Tag %s:\n  Value %"PRIu32" of NumberOfInks is different from the SamplesPerPixel value %"PRIu16"",
-+						tif->tif_name, fip->field_name, v, td->td_samplesperpixel);
-+				}
-+			}
- 		}
- 		break;
- 	case TIFFTAG_PERSAMPLE:
-@@ -986,34 +1032,6 @@ _TIFFVGetField(TIFF* tif, uint32_t tag, va_list ap)
- 	if (fip->field_bit == FIELD_CUSTOM) {
- 		standard_tag = 0;
- 	}
--	
--        if( standard_tag == TIFFTAG_NUMBEROFINKS )
--        {
--            int i;
--            for (i = 0; i < td->td_customValueCount; i++) {
--                uint16_t val;
--                TIFFTagValue *tv = td->td_customValues + i;
--                if (tv->info->field_tag != standard_tag)
--                    continue;
--                if( tv->value == NULL )
--                    return 0;
--                val = *(uint16_t *)tv->value;
--                /* Truncate to SamplesPerPixel, since the */
--                /* setting code for INKNAMES assume that there are SamplesPerPixel */
--                /* inknames. */
--                /* Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2599 */
--                if( val > td->td_samplesperpixel )
--                {
--                    TIFFWarningExt(tif->tif_clientdata,"_TIFFVGetField",
--                                   "Truncating NumberOfInks from %u to %"PRIu16,
--                                   val, td->td_samplesperpixel);
--                    val = td->td_samplesperpixel;
--                }
--                *va_arg(ap, uint16_t*) = val;
--                return 1;
--            }
--            return 0;
--        }
- 
- 	switch (standard_tag) {
- 		case TIFFTAG_SUBFILETYPE:
-@@ -1195,6 +1213,9 @@ _TIFFVGetField(TIFF* tif, uint32_t tag, va_list ap)
- 		case TIFFTAG_INKNAMES:
- 			*va_arg(ap, const char**) = td->td_inknames;
- 			break;
-+		case TIFFTAG_NUMBEROFINKS:
-+			*va_arg(ap, uint16_t *) = td->td_numberofinks;
-+			break;
- 		default:
- 			{
- 				int i;
-diff --git a/libtiff/tif_dir.h b/libtiff/tif_dir.h
-index 09065648..0c251c9e 100644
---- a/libtiff/tif_dir.h
-+++ b/libtiff/tif_dir.h
-@@ -117,6 +117,7 @@ typedef struct {
- 	/* CMYK parameters */
- 	int     td_inknameslen;
- 	char*   td_inknames;
-+	uint16_t td_numberofinks;                 /* number of inks in InkNames string */
- 
- 	int     td_customValueCount;
-         TIFFTagValue *td_customValues;
-@@ -174,6 +175,7 @@ typedef struct {
- #define FIELD_TRANSFERFUNCTION         44
- #define FIELD_INKNAMES                 46
- #define FIELD_SUBIFD                   49
-+#define FIELD_NUMBEROFINKS             50
- /*      FIELD_CUSTOM (see tiffio.h)    65 */
- /* end of support for well-known tags; codec-private tags follow */
- #define FIELD_CODEC                    66  /* base of codec-private tags */
-diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
-index 3371cb5c..3b4bcd33 100644
---- a/libtiff/tif_dirinfo.c
-+++ b/libtiff/tif_dirinfo.c
-@@ -114,7 +114,7 @@ tiffFields[] = {
- 	{ TIFFTAG_SUBIFD, -1, -1, TIFF_IFD8, 0, TIFF_SETGET_C16_IFD8, TIFF_SETGET_UNDEFINED, FIELD_SUBIFD, 1, 1, "SubIFD", (TIFFFieldArray*) &tiffFieldArray },
- 	{ TIFFTAG_INKSET, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 0, 0, "InkSet", NULL },
- 	{ TIFFTAG_INKNAMES, -1, -1, TIFF_ASCII, 0, TIFF_SETGET_C16_ASCII, TIFF_SETGET_UNDEFINED, FIELD_INKNAMES, 1, 1, "InkNames", NULL },
--	{ TIFFTAG_NUMBEROFINKS, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 1, 0, "NumberOfInks", NULL },
-+	{ TIFFTAG_NUMBEROFINKS, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET_UNDEFINED, FIELD_NUMBEROFINKS, 1, 0, "NumberOfInks", NULL },
- 	{ TIFFTAG_DOTRANGE, 2, 2, TIFF_SHORT, 0, TIFF_SETGET_UINT16_PAIR, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 0, 0, "DotRange", NULL },
- 	{ TIFFTAG_TARGETPRINTER, -1, -1, TIFF_ASCII, 0, TIFF_SETGET_ASCII, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 1, 0, "TargetPrinter", NULL },
- 	{ TIFFTAG_EXTRASAMPLES, -1, -1, TIFF_SHORT, 0, TIFF_SETGET_C16_UINT16, TIFF_SETGET_UNDEFINED, FIELD_EXTRASAMPLES, 0, 1, "ExtraSamples", NULL },
-diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
-index 6c86fdca..062e4610 100644
---- a/libtiff/tif_dirwrite.c
-+++ b/libtiff/tif_dirwrite.c
-@@ -626,6 +626,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64_t* pdiroff)
- 				if (!TIFFWriteDirectoryTagAscii(tif,&ndir,dir,TIFFTAG_INKNAMES,tif->tif_dir.td_inknameslen,tif->tif_dir.td_inknames))
- 					goto bad;
- 			}
-+			if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS))
-+			{
-+				if (!TIFFWriteDirectoryTagShort(tif, &ndir, dir, TIFFTAG_NUMBEROFINKS, tif->tif_dir.td_numberofinks))
-+					goto bad;
-+			}
- 			if (TIFFFieldSet(tif,FIELD_SUBIFD))
- 			{
- 				if (!TIFFWriteDirectoryTagSubifd(tif,&ndir,dir))
-diff --git a/libtiff/tif_print.c b/libtiff/tif_print.c
-index 16ce5780..a91b9e7b 100644
---- a/libtiff/tif_print.c
-+++ b/libtiff/tif_print.c
-@@ -397,6 +397,10 @@ TIFFPrintDirectory(TIFF* tif, FILE* fd, long flags)
- 		}
-                 fputs("\n", fd);
- 	}
-+	if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS)) {
-+		fprintf(fd, "  NumberOfInks: %d\n",
-+			td->td_numberofinks);
-+	}
- 	if (TIFFFieldSet(tif,FIELD_THRESHHOLDING)) {
- 		fprintf(fd, "  Thresholding: ");
- 		switch (td->td_threshholding) {
--- 
-2.34.1
-
-- 
2.34.1


