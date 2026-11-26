Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5921.1795728601740714158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 13:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LEVBeB+G;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so8624552c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728601; x=1796333401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=emv5UHPGorlOvJlmzHy0gdU3C6AcRmv9uhdMJcsfLWo=;
        b=LEVBeB+GuKcZioFhjHzI8yDYecsZkWj5wjJoolpaGhcGYvqYnEVpzUZBFPESXy0k8t
         85jdW/Zsc2gtP19RpSpkpOf7M6qrN2B7C8XzDxRnAkZZwrfN3hhLLjDvm+sny5K3/Bz+
         1xu0DwTkNrCNonZhCXYpcZectVKFliSgfPPRAn18QsnkBeUJ0qIWMOSD+KGaVYcJZW+y
         QQdoFBDgXBLFY012Gy7HvEewnyREjpX+4vcOxrUcIjJ+8TNzySofKexNBOsmJzxBwpn5
         ca9R8GdhBl7EeeGfAUfgD1G7nblKqgfHds05Dzfq/Z45/tBjE1DkzPL0IW4ZCZLfaZ6e
         c05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728601; x=1796333401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emv5UHPGorlOvJlmzHy0gdU3C6AcRmv9uhdMJcsfLWo=;
        b=OQV3ys1Ve9JWCo9fjuPZHXq6pJDhK8aG77WJ5yj95Tx4+QfkmM6esA4VPAfG41bJpg
         MWMBCvARHHQ2OCDP/pPypctg+srbAlSjJWj1TaoO3vaBlZcbUFhvSgh2MtBTFexDTRZH
         akoj3KnbZcx4bFxShCcDwtrT6jeV6qr9Xgl6lIcD+91t7ROPvo64uJNllPoln2tiTdX9
         jHKd+A1id9rKfB8615mjykgJXnoHEt3F9q2vesnkAApk6I9dNqU09SOsqQzPIED1AR8W
         gPOlZ8VBTTPt6A+Qc1HtHEOO04J3QqqK/O+W+as4KipzPGux/lkVB1ZrTmtHSjrNCv2u
         yiMg==
X-Gm-Message-State: APuU4Z8a3DC+HYJjp71F0hutT3OAr3/xg2YFpj8N7Qtbohz7RuB2QQWL
	AW3yacsFLPHI7JuHy24gpLA2ZDOLAQ6dcUc8c/NTaE+fxcNdksLGBIyaHeTOMxyW
X-Gm-Gg: AZFdTZeNdIJGorgDUtxKEMDzhj8mjUTSOL0Y7ywpuKAds+kxvz+RC35NrZZKfVfrF50
	N5mpqgk3SKKqG3bGI9tjQlzZZVaJdVqjqMGB68XkFfOPTXQP943yMXqrZ6eY4k+Wt6W3Qg/7DK0
	66/qARFTcEnbmfhir/t9xpl7pLk3z8QB48vXK2L3CtrXsMciZlChNCsdxbCGkD/mM39eCLPbh5/
	nsNm3etmSzi6+EHsMyXhkfi+FYqKMzDmSdGXxW8+rg9K0TQ3Mb7BsIcvt1qNoPFAT/wmgCjp+6c
	LW9gmmOvY7CWbTSdEJhSFXkXu6ff69lcszV+iFA/3b1QymL0iWN/wIin1TPVir3AAhc4Yx3+RBn
	p13CqbJ/vW/B65sxzuI+W8LnpvSFUG703G9MwgjBCUPeDgGjVzzd4chkM/6KEPPvOR5oSM53jWa
	OkAoOEliaqa8ykelemeH5Z7qO4HBChjqQdoZab9F0ddcmARC7uCktWhUYi6EiKH37FmIVHMj3Al
	owLEoBdS4mbI40UiqyNdlLrx0s0Aucg2IWZdUSwcqqigbmiXW1QzbL0kWJWM1m0Hwexcs7rwZ0s
	N3SsLO9Kfd8XWx67mmwScuv9lcHaMbb+OVlPyhfujUM+YimNJQxYcjW4SP7S5JuMI0hJA9I2OAO
	ATrYqupuELLelSm1g5TfVllEF/uJ6HiXe3dn3EXmQISOndvB5PRKJ9Fv4VmbyNmXpfsmaia95i+
	c1nlJhwSZNwlazt4CXAVc9g4R09IIPdwDTxXT0Ln5aOgO6yO8IVxMjRCvAevxDkB/fD8GkgPDco
	HYpPFYvwq05bv9OjggF8aWKQWvmHsm6tHFWguMEjm1sHv6zueKsUK3yglxQVqO0ddYDvcGp54Zw
	JLtj
X-Received: by 2002:a05:7022:2649:b0:19f:527d:96da with SMTP id a92af1059eb24-1b5568ee905mr20241571c88.33.1795728600829;
        Thu, 26 Nov 2026 13:30:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm58739525c88.6.2026.11.26.13.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] sqlite3: Enable unlock-notify for native builds
Date: Thu, 26 Nov 2026 13:29:57 -0800
Message-ID: <20261126212957.2477520-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 21:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251330
Content-Type: text/plain; charset="utf-8"

Rust crates that use sqlx with the system SQLite build their sqlx
proc macros for the build host, and those link sqlite3-native. sqlx
needs sqlite3_unlock_notify(), so without it the macros fail to load,
e.g. for influxdb3 in meta-oe:

  libsqlx_macros-<hash>.so: undefined symbol: sqlite3_unlock_notify

Enable unlock-notify for native as it already is for target.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-support/sqlite/sqlite3_3.54.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.54.1.bb b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
index 681b8e1e20..5daea010fe 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
@@ -32,7 +32,7 @@ CVE_PRODUCT = "sqlite"
 inherit pkgconfig siteinfo upstream-stable-release-point
 
 PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext unlock-notify"
-PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
+PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext unlock-notify"
 
 PACKAGECONFIG[editline] = "--enable-editline --with-readline-header=${STAGING_INCDIR}/editline/readline.h,--disable-editline,libedit ncurses"
 PACKAGECONFIG[readline] = "--enable-readline --with-readline-header=${STAGING_INCDIR}/readline/readline.h,--disable-readline,readline ncurses"
