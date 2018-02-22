Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04F4078709
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 12:50:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t3so3686752wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=n6d+MIDPBQeMGksu8fiFbPYy3gVBapSHf+6qSNhN1bg=;
	b=KCoPv29nttrti2g0ZDEhN9m87BBQPUe9ziXfPmNq2vBohQtsR7fx9Bmxg3dR6BkqCr
	wR4WfDTddyGHfMrs0SC6kZ4TLdqBVPbECruktAKH178tFoFUfMWTpvFTvUf3+HROd1Ui
	vi0UrYRwcsVpSvKtzHXmafFPkKDM1uvufHiDgPAj3nXqjmClinjQ5hJ5zaNoC6N+YZmq
	9mUYkmx3RUJQSgwj8o7ZQSvZsmd9LK5YbsGDWWEjm3jNkDqO678YhZ4l/Jn6X3e/fwGd
	8S/IdRX22DFIlaKA2MSbHA/GWMckwz2ZyX2Y3/mXeAWPN5SwffYOCKydGCG4oIMgAMHO
	1Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=n6d+MIDPBQeMGksu8fiFbPYy3gVBapSHf+6qSNhN1bg=;
	b=fbGsHqDQWZCO8Y1h56ijrFD0ct2kVZk3SNjdTgik8zfE1dvGZGZ/0/Tv7phstLWpOi
	pOExL66Kwf8i7z/kDfd/1Nw2OezTOVzf/oGg9qP+GsnrL3eg7m4hdkvxkg289OeslFH7
	XNp/CBMeThGK+L5nxLyujWl2smrluWEqgtdzxUJfO/Yc7bO7T24Lt7QrvcOEajATA6sH
	hw55JRQAEkqyaneF/JwL7PB6oUe8ilBuVR7Arz1sV1ngNPDJK5anWYLQrNZc+z9e8MDL
	qFU5mq5kd21gg+aXnuQfxwlFw14TNn4QyZ70Il5hDHIYGuHPwOGXk5wA2YapLxBFSKAT
	Z6tA==
X-Gm-Message-State: APf1xPDZyU8LEJua2mgx3G0KeQpP2UbJ02YrzR3SDulFQzpPJE0kvCMQ
	HYu0eyPgyK0VvA487SK+IhfBlIAq
X-Google-Smtp-Source: AH8x224d+ckj7ZHFhOs24YfJOVQMR1PiBIt/D9mbFkZ1oe0Vm1lxn1IYWKdakN5NvQ2QbeKjMo60Xg==
X-Received: by 10.28.186.66 with SMTP id k63mr4566940wmf.156.1519303814544;
	Thu, 22 Feb 2018 04:50:14 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r6sm21719wrg.63.2018.02.22.04.50.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 04:50:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Feb 2018 12:50:11 +0000
Message-Id: <20180222125011.21571-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] sstatetests: pass the right files when comparing sigfiles
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
X-List-Received-Date: Thu, 22 Feb 2018 12:50:14 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 67356942634..7b008e409f4 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -526,7 +526,7 @@ http_proxy = "http://example.com/"
         # this is an expensive computation, thus just compare the first 'max_sigfiles_to_compare' k files
         max_sigfiles_to_compare = 20
         first, rest = files[:max_sigfiles_to_compare], files[max_sigfiles_to_compare:]
-        compare_sigfiles(first, files1.keys(), files2.keys(), compare=True)
-        compare_sigfiles(rest, files1.keys(), files2.keys(), compare=False)
+        compare_sigfiles(first, files1, files2, compare=True)
+        compare_sigfiles(rest, files1, files2, compare=False)
 
         self.fail("sstate hashes not identical.")
-- 
2.11.0


