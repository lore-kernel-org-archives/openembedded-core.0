Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13794.1795509797839074161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ly9UDQez;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385c497bf94so4138478eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 00:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509797; x=1796114597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1Qe8gwFyQVtWaLrbChQCsQhyi++I0Odv+bwWUPMIxE=;
        b=Ly9UDQez4pltrov09DLT8R3Z2hRY72gosyAUGOyTipTKZuQlhuTyyQqh2VZhE2qABF
         ie7nB3PnsZM0JLb2qiavQGsk+AN4g2OQfoHdZ4ReiVjSNYevyTshnPIt6EaMI73znokd
         CaPCJNg9cPoFjykZx8OOy8N5WH140fu2PsoK1iVRIMGZk0XQqbWsSRNHEOTJfpSkufZG
         sq/9qk/+RraSeocONxBVNGeMUGUOHaiuVsH8msFwvlGoxnpCy9jQ1/WVTAoP6I6WEpcl
         5lEasCvQnczgnidD5epdNNtKgegK7iffR9M4Xy2k9FXfvV5iFHpG0uDo1fzwiwDRxcgE
         OXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509797; x=1796114597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1Qe8gwFyQVtWaLrbChQCsQhyi++I0Odv+bwWUPMIxE=;
        b=FYLr2A6LtMKaEQp1T0W8tYg+2syb+KyFRL+Yrwku9QIDD//GayuWgWBb8CUevB1A0Z
         wH4hRiwnYt6hPwQju/sSj3VC6YQM/ufpxGLUewTBVFXVlTq6xFjYTWquyLOO8tPLvWJs
         voFwnLnUFycUVoRVFd9hV9z122gGEO7zXN2gaeNffavx3PRgRbF+0Oe2tP8KhJbvngoz
         obkeTkZ7/b8T49fGcJhC3TRG5cN1VbKMus5cWEJh1WRQXhEfRE/Jo2QZ/MqPFCAW9Cow
         nEg2JSizBoLQOBMVOPnAMbAe3/bYbePXYWAQblT0ors0buX8Ony2HjFkOq3EtFcHbqfe
         rcFw==
X-Gm-Message-State: APuU4Z+XAZHzXAFHkqhZPOTCw2wUnmWDlY6lQJZngmK2ZQbll+D1dXto
	+cpNyKR6xeABEY/9damISgi6t9+/Igsm8HzZn09NPXkP9Tf7TcTn13dM9q8w9sTU
X-Gm-Gg: AZFdTZdxKyf/suZKAAIJHn2QVnaCX11hmVT+VFOaxo5Z6xDCCt9LNk977Lz8FkZd8ZN
	sGvu5S4OIGJ5idTDjPrzjg6J2adrGOx65OlcdZ86A1TeAsdT6JUe3/260MAJQVca7BPHuRJTuJZ
	Tz4s3tgKrQoInGrgKQVby0G4sGDYE2RAwB0UNoFlGPuQ4TCMIjoIR7JvI98+NPJmun2jK0c68Hq
	r8Jr//Cqw2oHyR4lDNkMH+0gaaJjVOEYHi8YJTL3jK9SK6Q+2a1TuPuoqiKOq8Rn+Cgdvc3I+GE
	4oGaxZD2OQt6MJnaBGJ0LU1NyqNf3p29bENiIU9AUABIxNUq7U1BXvXbgYj4hI2kwav9iQuAkRh
	UkoOFEcnI2E+JDr2zgoDuJuuGSA+Efq+9YuExQvOC4Mlq7bhoBnBiW0B3MA0UwmAyIFC58924HL
	fT5wWDTkpzv+C0J9CGCChrmlvrwJl7pEB0zMqz6wXbiBo5rmfSqbdCM0Rr2X2m7VqExgOwJweGP
	3jS/LTsV/C0O4e6F9b+h82nGTDsBr1+KwilaH9ED0vTxrvqQLnRfr89U2edc0aXiU8fFnYfNoAP
	h1nbp5YqeZ0C5DvziuJNfpH3V+S+6N9+YvoVQbXJNavZI/bijv7iXztwN4JvlnO2a5av4C/cNCU
	O/mJTtuwmC7TvOJ3Dav6vBJaB+NAw1bJTiEQXHp1l2Fjgi9lo5+gLO4xO8dnHAGmarQlbmpWHWL
	GACE0+cpUkddEvjSuBMS95MbxdZurcNbigOFpusW4PQRLboyIBiyeGAf7lxTENfTBJAY2VvY+UJ
	NJ7wT60fmd6LgZXcWfxN7FTg/weT9NGiI8ctPUULQaVXTWcR/bYXSKkkXtSuki5gE4+iX4vJDk4
	rMmkInzYYgV4kD/VtVahUZzCxA==
