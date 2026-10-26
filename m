Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6313.1793052475888624642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 15:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nmu3B8TQ;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70059e4dab6so2491210eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 15:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793052475; x=1793657275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAlqZu90EtTWYSnKVaBtnenIhrxU2J1p0Qz0ttxIRNU=;
        b=nmu3B8TQws7VxXcOW65Z/Hr3NFEbVb1n/X0E19ReGHu24BJOdjeVlGNfUsHsTKbxSF
         LdGEFPTItNufXvw7atsj1w11Ddtp1kQDeSUruEAwR8mCCzb+TOFQVfZ9eAziMdGlewlv
         WHEAHE7h+oKsi19b7psq2TXTW7EIc0R1F3VcN16mdyeUFr7oIQkpvAYHtSIfJir2UI01
         BtMUcACD0T0uRYR76wFzDnma784kav5yIgQE+ZJ42p4nOKVRiX9keE0fbniKM+MgkAd8
         8MU+MFV2e9YXtazeXUv9zQKGxutl17ZGxtLnA5hp7QR2ZVobps9FT071+UpwqFvscORs
         ZDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052475; x=1793657275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zAlqZu90EtTWYSnKVaBtnenIhrxU2J1p0Qz0ttxIRNU=;
        b=eT2Yy7YJD+1tOjrXwmSmmBS6XXRneY8tYWOx6w4RXDDax0++i4GWJ6OOyTa58z4n64
         CPUaB4t7weAjtxyqf2paEJHfZOgX+7AvRfl7YV56PUOTUmAYhT7ZK5J7gVz+7J2Onwib
         t2IJy3mHWfBwGGVkt4E0v8INWqZfBmNdCgrfRkiU9C6KgGj/MVeL4zLtSJdqoFOlEDkx
         H5vxR4LNgKCtkgrbrCEXw/pGOZfVpRfQ/KzDrmvE+2LKRAJMzUHIUUUYnuwO6/tVc6eY
         /ZRK0oHHqnAG8CZLwhdQ9TkAJGsqsDc29RStLZYjEP6fEAiagfiPViqvb4OOPB6CmNq4
         R9Vg==
X-Gm-Message-State: AFq9FYJMbuPoLmDvxpHb3HZ5UbSYZQSsK+Cns17VxAn+pC9IhNb940Cf
	aYQjAyGHV73zFXo7AUdQD2EgMw4shAfFxa5su+HPL9xew/pKbRPemYJ4mEJ8Rw==
X-Gm-Gg: AYBFou0Uh9J+vuXY0RW312FLWGMfcZyj+LsW6vcWwCAiamtjaH58pWj+nnw4qNPL4bM
	IzafFiSPxRP6oAyAJSy8BJDDq5KQh1ryzRuD5Nz8JTIt+JuAiYP+xyPPn9e8w3ob8EH9GVGfs0I
	0PoktLcOZXcXabLRJ4ToOrOGdznJPMW2SHiIKPoOZOEwMzN7Zb65VqQ7TwfFxm+C2ikIBXRCvl+
	bcORHtWvPBwiC/1beC6th8EYRdksXjFcgVdcd5p1A42mqjTg3q1mPwFcB7CV8ZCtsizScOnZg2/
	2IDEZoVABlbh7FANIqmrfC9MnxomoTHL8vPwGFHjpYHHsB7GeRMGJR+pbdNsXJqgQO6hMiNq9rb
	3VG2F5NPVxSfgJIpybLC6p5XxbQDf4sk4czVyidL3xY2XEUGGla7N8HtpXZVyB/LLeSUrOEvEgv
	mKEEc06X1r0bt8Evc7i1hz/T8dNT1zIDf9O2OmoOE1LoJ/eI9oG2lLsfzTRxWqRlt3dfgpgFkvS
	XmvkVIODjKpHjfgd8p11WY4eAFevk2xvyLwwSOkV+/5yO2iKQlCXw==
X-Received: by 2002:a05:6820:55c5:20b0:6dd:9a5b:cfc5 with SMTP id 006d021491bc7-70ba0f6e4c9mr2943640eaf.89.1793052474974;
        Mon, 26 Oct 2026 15:07:54 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0763easm9025237a34.13.2026.10.26.15.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:07:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/3] lib/oe/license.py: Fix documentation of parse_legacy_license()
Date: Mon, 26 Oct 2026 16:06:33 -0600
Message-ID: <20261026220751.2480577-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026220751.2480577-1-JPEWhacker@gmail.com>
References: <20261026220751.2480577-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 22:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248702
Content-Type: text/plain; charset="utf-8"

The function documentation was incorrect in that it doesn't check if the
license text exists. This must be done with get_license_path()

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/license.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index bd1d85ad5f..e2a2bcc47d 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -425,8 +425,8 @@ def parse_legacy_license(d, licensestr):
     once legacy licenses are not longer allowed.
 
     Unknown license IDs in the string are automatically converted to
-    LicenseRefs, assuming that they are provided as either a common license
-    file or a NO_GENERIC_LICENSE
+    LicenseRefs. To check if a LicenseRef actually exists, use
+    get_license_path()
     """
     licensestr = _substitute_legacy_license(licensestr)
     if licensestr is None:
-- 
2.56.0

