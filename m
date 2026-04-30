Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29058CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 19:45:09 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7106.1777578305835695017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 12:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nlyoT17m;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b4583f0a1aso8677595ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777578305; x=1778183105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcoQpAI8Mh/opK8Dsw79RFq7l8TT6DdQjTylsz9/EZw=;
        b=nlyoT17m9sTMwbEtnjhWI+fcaSA53GysWFHmnuLOgsAFj7AKw+m5PKc4t2NCm4kztJ
         VB7o4Ly0ceGK+jTup4LM5V43WYh05PGcwL5tgqs7mefx2fFGeGs+0hP6R03rupjgLlih
         H+8WzfJanq0MKE6Nmlg8W4mY9HN8aFxvwtMNgdMDaTiIk68DK/uchybWslb0kAbYjFnT
         4PJIQ2V23Q/DZgVPqoDqIX7DhSmIc84wQvhSJG20bvyPkzqGmrnendVA+Gv0QD/7gowA
         oz9Rm2U03ht0bWn0kKJ+QbSCOtZucPReQNG6qNypntxfrKhcExfaBYt5PFvTJkPBohCx
         8xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777578305; x=1778183105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcoQpAI8Mh/opK8Dsw79RFq7l8TT6DdQjTylsz9/EZw=;
        b=C5O+O8IZ0/wUPhslUGNqLt5MzgBCrpcMCniz8YvnMrYLkDI/8zYz16ifMY+8zBMPwX
         DOhJWPZQKm2DxlI+zAkqH91Wuqekqx+6+Vax6NpeB3FCCA1f7IlN1bfQx8zMzPok5AgM
         8yL9zJlJKO6M8BU8MdyM3PqAkjbwZ0yqtc2SyIelblBPwNdpuLBlsjb228kpB5XY+gjl
         Urvk7qpey3X0YouJl9LC9gGLUIDi2q2yIPf6uLCHnsz2FW9whtx36Zb1CP/Z5RxXa2sD
         Ridm2n2EnQXzVH585grTVTqMVgym1hLfyIGlvAQpe36V06NHTVH6as8p7v7QJZ6wLJYU
         AQBg==
X-Gm-Message-State: AOJu0YwM6ZWR5PhT73vj7fymi9GYX2QSPDAFHcSsllcs5CgRPzh29K41
	LzO2R2ETMm7g5NRYXxm+78aioa1Wr1wLU5bodF4egR/dHXBa0iu+6BfURcZuKbrQ
X-Gm-Gg: AeBDievFwD7Q1A49moZjXQsrRIXpVphxVyizuStJSN/NWLBG+F37qMtgSopLBmWu6zW
	FSDyVrKoJSxyYWzhfvcudcCudMW/xB+1r4If0eLbiGmBZY/xsnIYLalxuZXIoJYl2cBlMmnEsxA
	JAwyz6awuxWehlQ4yOuNkSMxI6hyvCZnQ6Ky13qOtM2aFzfmnnI/3Ak6U/BMnFfCk7gSz4HFcQ+
	zYNrEwLWWo4HKSXdfV4InKlrw2ogwgnliGohyWLVRt+r5eykhk/tLTFFhUN//rCF0pO7so4gfV4
	tVoNdL8VG93SJZs6cgVGbUgRBKXEOA8QkgNPm6fXN1v0Eb2u2QPCVpwYi5tdPdbMd/TwxLafTCr
	/NVts1QNORY8TTwgTVJsO0AjdYGdCeLGMqhcfkDAemLZ0T8o0swbW2WdDtWolH50xGmEiPAxRzk
	9u4w+JcyoLc/uvJOaLcuFxUNz0e184tl0MCPXGTT7bQrmCg2c=
X-Received: by 2002:a17:902:b403:b0:2b9:5d18:994a with SMTP id d9443c01a7336-2b9a230481fmr32629015ad.7.1777578304812;
        Thu, 30 Apr 2026 12:45:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59864sm3626325ad.75.2026.04.30.12.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:45:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/2] tzdata/tzcode-native: upgrade 2026a -> 2026b
Date: Fri,  1 May 2026 07:44:52 +1200
Message-ID: <20260430194453.261162-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 19:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236181

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The 2026b release contains the following changes:

Briefly:
    British Columbia moved to permanent -07 on 2026-03-09.
    Some more overflow bugs have been fixed in zic.

Changes to future timestamps

    British Columbia’s 2026-03-08 spring forward was its last
    foreseeable clock change, as it moved to permanent -07 thereafter.
    (Thanks to Arthur David Olson.)  Although the change to permanent
    -07 legally took place on 2026-03-09, temporarily model the change
    to occur on 2026-11-01 at 02:00 instead.  This works around a
    limitation in CLDR v48.2 (2026-03-17).  This temporary hack is
    planned to be removed after CLDR is fixed.

Changes to code

    zic no longer mishandles a last transition to a new time type.
    zic no longer overflows a buffer when generating a TZ string like
    "PST-167:59:58PDT-167:59:59,M11.5.6/-167:59:59,M12.5.6/-167:59:59",
    which can occur with adversarial input.  (Thanks to Naveed Khan.)

    zic no longer generates a longer TZif file than necessary when
    an earlier time zone abbreviation is a suffix of a later one.
    As a nice side effect, zic no longer overflows a buffer when given
    a long series of abbreviations, each a suffix of the next.
    (Buffer overflow reported by Arthur Chan.)

    zic no longer overflows an int when processing input like ‘Zone
    Ouch 2147483648:00:00 - LMT’.  The int overflow can lead to buffer
    overflow in adversarial cases.  (Thanks to Naveed Khan.)

    zic now checks for signals more often.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 00bb704e36..ff02416ed3 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026a"
+PV = "2026b"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
-SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
+SRC_URI[tzcode.sha256sum] = "37e9ed8427f5d3521c22fc58e293cbfb043d70eedf1003870b33f363f61ca344"
+SRC_URI[tzdata.sha256sum] = "114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544"

