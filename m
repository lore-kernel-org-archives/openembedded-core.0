Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1F1CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 19:56:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7357.1777578998513030925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 12:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pBtykSb8;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b4650d5f5cso5468335ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777578998; x=1778183798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcoQpAI8Mh/opK8Dsw79RFq7l8TT6DdQjTylsz9/EZw=;
        b=pBtykSb8hWnDN1twnuzd6tVAYGk9Qd+VtYhfqdW5H0uxA3zJEUhGXiJy3e1If7XJZ+
         IP7kxDv1WbTS+Tr+Y7yl16U8WmXqx7g58pcFnFVR6vrJ67XBl7HbCq39ZWD6U+kH2jm/
         SI6lrgh9Stw+GZc+1GaTqZQTIR6pOWIKD55n1RUUUtP46Y8iRpAP6yK01xS56glmTdyN
         zalCvTuidZUappke8rKPhtYH1FY1DNx0I/pyolrGaP6x8jJ0knrxifebZ0jWtmBI559X
         CStlHqzGh61IC/mGsfTzbg3vhzDyaTQhMugCt+fwLnBdJ0bSWRefZiv6/RYKInJnP6bV
         iCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777578998; x=1778183798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcoQpAI8Mh/opK8Dsw79RFq7l8TT6DdQjTylsz9/EZw=;
        b=q209H1wpNLe+uwziTgVx6tQ+mOUIJWU5V3pcS5faWhWcsyjFzOvznVR7eH2XoAhpwg
         sA9VUaGqEu+vVn0l8ki/gr4Vqb2sOmBQZAswkUbgaKvL/UhCQrs42NjNMgxF3+KYLiDt
         Mph6k496tvD8m10WHoKAZys9IiFuxSkO/ArjOJd0xJh9OQ0RS3EEQqACEjru3eVE60NT
         NlFdT/kuUEvxwyMdWbIcypUFoT6P7hiCWAoZf5hqWhErT+iNIRF+B2snaKvOVQyGY9zY
         KLba3z4Jo6EoLELV0qS/cyOmMm0gCEOYEvq0wGPr8yRgl05AN8RG2Z2CCSCHPS2qt8DY
         1GTA==
X-Gm-Message-State: AOJu0Yw6co4Axy6CN+GOVKozU1fDR+94YZsExBInRd+HjbTjVFcmlh9z
	8X2Km7+CAwF7Jk9d25LNDuGFqZE2qq6e0IQDYQgfOUDQ0jUdXmRoNAnKoVEQV5XD
X-Gm-Gg: AeBDiev5o4LMSy5scbT4iFk21ugvq3syv5yhLG18wyOOVBCzsQETxc3wiz1W9yXgtt+
	R3kY5sYfi4Esjdbw3Prp1kPDfhXzDkK2RxnHwrqA61hZNedABBY23RXsdcPGLCb8uemO6sP5jPV
	2a4K8qhSlhMpICBFds5e3Xy3CdQlsaG8S/63PhDBpBqziVKkqFc1+aAvAHG6YrrqWkQV1ZnPzOi
	baTsO02saYUqW/w2dntxlEIU08vrmWSo8U/lkPZpL3TIzAsFSBhzbxyqlWneqaNfM6EKvQ65f0r
	zuAifF4J2iw0ssODCHmURRitsuTKzhScBdUwNOmKmGr2CPB2AWc+l3abiYgcnLYtQhmQPgJJ/9V
	O/JzavM9v99lrznIY/AWiJVh7UzYXM9YMzqtmDrlailhAGZPAgm+avGh2tOmZbyY58YTrXa/NMe
	KWf09Hu6y1LBpQCBdukoRS2Bi1bI6Gh2hd175FYie9c4MuqCU=
X-Received: by 2002:a17:902:db0b:b0:2b0:67cc:adc3 with SMTP id d9443c01a7336-2b9a233734amr44913445ad.14.1777578997571;
        Thu, 30 Apr 2026 12:56:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59864sm3796735ad.75.2026.04.30.12.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:56:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][wrynose][PATCH 1/2] tzdata/tzcode-native: upgrade 2026a -> 2026b
Date: Fri,  1 May 2026 07:56:22 +1200
Message-ID: <20260430195623.278134-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 19:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236184

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