X-Received: by 2002:a05:7301:fd06:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-3856f549471mr14586220eec.28.1795509796891;
        Tue, 24 Nov 2026 00:43:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm53295750eec.4.2026.11.24.00.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:43:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] tcl: Fix lseq-4.21.1 ptest failure with clang
Date: Tue, 24 Nov 2026 00:43:13 -0800
Message-ID: <20261124084313.2047883-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250977
Content-Type: text/plain; charset="utf-8"

GenerateArithSeries() casts an out of range double count to
Tcl_WideInt, which is undefined behavior; with clang "lseq 1e5555"
returns an empty list instead of an error. Add a patch to range check
the count before converting it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-check-lseq-count-before-converting-.patch | 49 +++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_9.1.0.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/0005-tclExecute-Range-check-lseq-count-before-converting-.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/0005-tclExecute-Range-check-lseq-count-before-converting-.patch b/meta/recipes-devtools/tcltk/tcl/0005-tclExecute-Range-check-lseq-count-before-converting-.patch
new file mode 100644
index 0000000000..a06468378d
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/0005-tclExecute-Range-check-lseq-count-before-converting-.patch
@@ -0,0 +1,49 @@
+From 4f756debee55260106524bce5d12fb4c6ef5946e Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 16 Oct 2026 08:14:03 +0000
+Subject: [PATCH] tclExecute: Range check lseq count before converting to
+ integer
+
+GenerateArithSeries() casts a double count to Tcl_WideInt and then
+checks whether the result is integral. For Inf or values outside the
+Tcl_WideInt range the cast is undefined behavior; with clang the check
+passes and the count becomes WIDE_MIN, so "lseq 1e5555" returns an
+empty list instead of raising "expected integer", failing lseq-4.21.1.
+
+Only take the integer conversion when the value is within range, and
+otherwise leave it as a double so TclNewArithSeriesObj() reports the
+error.
+
+Upstream-Status: Submitted [https://core.tcl-lang.org/tcl/tktview/97dbd7a4e9290821f20233c144077801424433e4]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ generic/tclExecute.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/generic/tclExecute.c b/generic/tclExecute.c
+index fd43b87..97d76ab 100644
+--- a/generic/tclExecute.c
++++ b/generic/tclExecute.c
+@@ -9404,7 +9404,17 @@ GenerateArithSeries(
+ 	switch (type) {
+ 	case TCL_NUMBER_DOUBLE: {
+ 	    double dCount = *((const double *) ptr);
+-	    Tcl_WideInt wCount = (Tcl_WideInt) dCount;
++	    Tcl_WideInt wCount;
++
++	    /*
++	     * Casting an out of range double (including Inf) to an integer
++	     * is undefined behavior, and compilers may fold the check below
++	     * into a plain "is integral" test, so do the range check first.
++	     */
++	    if (!(dCount > (double) WIDE_MIN && dCount < (double) WIDE_MAX)) {
++		break;
++	    }
++	    wCount = (Tcl_WideInt) dCount;
+ 	    if (dCount - wCount == 0.0) {
+ 		Tcl_DecrRefCount(count);
+ 		// Switch to the object holding integer version of the count.
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/tcltk/tcl_9.1.0.bb b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
index a0a908e19b..db31ab6d89 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
            file://0002-tcl-fix-a-build-issue.patch \
            file://0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch \
            file://0004-tcl-update-the-header-location.patch \
+           file://0005-tclExecute-Range-check-lseq-count-before-converting-.patch \
            "
 SRC_URI[sha256sum] = "ba11ae7035ec4b0caf2c489b20d5aa2abb1cf001a7e65b0fa2fbac86908c643b"
 
