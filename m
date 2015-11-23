Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A90EB6012C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 14:37:23 +0000 (UTC)
Received: by wmww144 with SMTP id w144so99001077wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 06:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1D7GLVqYB5R7ZjZi6c74a3eeXfLOyX1QPZ+KCKWaXFk=;
	b=ZKBrkVFsG0OJMx9efmvigXHZ3mYcb5X7a0Gmy+1NXaceW2/jbpqzFQuFEMMv8a/6eZ
	WRn0MyvznfvrKvjvOK2jLk+96lBoajGw9ASkeUV5Jvjsx3Ytm693Hwaft9hvmJCmCSav
	LQOBVSWcWYZu3x3shGnzos5M7swl5xC6V/9YfiJP5aH49bmpUwYuBfWAoZHH3YijzxIc
	cB2Fl3NlizX+jaT5wCv1RTsfyx8/V9E7dgEZdrkT7x5Q40D3upR5DzTQggPIMip9QCCz
	JwPBNvZRum4Yr/wgVjj93nhz4Lrwc+KnmB/aiMZrFoamKRP3Yr/i55XFBJf6o+e6EMiV
	/iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1D7GLVqYB5R7ZjZi6c74a3eeXfLOyX1QPZ+KCKWaXFk=;
	b=CdHvf8yPbB8lVlzDj7ZtXWzXoerWIfItP6r3jQ6hLd2XAwhRPCBuyIP7eRgPJQx5DN
	YfuLbfiErQNgr1zcz13aG/8+zHUY+k6u/vL0BaEJAVFYBSvk1u3Riq7acxcConJSQb4I
	QlXj7xI2sx8IHwIUEjG5H9qgXWfsjf/jSYQMlVoCUCBOb6tRMrkBygZpnXsIENcfpxQk
	4ofJ8Ow3Yqhw+qscoTFVz0TOKLWkseptVAvrzLK3Lu0AaY1DUmTGPTUt60qwaZ2xa/Vi
	yi12KeG6JkFjYTAlqTcMF/PxzNdK+08BIKOScM3q3ZAVsPWjtiH8xA2Tx4/4+RvrmtrB
	weKA==
X-Gm-Message-State: ALoCoQk8LzUb7b+6ZJUfxKT4GKrMPPZQaGLJ5hX4bIAamtHzWDlX2bCKlVAMJQOP8XRGVdo523eM
X-Received: by 10.28.210.137 with SMTP id j131mr11874472wmg.93.1448289443833; 
	Mon, 23 Nov 2015 06:37:23 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id bh6sm2575137wjb.0.2015.11.23.06.37.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 06:37:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 14:28:40 +0000
Message-Id: <1448288921-23123-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1448288921-23123-1-git-send-email-ross.burton@intel.com>
References: <1448288921-23123-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][jethro 2/3] libarchive: rename patch to reflect CVE
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
X-List-Received-Date: Mon, 23 Nov 2015 14:37:24 -0000

This patch is a CVE fix, so rename it to help CVE detection tools identify it as
such.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...CURE_NOABSOLUTEPATHS-option.patch => libarchive-CVE-2015-2304.patch} | 0
 meta/recipes-extended/libarchive/libarchive_3.1.2.bb                    | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/libarchive/{0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch => libarchive-CVE-2015-2304.patch} (100%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
similarity index 100%
rename from meta/recipes-extended/libarchive/libarchive/0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch
rename to meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index aaa3255..716db9a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://libarchive-CVE-2013-0211.patch \
            file://pkgconfig.patch \
-           file://0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch \
+           file://libarchive-CVE-2015-2304.patch \
            file://mkdir.patch \
            "
 
-- 
2.1.4


