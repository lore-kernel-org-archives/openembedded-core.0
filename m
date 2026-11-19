Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12661.1795089610538685581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 04:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gT0TM09U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491d1f66968so182967f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795089608; x=1795694408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OKrgc6Bp2uErkp5ZNJeMwk6tZDC2FXfFQXA2z7LATU=;
        b=gT0TM09UVh/ZkbxbT9BVkpQ4ytbUifaZ/PVmd3WYBN3/lIyN036Fd5+rgjWxyYfpTn
         VQscoC5f9RIFWFU2NVJWK7flRjFQD/E4OoECBhnmp2LGKAM46foTE8lmb+ZGrjxx7bcP
         5mCALj1e+IsuSTCZijWxzwGleIu/XXWMV3Vqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089608; x=1795694408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+OKrgc6Bp2uErkp5ZNJeMwk6tZDC2FXfFQXA2z7LATU=;
        b=TMrUlBCTfIEk92KGlwbpzj2p1hsKFAIyikyLuq0HUC8a51jhxeIz+TWI8osAHDFP+A
         Zc30kEFCiGTV23shktDQqg3dCITNMOvh0OQE/pSWwmdYmVCmoOQgOCoRZjKfLsKPD8u2
         3/YlTUxTVmXQ4EIwSk+AUUpLZ+xnITpGAo/9hZRXzq5zanUWIT1ErvEf/WL0mMztU3nA
         vqHmZ2iGEncXnK0r14A1Lo0IHrWbXyUdedWxVVPeESKFQNJEv/uX7AbdPTrHz1IzueQW
         NOcCOTg7Y7dbx1ZtqH0jU/iXGYut3lhyf5I5/Sdu7OQ+6kYFc2p18zTZAgDgZmG+fgqr
         ja8Q==
X-Gm-Message-State: APuU4Z/wzVJWBYSmjd6/808h8knRPrixtKC5SMmJCzGaVB35JeSo7kod
	v3RmHYCvJgro6M1n+d1N9QsEUbyHGWQ44Ry/osUUd1LZRc2FM1cGakjdQBptuNgjQi/mkTYgySo
	kAvh/6K0=
X-Gm-Gg: AZFdTZd1LI7OEpoKa4ojbU/ozceSBHeEiDFIkkADRIjE4oRVK01rTHFwrgANpRtIqpy
	p6dJbwCAJB8xbSqco8do4C/zZUi/pZTnX4uphqMoCOgbdLYT4brMEI94vr1Neuwjzo8iLf9AR2J
	yijGavwl17VM63A7MbYciBdZA16zefqeD4Oe9YANRPFbyfaSiHw14LCFQ9uU7FHY73yeqldwZrr
	hxjyISDiytZpEse+qHOi4LivZraiRQn9ifx0XBszYSKjFd+EVbLpmmEwAW4kJCE6ImFYcApWI98
	wZE8KKwA265QZI4L2wWMd6g5DVh0Y1mceJ3opEUKNUkMBKA01JbMtj9lrkfnf+0JCVQsOxply4x
	qDfGOn8eQR/8SAguvCVXUVnvM4zlYWOAkuzK7e11B9Qbijz0BTrn+ZMZHHJDHVjS/i9tGuoPVb7
	3A++qUZcqyupsOWtDd+A8K+9VoB4p5MVoS5PHlrqoE0WevVJ4PIyq+VM0RtUVcMazlLL3y31LsW
	/WBsZ61Dq0psFzKK5KdlIAluiSmFeDItEPLZtAc/gC6EPeiKGJJ+aCb4EHuzMUdexf37H7LzIss
	eKPFnQpaZL3Qp9llbaAjvoplR93eONDrqt/0Mjdra47eA77xZiAioAoRUA==
X-Received: by 2002:a05:6000:4812:b0:491:49c2:3b3 with SMTP id ffacd0b85a97d-4a63bea7c57mr11900168f8f.51.1795089608291;
        Thu, 19 Nov 2026 04:00:08 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:638e:5650:6a46:d2a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65683d5a2sm10676423f8f.43.2026.11.19.04.00.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:00:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/utils: Drop str_filter and str_filter_out
Date: Thu, 19 Nov 2026 12:00:06 +0000
Message-ID: <20261119120006.22357-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250662
Content-Type: text/plain; charset="utf-8"

Nothing in core uses them and we have other filter operations now
which interact better with the datastore, drop the obsolete funcitons.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 dev/null             |  0
 meta/lib/oe/utils.py | 18 ------------------
 2 files changed, 18 deletions(-)
 delete mode 100644 dev/null

diff --git a/dev/null b/dev/null
deleted file mode 100644
index e69de29bb2d..00000000000
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index caa4dd43016..8fa40da2d11 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -198,24 +198,6 @@ def prune_suffix(var, suffixes, d):
 
     return var
 
-def str_filter(f, str):
-    """
-    Take ``str``, as a space-separated list of values, and return a
-    space-separated list of all the values matching the regular expression ``f``
-    using :py:func:`re.match`.
-    """
-    from re import match
-    return " ".join([x for x in str.split() if match(f, x, 0)])
-
-def str_filter_out(f, str):
-    """
-    Take ``str``, as a space-separated list of values, and return a
-    space-separated list of all the values *not* matching the regular expression ``f``
-    using :py:func:`re.match`.
-    """
-    from re import match
-    return " ".join([x for x in str.split() if not match(f, x, 0)])
-
 def build_depends_string(depends, task):
     """
     Append a taskname ``task`` to a space-separated list of dependencies stored in
