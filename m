Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id EFD177F322
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 16:27:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id n19so6084593lfe.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4u6jrR1+CBl2TfE2AvHKkpHHibgOr2XVFbw8gbt9XxQ=;
	b=044zHeK/7z6c8e7l1qp7ls0OF3HVX5jDlIHFW/eK78ZVqsqlTlK5Md8w9oV9hebs1t
	lMSTKQoScGg9O2Z9x+yHzqqkO0yqzDiBfmQpXbKWBK5OzsdlkkrSegbHCe2dAJl2I20z
	zZjoBzGxl6VdO2OwerYRZXRJjJoA0upVbPyJd+cqjTEcjnNS9ipwhWU1+rUkfqP+dbws
	wVLOduaPykbyI+UFf8kfdLxcHuksnmaGG0Ju2rfX16G7UEhx0IlFEDVekcyJfEzmY0I7
	oM6dMv2gQjzS22DJvNBFsr/QLjrWuh0Na339T+tQIOt8vAhe0Q1bVgSfUOmOz6Y4UI3L
	lnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4u6jrR1+CBl2TfE2AvHKkpHHibgOr2XVFbw8gbt9XxQ=;
	b=EBg6KJBFMj+hIHZKqiDcxs3qg0jKxv0+I68bKtvzbc1xafMe3RnDEBkdisczdjKb6B
	nDMKZJEyvtdL7tdqGEJJUmpwIl/CkCH/2wMUCxKUkcJ2+iybWqMTAfYmyb4H2VRCPnnG
	P3FpXqTvufEhzblXomthwZ8FR3sgvl7bQiZ4QEcnuOkEY+znOurAIIx9BsgmAHP5/NeN
	bc/t4Btb09U2PYf+oFkZebxrkDPu+LCGYU6aYekYK/h2nPv0u29eKT7Z0SzEx2dKUMAw
	NuXKWDNqS+PO9a5E20P/ZQzPBh8/yDCQUNiPEoHU23Xb2d3LhcINOwW2fpmGikmBQFHD
	asWA==
X-Gm-Message-State: APjAAAXTtzjPvZK9dEXbBBlywFfxBzfjfxH6L/kfEn3HDWVwofd1NE6z
	jfDeWswIMLD2ZBccE4wJQbc8Zhlxd+M=
X-Google-Smtp-Source: APXvYqyfjtQ9KBFoRmb6GKnlxMo/fz9wDTTMH1r2tyvAPjy+FhblX9dwyBlvF56f5mHt4izQLna6XA==
X-Received: by 2002:a05:6512:484:: with SMTP id
	v4mr8501250lfq.66.1566059237369; 
	Sat, 17 Aug 2019 09:27:17 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r23sm1508165ljm.59.2019.08.17.09.27.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 09:27:16 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Aug 2019 18:27:02 +0200
Message-Id: <20190817162702.14396-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] cups: update to 2.2.12
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
X-List-Received-Date: Sat, 17 Aug 2019 16:27:17 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/cups/cups_2.2.11.bb | 6 ------
 meta/recipes-extended/cups/cups_2.2.12.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups_2.2.11.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.2.12.bb

diff --git a/meta/recipes-extended/cups/cups_2.2.11.bb b/meta/recipes-extended/cups/cups_2.2.11.bb
deleted file mode 100644
index aeb2e14e3b..0000000000
--- a/meta/recipes-extended/cups/cups_2.2.11.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
-
-SRC_URI[md5sum] = "7afbbcd2497e7d742583c492f6de40cd"
-SRC_URI[sha256sum] = "f58010813fd6903f690cdb0c0b91e4d1bc9e5b9570c28734229ba3ed2908b76c"
diff --git a/meta/recipes-extended/cups/cups_2.2.12.bb b/meta/recipes-extended/cups/cups_2.2.12.bb
new file mode 100644
index 0000000000..8e5534a979
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.2.12.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
+
+SRC_URI[md5sum] = "e763689f7735d3fe95a2943397189e40"
+SRC_URI[sha256sum] = "0f61ab449e4748a24c6ab355b481ff7691247a140d327b2b7526fce34b7f9aa8"
-- 
2.17.1


