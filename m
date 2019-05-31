Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5DAD27E5B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 19:36:26 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h17so4598721pgv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vMzvCwJUd7HIJIJikB6OlpE/9G+MtIm4TU9MDO30mCU=;
	b=byKl5Enl5NNrQIHaPB1c0/PTo4NkcalA4iHQEDKXjmrLr7WJjaYzdJw3lWgFtaKSXW
	cvt/p9ejY4Im6C6E9aBKnYQvpSZrFkFfq+VsD349fm7RpUP85A75F5QS/qLZOVieDdeh
	lEel8IdCVp43AonGQTHUShOrZn/b2kcZQ0cocXytmZrLqEzPos+HmSdm7rU1/HiMluzn
	RAez8TXhWg2FKpFIRmBLVGqSkgNI+UgrU6ajOj3jtfKuuGUAvmIUy2wvJ057Ews/6si3
	OiP8VE2H8M1tollRXuGRiWhpYNlkeVsR53loLu+6uFApTRMpqA70TelYAK/zq0p3r2bt
	8w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vMzvCwJUd7HIJIJikB6OlpE/9G+MtIm4TU9MDO30mCU=;
	b=TT9ux1jkDMupihm4NYVCifOIbC14M6YUQKTsc93xRZGWagpu894G7WqKywoPDNQ7xI
	tMjyXeRJmodXEsyOyssNQzvCMpGNh4jqAYkiPwejFqG1GK9YeLm1ao57aelvK3y1tD4p
	YceXKjwgo2IkUlCbe6KK4aMhWimEXxDjF6UhwBdOSa5MEeBuIwtSPxjTvsuMZKUMffDS
	rvx36nNEMcUNEYi9nI+0zekIEg2TF/DnR2jg4opG/WJaMNi0myAk2TWLGaLYqX424ffg
	xRdUNprsNYt+9roSKPrw+H6WlP1Y/fzu3wkd5hx+llxhvwSfMR6HVpWi/yCp3Sp+9O4m
	Qtew==
X-Gm-Message-State: APjAAAUq5OAVZuy1XC92O4xYYStp1I3TIBGk2q3HmQ/+G2mcCkt5OQcq
	B1riYQ/lBcjU1l0MJkvqmm89gBVw
X-Google-Smtp-Source: APXvYqyTQGw38CB+cGS3FO44t9wg5XvSpc2IwtXVKU+pVU68V+EBXMigQQQcXJIDEF5ULGie9XUxog==
X-Received: by 2002:a63:eb0d:: with SMTP id t13mr11456102pgh.37.1559331387363; 
	Fri, 31 May 2019 12:36:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d8eb:da43:9914:3fc9])
	by smtp.gmail.com with ESMTPSA id
	r71sm19646796pjb.2.2019.05.31.12.36.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 May 2019 12:36:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 12:36:22 -0700
Message-Id: <1559331382-23257-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559331382-23257-1-git-send-email-akuster808@gmail.com>
References: <1559331382-23257-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 2/2] cups: upgrade to 2.2.10
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
X-List-Received-Date: Fri, 31 May 2019 19:36:26 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Source: OpenEmbedded.org
MR: 97351
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-extended/cups?h=warrior&id=fbe7a0c9bab7c9be7fd2c0da8b2af61e66de1ebd
ChangeID: fbe7a0c9bab7c9be7fd2c0da8b2af61e66de1ebd
Description:

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

CUPS 2.2.10 is a bug fix release that addresses issues in the scheduler, IPP Everywhere support, CUPS library, and USB printer support. Changes include:

    CVE-2018-4300: Linux session cookies used a predictable random number seed.
    The lpoptions command now works with IPP Everywhere printers that have not yet been added as local queues (Issue #5045)
    Added USB quirk rules (Issue #5395, Issue #5443)
    The generated PPD files for IPP Everywhere printers did not contain the cupsManualCopies keyword (Issue #5433)
    Kerberos credentials might be truncated (Issue #5435)
    The handling of MaxJobTime 0 did not match the documentation (Issue #5438)
    Incorporated the page accounting changes from CUPS 2.3 (Issue #5439)
    Fixed a bug adding a queue with the -E option (Issue #5440)
    Fixed a crash bug when mapping PPD duplex options to IPP attributes (rdar://46183976)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/cups/cups_2.2.10.bb | 6 ++++++
 meta/recipes-extended/cups/cups_2.2.9.bb  | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups_2.2.10.bb
 delete mode 100644 meta/recipes-extended/cups/cups_2.2.9.bb

diff --git a/meta/recipes-extended/cups/cups_2.2.10.bb b/meta/recipes-extended/cups/cups_2.2.10.bb
new file mode 100644
index 0000000..490c84e
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.2.10.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
+
+SRC_URI[md5sum] = "3d22d747403ec5dcd0b66d1332564816"
+SRC_URI[sha256sum] = "77c8b2b3bb7fe8b5fbfffc307f2c817b2d7ec67b657f261a1dd1c61ab81205bb"
diff --git a/meta/recipes-extended/cups/cups_2.2.9.bb b/meta/recipes-extended/cups/cups_2.2.9.bb
deleted file mode 100644
index fcd96ef..0000000
--- a/meta/recipes-extended/cups/cups_2.2.9.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
-
-SRC_URI[md5sum] = "798e83bb1a240f5417a252903d83ae0c"
-SRC_URI[sha256sum] = "6d22d5da253b97643320da0bf95574acd85ff2abe3ec1a51d36093841d891156"
-- 
2.7.4


