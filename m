Return-Path: <frezidok1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02706CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 13:21:42 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8232.1779110493487365128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 06:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ma05OHhZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: frezidok1@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-393925cb1baso27220161fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779110492; x=1779715292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx1UkK2FKl6aLRrzZFH6SiGqGEbgsxuHPPUqhBSgOYg=;
        b=Ma05OHhZOe71cvElcidECUYjGrR+M26xQXTHx4nBqM8NiHKBnQr3cm+l1l+k5Ttvyi
         nt59aGHe0Pu0Xv74x2jHXpkSaONwXJHCvlRQuMuioFPY/kZCLsC82GgRC6GDpd7jrdmS
         UKBoOSyruSSrM6dfC4320aU/OdWLb/ZLwKp09/gK+QRMDBeDG4MqDVT5DR0aQXRiz9Tr
         KT6l9XT3FjQ0qL5+ninrtPfEj+gF/T9Mo7bVSl/2n7eB3zg+EHcw0wMkkq7nivcxRiAH
         vmB5EgNdnx05cONSI97vwkvTQoKdvPpLqTZgv7tCrzOETLX6N+hGVURWDp8J506a1suM
         /6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779110492; x=1779715292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tx1UkK2FKl6aLRrzZFH6SiGqGEbgsxuHPPUqhBSgOYg=;
        b=Gs2QXtsXOrPPnmTr1NOX5qUsR1vomboFjpQCO/Zou5ipaGDJgfeFM4/9h1c16g2A11
         9LL9ie+/tQVftgjnvH3j0R0VY1Z0gVawkQiKXijrfu/gRmWO7LhuC8qazRJZzv8FGrHV
         liW1eMo1fRdtDUq6Y+qD7iFOes+/MIRzl0TYB513asGreMVkw1Y5iIee7b8RlGzR9kUA
         hUxhicSfsnvNsMCHACgyjxj2p74DJ3xU8Vu7+Ui453NtVZP5MHvihmGv/jLTfJ1A6+se
         eUXVX2E1DhSuDqsgexi9ZXenMJ4Ebu4wZX9VpGmLMlmYBMlUo85WV0FqSWLl3Sc5+gsQ
         cRAw==
X-Gm-Message-State: AOJu0YxGAtXoJLPRXEtiJv9Lj2ewLcDWhnmUoxoRqiNChBpiIm4dJSRc
	AQ6FN8vNUpDrQFoh+hh/SVmpOybfpK5bHe6tddwVGS13r7uzuG0SuVUPag6bWbOAONs=
X-Gm-Gg: Acq92OGlz8dTmPowiuejW55BkfPFtR5AgR7BmmcDt7l5iBM8ULjhfd45Sr8eQe65i/T
	6g5DERsWxaI4OhUUfUJ3wy5tBrevPZk+vqOSbmNNZ/EBg6l/pet6FanP3qsL2u6Nonl1v7PIrmp
	zA9r7csbJXCuVpyOt/BwCsW8+j9g7k5mwyjohpdj2/Iu3+K3uaVlhL8ZCUIl4u1iZp04J2DVN8l
	Ej6w5hlvyzK86idkpOmtAd0TMZaiN5ahnn7HjDI0EBASZwQwrASxhtEcmD1B3+tgtDykyvFYxo5
	yGYqeMk6xh69Nij6tgT3hMMC1t+yhDEBVqgMSCDk5Am7Y0vWIxHakTHFCbVLxpxDZB+hlrnYpZ1
	ScVxDMFmuVHqfq5iteBLBcNTf+rlnf2SbX5splbiO4hCmrFlrn4w9ZVXAXUY+dpVu+Er9+dz6t4
	SgRMGI0p6ltST3ZyW5Tg==
X-Received: by 2002:a2e:928a:0:b0:393:8ba5:3d01 with SMTP id 38308e7fff4ca-39561f22d3dmr31222591fa.22.1779110491373;
        Mon, 18 May 2026 06:21:31 -0700 (PDT)
Received: from ubuntu1.. ([213.87.153.150])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958827ec4csm11865711fa.4.2026.05.18.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:21:30 -0700 (PDT)
From: frezidok1@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Sakhonchik <frezidok1@gmail.com>
Subject: [OE-Core][PATCH] matchbox-panel-2: fix clock widget width resize
Date: Mon, 18 May 2026 16:21:06 +0300
Message-Id: <20260518132106.1296563-1-frezidok1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 13:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237245

From: Dmitry Sakhonchik <frezidok1@gmail.com>

Previously clock widget used to change its size depending on digits' width inside it, which caused other icons in the panel to move.

Fixes [YOCTO #15435]

Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
---
 applets/clock/clock.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/applets/clock/clock.c b/applets/clock/clock.c
index b8057a4..3065cfc 100644
--- a/applets/clock/clock.c
+++ b/applets/clock/clock.c
@@ -73,6 +73,7 @@ mb_panel_applet_create (const char    *id,
         GtkWidget *label;
         time_t t;
         struct tm *local_time;
+        int ref_string_width;
 
         applet = g_slice_new0 (ClockApplet);
 
@@ -81,6 +82,17 @@ mb_panel_applet_create (const char    *id,
 
         gtk_widget_set_name (label, "MatchboxPanelClock");
 
+        /* Size the widget using the widest possible time string ("88:88") */
+        PangoContext *context = gtk_widget_get_pango_context(label);
+        PangoLayout *reference_string = pango_layout_new(context);
+
+        pango_layout_set_text(reference_string, "88:88", 5);
+        pango_layout_get_pixel_size(reference_string, &ref_string_width, NULL);
+
+        g_object_unref(reference_string);
+
+        gtk_widget_set_size_request(label, ref_string_width, -1);
+
         g_object_weak_ref (G_OBJECT (label),
                            (GWeakNotify) clock_applet_free,
                            applet);

