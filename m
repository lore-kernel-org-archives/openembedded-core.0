Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5303060279
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 13:54:49 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 71-v6so2577959ith.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=h/fWo5lYlBkiwaaYSQlqAvdw3IdbjL1QrBncq43BzUg=;
	b=GQ5KBS9XCMT4SdxXFZxkuezgEh9KKPF2SF1rfh2g7ae0/ufkcpRtYUEj1bo9YWeQMS
	woC9DJj/YH0e2v6u9mMGObWMDl2qc0cQZmynvT0wEcVnr5RcNJoPg9KyolguL8/WMeym
	H9Gj0b0EH4sKPCoHt1JUfSly9Hw0LPjSSpFGcFQg9LPjJqXBG0ePVgvRy4L2zIjfEKIZ
	MGNXMUuV/VclNPXNH35Lzo7OTR7aUQY+Fjyy1/IgQFX65Grx8Sql5W4xy6j2dzuvS0Nd
	fw+vGtSe1bw7Ez911y52jWgNBl4lWvkNw7/JEL2DNbLECEGxirYr/Vz/IyaskIp4wyZU
	UR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h/fWo5lYlBkiwaaYSQlqAvdw3IdbjL1QrBncq43BzUg=;
	b=VohI5Yajs2q5M25pnEmC3KR++uslGzvoRUTxOPNJ6qjLWz41KSulOMR4Gg+zXlh2P1
	+qt2j0Sm7q4dbYXi3JBDdEXxzSC7dgzTBuGEFVbXg+oRg7YJSvPrVk/Ic2y6X+NSyHAA
	KCKGUnC+8DPmiVGKOY/2ZX9F3zZl2+zzAYFDwEjFzimAMxS9ndJ7ptXLmRL26hNziPAn
	yETm/vD9CgbZ49ELAPjBZwEEC9HpU722SUIMmIemDLkhqcGcnfEtRqysGKq+SC9VCIlf
	DbzgfRvxFFBzyQBathORZrVsYvQPMtWG0ASPPAD0ka1Xdqz5O2fn4KOJjZPcE+8eQDMN
	YOUw==
X-Gm-Message-State: ALQs6tBBMwG18FaNviUhHksE6dhFDMSKchRY5fDcnpGvaPHlep3xfg6Y
	dYpX0uu3NwGrsjwdL0X7D15r4f+n
X-Google-Smtp-Source: AB8JxZrzOsWXRBJ3gevi9p1MIYkLHbXZlSxuVNErGvjPyseuEJk1MUE/8pvopGoZoTP3ORMUUUO9bQ==
X-Received: by 2002:a24:490b:: with SMTP id z11-v6mr3110262ita.3.1524232490887;
	Fri, 20 Apr 2018 06:54:50 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	67-v6sm2955008iow.4.2018.04.20.06.54.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 20 Apr 2018 06:54:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Apr 2018 08:54:06 -0500
Message-Id: <20180420135406.28410-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [sumo][PATCH] Revert "icecc.bbclass: Improve error reporting"
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
X-List-Received-Date: Fri, 20 Apr 2018 13:54:50 -0000

This reverts commit b28114cf1e58643bd233bc0c83d6d8138952b7ac.

The "-E" option for flock is not ubiquitously supported, so don't use
it.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 73eba7a6a96..0ca8de86c24 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -366,20 +366,14 @@ set_icecc_env() {
 
         # the ICECC_VERSION generation step must be locked by a mutex
         # in order to prevent race conditions
-        exit_code=0
-        flock -n -E 10 "${ICECC_VERSION}.lock" \
-            ${ICECC_ENV_EXEC} ${ICECC_ENV_DEBUG} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}" || exit_code=$?
-        if [ "$exit_code" -eq 0 ]; then
-            touch "${ICECC_VERSION}.done"
-        elif [ "$exit_code" -eq "10" ]; then
-            if [ ! wait_for_file "${ICECC_VERSION}.done" 30 ]; then
-                # locking failed so wait for ${ICECC_VERSION}.done to appear
-                bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
-                return
-            fi
-        else
-            bbwarn "Could not create icecc environment: $exit_code"
+        if flock -n "${ICECC_VERSION}.lock" \
+            ${ICECC_ENV_EXEC} ${ICECC_ENV_DEBUG} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
+        then
             touch "${ICECC_VERSION}.done"
+        elif [ ! wait_for_file "${ICECC_VERSION}.done" 30 ]
+        then
+            # locking failed so wait for ${ICECC_VERSION}.done to appear
+            bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
             return
         fi
     fi
-- 
2.14.3


