Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id A61886A44D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:25 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id t60so270741wes.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=1hVqEJPWbulpdrP1MNIWPKFJi1s3MNZe2/DX64NmMDE=;
	b=aNPeD2CimdExspzYOokeLZQdvr4eqC0GJClL+lXs5pqmrRHxvmQGX3hkjKG6mSzyBL
	yOVTo19HKrxYrpuqeZJTsWGHsLTJyvpwGCrB34bq0o0aMwWFXsnI3uBxy7SU1mWwzJ/H
	3vNbcoUuzBesvFc5Xm78VBUhfav4PfN+l7KRzYLenUpc4RhGnYsXE2KJUj4Dwe9CqTh7
	hqPsByAOockcH66LKl18bLWwf+HKrc5RVwvNtDvc2rdpRQc6ZcLPe1BEkSeq6x6fwSK8
	QRTwDW70fTw9P/p2YHoMqyNrocvHJxrsSNaK0Dm/FUASqE/nVAhNHFBw6lAP9nIry1ED
	fcgw==
X-Received: by 10.180.81.169 with SMTP id b9mr19021341wiy.12.1369922186431;
	Thu, 30 May 2013 06:56:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:44 +0100
Message-Id: <5a0611c3408da21928af4f40fa08cd9f8bedf055.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmOEXAsKAKeaNfap8eUG6MaHc+IatiZoh7jyYnJNe6ODHJmvlnDNqAF3DzmpR/1g0BsiLOf
Subject: [PATCH 10/14] gtk+3: add dependencies for gtk+3-demo
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
X-List-Received-Date: Thu, 30 May 2013 13:56:26 -0000

The demo loads PNG files and sniffs mime types, so ensure that these
dependencies are present so the demo actually works.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index 1e0fed2..cc51fcd 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -65,6 +65,10 @@ FILES_${PN}-demo = "${bindir}/gtk3-demo \
                     ${bindir}/gtk3-widget-factory \
                     ${datadir}/gtk-3.0/demo"
 
+# The demo uses PNG files and mime type sniffing, so ensure that these
+# dependencies are present.
+RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info"
+
 FILES_${PN} = "${bindir}/gtk-update-icon-cache-3.0 \
                ${bindir}/gtk-query-immodules-3.0 \
                ${bindir}/gtk-launch \
-- 
1.7.10.4


