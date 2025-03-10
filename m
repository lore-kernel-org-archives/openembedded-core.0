Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E76C282EC
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 15:04:28 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.40536.1741619064456595143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 08:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GF5tcZ9g;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: c137.marques@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so5341295e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741619063; x=1742223863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2Cr03hvv5ARNsIRai8yRloosUyXBObNoK0J1Lp8oVY=;
        b=GF5tcZ9gLDUTcEUr0/gSEUW0I4xsQLLeNJBcdNVlsznQOzbHPXZG7LDIc35SMqBC/5
         jCxPH3UJ+gpfKZkhixb6eYKdEIMaVoC+8gb/eferrdJoakox4EuUAm76jiMo+sJeXmYb
         ja3YPGRWp9z00tkn0859L2Smpr3irntihAwMbKd02e5tV8cWCedM7dsLpNKoaY4j4A4e
         Ggy14/vW8rTgKsKOYAClAnIPOOw2moEjM8n1U63Gb5YnHmSffZGf0UZzeSbUOUZL6+x0
         j/zNlvrGcG0+8r6Aes/m36LhLl+5YTH0Z0nrBmOMXr1N40tp35HNoQo+bpwkDolTlbT7
         HK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619063; x=1742223863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2Cr03hvv5ARNsIRai8yRloosUyXBObNoK0J1Lp8oVY=;
        b=qNGs5WbuRMnJq4zDv7oGJUdeKsgqqpUyJjubTkhdDD+wTocK76cZkbxyqUrTFyeGX/
         5rshy9AM1JRQYUx8KnL0h9A3+ERZp+/RzUDuGlkbiSGwQJASxbuC/JaFt6L5xCR52Ezo
         i7Qysj1uKqR5+kLXyJyH61k/7Chh967McJfChjrWy3uf9qwKlxB5K7b2nZ14w9XqUGXG
         ohJYFBW8+a39IVCZcq8uc2uuGq6TMTRdCpfl0mrYHpFd/I1qSVCdoOOycvbD5m909TEz
         yz+H6Jfja/8tKsr8dbssxo0jh5onw1AQxEmdJJNeP7+h1K1YTs1M6mEO4p8M6le5hHHM
         5j5A==
X-Gm-Message-State: AOJu0YwcpRURcsUClAuFAiLfkFrmUQiof5egQZO9h83WW/NwIf/9Y6db
	cvkosvZZaDqK1f0N17a8UYnjaLQVLrRLUKphq1VkgqptdC+8Cyuyc86cAA==
X-Gm-Gg: ASbGncu17uZ4kk9ABL8STP+Ag238EosKKT4m+yzsK3OCjA5/1Nu+84lmoab2gQ/w120
	vUaarFlj5hNSsErGlcRDFNxkyj3/NrWxJhTrWkHcO4fNCIhZTr8uvtSG5q2Xkx+eeo3y+LV2aDV
	V2qGk0dKAljKchyK9Em3e9b3FEEXCD/12lpSk+phKXT92nva+hi/9SNlP4SG+6QVGTO4wvH6Oey
	HCs6tCfNPrIhtzvTAqCxDwoGI1YELfrszBJdV/qPhDU7Z3uhPZ7d1Ku6Q+HzLdIwxr5sIEqeFa0
	AqfemH+YdMp756K0/eNvae8tQ+JSjwLlfJbYONPOx6yCUAD4F0Uro0e7qgvzSWL6l5baX83WA2v
	dtd9X7kFESlcFDd8I33xlXcM=
X-Google-Smtp-Source: AGHT+IFHz/mw3z8iow5kEMkq97bDbpLOxTKkMm6nVuUBUBQjv0fkbKU3KI6e2uPBXAjJhlz9H4ErEg==
X-Received: by 2002:a05:600c:4f10:b0:43c:f64c:447f with SMTP id 5b1f17b1804b1-43cf64c4722mr31421435e9.29.1741619061954;
        Mon, 10 Mar 2025 08:04:21 -0700 (PDT)
