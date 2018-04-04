Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id B63247482D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:29 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id v18-v6so9786616ply.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XUGF7uEscSrLe7u9IlrUoPH8pvPSjONKM+xUhmJ/Ick=;
	b=T18FDVMvJDgbHKXhYXTZEnzgQbwNYXAPCB6TK59+rwbAqIfmGEUfSZEqmLH5w1Fajd
	OG5hyKf2DFmqg79LYr6qDWb9s5V8w4LEFudo82PV5JEkXNdJ3bdFbevla8wLU8vqnGMP
	V0RdD+EjNsBnoIVG/KVxgGuxms2Ll42y++5muiYfN2+s8bOlq7wYLpBtGxjiYGEhvUxH
	tj2lbaiD3KSNyxixk4c1Du/TkNc+An9XKhNKaYWl0mMKl1+I0suqpVy5N3UJ4/jnebJU
	fGngpeGS1M0qrvF05uGZknMFEiX/Bw0NNM+HXwSZRTqR/stDmfzUARVYa+Z+bca2mLZF
	xwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XUGF7uEscSrLe7u9IlrUoPH8pvPSjONKM+xUhmJ/Ick=;
	b=QRa2/rnBo8f4+tzSxeRAt1W7LfjEFmh6VNwfALw9eRRrmODJWGgdnKREpXzQLnr6su
	lziQUk9OhV/+RZW38+VonorvvzeVbEWgpLo8CO+4cGFKnIyhKfrx3tv5pybv6K+4Zg1b
	Ks34xFwpzwqDQ1CDSHo3p4DM56FVBAN8tYzemDgLdmp5UjoyWepi5+vUwy66zx25Vh2V
	1qfp4FEfaBYfRnd7RSREAS/bWRApCwSjG0Sq1ecPFwbJ9aFm3GIgC57/bK+28M5F1fVK
	EnxIHGmDnrKwsKFQJevmCXukhXUcRbNQQbKzMesfif2sOTCyWnQEek+7/UzkmmJf8+rm
	KjKw==
X-Gm-Message-State: AElRT7F8YBqHHI1QQJa3PtDEA2/Vdo8cqUeADKBm5YgNYWGE5K3cT5mZ
	Z+VDei9gknvsA+Ot/Rcg+OKMcg==
X-Google-Smtp-Source: AIpwx48i53WxVe4ZAAjKMYdE+ov++4Iw88RlCrUhrr9U7ofQLVpgHJRp6Iq1xkM+WyVGF5kZMoxxGQ==
X-Received: by 2002:a17:902:9a88:: with SMTP id
	w8-v6mr16492086plp.29.1522806570989; 
	Tue, 03 Apr 2018 18:49:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:06 -0700
Message-Id: <c352af7f8702619ad42e0189105886d041945905.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 07/21] gnutls: update to 3.6.2
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:29 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb} (54%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.1.bb b/meta/recipes-support/gnutls/gnutls_3.6.2.bb
similarity index 54%
rename from meta/recipes-support/gnutls/gnutls_3.6.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.2.bb
index 7624a20..e540528 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.2.bb
@@ -3,7 +3,7 @@ require gnutls.inc
 SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
             file://arm_eabi.patch \
            "
-SRC_URI[md5sum] = "4b65ae3ffef59f3eeed51a6166ff12b3"
-SRC_URI[sha256sum] = "20b10d2c9994bc032824314714d0e84c0f19bdb3d715d8ed55beb7364a8ebaed"
+SRC_URI[md5sum] = "8b4912c6c0e5ffefd3dbb4888eaf8a58"
+SRC_URI[sha256sum] = "bcd5db7b234e02267f36b5d13cf5214baac232b7056a506252b7574ea7738d1f"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


