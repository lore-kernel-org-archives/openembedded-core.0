Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5034ECD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 11:18:15 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18206.1779880692327707687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 04:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ONy1jpBS;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bd2c147abaso70054675ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779880692; x=1780485492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8p4VPUTVkx8Bgu9uxt/nQ7yvo0tDR4nGUc0FGCSoC4=;
        b=ONy1jpBSRUbip/WHyELbREBIAfO1YqcYQp3Pnr4o+bDAR46PybLy0ejvEEVf6geGfj
         aP6DWvOzEk/L3vQRbafP5EPNhhn8gDvt7Va9nhOwrFyUxs1rmCx4JFlYcomi1wEobxdX
         S/63sePdbLx8/mwH7zQCoL1HZTL91nMhvxEHtBOpK0wi+AbFx+B88GFmsoKfaRqLsmEm
         M6tSQ4r8/+W77W0Kr8FlrAHcxSZrk1870/zWWKyLFeunfMwU+XajYaqMoqK6U/I4IUmw
         5C9kE70S8OD+s2AeMN1ZigZn9Srdy3i8ojWrTjgtKYFRoyUnAbUi7WWt5NTNktYz0k6b
         A0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779880692; x=1780485492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8p4VPUTVkx8Bgu9uxt/nQ7yvo0tDR4nGUc0FGCSoC4=;
        b=jINGRzuUbfQp0/mZYr6SSN68f9FG/Sm2EH221Bv+y7x+/QRHzOQFLoDMuruzJU7KKN
         xT6P2V3Bru2kxoyHS7c447mIiroIN1y6Cj6WD0fcawlKHG5yEHo0OAOQpHpClvKiVjrr
         ZuvSQd2OKZBL08k+6+QGanfNcdJ/zqEDdbc29ytPbwNLymPXKpjblr9s7uMD/OgXVKge
         bbZOGs1vzhlqO5NaoblVvYWRwchbTE5kqT2FIdPANcE+1n+/00oQaM6dWNC/gHrcDDjR
         XReI5DOuy7F/avWNtgiMxtcETxgPSQUMtQD9orXDSDmiM4RWWMwI7iyw4WCKZnsnjJ2P
         jR9g==
X-Gm-Message-State: AOJu0YxSjZgwOr6cDQhOaXIyxM8zc8HV50/j101h9QsYe+34Kvg4T9MW
	Bzq+zfsyC9DTE+6e3dBZDvSqcvUWVo2zx1mmjTzo6pJD9bViqRkRA6sz8zsC1nDK
X-Gm-Gg: Acq92OE9ewJperIlT5lUGDBAIBYX2j+uOCyvwy6Dw4ekjSybZDsXcu5YSZ7K3avPvIe
	AyOOW+Bb8YmZgZfsSD5ujtrD7WDV7ALEn/AVQEaiY3/44a6OKKGyTMCBaRRfjo6phaER6TR46wm
	kaPr5nwv2odwUgKC0gi5ckzqs9fEBcfgwDo4Az0TYTfgWp0nppQIVHAyzRaiyvAAbwQxrbeYx16
	li0Y/PpD0f7na2095oHT0yyg9MsslOnkWWUYDRGMJEqyk6ox0laziUj8e7RxUn0T5Cq6ixoEQ03
	eOl+V7R7vu42kTxgpVW8YNkV4Yzfg5sFGKY7d1NfJyTJIEKWrv0Cf3BEGcINzfpkD/f6mDNrpX7
	Rwbi5rdthpKrNX/+bDZl1oC3srHbWYClyQMbLtSkfZpMZObIRpUYJdq69vmVf44g7ke1LS3s66T
	FG0A3f/SS4LvyUvNVOZfWCTXo7GndE34JwvJ5EYFljlJWkPBUieB3AOFHp
X-Received: by 2002:a17:902:e745:b0:2bd:158d:299a with SMTP id d9443c01a7336-2beb05cead8mr246671605ad.25.1779880691572;
        Wed, 27 May 2026 04:18:11 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.21.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b9fabsm192079475ad.23.2026.05.27.04.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:18:10 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v4 1/4] oe/qa.py: add check_uri_srcrev() helper for SCM URI SRCREV validation
Date: Wed, 27 May 2026 16:47:53 +0530
Message-Id: <20260527111756.1306022-2-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527111756.1306022-1-saisneha196@gmail.com>
References: <20260527111756.1306022-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 11:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237642

Add a shared helper function check_uri_srcrev() that checks whether
a single SCM URI has a valid SRCREV set in the datastore.

The function uses unexpanded getVar() calls (False flag) to safely
inspect SRCREV without triggering AUTOREV expansion or live network
fetches. It mirrors BitBake's internal SRCREV resolution fallback
chain exactly:
  SRCREV_<name>:pn-<recipe>, SRCREV_<name>, SRCREV:pn-<recipe>, SRCREV

Returns:
  - The revision string if a valid SRCREV is found
  - '' for non-SCM URIs or URIs with inline rev= parameter (skip)
  - None if SRCREV is missing or INVALID

This shared helper is used by base.bbclass, insane.bbclass and
yocto-check-layer.bbclass to avoid duplicating the same logic.

Reported-by: Yoann Congal <yoann.congal@smile.fr>
Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
AI-Generated: Developed with assistance from Anthropic Claude
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---

Changes in v4:
- New patch: factored common SRCREV checking logic into shared helper
- Eliminates code duplication across base.bbclass, insane.bbclass
  and yocto-check-layer.bbclass
- Uses for-else pattern, f-strings, simplified name lookup
- Adds docstring explaining return values

Changes in v3:
- Added AI-Generated disclosure and Reported-by tag

Changes in v2:
- Initial public submission
 meta/lib/oe/qa.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index cd36cb5070..3505e2492c 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -240,6 +240,36 @@ def check_upstream_status(fullpath):
             else:
                 return "Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines)
 
+def check_uri_srcrev(pn, uri, d):
+    """
+    Check that a single SCM URI has a valid SRCREV set.
+
+    Returns the resolved revision string if valid (including '${AUTOREV}').
+    Returns '' for non-SCM URIs or URIs with inline rev= parameter (skip).
+    Returns None if SRCREV is missing or INVALID.
+    """
+    import bb.fetch2
+    try:
+        (scheme, _, _, _, _, params) = bb.fetch2.decodeurl(uri)
+    except Exception:
+        return ''
+    if scheme not in ('git', 'gitsm', 'hg', 'svn'):
+        return ''
+    if params.get('rev', ''):
+        return ''
+    name = params.get('name', 'default')
+    candidates = [
+        f'SRCREV_{name}:pn-{pn}',
+        f'SRCREV_{name}',
+        f'SRCREV:pn-{pn}',
+        'SRCREV',
+    ]
+    for candidate in candidates:
+        rev = d.getVar(candidate, False)
+        if rev and rev != 'INVALID':
+            return rev
+    return None
+
 if __name__ == "__main__":
     import sys
 
-- 
2.34.1


