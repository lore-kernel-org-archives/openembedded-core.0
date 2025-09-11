Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF2FCAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 20:36:24 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.7736.1757622976928211984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 13:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZmHzQoz;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0473327e70so195713066b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 13:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757622975; x=1758227775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbgfvM7lQKdkByLYOE8P3y/su3QKbSrcyiqqUhljBWc=;
        b=IZmHzQozUMB6twfNpY3ulDFGNdsYCS2nrWxLk1Dr+fIxc5eRisObSvINQ2+C3oqCC1
         ICR18wvcW69Zzu5ebM/sB2xWi2C/cW17uabnL3X59RfpWInNR39Ixvg6NWxpGyMd8Mb0
         RUiMFyjt1TbtEbtjOX4N1maVVieGg74/0tGu18fHBfYcTEAqzyLPLIOnJgFvfKEKXaPN
         gkpdVYRnqewYe6kloAmk0q+eNRA0ZLs6sFUeJATORqPX/zJZPkhuZvedOvAgaplJvy3b
         7xMKn20VWGEp2kp7XctlBmJO+NQSgF1mZdqW6b/orXRIqkBiqKKJaM8TqvIRg728fAvd
         O7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757622975; x=1758227775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbgfvM7lQKdkByLYOE8P3y/su3QKbSrcyiqqUhljBWc=;
        b=wIRyC3q+uW6OKRScJ4hbLDL48cmyP7azdv860OKUxYOd95GTwCNnSmm4DOh42Vtd2u
         gC/eTrCix40JhKWcBqY50XFf4tqkrVN5t/rxErK5f9YA47vrG28V8yBr4gWm3NfSVjFQ
         vUCkEVy/6yVGpH2AIIuCjL2iUk3XNbFMxsAmtSAKoa/1NoKCWDfn5MjKQZHF+22gYDdL
         zn7xWzkXVXsjXvyI4DkGwqQqTbgmR0NFYP7UnF4Bhok3tJmjZGZjHgH6afizSHkJWMZk
         TYrHtEXc6cAO27iRq6Mztwb09dhQCOqsYVN0+vxLzonUM2ATBMpQvkQR/j/+6d/EroaT
         3V8Q==
X-Gm-Message-State: AOJu0YwdKD2gELkcJjN5+CO2jmS57fvL/TsajdiH5muPcSiVhwh9bCmr
	8/i/jygT8jfZE/zu2WULzHgWvAcgktKSFToEeUtvp9MitTt8aJ4L3xXT/is1rg==
X-Gm-Gg: ASbGncsryVnD1ef1FyEusqPpStyrVSKqrU4J4S/sLNKiKBYIBHaI3ACVg5zpV/Ynju4
	ot4fCNRRDTcXnQksH4kbA/UXX0ROcCw9Q5HhY4jnOMZ+4NrZI08DSubHbTVDaUSxrQFLJaEQKWv
	jZGMMj16TbumshmV2doT2HJkZg7iZ7YR9MKbM+rtPo75TXCvQW36dMwOs5GRhgrALhV6lCvu9If
	nmDM4t+0BK8tQ5i1DN42vnfYOkKmd+I0DXsOf+CabCVzVDi+HUDYKm/5GnBsTiH1DI80MkUDUCD
	LEY3M5B2Zf9U8TEGLY19PDEhdo9Dq2CZXMSgcXu/AGQgvkixJC6ktJH7sYYxTE26AcgE4bCuZJZ
	Vu+YZ9JmSRq95+F3hL6gcSGPdJomYrpQ=
X-Google-Smtp-Source: AGHT+IEFe5E4LpJWpbj+HrJXgxojFb6hmn1DnrefyDVt5YArIXWOK5tjhpsCS+sWlDqeyddpwWtzlw==
X-Received: by 2002:a17:907:2d1f:b0:b04:9460:c4fd with SMTP id a640c23a62f3a-b07c382915dmr39001066b.33.1757622974953;
        Thu, 11 Sep 2025 13:36:14 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334ed29sm200429866b.107.2025.09.11.13.36.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 13:36:14 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] babeltrace2: upgrade 2.1.1 -> 2.1.2
Date: Thu, 11 Sep 2025 22:36:13 +0200
Message-ID: <20250911203613.3568643-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223295

shortlog:
src.ctf.fs: be less strict when encountering trailing byte at the end of packetized CTF 1.8 metadata
tests: add bt_test_cli
tests: make bt_cli accept non-positional options
tests: bt_diff_cli: don't pass unexpected extra args to bt_diff
tests: remove unnecessary nonlocal keywords
Fix: Python: set local typing version to that of 3.5.2
Fix: Python: missing __contains__ method for _PluginComponentClasses
Fix: tests: Add explicit items method for Mapping compatibility
Tests: sync normand.py with upstream
Fix: tests: Add explicit __iter__ method for Iterator compatibility
Fix: Use local_typing with Python < 3.5.3

ptest results:

1..19926

DURATION: 127
END: /usr/lib/babeltrace2/ptest
2025-09-11T20:25
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../lttng/{babeltrace2_2.1.1.bb => babeltrace2_2.1.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.1.1.bb => babeltrace2_2.1.2.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
index 945f82ef34..b0cd6efde1 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
            file://external-python-tests.patch \
            file://0001-src-explicitly-only-build-shared-plugins.patch \
            "
-SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
+SRCREV = "d0e946a71faf5f0c2d7f1fb5b92a369983e9cf10"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 inherit autotools pkgconfig ptest setuptools3-base

