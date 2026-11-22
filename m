Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37490.1795368057721194268
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 09:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kjK5xIsr;
 spf=pass (domain: konsulko.com, ip: 209.85.210.180, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1066272b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 09:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795368057; x=1795972857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaeW5Ak8tS6vwRI2sNgZEyuXUQmKElfu8yN4D2H4lfM=;
        b=kjK5xIsr3YfDwEo5xlT7yVQTv65HKy8vDJFlSuPDdUUUFuYvpds6gqeQ16wEQgQkyl
         4qDJwCCBkoNxyyFSTBoLY/UH8t70V7+WLrl1BgR8k7l6N0qrbbHTLd0mtTjROZ01F061
         g41TpGtlJpWKKBuanSFUjiMF/PVKGLCSd3eAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368057; x=1795972857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaeW5Ak8tS6vwRI2sNgZEyuXUQmKElfu8yN4D2H4lfM=;
        b=HtOqwP+sY3Ex0A8DqdL3YX78ZH9U5FDUswkx+ao1sjgpOQHFnQ0dkNPAD1c3wSvfQn
         kZ6/eQ3EcQa+7f9/R0M92UYdSnRMW/7ZORmm1ZWb1NC83erlTpDphgvCT7/9fwa9l2Ri
         XEq4dGJNohMLdGBzdKsWYdz4tywka9oqOX7uL/NRhpRqkMIPgCIr49AfroqUCM+6kX9Q
         +MD1fS1sbECnizYFl6lSrxqIa5zpQzcwP7lnZsxDlKlzaqj/L+CZa6RpDqbTHt0JrKPo
         F8YRXGbXKcNx6pXS68JJlUb57Zi2IjyAHI1A9zlDkZwVeAJD0Ft5xaHKOMssPMv6cPbY
         S9mw==
X-Gm-Message-State: APuU4Z/diLbWk9/YPlwP4gHzoknMMqcGu/PheFKEPN+z4Zcru9LZIozO
	O3yT2vVsAzQI/RYSC8Mu9wYma8S+jg3BeTQN4famkFa0z5cinJkyLL6LyCWSMzCq3LpLdvijIFi
	rzeAF
X-Gm-Gg: AZFdTZeYr1plPYJEC06wGgwdkvirEj7Qk1DJAO7VrkpckTeb9xi+KrulHwoSewrXudW
	tsGtpXX4KAIbP4B5Cjm6E5z9tAGKuUb1Ar5eztAWLCVhGbLHfCxlkREds/57EEBB11QUM05EoAK
	KOrfAA8wCEkRtURsrv9pylaTPfFob38kn4nbivNl235Of4g3iyox4fKIlv/7bXfPVkAdkvlxAro
	RKxEVda4S4hOctxiGDN2Q9BAEhV5EanTn15YIhICmhQr8LudFknoYoAOcgqLP3ALESwKsak5+nz
	3qJBvJmbxo5RDQ75pzxbS/3aUBo3kGtdW+uD0hDwLHwJVUnab0fshsK2RUfmdgc2MXP0qm5VakO
	sOn0IOnXKd+GY7o7c1n1rgMOXD7jWqD+8oL3Z+B4Ukw4MJ1BL7ZgRR++ZQ1hhZW+PXwGGqpYISz
	bLOF8ehgUJKPORMyFJ5mQR57ogahezAxsN9HkIzBikoje+LP9gx4K9H+88Ux6eP3oj7O6c+GRzZ
	gf34wOvtfpTZpMIIiYirH0MDQuFZSkZe4RxCdUyvrYRR8xraQtR8fBuKok/NbOaA1mW21deUAXe
	Olxg+TCfroncPKz6Mfal+2iaBOi839TLAhJg+01iU4Sl/B6DuRxyTdDFJXcR98ZdcqgSQbfhc5f
	PQmn1UiyPrBCjMmM834byTuLSXTOWuFMK07zQBrlKJV0AzjNW
X-Received: by 2002:a05:6a00:6de7:b0:892:d40c:4f7b with SMTP id d2e1a72fcca58-8c87bdb52c0mr8183712b3a.10.1795368056959;
        Sun, 22 Nov 2026 09:20:56 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:6b04:91fb:ab00:ec51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm4136971b3a.11.2026.11.22.09.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:20:56 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/3] python3-pyyaml: upgrade 6.0.3 -> 6.0.4
Date: Sun, 22 Nov 2026 09:20:46 -0800
Message-ID: <20261122172047.2161662-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122172047.2161662-1-tim.orling@konsulko.com>
References: <20261122172047.2161662-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 17:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250872
Content-Type: text/plain; charset="utf-8"

6.0.4 (2026-11-20)
* https://github.com/yaml/pyyaml/pull/937 -- Fix merge key performance
* https://github.com/yaml/pyyaml/pull/1010 -- Expose libyaml recursion
  control API (no-op on libyaml < 0.2.6)

oe-core has libyaml 0.2.5, so the new recursion control tests skip.
test_dump_load.py is still not in the sdist, so it is still fetched
separately.

Tested with core-image-ptest-python3-pyyaml on qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pyyaml_6.0.3.bb => python3-pyyaml_6.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyyaml_6.0.3.bb => python3-pyyaml_6.0.4.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.4.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
rename to meta/recipes-devtools/python/python3-pyyaml_6.0.4.bb
index 849e2c9cc8..a61f8e2279 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pyyaml.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 
-SRC_URI[sha256sum] = "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
+SRC_URI[sha256sum] = "e24bf71af8a432d7808fabff134d38dfe16d3cbb41f2873bb4b1e42422de0a1a"
 
 SRC_URI += "\
     https://raw.githubusercontent.com/yaml/pyyaml/a98fd6088e81d7aca571220c966bbfe2ac43c335/tests/test_dump_load.py;name=test \
-- 
2.47.3

