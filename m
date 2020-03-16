Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id A950860214
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 19:06:15 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 3so2625327pff.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lEwzYr+e/QrbXMeKj83XYP11rwJCy76BPOxjz82RUmw=;
	b=lrLucS36gznwBatY4qUDdSxve/DcK16ln9XnXLt1FPZtGwF0FdxjWEA/UVqMYuzRaD
	ffsHS59kujZdgwOiv5qhwQOqKTLdRGADBDJEkVRCxhbWIHt3AH4xE5s7jN3F2Foc3fXK
	ZZEoMvX17J1lpeCNs0YYLqdTms+vseOixaULTN5QtovlNYu8L2rURqLnwC9gKaflbSPo
	XWH7q2tnPoMSINCqgCrO9lK2LMGPd2Q/1D6AMQ9ml7zBDekUNtTA5GytP812Na3Iqrol
	Vw4ZFRDUpCVQFGv2+GtnEOK5lod2q/dRzqD9RiD8Twig+BCKjgEM9xvWegVB0jsQHnfb
	dFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lEwzYr+e/QrbXMeKj83XYP11rwJCy76BPOxjz82RUmw=;
	b=OvifAN59/EpaWun1278d/t59BEX4VJjktvRyutayAiadOikjVsPh0qAnI0Nw38wrTA
	RNFZ0guMZPmDwwUTncYxSaXVTuRPl2GsUBZftjUFSU0W5WaJOWWfkJ6eawRQnHQvy1tt
	1zUjGn4c8lFenlovrh6ao9rCdK2Y6ZjFLqROFD3vVs8bhK6JRHQxY6v+lCBmtqgP4s2e
	NQlqkMMEhGXL/iJHyg2Cll2jI+0wAkAi7fXPaUxx6NcyP/qkvfOFYzRsd9SmuATY2Fgj
	2gk1bZNVGVmsr3Co3dwScg3bdP7JRs3bKkutLqf0RBZmKye0OWq2KcN/YaVjIFp7ldfJ
	YzDA==
X-Gm-Message-State: ANhLgQ3V7TxbCo7mkeyKdZ2JVdWHqezPg+Kz3zVp5YhTDY80E2WNo+TV
	831hXVazeRwUZP6Q+k5qeDyvSsyzadc=
X-Google-Smtp-Source: ADFU+vsVag6HRvAlJ92VZX7a4pQzuR5xEu4CZsDZsOHBXkS8GnNT7pcYgv9KS8drbxeKtGDjta4kog==
X-Received: by 2002:a62:7dd0:: with SMTP id y199mr1038684pfc.267.1584385576157;
	Mon, 16 Mar 2020 12:06:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::593])
	by smtp.gmail.com with ESMTPSA id
	x135sm282640pgx.41.2020.03.16.12.06.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2020 12:06:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 12:06:28 -0700
Message-Id: <20200316190628.19383-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] oeqa: Extend parselogs to rpi4
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
X-List-Received-Date: Mon, 16 Mar 2020 19:06:15 -0000
Content-Transfer-Encoding: 8bit

rpi had additional diagnostics which should be ignored [1]

[1] https://github.com/raspberrypi/linux/issues/3195

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index cc4f5f8c78..48712d4dac 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -183,6 +183,11 @@ ignore_errors = {
         'Failed to make EGL context current',
         'glamor initialization failed',
         ] + common_errors,
+    'raspberrypi4-64' : [
+        'bcmgenet fd580000.genet: failed to get enet-eee clock',
+        'bcmgenet fd580000.genet: failed to get enet-wol clock',
+        'bcmgenet fd580000.genet: failed to get enet clock',
+        ] + common_errors,
 }
 
 log_locations = ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"]
-- 
2.25.1


