Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1632E6A8D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 16:44:31 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t59so742345wes.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 09:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=irn3CxMmn6lGGeenQJFKaeIPvOb6YCUh/hALrR3NDXU=;
	b=dd2s4YjMm0Dexid5xE6z5wGodtYTxhszn/iXfKV3RSzzMTrWOC800k+MvKOPLgV7tE
	D57FGGs5dafMSLhMZhKX6S8dnrWX1xhCUa2b0Mvv1S28Hzaq4FJDHeruQBRmlHIBpLWi
	DqcnHZh8qd0PmwApSlCUnJXeDRwC4177QwhlkE8TKVXtSk9tc/ZIK41fSHvEWVfrAJHB
	YJOMsbjMTdk/PzTtuuMYesYGRipaHqycBeS6JL2v0Dq9lwp4PhCf3xvkXTAEXRx8EMIv
	vHHXY2zeK9y73dtbF02FkoXF0/JkAOs4mz32nlTJP3rFK0Zj2nRxTxZzATKW24XbQ66D
	itTg==
X-Received: by 10.194.60.5 with SMTP id d5mr6973100wjr.26.1372351472363;
	Thu, 27 Jun 2013 09:44:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j20sm4719162wie.7.2013.06.27.09.44.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 09:44:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 17:40:51 +0100
Message-Id: <1372351251-13677-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372351251-13677-1-git-send-email-ross.burton@intel.com>
References: <1372351251-13677-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlLRyITF7JERGmC+sgrOhwVe34C1N7lzg70nqeMJ7t4BiBmT4pnvnIBNzgwP5ohBCyPA4Ol
Subject: [PATCH 3/3] seperatebuilddir: cogl and clutter build out of tree
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
X-List-Received-Date: Thu, 27 Jun 2013 16:44:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index d113f92..979f44b 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -68,12 +68,12 @@ B_pn-ccache = "${SEPB}"
 B_pn-ccache-native = "${SEPB}"
 B_pn-chrpath = "${SEPB}"
 B_pn-chrpath-native = "${SEPB}"
-B_pn-clutter-1.8 = "${SEPB}"
-B_pn-clutter-gst-1.8 = "${SEPB}"
-B_pn-clutter-gtk-1.8 = "${SEPB}"
+B_pn-clutter-1.0 = "${SEPB}"
+B_pn-clutter-gst-1.0 = "${SEPB}"
+B_pn-clutter-gtk-1.0 = "${SEPB}"
 #B_pn-cmake = "${SEPB}"
 #B_pn-cmake-native = "${SEPB}"
-B_pn-cogl = "${SEPB}"
+B_pn-cogl-1.0 = "${SEPB}"
 B_pn-compositeproto = "${SEPB}"
 B_pn-compositeproto-native = "${SEPB}"
 #B_pn-connman = "${SEPB}"
-- 
1.7.10.4


