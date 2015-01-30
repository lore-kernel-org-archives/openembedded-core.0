Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 36EFA6AC17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 17:31:30 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id l61so28366043wev.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 09:31:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8VMcuXpYiqWXcjWePfMNnPfwpGW3xL4hAcKtxIexYk8=;
	b=FBpaAnXmiEsXMgzhWda1kXP5DAD97EerQkn8iEayIBpPriBfxMNit9XmzpyQQn2pEk
	c7eRaUbZt6j/0cQrxeQCaRcd047pMPjSRRERcq2paDCnSVCZh48puUAiYN50korVdubp
	03DVeEGO/mNgxBeI/tdh9CWh1Y0fP5Q0g8TTyfXRS+SAAbbydWr9/Vkp7JU0x+geoevc
	1nZj2+NRuYdb0z1Ltsr/4thZqvJg3xtptNe91FETHJfubojz0RE0chDbeZlEUOq5dFDq
	qjCtZBA3MLLIeE1uPuO+uqicfKVyX5R3BKS9IrIlaZcIZVX14wQskepXqpHFeHSURK/U
	zF6w==
X-Gm-Message-State: ALoCoQmPpMv5x1gKbGGHs08C8J/aVrLlxPx/YvGzlC3da7M8hY4etNVfsvbjm6h3jtlfTwNlYLmu
X-Received: by 10.180.37.77 with SMTP id w13mr7004699wij.66.1422639091249;
	Fri, 30 Jan 2015 09:31:31 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id fq10sm6991526wib.3.2015.01.30.09.31.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jan 2015 09:31:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jan 2015 17:29:38 +0000
Message-Id: <1422638978-1419-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1422638978-1419-1-git-send-email-ross.burton@intel.com>
References: <1422638978-1419-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] insane: add unknown-configure-option to default WARN_QA
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
X-List-Received-Date: Fri, 30 Jan 2015 17:31:36 -0000

The unknown-configure-option check is generally useful and should be enabled by
default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 143ec46..ea238a9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -30,6 +30,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps file-rdeps \
+            unknown-configure-option \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
-- 
1.7.10.4


