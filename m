Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0588FCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:29:59 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18782.1780381793302632148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bRU6dVZL;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: saisneha196@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so1411716a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 23:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780381793; x=1780986593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksnDEmbb2W3adotJdi1iGKHqYcwNeFwqrHEJVUtQ9F4=;
        b=bRU6dVZLwMR8E7xPnWVvG8zmvz0udoK9RuwZ85ZEAaRTZloXnigg2YNLVFBnMuhqWz
         AEQ3BwOZgMuwKhvcwKpuamkOa9cHrtzt5AmS1iAdU9WjWAWOWhsyMNsySGDeFYF2rQH5
         e3fWI7fX4HlsJcv4cROXrw7amKLudjJfLuJ9YNkF3845VFC5pDSv1ss53p7SNW828unH
         WHSISH0Nx55TaMGK9bYVKyKOeem14ROh2DJDp5t7SL1BOVybthbXBkKtJsGiqMXRYTFX
         Jp8iNoFWxZXw3w3H7xgF9PtvYTF19An/ESymY9dCDSoS+cBN+eSTmCMLyOidKDu4Qn/c
         9XAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780381793; x=1780986593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksnDEmbb2W3adotJdi1iGKHqYcwNeFwqrHEJVUtQ9F4=;
        b=jrwn5CtFFWy9QFzCHURWfsMK5IwvsHhM1CW4eeRQ1/UL2BSal87TuU0BI1Ll+gVGM+
         ffA/Yn1xG9qPP4G6zmPoZN1fkDjKF5YHf0q6zegpFHmc/shR6BXDOpzMbED/rrX/5RsV
         4FULqGfsgT8TKYx0Tl4ODSyv2p1VkQ8Bfh2OwiJOc+U/dLoAh0wkqFRSbi9Z4qqeOlwr
         A+dKq/NN+Ib9neAA+nQ6f/mPu5nAA1x8726Q4lA5fHTilJVHUd+KTnjwua2n4snJzJoX
         u1EQsGABh2JHDXkIDQaENNdHXI4Qgp8+t50JtnBEWEyHE80acxMIq1hYXnwP20xJtPiY
         54pA==
X-Gm-Message-State: AOJu0YxSfh6Fm2+vA9aQ36kxVxTU0VAghxwEE1bHXRvIFQsfNiZWUznJ
	hW/6KJUfkOA09AS/38xLT4fcw58cqMBIQi1ACaITOF9sCbCFwGN+bb+g9jTMm00C
X-Gm-Gg: Acq92OE+UQowWZJTOXeQt/z5sJZMT4UDXuUwFGpomUeyKtpUCcWZ+6QmtFtbCYIsaiw
	p7HhTrXB2WpF3cuYnFqm/aMjkPDIOB2J53ZYODCGKwPrDj78+6FsQyNz3AAr2zzEVBFIx6FBk/d
	Amzdt+SO0rbLemgKp1kBXgeKCSoyEpdpEoubr9jdeylK75P05dXMjNIw4BiXVfz7jNuAFRoEroB
	cA2zjPRl74zUd5t4mHLac+VYK8Gl3RTJccwZXHj88mXFHXb8gAwGNElmay3MTmJvqrjFqY2vFRC
	iH0B4NKm0QcXI5RHZ3hFX54cRWhWXYvpS/Q2+s45aPrAiK0vrCoeDfOaBiGtskFqEpapg8xTnP5
	mvY2CpZOBrdud8567JWpckP6p0pygXQzaZS91HtF3suWeu7EKrEt+I9wB6oTqxD5r7jXZ3gIsfh
	B8xED8+NxuseSG73LjzRABpYuK2vWdGRGjIPAZ6xaZu1UMrC+LJNm+iOVC
X-Received: by 2002:a17:903:1905:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2bf367c8d3fmr166483965ad.16.1780381792541;
        Mon, 01 Jun 2026 23:29:52 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.118.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm128280255ad.76.2026.06.01.23.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:29:51 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v5 1/4] oe/qa.py: add check_uri_srcrev() helper for SCM URI SRCREV validation
Date: Tue,  2 Jun 2026 11:59:37 +0530
Message-Id: <20260602062940.3107241-2-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602062940.3107241-1-saisneha196@gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 06:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238001

Add a shared helper function check_uri_srcrev() that checks whether
a single SCM URI has a valid SRCREV set in the datastore.

The function uses unexpanded getVar() calls (False flag) to safely
inspect SRCREV without triggering AUTOREV expansion or live network
fetches. It mirrors BitBake's internal SRCREV resolution fallback
chain exactly:
  SRCREV_<name>:pn-<recipe>, SRCREV_<name>, SRCREV:pn-<recipe>, SRCREV

Returns:
  - The revision string if a valid SRCREV is found
  - '' for non-SCM URIs or URIs with inline rev= or tag= parameter (skip)
  - None if SRCREV is missing or INVALID

This shared helper is used by base.bbclass, insane.bbclass and
yocto-check-layer.bbclass to avoid duplicating the same logic.

Reported-by: Yoann Congal <yoann.congal@smile.fr>
Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
AI-Generated: Developed with assistance from Anthropic Claude
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---

Changes in v5:
- Add tag= to skip condition alongside rev= to fix selftest breakage
  (test_git_unpack_nonetwork) reported by Mathieu Dubois-Briand
- Update docstring to mention tag= parameter

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
index cd36cb5070..0987aaf2c4 100644
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
+    if params.get('rev', '') or params.get('tag', ''):
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


