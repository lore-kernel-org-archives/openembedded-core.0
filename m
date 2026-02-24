Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED840F357D9
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21697.1771943599836504482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I1YXZ4hk;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48336a6e932so34615935e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943598; x=1772548398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Get/K8Ad/0gkC/fRTNSZS+7nqdVV69GPFf9GFLam5Bo=;
        b=I1YXZ4hkcnXleu7NrZkbrGKr6T5STB6Qj8h6zVxC5Dfr68vcn5rQG9Nk7xcCzy/L2u
         SWAUX4pWYj8ylh0k7YW7kjvXW29/Qj/+5VjeWkfGO/kSH9RHME+1//Oc7t1w/eJI9Br7
         dgsM2jJ4yoCH4vI7iUuc7JBVKh1EstGqeYN7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943598; x=1772548398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Get/K8Ad/0gkC/fRTNSZS+7nqdVV69GPFf9GFLam5Bo=;
        b=dQAn7Gruoz/87Pp8kUdk1uu39TLWPGrStDavcydeTJVjJ6hTdgg6H1wFwuMiuIENBW
         dGszlEr2i3iyzz/XG0w8fcsheUhpDxJRS9zH+vmO9J6fwy4iQF9QXKFTQ9QMPEN/75IY
         n2xja6dgSNZFiddAUFKTMzlZQRSQPYXZ7/d5kD9/4p8R/Cmlgp8T6q7Yamh+q301l6PJ
         0QZXL8HjDs6kWnX7ChN5tChBzqTrWEvfewjfgl1Rz4OrV2G8AYY2HoGi4equoAe0oITo
         lvPzpaiLs0pFsTJhpV3MbW9JBmoj9D8mOFRGajMDJ2ON3T66n+j6WThPri+WL9RYl1Zx
         v7kA==
X-Gm-Message-State: AOJu0Yze4GFx1Rz8ZPATo9YOvTPHK3Zh/K0K8wIXs8wFroVcwyRB7MrN
	Drp+PGG/ZsYvFxwcZ9VCoU+zMJ1ezE1QsdLvkTfv4Z53PVNTNcPUk9h4JKICcHAXk4HwrQVqHGe
	GJ9+o
X-Gm-Gg: AZuq6aJ0ujAqdVddsudS5CyY0Y7Q5Wxc0l4d4JP7KJqBdJbaD0Z5iNq1rCGZjDmnVNH
	0l0QnPl1P3gEsbDpHv6c0A1xxisDycploLXF8t7Ns/MV0QZhqzKRxEKtiC1J0nu/fYSkVj0oFa0
	AkA8aQoaUzEeAiCWc8EQPIY+mA0jn85hGIlFt91NlMuRfGcQWBXRKx8i8yVUnIsqQtmbuX9v/cV
	EIiGZaAMdEbGaigWWE9A6JRAsyVG4iMbX53hrAloqVJu6wOELKzBhOH2FbipalpKpEttd1+vDQG
	CGTm/1uS9aqtvXiFpbsslcn8xkfNF52LgLlhw1uOWBJSwKyWHmEGAKTb1GyXhzhEYUawLr3EXjM
	T747NprHZykNg8igk6sqIkaHqBJPlkp85ZbN8PsW1baCtGt79amIlb/Adx8sDXrCTGbjiQN5hyI
	xon3zaoWXdUpsUmkVbbD5HfYIRYCqJ1F2EKBdBVYQ4FGX2we53taeXaK/jtLxeK0NFfBN8JPh8c
	l/pYZVmKAxzp5aAoCK4t5w9IhqcjX6dEg==
X-Received: by 2002:a05:600c:468b:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-483a95eb55bmr237582865e9.5.1771943597926;
        Tue, 24 Feb 2026 06:33:17 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 41/44] ffmpeg: set status of CVE-2025-25468
Date: Tue, 24 Feb 2026 15:32:09 +0100
Message-ID: <cd61bdef7057dc2097361c98ba4968a4e4f9d343.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231848

From: Peter Marko <peter.marko@siemens.com>

This vulnerability was introduced in v8.0.
This can be seen by blaming fix [1] (linked from NVD report [3]) is
showing that the return without freeing memory was introduced in [2].

[1] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9e1fb887e2fe8dcfd4b12e0efcd
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d38fc25519cf12a9212dadcba1258fc176ffbade
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-25468

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 03ec637ddfa..eb64b5c8d59 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -51,6 +51,7 @@ CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
 CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
+CVE_STATUS[CVE-2025-25468] = "cpe-incorrect:vulnerability was introduced in v8.0"
 CVE_STATUS[CVE-2025-25469] = "cpe-incorrect: Current version (6.1.4) is not impacted."
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717

