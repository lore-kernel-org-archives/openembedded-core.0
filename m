Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.7449.1591350009795024285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 02:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bqhVysTz;
 spf=pass (domain: konsulko.com, ip: 209.85.128.68, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f68.google.com with SMTP id l26so7801888wme.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxrIKu1qD/GIlcJ/7g2nlBctMTUZt6u0UcGcrQVh3u4=;
        b=bqhVysTz/zhFIcWCGcLUjumvMjFOueYh+EStJiZVu3SMTh1iPyRL6alTuTT0SOWLNg
         O9GKf4wOUpHAqpsFuRoyX4i5X/eD+WumROgTPYo2hOHl0jCxsA0mORYkHWtfKA/aMIEF
         b09BwG7NjuPb3T9Qx26mAJYcztbo8omuMDIoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxrIKu1qD/GIlcJ/7g2nlBctMTUZt6u0UcGcrQVh3u4=;
        b=U5GdG2p+1SsiN3mERNlFduzU7xwQCrkbrCLJdq7cXM3p0aJ/tQVFGFbNAXWGQpUzc4
         5bOs2Rysf7VeARKtTfnnli60hepjQqMyEbM0kDppUO7U75oM+BBE22TCETLH0tuFrMQt
         o3R8BDDbv39hZOGWm2doI7as6GdP0XMYm5ncZ2+jLeiDE1ZX2BeAyzHVZZByDTHucMe/
         5IqMI6w09z4qdhBbnql5dCSE6dINLzotHJs4XgY50+r7oc/KnqscSipfhV0YU8HYT6dj
         8tqmNLcPJq03pRED4fhHbBTmdggK3elvJ18tugg7x276bV2yu7OxqyYHqCMP0jKLCOe1
         57JQ==
X-Gm-Message-State: AOAM530+J15b3zAwAPdWJ+fao6ZfG4Py3vXu/GBwCdDv/hE3bEX4U3tQ
	HQGzmRgJfQoX39vBGkmXHlEHO6oe5svMAQ==
X-Google-Smtp-Source: ABdhPJx7O+Pl/JA+8X0cesQGoZYC3ge+gpz9Gm1FKpn+yDTViYHAbqS/NMTrfZSNT988Bkcl4kAT5A==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr1824081wmq.106.1591350008175;
        Fri, 05 Jun 2020 02:40:08 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id j5sm11283493wrq.39.2020.06.05.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 02:40:07 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 2/3] selftest-nopackages: New recipe in meta-selftest
Date: Fri,  5 Jun 2020 10:39:55 +0100
Message-Id: <20200605093956.6385-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605093956.6385-1-pbarker@konsulko.com>
References: <20200605093956.6385-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This provides a test recipe which is known to inherit the nopackages
bbclass.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../recipes-test/nopackages/selftest-nopackages.bb          | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-selftest/recipes-test/nopackages/selftest-nopackages.bb

diff --git a/meta-selftest/recipes-test/nopackages/selftest-nopackages.bb b/meta-selftest/recipes-test/nopackages/selftest-nopackages.bb
new file mode 100644
index 0000000000..154df910e4
--- /dev/null
+++ b/meta-selftest/recipes-test/nopackages/selftest-nopackages.bb
@@ -0,0 +1,6 @@
+SUMMARY = "Test recipe for nopackages bbclass"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+inherit nopackages
-- 
2.26.2

