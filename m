Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37008.1795368055795780530
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 09:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lIBDqnOg;
 spf=pass (domain: konsulko.com, ip: 209.85.210.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b6b22be970so924764b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 09:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795368055; x=1795972855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDLdXnhSZprFF8NVPschyvvTn1Mq1QhH9UO7KG7Dhj8=;
        b=lIBDqnOgLUpciTdIRDfyEQZAw1ZOl3sr/5UwsIfC2jGUN+iZ3Zh1URSku5q0AdvmiA
         JM0Zgw7A45ahIuIB9/Evnu04sw2rvIfe5CeUf1X0Zg/4XzhxslHSe5gQqY4ojel+zyYh
         HIxxAQzHUdHdbhD7ikHLYhheSc7GfeWHRWn5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368055; x=1795972855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDLdXnhSZprFF8NVPschyvvTn1Mq1QhH9UO7KG7Dhj8=;
        b=raWlZAegcbasbcSI6gT4Z8tGLVLdzkcdFe2bLf3/anMbXkcDoTh5HVMotZgfoRw+L3
         oVPNoZxdyObAjfyjmmGHxAjaarVNIRW6884pfRxD8OFhG5i2iyquykzf/BPe/prUrmza
         Qc93UX/6K1SDBz8rB5J0VDkV8QG3q6gyXg4hnYlexW6wzxjN2Zp2siIWA+l7n8rrsm01
         5fG3O6+qt9zWXFQvL/GK26VCBLRcUHnbx6eRgUoAC343r+Bh8TKQo/ZWrEUYmZ4z+b46
         JnW7VdXoirpzDlvrGul6ze10jPFRWxyUo1xevg7Fgi2xLaoNtTB6drfPp1v1ak/H2M1N
         9fEw==
X-Gm-Message-State: APuU4Z9eMl/PUI/hu/VLB1WMkMuwlzaljAFI5136euDdwxx3icVm+xZ5
	HP6VUNnM7SE3PmMenFjT1TAFIzZgxXBE6YBXEP6cY7sF5CapcQgDrZ2qXQy4/3GzgjT1ixav2I3
	1GhPi
X-Gm-Gg: AZFdTZfJjMiIpYUsWC/i05eWk9gg6Iag0rDYpJyDbTrLYEnHY9Xtx7soAyX1wVYewDA
	BEalVfL5E6Fu+zylGvKu8uYAIQIe3x/ilVJGyC79jrqf813QqDgXX02yXAfVScvbHCkqPn+YfyP
	HS0oHrRTqEdBXsIt7pwUCcDuzuYRdiZZ1bwC87ye56kRNX0EB2q9Cb1+DAyxAlDbJTgg/NkOyyr
	xCFBpRwCQRxGpQ39g4ZqEzYphCe5TYtltTnmXrP2pvloQwRgPJf7vAWMfYBYgl0hPBKCJRHo9aR
	UREDX3GS99jvrN2jdX3jgGoGTejKabrbnOoJ7DF6h62joTNmEKB7cYOx0OYO32vnHQCQUOEPkJP
	1MUdHcnE/qPMfhr1XECGZTiEhMCS/RFc2fpMHkaqKh+PK8p8dfmMdPoHUB8OrRGR6q0JRa9WKrm
	FPHSoo2qIwKKNLWBrZh94qO8uD+wTZi46Zyh5pFAk6eHLY42AKTdwYYwueGmwDcHExoqsH2qBkQ
	HBi7wcFWTf6l6jWlqnbUMRjFMAjejKGgFRkYkuftRNaCX4/Bl+g4lonVaE8JEB6Wv8/ia+Vveq0
	T7ldFw91agLi68HcfzyiN1tmEZt424QKbtQJTu79HkWg+C3RdTXP799eARu1eEgcm7uMnuolXI6
	PuPaPmBb7yg5dDZUMhNyv9oLdS9k=
X-Received: by 2002:a05:6a00:a13:b0:89f:d9b2:4a1c with SMTP id d2e1a72fcca58-8c87c482557mr8663944b3a.28.1795368055116;
        Sun, 22 Nov 2026 09:20:55 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:6b04:91fb:ab00:ec51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm4136971b3a.11.2026.11.22.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:20:54 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/3] python3-certifi: upgrade 2026.10.23 -> 2026.11.20
Date: Sun, 22 Nov 2026 09:20:45 -0800
Message-ID: <20261122172047.2161662-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 17:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250871
Content-Type: text/plain; charset="utf-8"

Refresh of the Mozilla CA bundle. It removes five roots and adds none:
Buypass Class 2 Root CA, Buypass Class 3 Root CA, QuoVadis Root CA 1 G3,
QuoVadis Root CA 3 G3 and Certigna Root CA.

Tested with core-image-ptest-python3-certifi on qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...hon3-certifi_2026.10.23.bb => python3-certifi_2026.11.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.10.23.bb => python3-certifi_2026.11.20.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb b/meta/recipes-devtools/python/python3-certifi_2026.11.20.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.11.20.bb
index 29e213ef22..8b2449fb1b 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.23.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.11.20.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd"
+SRC_URI[sha256sum] = "af1cb240a8133f105aa52684a3a3258339d7f2fd0bd4e2812698ff5cf5588c4e"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3

