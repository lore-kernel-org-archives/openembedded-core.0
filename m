Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6495.1793052478503158602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 15:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N/K3WfR0;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8490a7d6696so2103187a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 15:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793052477; x=1793657277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMkLpQjVjjAXJrfKMONZDAAGMa7b1SR2kwQPZq1L4zk=;
        b=N/K3WfR0vLjs+/kCciUCoALV/taVK52QRTTBJx6uSos8qepcjbJ8OQ9aivEpfSWyou
         +J8uklriN6kXgMbfX3cdZzdW2DQtKXFQCoH6I767OTABjc8oEHQuD2Ud1IsPqf8zoEvo
         uAXkQJxgJiZEeWVeVpbwFnBM7dcfqo232jM++yJazPByyo5rnhWpCitnPcp76R8gzOyT
         9v8MqunWBo4IrCWcMjcpxUF03I8skfaNM5om44RdmYFTiZ+52U8jUoq+OCiwma7aQaLf
         Vuj3Xj5W7dnQb5aGS4DUHa5KwS/aO+8R953iBIL+1l3Rdimy9WnDg4vNRieRXnGf27cZ
         3JFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052477; x=1793657277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMkLpQjVjjAXJrfKMONZDAAGMa7b1SR2kwQPZq1L4zk=;
        b=Ajhdv9k6gJTtjT1sw3+ghtBPb7MzUSgk+2zUcOOBWIa2NVE7Po5bFeXTap41CrEogl
         ts+07Bf4mxinoNoOXJ1xWjr+5eD/BwCgKCVt9xrKt3PtR6Y+wq9yTctAREY5gT3PqYD7
         1I97t86KkLgBX3LVFaaCVUJtSESw+hkzGOWEjMU9zeBBAPl10hkvaQwofg2DxJsdfY8I
         i4PoezLQnYVJkOaLP6WV3Or2xXh02ynKJxYK6LEjsEivWJxpcGRo1h/dyyAVKsnZZkvb
         7qYojl0dxaiydj+1uBQOQ2h+yo/dWv+tXwaThcFyvhj6PYb47VbiEOcRDwBerMtjhJlI
         /r/w==
X-Gm-Message-State: AFq9FYI7FKL1MXNXsX+kZgFbLXAheHOY+8DbaaBHl27q4WD+F2+0wuub
	DZ4adiH+/sX4ifr45gEKX3iFdhtllp/vWtqChgnXyXDYkDUw1y6+ibtCLAmKMQ==
X-Gm-Gg: AYBFou0D3XilvVY0DKS7nx7gxkyioqLV8CoaZXhxZk8zpJruqWpfE/rrLitMYNLOmFz
	NFkPI8KkDk45u5/gyr7WmFFLsufHCfhf82zaeuHrJvzItTm4TH57lvfm9qlsadNc4oQATepc8IU
	UMU4UeeDyjFGnviUfmkZwtnFxz7XPsyE8Ukef/N5eK7opB6JIp2Iuyhw+hXPfDxATbBQS0ryrA7
	g3BQePpGcHyxrb8KpNgjmX7zEL7pj0yAL8BxyHzsnUNTiMykIWoliQoUJAUmN/ehgHDynrh02wK
	aF9EYdfIlFKAUuamIvDIvN3WxU6dW2dsBq/u5GXPCvy3hF4sICWLJ3wIJTUTTxB5i0nvdbn18mG
	lWqArBB4kS/NJkNIqm7OfVJLzBenRSuc+7pVi7t4ZX+jT8qf+gAQnmbAX8vXiOIqWo3NN2uHa4I
	/hhg5UrW232tpNF+V/IeLv+ul9fhvn+GGq2T24grNnO5cLicrWxClzm7YPm/J5jzRcmhT+DroJd
	ek1iWbksnK2iW/Kd+qyDHG2TUJkN1bhqV/mx+2k7vBOX+EE3pB0Iw==
X-Received: by 2002:a05:6830:b15:b0:81a:9522:f007 with SMTP id 46e09a7af769-850fd189a55mr6835846a34.5.1793052477658;
        Mon, 26 Oct 2026 15:07:57 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0763easm9025237a34.13.2026.10.26.15.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:07:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 3/3] lib/oe/sbom.py: Split deduplication of CreationInfo
Date: Mon, 26 Oct 2026 16:06:35 -0600
Message-ID: <20261026220751.2480577-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026220751.2480577-1-JPEWhacker@gmail.com>
References: <20261026220751.2480577-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 22:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248704
Content-Type: text/plain; charset="utf-8"

The deduplicate logic has a logic flaw in that it was scanning over all
deduplicated items from previous calls to find_deduplicates(). This
doesn't make any sense because the types of objects already being
deduplicated might not match the new filter. In practice, this didn't
matter because the CreationInfo comparison function doesn't do anything
that cares if the type is actually a CreationInfo; so it didn't fail
when it was passed something else.

Fix this by creating a separate instance of the deduplication object to
start with a clean state

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 713eec92d4..e279cfc82b 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -1236,6 +1236,7 @@ def create_sbom(d, name, root_elements, add_objectsets=[]):
             choose=choose_license_expressions,
         )
 
+    with objset.deduplicate() as dedup:
         # Deduplicate creation info
         dedup.find_duplicates(cmp_creation_info, oe.spdx30.CreationInfo)
 
-- 
2.56.0

