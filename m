Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id F10527F8BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 14:26:59 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id b3so11545539wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 06:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=c4QlwE9lZiA21lPqHcAyFAqKUF0TlKtsbyRAav+RBnQ=;
	b=Z+6lZQP3lFEJNfh/ETD6+UUrkDeUHgQ2b02GFTHSKqj8fnf0nLtH0QQRDvSDqvV/HE
	icj8BdLyWzINacwriw0vjoHsYw0IRslJS4w3jkTSOc6B79w2QfenpMDfaZ3WlcqWRyGW
	0rsozEWPuF163o+tRWS19OU4olh9rm33/IxPX2Bcyqdv9GaW17CwWYk7FDPsaOer84tI
	PDrT0rEIL5UUBLg6I4Sq1Oh8/aOn6Txy+gAXTLbenQEhftvq4LvB3A3mHo6YjotehIH8
	ogdMnrk8a/cfy73wrQMFFDNjkAo/mmGWQvnc3PszoeBg4zFFv4cKRafbNWn5r629ByX2
	/tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c4QlwE9lZiA21lPqHcAyFAqKUF0TlKtsbyRAav+RBnQ=;
	b=hz2dY5KOLx04w1nSrKB5bWfgxi/oUn2YPg6b0A2I5cdrftorKnDS+7svyy3c8M1gKL
	EFcKb+vmvakUmUQif2bDgwTBOFu4xVNi3J6/0xZb9lxuMT3f0y327HGEv8ROvoirF2YT
	l8KKnXTK239cWVirEETKgdaMLwVl+fg6wp7/1DrmGHCHl3tfwmQxY80uS6AId4+QDEfo
	l7jN1ZT+XTc0OW7ReaxtPcc+ricrArkBpnP079UDBvDcgT8lHKQsa2wntaO7byjd5OJW
	22OXuuuxR7Dw/Oy7UMOIsu729xoa4dMaRERMotJkqW6zFwiB0fNGJu8pRSfLL83Sx/Zh
	eZeg==
X-Gm-Message-State: APjAAAWXhUX8r/U4gU5/0Us15UhR+t6MstEiiwVGbPzWmTSZQkVoySDk
	xJTimliGPBcchF9I7lcIQx4mnpztVss=
X-Google-Smtp-Source: APXvYqx45WwhnTG56GaicZ3LKQeVvhN2MzSnlb4n1G4bOiv72KVBZi5lAiw0Glfzrw/wFJMds2GuOQ==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr10474647wru.342.1572877620515; 
	Mon, 04 Nov 2019 06:27:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d4sm26873251wrc.54.2019.11.04.06.26.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 06:27:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 14:26:54 +0000
Message-Id: <20191104142654.20440-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191104142654.20440-1-ross.burton@intel.com>
References: <20191104142654.20440-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] libsndfile1: whitelist CVE-2018-13419
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
X-List-Received-Date: Mon, 04 Nov 2019 14:27:00 -0000
Content-Transfer-Encoding: 8bit

This is a memory leak that nobody else can replicate and has been rejected by
upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index ffb45855a4b..7855008f3d8 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -33,3 +33,7 @@ PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
 
 inherit autotools lib_package pkgconfig
+
+# This can't be replicated and is just a memory leak.
+# https://github.com/erikd/libsndfile/issues/398
+CVE_CHECK_WHITELIST += "CVE-2018-13419"
-- 
2.20.1


