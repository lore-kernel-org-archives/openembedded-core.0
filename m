Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25108C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:58 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.16545.1644196137260271731
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cFcD6THo;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id u15so22024625wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lcDu7/GnnJkc2/pGVwPpe7p9GHJfNGqSnt/vdHk0v5g=;
        b=cFcD6THoU1232E2zzgyE0y5toqead+QalHtaedqLG2Vt3DsEMxofmX40kdqy1mb18U
         RRTGjDlmsb0SAkQ9HeFH3tCKnTfw+Zl52/Q/WH6Q9pw/7pvg5Ocs2AkZgxKBpxU8vAIg
         dKW0meEkSZScNSer9JeRkygwSC5e2bN1epFM0mbkNnXarsupZruTuxcRqi3XOgKJyp1E
         OKAWcjK7HPcPi3r8dhspsImfwNlwjxMZsz6ud2k0RRfzmK4TBmJM+nMdJNTVo+/Voy53
         QXyb6O9YL6+d2xyPsR08t0zHjFZ90xZoZUFau4bGW1pcua65hgc8Z6Ehfa1gI77pDeGf
         tM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lcDu7/GnnJkc2/pGVwPpe7p9GHJfNGqSnt/vdHk0v5g=;
        b=xfUB5SkyGtlTHWVy6OXl8zUP2H86HVuqFWrhpqM5FKVcGsjftRg2B83CBO3sM0XWAn
         mmaMrx3mPFE0DsbDLeMtLqjKhqdr9No53e2HnWbOAS1lAcKKgGWpOx5r1y04EgOgCJ40
         ON47gkUcVmEpLkuiX04dfSyhVyPgMbok+mJwD8aUgBQ8UoKRFv1L68R2L/MsM8kiy3bt
         SQhtlmhvyqDx6Evr6Hn1rwo6Bv7Zr/eV8yafbmy5hTXDKWnkKC0cVEZF8m2//9t8EZRw
         5MYgBBifkrPOWQL51qnVD3MheA5kwVZ1wo+dd9b8SM7WpJWHgYRihxDIMujv993r2unz
         gUUQ==
X-Gm-Message-State: AOAM533X4l7gM60I/F3ezo9oKuiccnDBar6CHSpDRdyoinUPsy4CHQuv
	3giP/6bbTXpBFKrWNn3NtynbCtBH/5M=
X-Google-Smtp-Source: 
 ABdhPJw7PTuB2TOvWv+DM+ZIh5SRaIC3ejeqDRBiibzgg1clSlZbEuxlH59EKtaKTCr6xxkRdnpNAA==
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr7901621wrm.332.1644196135571;
        Sun, 06 Feb 2022 17:08:55 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:55 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 17/17] gst-devtools: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:23 +0000
Message-Id: <20220207010823.143664-17-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161437

- Add new meson options

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-devtools_1.18.5.bb => gst-devtools_1.20.0.bb}       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb => gst-devtools_1.20.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
index 1b46b89cb9..7a27d27b2e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "fecffc86447daf5c2a06843c757a991d745caa2069446a0d746e99b13f7cb079"
+SRC_URI[sha256sum] = "69fc8756ec9d93e5c5258c99088434f203e91fdbc5af28d1f2c583fd819b7a1d"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
@@ -30,6 +30,9 @@ def gettext_oemeson(d):
         return '-Dnls=disabled'
     return '-Dnls=enabled'
 
+# Build GstValidateVideo
+PACKAGECONFIG[cairo] = "-Dcairo=enabled,-Dcairo=disabled,cairo"
+
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
     -Ddebug_viewer=disabled \
-- 
2.35.1