Received: from ctw-bre-003.bmw.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceaac390bsm79754555e9.35.2025.03.10.08.04.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:04:21 -0700 (PDT)
From: Alexandre Marques <c137.marques@gmail.com>
X-Google-Original-From: Alexandre Marques <alexandre.marques@ctw.bmwgroup.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] scripts: Add clean-hashserver-database script
Date: Mon, 10 Mar 2025 15:04:13 +0000
Message-Id: <20250310150413.2654942-2-alexandre.marques@ctw.bmwgroup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310150413.2654942-1-alexandre.marques@ctw.bmwgroup.com>
References: <20250310150413.2654942-1-alexandre.marques@ctw.bmwgroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 15:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212529

Auxiliary script to clean the hashserver database based on the files
available in the sstate directory.

It makes used of the new "hashclient gc-mark-stream" command to mark all sstate
relevant hashes as "alive" and removes everything else from the
database.

Usage example:
```
./scripts/clean-hashserver-database \
    --sstate-dir ~/build/sstate-cache \
    --hashclient ./bitbake/bin/bitabke-hashclient \
    --hashserver-address "ws://localhost:8688/ws" \
    --mark "alive" \
    --clean-db
```

Issue: NODE0DEV-39586
---
 scripts/clean-hashserver-database | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100755 scripts/clean-hashserver-database

diff --git a/scripts/clean-hashserver-database b/scripts/clean-hashserver-database
new file mode 100755
index 0000000000..6eb006758e
--- /dev/null
+++ b/scripts/clean-hashserver-database
@@ -0,0 +1,73 @@
+#!/bin/bash
+set -euo pipefail
+
+SSTATE_DIR=""
+BB_HASHCLIENT=""
+BB_HASHSERVER=""
+
+ALIVE_DB_MARK="alive"
+CLEAN_DB="false"
+
+function help() {
+    cat <<HELP_TEXT
+Usage: $0 --sstate-dir path --hashclient path --hashserver-address address [--mark value] [--clean-db]
+
+Auxiliary script remove unused or no longer relevant entries from the hashequivalence database, based
+on the files available on the sstate directory.
+
+    -h | --help)               Show this help message and exit
+    -s | --sstate-dir)         Path to the sstate dir
+    -c | --hashclient)         Path to bitbake-hashclient
+    -a | --hashserver-adress)  bitbake-hashserver address
+    -m | --mark)               Marker string to mark database entries
+    --clean-db)                Remove all unmarked and unused entries from the database
+HELP_TEXT
+}
+
+function argument_parser() {
+    while [ $# -gt 0 ]; do
+        case "$1" in
+            -h | --help) help; exit 0 ;;
+            -s | --sstate-dir) SSTATE_DIR="$2"; shift ;;
+            -c | --hashclient) BB_HASHCLIENT="$2"; shift ;;
+            -a | --hashserver-address) BB_HASHSERVER="$2"; shift ;;
+            -m | --mark) ALIVE_DB_MARK="$2"; shift ;;
+            --clean-db) CLEAN_DB="true";;
+            *)
+                echo "Argument '$1' is not supported" >&2
+                help >&2
+                exit 1
+                ;;
+        esac
+        shift
+    done
+
+    function validate_mandatory_argument() {
+        local var_value="$1"
+        local error_message="$2"
+
+        if [ -z "$var_value" ]; then
+            echo "$error_message"
+            help >&2
+            exit 1
+        fi
+    }
+
+    validate_mandatory_argument "$SSTATE_DIR" "Please provide the path to the sstate dir."
+    validate_mandatory_argument "$BB_HASHCLIENT" "Please provide the path to bitbake-hashclient."
+    validate_mandatory_argument "$BB_HASHSERVER" "Please provide the address of bitbake-hashserver."
+}
+
+# -- main code --
+argument_parser $@
+
+# Mark all db sstate hashes
+find "$SSTATE_DIR" -name "*.tar.zst" | \
+sed 's/.*:\([^_]*\)_.*/unihash \1/' | \
+$BB_HASHCLIENT --address "$BB_HASHSERVER" gc-mark-stream "${ALIVE_DB_MARK}"
+
+# Remove unmarked and unused entries
+if [ "$CLEAN_DB" = "true" ]; then
+    $BB_HASHCLIENT --address "$BB_HASHSERVER" gc-sweep "${ALIVE_DB_MARK}"
+    $BB_HASHCLIENT --address "$BB_HASHSERVER" clean-unused 0
+fi
-- 
2.25.1


